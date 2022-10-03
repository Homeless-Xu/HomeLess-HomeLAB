[傻瓜一键安装包(可以实现中文下输入英文标点!!!)][1]
在 default.custom.yaml 下.

我的配置: 

## default.yaml  
1. 添加： - schme: wubi86
	// 加入五笔输入法功能

2.  `page_size: 9`   后选词 数量。
寺;&#60;,\<..”‘’??”\>

## squirrel.yaml

- 安裝好后默认使用繁体拼音

- 用 `⌃ + ~` 来切换輸入法。

Rime输入法设置有点类似Sublime Text，
- 有一个系统默认设置，
- 有一个用户设置。
	默认设置在每次升级的时候可能会变动或者恢复成默认值。
	*个性化设置应该全部放在default.custom.yaml中*
	> 官方发布包里根本不包含这个文件，因此不会被覆盖。

`default.custom.yaml`是一个需要你自己建立的空文本文件.
放到輸入法設置的这目录。

*安静模式：*在指定的应用程序中，缺省为英文输入。
•	终端 Terminal / iTerm
•	代码编辑器 Emacs / MacVim / Sublime Text / Xcode
•	快速啓动工具 QuickSilver / Alfred


鼠须管的一个明显缺点：
自带词库不够多，很多词组都必须自己在输入中进行“造词”。


*Mac os 配置文件：*   `/Library/Rime` 

原始配置文件： squirrel.yaml . 
> 修改外观主题啦什么的/默认英文程序。
用户配置就是：squirrel.custom.yaml
> (自己新建)→ 重新部署生效。




`default.custom.yaml` - 配置拼音输入源。
`luna_pinyin.extended.dict.yaml` - 输入法扩充词库配置文件
`luna_pinyin.custom.yaml` - 朙月拼音自定义配置文件。
`squirrel.custom.yaml` - 输入法全局配置项，
输入法对各Application的个性化配置，如默认英文等
`installation.yaml` - 部署配置，包括同步文件夹位置等
`sync` - 文件夹，为用户的数据同步文件夹


等等

的








自己新建 default.custom.yaml （全局生效）

patch:
    menu/page_size: 9      #这是之前增加的候选词数量。
    schema_list:           #“输入选单”中激活的输入方案定义。
     #  - schema: terra_pinyin
        - schema: luna_pinyin
        - schema: emoji
     #  - schema: luna_pinyin_fluency
     #  - schema: double_pinyin_mspy
        - schema: luna_pinyin_simp
     #  - schema: bopomofo
     #  - schema: double_pinyin_flypy
#下面定义“输入选单”的切换控
    switcher:
        abbreviate_options: true
        caption: "〔切换输入方案〕"          #把默认的“方案選單”修改为了“切换”。
        fold_options: true
        hotkeys:
            - "Control+grave"       #默认方案
            - "Control+Shift+grave"   #默认方案
            - "Control+s"             #新增方案
        option_list_separator: "／"   #以下都为默认custom.yaml文件的默认配置，copy过来就可以。
        save_options:
            - full_shape
            - ascii_punct
            - simplification
            - extended_charset





*中文用英文标点：*
一、取得此设定档 alternative.yaml，保存到Rime用户目录
https://gist.github.com/2334409

你把版本号改一下　
`config_version: "0.3"`　改成你现在正在用的即可_ 
二、在用户目录新建一个 X.custom.yaml 文件，
X替换为常用的输入方案标识，如 `luna_pinyin.custom.yaml`

写入文件内容 
`patch: 'punctuator/import_preset': alternative`
三、重新部署生效
昌。昌。。。。..dd大。。等等。的。。


设置静默模式，
可以直接点击设置，打开squirrel.yaml来设置。如果你希望程序升级后仍然保留你的自定义配置，还可以考虑把这部分设置放在自定义配置文件里面。
设置静默模式的属性叫做：ascii_mode，把这个设置为true即可。另外，你还需要一个应用程序标识，可以通过Mac OS的进程管理器找到。
下是我常用的开启静默模式的应用程序设置列表，包括：Alfred2，MacVim, Chrome, iTerm2
app_options:
com.googlecode.iterm2:
ascii_mode: true
“com.runningwithcrayons.Alfred-2”:
ascii_mode: true
org.vim.MacVim:
ascii_mode: true
com.google.Chrome:
ascii_mode: true
YAML格式是通过空格对齐的，所以要注意。
保存设置之后，重新Deploy一下，让设置生效。这样，启动进入这些程序的时候，就默认输入英文了，非常实用！




[1]:	https://imspm.com/article/1466415480956