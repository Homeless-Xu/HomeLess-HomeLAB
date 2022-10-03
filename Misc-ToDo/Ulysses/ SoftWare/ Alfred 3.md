##  Alfred 3
> 快捷键: ⌘ + 空格    

## 搜索排除文件夹


## 基本功能:

*启动程序:* 关键字
 qq、qqmusic、vi、xcode ……

*锁定 / 重启 / 屏保:*
lock、restart、screensaver

*Shell 命令:* . + 命令 (手动开启)
.ping 192.168.1.1


- 计算器: 直接输入
	// 2+3+5

- 打开文件: 空格 + 关键词

- 查找文件 / 内容搜索: f/in + 关键词

- 查找 通讯录
	// Mzyy qw

- 发邮件:
	 // email xujian0219@126.co 

- 标签搜索:
	// tag 红色   可以把配置文件都加个标记. 方便使用.



- 显示/清空垃圾桶 :   trash、emptytrash


- 隐藏/退出程序:   hide / quit + 相应程序  退出所有 quitall

- 文件夹浏览  com + /  
	// Navigation ; 设置一个默认文件夹 ; 左右键 上下级 文件夹.  回车 打开文件夹.

- 全屏放大文字
	//  Com + L


## Web Search

- gg - - - - - -→ 谷歌搜索
- image - - - -→ 谷歌图片
- Map - - - - -→ 谷歌地图
- Gmail  - - - -→ 网页 Gmail
- Wiki - - - - - → 搜索 wiki
- Bing - - - - -→ Bing 搜索
- taobao - - - -→  淘宝搜索
- jd - - - - - - - →京东搜索
- amcn - - - - →中国亚马逊搜索
- amuk - - - - → 英国亚马逊搜索
- amde - - - - → 德国亚马逊搜索

#### 1Password
直接 打开网站(不用输入登录密码!!!!)
// 1Password 必须高级设置 启用 整合第三方 APP 功能.


## WorkFlows
	这个功能才是Alfred的核心功能，有了这个其它那些免费功能只能打打酱油了.

### WorkFlows的四个基本对象：trigger、keyword、action、output。

Alfred通过将这四个基本对象合理connect便能实现各种高级功能。  
就好像乐高玩具，我们可以通过各种零件组合在一起组装成各种有趣的形状。  
可以夸张的说WorkFlows没有什么做不到只有你想不到的。

查看例子:
### 基本属性设置:
添加例子:    Workflows → 左下角 “ + ”  → Examples → should i watch this movie.  
 双击图标 → 打开这个 workflow 的 基本属性设置

Workflow Name名字 
Description功能描述
Category类型，有未分类的、工具类、互联网类、生产率类的 
icon将图片拖进框内，为WorkFlows设置图标
Bundle id为WorkFlows取一个唯一的可辨识的ID 
Created by作者 Website主页 
Readme如果还有其它的内容需要填写我们可以都填写在这里



从例子功能描述中我们可以知道，
这个WorkFlow的功能是通过关键字“movie”加上电影名字 
然后系统会打开浏览器并分别
从Youtube查询电影预告、
从IMDB查询电影详细信息、
从Rotten Tomatoes查询电影评分。
除了基本设计外，我们下面来详细介绍这个WorkFlow的“组装”界面：

左边是 input    右边是 action
input: 
keyword: 关键字  
with space: 是否需要参数(空格)


action:
web search:  默认很多 选一个就好
如果没有你想要的搜索: 那就要 自己建一个了   右上角 加号 选择 action 
URL : 自定义查询网站+{query}  组成
如果不知道搜索URL是多少，我们可以先使用一次网站的搜索功能然后就能在浏览器的地址栏上找到该网站的搜索地址了。还能设置将查询内容编码成UTF8格式、将查询内的空格变成＋号 → open url → 输入搜索网址 :必须要 带 http 的.  然后保存

然后 keyword 右边中间 拉出一根先  连到你新建的 action 


Browser: 浏览器选择


Google Suggest:
就是在每次输入查询内容时系统会列出一些候选的查询关键字供用户选择。

