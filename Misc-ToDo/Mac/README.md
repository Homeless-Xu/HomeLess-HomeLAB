⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵   简介   🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️

🔵 本文简介

    数据备份  
    系统重装
    系统配置
    基础软件
    极品软件


🔵 数据备份

    装系统前想的再怎么仔细，肯定还是会漏掉的，而且是非常重要的文件！
    比如各种软件的配置文件！！！ 所以 timemachine 是必须的。

    你有 NAS 备份很简单，
    没有的话买个ssd 来备份！！ 平时还难当u 盘用，
    电脑连ssd 只要一根数据线就可以了！！！ 数据无价。


🔵 系统重装

🔶 简介

    系统分两种 
    最新版系统可以直接在线通过网络安装，无需任何东西！
    老版本系统需要自己制作 USB 启动盘了。。。 麻烦。
    但是这里 karabiner 这个键盘神器只支持 10.11 
    虽然现在都出到 10.13 了 但是我还是决定重装10.11
    Mac 系统的版本选择 和 Win 差不多的， 
    Win 还是 win7 最经典，Mac 我认为是 10.11 最经典了
    加上苹果没了乔布斯。。。 不管是软件还是硬件质量普遍不行了！


🔶 最新版本系统：

    开机 → ⌘ ＋ R 直接在线重装！

🔶 老版本系统： 自己准备u 盘。。。

    ☉ 准备工作 
        • 8G ＋ U盘一个 
        • 老版本系统镜像
        • Mac 电脑（带系统的）
        ⚡︎ Win 也能制作 Mac 的USB 启动盘，但是麻烦。。。



    ★★★★★ 参考教程：http://www.iplaysoft.com/osx-yosemite-usb-install-drive.html


    ☉ 步骤简介
        不管制作什么版本Mac USB 启动盘， 步骤都是一样！ 
        大概就是下载系统镜像 → 解压 → 格式化 u盘 → 用命令把镜像写到U盘 
        ⚡︎ 命令就是重点！  你要改到无法就是 系统名字  和 u盘名字。

    ☉ 命令
        sudo /Applications/Install\ OS\ X\ El\ Capitan.app/Contents/Resources/createinstallmedia --volume /Volumes/iPlaySoft --applicationpath /Applications/Install\ OS\ X\ El\ Capitan.app --nointeraction

        回车后，系统会提示你输入管理员密码，接下来就是等待系统开始制作启动盘了。这时，命令执行中你会陆续看到类似以下的信息：
        Erasing Disk: 0%... 10%... 20%... 30%...100%...
        Copying installer files to disk...
        Copy complete.
        Making disk bootable...
        Copying boot files...
        Copy complete.
        Done.
        当你看到最后有 「Copy complete」和「Done」 字样出现就是表示启动盘已经制作完成





⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵   正文   🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️

🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶 ❤️ 输入法设置 ❤️ 🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔶 简介

    自带的输入法非常不好用， 就是因为标点符号！ 
    IT人员肯定喜欢 在中文输入法下用英文标点！ 
    怎么办呢！只能换输入法了。有三个选择。。。
    • 自带中文输入法：➜ 按Cap 就变成英文模式！！！ 再输标点 就会变成变成英文输入法
    • 搜狗输入法：➜ 慢！卡。。。 
    • 百度输入法：➜ 虽然很讨厌百度。。。 但是还是试试看吧。 某些人说这个蛮好用的。。
    • 鼠须管： ➜ 配置麻烦！！ 非常麻烦。。


🔶 Cap 键

    在因为输入法下按Cap键 ➜ 大写模式
    在中文输入法下按Cap键 ➜ 相当于英文输入法！标点也是英文的. 要输入大写英文 按下shift就行. 
    中文输入法下的 Cap 的英文模式 和 直接 切换英文输入法 也就是按一个键 或则 按两个键的区别。

 
🔵 百度输入法

    ⦿ 设置

        • 中文时使用英文标点
        • 启用模糊拼音
        • 取消状态条
        • 候选词: 9 
        • 安静模式( 在某些软件 强制用英文! 比如 Alfred )


    ⦿ 使用 

        • shift 可以直接用来切换中英文! 

    ⦿  输入法默认英文怎么办啊!!  哦 对了 Finder 记得从安静模式中取消!


