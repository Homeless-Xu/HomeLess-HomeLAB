# SOP:抖音/短视频 语音提取 + 内容分析

> 适用场景:拿到一个抖音分享链接,想快速知道视频讲了什么(语音转文字为主,抽几帧画面为辅)。
> 全程本地处理,不需要抖音登录 cookies,几乎不消耗 AI 对话 token。
> 验证日期:2026-07,环境:Linux + Python3。

## 流程总览

```
分享短链 → 解析视频ID → 抓分享页内嵌JSON → 拿真实视频地址 → curl下载
        → ffmpeg 提取音频(16k单声道wav) + 抽帧(每18秒1帧,480px)
        → faster-whisper 本地转写(small模型/int8/CPU)
        → 转写文本 + 2~3帧画面 交给 AI 分析
```

## 0. 依赖(一次性安装)

```bash
apt-get update && apt-get install -y ffmpeg
pip3 install faster-whisper        # 本地转写,small 模型约 460MB,首次自动下载
# yt-dlp 可选:抖音直连需要 cookies,通常用不上;B站/YouTube 等其他站点用它更方便
```

## 1. 解析短链 → 视频 ID

```bash
# 分享文案里形如 https://v.douyin.com/xxxxxxx/
curl -sSL -o /dev/null -w '%{url_effective}\n' \
  -A "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15" \
  "https://v.douyin.com/34vAoeaIm88/"
# 结果中 /share/video/<VIDEO_ID>/ 即视频 ID
```

## 2. 抓分享页,提取真实视频地址

分享页(iesdouyin.com,**无需登录**)HTML 里内嵌 `_ROUTER_DATA` JSON,含播放地址和元数据(标题、作者、时长等)。

```bash
UA="Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15"
curl -sSL -A "$UA" "https://www.iesdouyin.com/share/video/<VIDEO_ID>/" -o share_page.html
```

```python
import re, json
html = open('share_page.html', encoding='utf-8').read()
data = json.loads(re.search(r'_ROUTER_DATA\s*=\s*(\{.*?\})\s*</script>', html, re.S).group(1))
item = data['loaderData']['video_(id)']['page']['videoInfoRes']['item_list'][0]
print('标题:', item['desc'])
print('作者:', item['author']['nickname'])
print('时长(ms):', item['video']['duration'])
print('地址:', item['video']['play_addr']['url_list'][0])
```

## 3. 下载视频

播放地址形如 `.../aweme/v1/playwm/?video_id=...`,把 `playwm` 改成 `play` 即**去水印**版本。

```bash
curl -sSL -A "$UA" -e "https://www.douyin.com/" \
  "https://aweme.snssdk.com/aweme/v1/play/?video_id=<URI>&ratio=720p&line=0" \
  -o video.mp4
file video.mp4   # 确认是 ISO Media / MP4,不是报错页
```

## 4. 提取音频 + 抽帧

```bash
# 音频:16kHz 单声道 wav(whisper 最佳输入)
ffmpeg -y -loglevel error -i video.mp4 -vn -ac 1 -ar 16000 audio.wav

# 抽帧:约每18秒1帧、宽480px(省 token;1分钟视频约3~4帧足够)
ffmpeg -y -loglevel error -i video.mp4 -vf "fps=1/18,scale=480:-1" frame_%d.jpg
```

抽帧密度按视频长短调整:`fps=1/N`,目标控制在 3~5 帧。

## 5. 本地语音转文字(faster-whisper)

```python
from faster_whisper import WhisperModel
model = WhisperModel('small', device='cpu', compute_type='int8')
segments, info = model.transcribe(
    'audio.wav', language='zh', beam_size=5,
    # initial_prompt 填视频主题相关词汇,能显著提高专有名词识别率
    initial_prompt='以下是普通话内容,关于ESP32、语音识别、小智AI对话。')
with open('transcript.txt', 'w') as f:
    for s in segments:
        line = f'[{s.start:6.1f}s -{s.end:6.1f}s] {s.text}'
        print(line); f.write(line + '\n')
```

- 1 分钟音频在 CPU 上约几十秒转完。
- 模型选择:`small` 中文效果够用;要更准用 `medium`(更慢);英文内容 `base` 即可。
- 首次运行从 HuggingFace 下载模型,之后走本地缓存。

## 6. AI 分析(省 token 要点)

- **以转写文本为主**:整段 transcript 交给 AI 整理、纠错、总结。
- **画面为辅**:只读 2~3 帧关键画面(确认字幕、产品外观),不要整段视频逐帧看。
- 视频里的**硬字幕可以用来校对** whisper 听错的专有名词(如人名、品牌名)。

## 常见坑

| 问题 | 处理 |
|---|---|
| yt-dlp 报 `Fresh cookies are needed` | 抖音直连就是要 cookies,改走本 SOP 的分享页方案 |
| 分享页没有 `_ROUTER_DATA` | 检查 UA 是否为移动端;或抖音改版,搜 `playAddr` / `loaderData` 关键字定位 JSON |
| 下载得到的不是 mp4 | 用 `file video.mp4` 验证;确认带了 UA 和 Referer 头 |
| whisper 专有名词听错 | 用 `initial_prompt` 喂主题词;再用画面字幕人工校对 |
| 其他平台(B站/YouTube) | 直接 `yt-dlp -x --audio-format wav <url>`,后续步骤相同 |