详细教程链接:
[http://wellsnake.com/jekyll/update/2014/08/16/001/][1]

高级功能:
[https://github.com/zhaocai/alfred2-top-workflow][2]




关于 程序名字  可以自己在 mac 的应用程序文件夹 直接改你喜欢的名字 



##### Buffer

可以将找到的文件 暂时储存在 alfred. 然后进行批量操作 复制 移动...等等  
也就是鼠标 右键的功能

alt + 上下键 来加入.


##### 自定义Web Search 举例.
- 比例 淘宝:
打开淘宝网址  随便搜索一个东西  看浏览器地址 
	https://s.taobao.com/search?q="{query}"
	一般 选前面的  加上 “{query}” 就可以了 

- 比如 百度:
	https://www.baidu.com/s?wd=xx&rsv\_spt=1&rsv\_iqid=0xe61116bf000888f6&issp=1&f=8&rsv\_bp=0&rsv\_idx=2&ie=utf-8&tn=baiduhome\_pg&rsv\_enter=1&rsv\_sug3=5&rsv\_sug1=1&rsv\_sug7=100&rsv\_sug2=0&inputT=1717&rsv\_sug4=1717
→
	https://www.baidu.com/s?wd="{query}"

- 比如 京东:
	http://search.jd.com/Search?keyword=%E7%AD%89%E7%AD%89%E7%81%B5%E9%AD%82&enc=utf-8&suggest=1.rem.0&wq=%E7%AD%89%E7%AD%89&pvid=zn4zuoli.secw4q
→ 
	http://search.jd.com/Search?keyword={query}
// 注意 京东这里 最后面   没有”双引号的” !!!!!!

- 比如 BT 天堂
	http://www.bttiantang.com/s.php?q="{query}"

- 比如中国亚马逊: 搜索 xx 
	http://www.amazon.cn/s/ref=nb\_sb\_noss/475-4330539-6248426?\_\_mk\_zh\_CN=%E4%BA%9A%E9%A9%AC%E9%80%8A%E7%BD%91%E7%AB%99&url=search-alias%3Daps&field-keywords=xx
→  删除没用的参数  凭经验了.....  精简后就是:
	http://www.amazon.cn/s/field-keywords="{query}”

- 美亚: 搜索 kindle
	http://www.amazon.com/s/ref=nb\_sb\_noss?url=search-alias%3Daps&field-keywords=kindle
→
	http://www.amazon.com/s/field-keywords="{query}"

- 英国亚马逊
	http://www.amazon.co.uk/s/ref=nb\_sb\_noss/278-6992928-5320213?url=search-alias%3Daps&field-keywords=kindle
→ 
	http://www.amazon.co.uk/s/field-keywords="{query}"

- 德国亚马逊 : nokia
	http://www.amazon.de/s/ref=nb\_sb\_noss\_2/277-6888912-6702366?\_\_mk\_de\_DE=%C3%85M%C3%85%C5%BD%C3%95%C3%91&url=search-alias%3Daps&field-keywords=nokia
→
	http://www.amazon.de/s/field-keywords="{query}"


#### Clipboard  粘帖记录板
- ⌥ + B  直接打开 粘帖历史记录

- snip 自定义片段
手动添加一遍  然后打开 alfred 输入 snip+ 关键词 回车就直接输入内容.
 
- Merging 融合
- 复制多段 内容   自动把你合成一段内容  直接粘帖.
 先 ⌘+CC 再 ⌘+V 会发出声音.
// 不建议开启  好像 复制时候 会出错——— 



## 高级功能:
	
	• Airdrop                                        airdrop 打开airdrop功能
	
	• 新建文件/文本                          nf xujian.txt       建立文本文件
	
	• 杀进程                                         kill 进程名字/软件名字
	
	• 剪贴板                                        花键 双击          或者输入cb             查看之前复制的内容
	                                                            Snippets 里面可以添加经常用的东西!!
	
	• 常用文件夹            find文件夹先 再右箭头 加入到收藏夹  然后faves(自定义wjj) 下面就会显示出来了

Features → Clipboard → snippets :自定义输入 →  自定义输出   常用的代码什么的.

Merging选项：

这是一个神奇的功能：可以多次复制 不连续的内容.
一篇文章  你要复制 随机的几段  只需:  
第一次:选中内容 ⌘ c  
第二次:选中内容 ⌘ 双击 c
第三次:选中内容 ⌘ 双击 c
然后一次性的 ⌘ + v  就会吧 三次的复制内容一起粘帖进去了 

并且可以设置是使用空格、回车来分割不同的片段。

[经典教程][3]




#### 有道翻译神器: 可用  可同步生词本!!!
[https://github.com/kaiye/workflows-youdao/][4]

使用方法，选中需要翻译的文本，按两下 command 键即可。
选中结果后，配合以下功能键可实现不同功能：
•	enter 同步单词到有道在线单词本（若未配置有道账号则保存至本地单词本）
•	alt + enter 翻译至剪切板
•	shift + enter 直接发音
•	control + enter 打开有道翻译页面
•	command + enter 直接在光标处打出翻译结果



[1]:	http://wellsnake.com/jekyll/update/2014/08/16/001/
[2]:	https://github.com/zhaocai/alfred2-top-workflow
[3]:	http://wellsnake.com/jekyll/update/2014/06/15/001/
[4]:	https://github.com/kaiye/workflows-youdao/