🔵 ShowyEdge 软件

    百度输入法有英文模式, 系统自己也有英文输入法. 
    一般来说,直接使用百度输入法就可以了,但是毕竟是苹果的系统,肯定情况下默认会是Mac的英文输入法的.
    怎么判断当前到底是什么输入法就比较重要了! 不然电脑用着不爽!

    用 ShowyEdge 这个软件 就能非常明显的判断当前是什么输入法。 而不用去看角落的小图标了。。。。
    这软件会在屏幕顶部显示一条颜色条, 高度 以及 然颜色自己可以改.

    没啥大用， 但是就是好用。。。    https://pqrs.org/osx/ShowyEdge/
    系统 英文 输入法: 无色
    系统 中文 输入法: 红色
    百度 中文 输入法: 灰色

    ☉ 自定义颜色

        百度输入法的时候 无色.
        系统英文输入法时 红色.


🔶 Emoji 快捷键: ⌘ ⇧ 空格




🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶 系统初始设置 🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔵 触控板 

    ● 轻点变单击 
    ● 三指拖放 （设置 辅助功能 》 鼠标/触控板 〉启用拖移 》 三指拖移 


🔵 输入法快捷键： 
    
    设置 → 键盘 → 快捷键 → 输入来源 → 打勾 → 设置快捷键 ctrl ＋ 空格


🔵 Finder

    默认显示全部文件 脑子怎么想的！ fuck 。。  
    改为默认显示桌面文件。  
    finder 设置 





⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵   软件   🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️

🔵 盗版资源

    ★★★★★    推荐网站1（国内）： https://www.waitsun.com
    ★★★★      推荐网站2（国内）： xclient。info
    ★★★★★    推荐网站3（国外）： appked

🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶  翻墙软件  🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔶 临时翻墙帐号！ 

    23.105.192.96   443
    加密：  chacha20 
    密码 UUrtCi


🔶 客户端选择

    • SS → 最简单， 性能一般般
    • Specht Lite → 配置要点功夫， 性能好
    • Surge → 性能最好！ 但是太贵了！ 几乎没有破解！ 
    

    ssx 官方下载：   https://github.com/shadowsocks/ShadowsocksX-NG 

    specht lite 官方下载   https://github.com/zhuhaow/SpechtLite/releases
        配置下载  https://github.com/HoonHwang/SpechtLiteConf
        教程：http://xclient.info/s/spechtlite.html?_=c4302fa9c19438bae7c00da40c26c69a



🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶 谷歌浏览器 🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔵 通用插件

    ★★★★★

        一键管理所有扩展
        Momentum  新窗口每天一副精美图片.  
        Advertising Terminator  去广告插件，比 AdBlock 好用
        Anything to QRCode 把网址、文字、图片生成二维码,方便手机扫描
        Checker Plus for Gmail  Gmail 邮件提醒! 再也不用手动检查是否有新邮件了.

    ★★★★  

        The Great Suspender  节省内存, 一定时间后没操作某网页就会回收内存,下次打开会重新载入.
        OneTab 节省 95% 内存! 把所有网页集合到一个网页中形成表格, 要用再打开
        Death To _blank  解救习惯在新窗口打开任何链接的你! 

    ★★★

        Visualping  跟踪网站更新! 比如小说更新了. 比如淘宝网站价格更新了.. 就会有提醒!
        Awesome Screenshot  截取部分、截取整个窗口、截取整个页面，直接编辑, 一步到位.
        Flash Video Downloader 、猫抓  视频下载, 有这两个各种小视频基本都能下了.
        Grammarly 英语单词与语法检查，直接推荐你正确的单词或句子，英语写作神器.
        internet Download Manager For Chrome  下载.谷歌自带的不支持断点续传.
        Persepolis Download Manager Integration 即开即用的 aria2 客户端!

    ★★

        Imagus   悬停鼠标 显示大图
        New Tong Wen Tang 繁体简体中文转换工具 
        AutoPagerize   自动翻页! 很多页的网站会自动加载下一页内容.

    ★

        ScriptBlock 脚本禁止插件. 很多文章不能复制.禁用脚本立马可以复制了.
        Listen 1  汇集网易、QQ、虾米的所有曲库. 个别歌曲会播放不了! 
        Pushbullet 电脑手机之间文件互传.
        ​​​​​​​



