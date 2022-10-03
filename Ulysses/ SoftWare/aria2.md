[参考文章][1]
aria2: Mac 下载神器.

*安装 :* `brew install aria2`


*配置:*

aria2 提供两种下载方式:
一种是直接命令行模式下载
一种是 RPC 模式下载 
> 这种模式 aria 启动后就会安静的等待下载请求,下载完成也不会退出.这个软件很省内存的 几MB 而已.)

要使用 RPC 模式 就要 创建个配置文件.
1. 在/Users/v/Document/ 新建个文件 `aria2.conf`

2. 然后把下面的文件 粘帖进去

#用户名
    #rpc-user=user
    #密码
    #rpc-passwd=passwd
    #上面的认证方式不建议使用,建议使用下面的token方式
    #设置加密的密钥
    #rpc-secret=token
    #允许rpc
    enable-rpc=true
    #允许所有来源, web界面跨域权限需要
    rpc-allow-origin-all=true
    #允许外部访问，false的话只监听本地端口
    rpc-listen-all=true
    #RPC端口, 仅当默认端口被占用时修改
    #rpc-listen-port=6800
    #最大同时下载数(任务数), 路由建议值: 3
    max-concurrent-downloads=5
    #断点续传
    continue=true
    #同服务器连接数
    max-connection-per-server=5
    #最小文件分片大小, 下载线程数上限取决于能分出多少片, 对于小文件重要
    min-split-size=10M
    #单文件最大线程数, 路由建议值: 5
    split=10
    #下载速度限制
    max-overall-download-limit=0
    #单文件速度限制
    max-download-limit=0
    #上传速度限制
    max-overall-upload-limit=0
    #单文件速度限制
    max-upload-limit=0
    #断开速度过慢的连接
    #lowest-speed-limit=0
    #验证用，需要1.16.1之后的release版本
    #referer=*
    #文件保存路径, 默认为当前启动位置
    dir=/User/xxx/Downloads
    #文件缓存, 使用内置的文件缓存, 如果你不相信Linux内核文件缓存和磁盘内置缓存时使用, 需要1.16及以上版本
    #disk-cache=0
    #另一种Linux文件缓存方式, 使用前确保您使用的内核支持此选项, 需要1.15及以上版本(?)
    #enable-mmap=true
    #文件预分配, 能有效降低文件碎片, 提高磁盘性能. 缺点是预分配时间较长
    #所需时间 none < falloc ? trunc << prealloc, falloc和trunc需要文件系统和内核支持
    file-allocation=prealloc



3. 修改上面的  下载路径 随便你设置.

4. 打开终端: 输入下面一行
后一段是 aria2 配置文件的路径 安装你自己的来
你创建在哪的 就写那个路径.

aria2c --conf-path="/Users/v/Documents/aria2.conf" -D


> -D 参数使Aria2在后台运行,即使关闭终端也不会停止运行。


这个就是 启动 aria2 的命令.
每次开启 都要重新运行一遍!!!!
可以写进 开机脚本里.

写个脚本 然后 系统设置 → 用户  → 开机启动 把这个脚本加进去就可以了.
有可能 还要给这文件 root 权限.

还要改 这个sh文件的 打开方式!  用 bash 打开.



*关闭 aria2*
可以到活动监视器中找到 aria2c 杀掉，也可以在终端输入kill aria2之后按 Tab 键，aria2 会自动变成进程号，回车即可杀掉它。




启动之后 就要开始下载了. 需要一个管理界面.

其实就是个网页.

网页有两个 任选一个就好了
[网页1][2]
[网页2][3]




**高阶使用 (配合 百度云)**

下载个 [BaiduExporter][4] 插件  (chrome firefox safari 都有.)



safari 下载文件.(就是扩展包)
双击运行就可以了


安装完成后进入百度云的下载界面，会发现网页上多出一个「导出下载」按钮，点击它弹出的「ARIA2 RPC」就自动添加到你的下载队列里了。

然后就去 管理页面 就能看到了....




[chrome 下载链接.:][5]





up download speed.

[http://codespaper.com/2015/07/19/baiduyun-fastdown/][6]








[1]:	[http://www.jianshu.com/p/1290f8e7b326]
[2]:	http://binux.github.io/yaaw/demo/
[3]:	http://ziahamza.github.io/webui-aria2/#
[4]:	https://github.com/acgotaku/BaiduExporter
[5]:	https://chrome.google.com/webstore/detail/baiduexporter/mjaenbjdjmgolhoafkohbhhbaiedbkno
[6]:	http://codespaper.com/2015/07/19/baiduyun-fastdown/