🔵 开发插件

    ★★★★★ 

    Similar Web 查看任何网站的流量、来源、排名;  google analysic 只能看你自己的网站.
    Octotree Github 专用; 像浏览本地文件一样的查看别人的github项目!
    Shodan  查看当前网页服务器的各种端口信息.

    ★★★★

    Open SEO Stats  排名、SEO、Alexa、IP 位置、Whois、SNS、缓存...
    Data Compression Proxy  流量压缩! 移动热点上网省流量神器! 
    Web 前端助手、Web Developer 前端实用工具集，谁用谁知道！

    ★★★​​​​​​​

    BuiltWith Technology Profiler 分析网站结构! 用的什么web服务器、js 文件、网页编码... 
    Tampermonkey 油猴脚本-神器，各种黑科技脚本: 去视频广告、看VIP电影、百度云不限速...
    Click&Clean  清理浏览器 浏览记录、缓存、私有数据、cookie 等等...
    Alexa Traffic Rank Alexa  查看网站的世界排名

    ★★

    Fatkun Batch Download Image、Image Downloader  批量下载某图片,可按图片大小过滤.
    Personal Blocklist (by Google)  在谷歌搜索结果中禁止出现某些网站. 如百度..
    Page Ruler  设计师必备，直接查看网页一些图片的详细像素大小、具体位置等
    JSONView、JSON-handle  json 数据查看，API 开发者必备
    Mosh (dev) 类似ssh. 要求服务器安装 mosh. 
    cVim 、 vimium  快捷键来操作浏览器.

    ★

    JSONView、JSON-handle  json 数据查看，API 开发者必备
    ​​​​​​​CSSViewer 直接查看网页css 属性.
    WhatFont  查网页所用字体
    Postman  API 自动化测试
    定时刷新网页







🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶 Alfred 3 🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔵 Alfred 3

    官网下载： https://www.alfredapp.com/
    正版账号。  126 邮箱里面



🔵 基本功能 

    ★★★★★

        启动软件 ➜ 软件名  ➜ 打开相关软件
        文件内容搜索 ➜ in xujian ➜ 查找文件内容含有xujian的文件!! 
        
    ★★★★

        直接当计算器 ➜  2+3 
        终端 ➜ 前缀+命令 ➜ 打开系统自带的终端并运行该命令; 要用iTerm看我
        https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred

        标签搜索 ➜ 给重要文件/配置文件加标签.然后可以按标签快速查看

    ★★★

        打开某个文件 ➜ open xujian ➜ 打开含有xujian的文件名!  
        查找某个文件 ➜ find .zshrc  ➜ 打开 .zshrc 文件所在的文件夹
        简单文件搜索 ➜ 空格+文件名
        Web 搜索 ➜ 进行站内搜索;如 谷歌、Bing、淘宝、京东、亚马逊...
        系统操作 ➜ 开关机、睡眠、屏保、登出、音量...
        给某人发送邮件 ➜ email xujian ➜ 搜索通讯录中的xujian 并发送邮件




🔵 高级功能

    ★★★★★

        剪切板历史:  能记住你所有的文本/图片/文件复制历史!
        设置个快捷键就可以直接查看历史.
        用方向键选择可以直接预览文件内容!!!   再按回车键就直接粘贴了.

    ★★★★

        文字全屏: Alfred窗口输入文字, 按下⌘+L 文字就会自动放大到全屏
        Merging 神奇的功能: 多次复制.一次粘贴.
        第一次复制用 ⌘C , 后续复制用 ⌘CC 也就是按两次C键. 不如:
        第一次选中AA两个文字, 按 ⌘C
        第二次选择BB两个文字, 按 ⌘CC
        第三次选择CC两个文字. 按 ⌘CC
        最后⌘V 粘贴: 输出的就是 AABBCC


    ★★★

        Snippets 快捷短语:
        实现快速输入地址、常用问候语、常用代码片段等.
        当然这个功能还是 用 keyboardMaestro 好用很多.

🔵 Workflow

    ★★★★★

        Chrome Bookmarks 书签定位利器! 快速找出谷歌浏览器中的书签!  
        YoudaoTranslate - 下载: 有道翻译: 中英文互译、 单词发音...

    ★★★★

        Fantastical-Alfred-Workflow  快速添加事件到 Fantastical 
        Resize Image - 下载 快速调整选中图片分辨率!


    ★★★

        Add Reminders - 下载: 快速添加提醒到 Mac 自带的 Reminder  
        github repos - 下载: 过滤并跳转到 你自己的github里的项目. 需先配置token
        NewFile - 下载: 在当前文件夹快速新建文本
        switchdns - 下载: 快速切换 DNS
        Copy Path 用某快捷键获取当前选择文件路径
        Dash 离线API, 直接在Dash里面安装.



🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶  VSCode  🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔵 简介

                    Less is More

                VScode 非常适合做笔记
            本人之前都是用Markdown写笔记的!
        自从发现了vscode后就转用纯文本写笔记了!
    VS Code 的使用并不需要很多的扩展插件! 用插件能提高效率. 


🔵 常用快捷键

    ⌘ + ` ➜ 显隐内置终端 (默认是 ⌃ ` ) ➜ 需借助 keyboard maestro 实现.
    ⌘ + B ➜ 显隐侧边栏
    ⌘ + F ➜ 文本内搜索
    ⌘ + ⇧ + F ➜ 当前项目内搜索
    ⌘ + \ ➜ 分屏
    ⌘ + , ➜ 设置界面

 
🔵 设置

    🔶 等宽字体  ➜    "editor.fontFamily": "Ubuntu Mono",
        1.) Ubuntu Mono
        2.) inconsolata
        3.) Source Code Pro 

    🔶  界面/字体 调整

        1. 用 ⌘ -+ 来进行整体缩小. 主要是为了 缩小左边侧栏的大小.
        2. 用 "editor.fontSize": 15, 来调整字体大小.

    🔶 80/120 垂直线 ➜    "editor.rulers": [80,120],

    🔶 显隐最左边状态栏 手动设置快捷键 ⌥ B ➜ Toggle Activity Bar Visibility

    🔶 切换布局快捷键 默认是 ⌥⌘1 改成 ⌘ ESC



🔵 自动换行 

        默认是不换行的,很长的行就会出现左右拖动条. 麻烦...
        加上下面两行,然后重启vscode 后就会自动折行了!
        只不过不知道为什么 那个80 无效.

        "editor.wordWrap": "wordWrapColumn",
        "editor.wordWrapColumn": 80



🔵 插件推荐

    ★★★★★

        • 文件栏图标: seti-icons 或者 VSCode Icons
        
        • 缩进基准线: Guides + indenticator 比自带的好用
            Guides 提供多基本基准线+高亮  缺点是高亮不明显.
            indenticator 只高亮当前基准线, 缺点是不显示别的基准线.
        
        • 书签: Bookmarks: 代码太长,加书签! 实现快速跳转. 
            ⌘⇧P bookmarks list 显示所有书签.可设置快捷键!
            ⌥⌘K 设置/取消书签;   ⌥⌘L/J 前后书签跳转; 

    ★★★★

        • 代码格式化: beautify
            再乱的 JS|HTML|CSS 文档.也能给你排列的整整齐齐.
            比自带的内置格式化(shift option F)好用
            安装后需手动配置 keybindings.json 来设置快捷键.
        
        • HTML 标签自动补全:  HTML Snippets
            输入 h3 回车变成 <h3> </h3>
            输入 link 回车变成 <link rel="stylesheet" href="">
        
        • 自动提示: HTML CSS Support;  html css js 提示功能.
        
        • 同步备份所有 VScode配置: Settings Sync:
            上传:⇧⌥U 、下载:⇧⌥D; 需配置 Github token 

    ★★★

        • 查看Git历史: Git History;  使用: ⌘⇧P ➜ git view history
        
        • 路径补全: Path Intellisense;  再也不愁文件路径的输入了.
        
        • 单词拼写: Code Spell Checker
        
        • 个性化注释(JS): Bettrt Comments;
            //! 红色; //* 蓝色; //?淡绿色; //TODO 橙色


🔵 Bookmarks 插件设置

🔶 快捷键设置: 

    左边默认值,右边自定义设置
    自定义只要去 VSCode 设置 ➜ keyboard shortcuts ➜ 找到 Bookmarks List ➜ 右键绑定一个快捷键...

    ⌘⌥J 上个书签  ➜ ⌘ J   Bookmarks: Jump to Previous
    ⌘⌥k 设置书签  ➜ ⌘ K   Bookmarks: Toggle
    ⌘⌥L 下个书签  ➜ ⌘ L   Bookmarks: Jump to Next
          显示书签  ➜ ⌘ H   Bookmarks: List






🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶 ❤️ karabiner & seil ️❤️ 🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔶 简介

    Karibiner 这个神奇只支持 10.11   10.12+ 的功能限制非常严重！
    但是有几个小的键盘设置 需要配合 seil 才能完成。 

    karabiner 10.22下载 ： https://pqrs.org/osx/karabiner/
    Seil 下载 https://download.freedownloadmanager.org/Mac-OS/Seil/FREE-12.1.html


🔶 Seil： Cap → Ctrl ＋ Esc 

    把 Cap 键 变成 Ctrl ＋ Esc 键！！！ 
    cap 几乎用不到的！ ctrl 是常用的。
    Mac 内置键盘，Cap 键却占据极好的位置，而且还那么大。
    不好好用就浪费了，所以才会有那么多人要把这个变成 Ctrl 键盘。
    再厉害点的，同时把这个键变成两个键： Ctrl 和 ESC
    也就是说 组合键的时候 这个Cap会变成Ctrl， 单按的时候是Esc

    如果你只要把 Cap 键和 Ctrl 键 互换，而不要那个 Esc 功能，那么不需任何软件。 
    Mac 10.11 直接就能改！系统偏好设置–>键盘–>修饰键，设置Cap Ctrl 互换

    如果要把 Cap 变成 Ctrl ＋ Esc  就要用 seil 了。 

    1. 禁用系统的CapsLock键
        系统偏好设置 ➜ 键盘 ➜ 修饰键 ➜ CapsLock 设置为 No Acton

    2. Seil设置CapsLock为F19
        下载安装Seil ➜ Change the caps lock key 的值改为80（F19）

    3. Karabiner 配置修改

        打开karabiner,在「Misc & Uninstall」中点击「Open private.xml」，会弹出来一个文档。
        打开该文档，将下面的代码替换进去：

        <?xml version="1.0"?>
        <root>
        <item>
        <name>F19 To Control</name>
        <appendix>F19, send Control</appendix>
        <identifier>private.hyperspace2Control</identifier>
        <autogen>
        --KeyToKey--
        KeyCode::F19, 
        KeyCode::CONTROL_L
        </autogen>
        </item>
        </root>


    4. Karabiner 设置F19为Escape和Control
        回到「Change Key」中点击「ReloadXML」，就会看到自定义的名为F19 To Control的映射选项.勾选即完成映射.


    详细图文参考设置：  http://www.jianshu.com/p/30a95c0727a9



🔶 Karabiner 方向键

    Mac 自带的方向键非常难按啊！
    右手要移动非常大的距离才能按到方向键。Karabiner 就可以帮你结局这个问题。
    之所以选择10.11 而不是 10.12 就是为了 Karabiner 的方向键这个功能。
    我喜欢把 S 当成方向修饰键！ 按下S 再按下 HJKL 就对应 上下左右！
    要实现这个功能 非常简单。也就是 Karabiner 里所谓的 VI Mode 勾选就可以了。




🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶  Keyboard Maestro 8.0  🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔶 表情符号快捷键  
    ；fs → 🔶
    ；fb → 🔵
    。。。。。。



🔶 软件快捷键 （Vscode）

    ⌥｀ → ⌘｀ 也就是打开内置的终端。


🔶 系统快捷键 
    ⌘ D → ⌘ Delete 这样左手就能直接删除文件了， 英文右手一般控制触摸板的，按 ⌘ Delete 不方便



🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶 BetterSnapTool 🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶

🔶 简介 

    窗口控制是刚需....


🔶 跨屏问题

    安装好就能左右 以及 四角的自动调整窗口大小了。
    但是有个小问题。 你的窗口可能会到另外到界面去。
    这个问题其实是Mac系统到问题，解决方法只能用下面命令增加延迟（2秒）。
    defaults write com.apple.dock workspaces-edge-delay -float 2.0; killall Dock

🔶 快捷键设置 
    BetterSnampTool → 设置 → keyboard shortcuts 

    ⌥ , 左下角
    ⌥ . 右下角
    ⌥ o 左上角
    ⌥ p 右上角

    ⌥ H 左半屏
    ⌥ L 右半屏
    ⌥ J 下半屏
    ⌥ K 上半屏


🔶 快捷键补充 

    左1/3  右2/3 的布局这个也能实现...
    因为浏览器在RMBP 的一半屏幕下实在是不够用的! 
    就是屏幕分辨率缩放到最高,就算那谷歌浏览器所有网页都缩放到 80% 
    肯定会出现左右的拖动条.非常麻烦...  所以只能2/3 屏幕给浏览器了...

    ⌥ ; 左1/3
    ⌥ , 右2/3








🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶  Misc  🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶





🔵 istat 6 → 系统监控





🔵 xcode 必装  Apple Store





🔵 Github  Tower（收费） ／ Github desktop （免费）
    Github 直接登陆就可以了。  
    Tower  要登陆配置：github 账户设置 → Developer settings → 生成 personal access token






🔵 brew  
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


🔵 基础命令安装 
    如 wget 

    brew install wget

🔵 jump 命令


🔵 iTerm ＋ on-my-zsh 

    ☉ iTerm2 手动下载

    ☉ on-my-zsh 安装
    wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

🔵 安装 nmap      brew install nmap 

🔵 安装 MTR 





# gce 设置ssh 证书

1. 密钥生成 ssh-keygen -t rsa
2. 密钥位置 ~/.ssh/id_rsa.pub
3. 上传   gce 元数据 添加 ssh 密钥   就是 cat ~/.ssh/id_rsa.pub   
4. ssh -p 2190 root@35.194.128.92



