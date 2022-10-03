## 端口 Port



### 操作系统 & 进程 & 线程

操作系统的设计:
1. 多进程形式: 允许多个任务同时进行
	2. 多线程形式: 单个任务猜分成不同的部分.
		3. 协调: 防止进程和线程产生冲突. 允许进程和线程共享资源.



工厂 → 多核CPU          一个 cpu 运行一个进程
车间 → 进程: Process 
工人 → 线程: Thread     多个工人协作完成一个进程.
房间 → 内存空间.




车间空间是工人共享. → 内存空间是共享的.每个线程都能使用.


车间的房间 要规划作用:
有些给一个人用. 厕所: 简单&效率高. 优先采用.
有些给几个人用. 厨房




比如厕所.只能一个人进.有人在用 别人只能等,
实现方法: 互斥锁.Mutex
防止 多个线程同时读写某一块区域.

门口加锁. 别人看到锁 就排队. 这叫 

厨房: 可容纳10个人. 超出10人 只能外面等
实现方法: 信号量.Semaphore
门口挂10把钥匙. 进门取钥匙.出门还钥匙. 没钥匙就等.
保证多个线程不会互相冲突.











### 为什么要有端口:

路由器:    把数据包顺利的传送到目的主机。
操作系统支持多程序（进程）同时运行.
主机接收到的数据包传送给众多同时运行的进程中的哪一个呢？端口机制便由此被引入进来。

端口其实就是队，系统为各个进程分配了不同的队，数据包按照目的端口被推入相应的队中，等待被进程取用.

接受数据包的进程需要开启它自己的端口，发送数据包的进程也需要开启端口，这样数据才能相互通信.
> 发送/接受端的端口号码不要求一样! 

**一台电脑的端口有 2^16个！** 范围是从0 到65535
0-1024 端口一般被系统征用的.  
一般都是1024+的端口号 随机给你一个.

电脑是为人服务的，他需要接受一些指令来调整系统功能.
操作系统 就像一个闭合的圆圈，这个圆是由很多线段(端口)组成的.
操作系统设计者，把这个圆圈截成好多段，这些线段就叫端口
- 如果端口关闭，相应的程序不能得到命令.
- 如果端口打开，相应的程序就能得到命令.接受外部数据并执行.


#### **周知端口（Well Known Ports） 范围: 0 - 1023
其中80端口分配给WWW服务，21端口分配给FTP服务等。

输入网址的时候是不必指定端口号的，因为在默认情况下WWW服务的端口是“80”。
如果不是默认的端口号则应该在 地址栏上指定端口号!
比如使用“8080”作为WWW服务的端口，则需要在地址栏里输入“网址：8080”。

有些系统协议使用固定的端口号，它是不能被改变的，
> 如139 端口专门用于NetBIOS与TCP/IP之间的通信，不能手动改变。

#### **注册端口 范围:1024 - 49151，
分配给用户进程或应用程序。这些进程主要是用户选择安装的一些应用程序，而不是已经分配好了公认端口的常用程序。这些端口在没有被服务器资源占用的时候，可以用用户端动态选用为源端口。

#### **动态端口（Dynamic Ports）范围: 49152 - 65535。
之所以称为动态端口，是因为它 一般不固定分配某种服务，而是动态分配。

### 端口分类: TCP / UDP

计算机之间相互通信的时候，分为两种方式：
- TCP: 发送信息后，可以确认信息是否到达，也就是有应答的方式.
- UDP: 发送信息以后就不管了，不去确认信息是否到达.


用软件扫描目标计算机 → 得到目标计算机打开的端口 也就知道提供了哪些服务。
服务软件一定有漏洞，根据这些攻击者可以达到对目标计算机的初步了解。

如果计算机的端口打开太多，而管理者不知道，那么，有两种情况：
一种是管理者没有注意，比如安装IIS的时候，软件就会自动增加很多服务.
一种是服务器被攻击者安装木马，通过特殊的端口进行通信。


### 端口列表

	21 - - - FTP  文件传输 
//木马Doly Trojan、Fore、Invisible FTP、WebEx、WinCrash和Blade Runner
	22 - - - SSH - - - Secure Shell - - - - - - - 远程安全登录 / 文件传输.
	23 - - - Telnet - -Telnet（远程登录）/ 未加密的文本通信,不太安全.
//木马Tiny Telnet Server
	25 - - - SMTP - - -简单邮件传输协议 - - - - - - -邮件服务器间的邮件传递
//木马Antigen、Email Password Sender、Haebu Coceda、Shtrilitz Stealth、WinPC、WinSpy都开放这个端口
	42 - - - WINS - - -WINS主机名服务
	53 - - - DNS - - - 域名服务系统
	80 - - - HTTP - - -超文本传输协议 - - - - - - - - 传输网页
	110- - - POP3 - - -邮局协议-第3版 - - - - - - - - 接收电子邮件
	123- - - NTP - - - Network Time Protocol - - -  用于时间同步
	161- - - SNMP - - -Simple Network Management Protocol
	220- - - IMAP - - -交互邮件访问协议第3版
	443- - - HTTPS - - HTTP securely transferring web pages（加密传输）
	465- - - - - - - - SMTP over SSL
	1080- - -SOCKS - - QQ，默认的端口
	1433- - -MS SQL*SERVER数据库server
	1434- - -MS SQL*SERVER数据库monitor
	1521- - - Oracle 数据库
	3306 - - - - - - - MySQL Database system 
	3389 - - RDP - - - 远程桌面协议 WIN远程登陆
	4899 - - Radmin - -远程控制工具
	5500 - - VNC - - - remote desktop protocol 
	8080 - - - - - - - Apache Tomcat 
	9800 - - - - - - - WebDAV Source Port
	10050- - - - - - - Zabbix-Agent
	10051- - - - - - - Zabbix-Server
	
	HTTP协议代理服务器常用端口号：80/8080/3128/8081/9080 
	HTTP服务器，默认的端口号为80/tcp（木马Executor开放此端口）；




##### 20 21 端口区别

一个是控制端口，控制端口一般为21，
一个是数据端口，而数据端口不一定是20，
这和FTP的应用模式有关，
- 如果是主动模式，应该为20，
	- 如果为被动模式，由服务器端和客户端协商而定

FTP Port模式和FTP Passive模式
　　当你对一个FTP问题进行排错时候，你首先要问的一个问题是使用的是port模式的还是passive 模式。因为这两种行为迥异，所以这两种模式引起的问题也不同；在过去，客户端缺省为active(port)模式；近来，由于Port模式的安全问题，许多客户端的FTP应用缺省为Passive模式。
　　

## 端口命令介绍: ( Mac OS )

保护端口:
1) 查看：经常用命令或软件查看本地所开放的端口，看是否有可疑端口；
2) 判断：如果开放端口中有你不熟悉的，应该马上查找端口大全或木马常见端口等资料（网上多的很），看看里面对你那个可疑端口的作用描述，或者通过软件查看开启此端口的进程来进行判断；
3) 关闭：如果真是木马端口或者资料中没有这个端口的描述，那么应该关闭此端口，你可以用防火墙来屏蔽此端口，也可以用本地连接－TCP/IP－高级－选项－TCP/IP筛选，启用筛选机制来筛选端口；
注意：判断时候要慎重，因为一些动态分配的端口也容易引起你多余的怀疑，这类端口一般比较低，且连续。还有，一些狡猾的后门软件，他们会借用80等一些常见端口来进行通信（穿透了防火墙），令人防不胜防，因此不轻易运行陌生程序才是关键。

#### 查看端口:

- 系统内置的命令 
- Mac 内置Network Utility 
- 第三方端口扫描软件。
- Nmap / Zenmap (GUI 客户端 ,包含在 nmap 包里面 自己选装就好.)


##### 内置命令:
netstat 


##### Network Utility (实用工具)
Port Scan → 输入 IP. 查看本机端口输入: 127.0.0.1
> 端口扫描需要很长时间.因为端口有很多个啊,让它默默运行吧!!! 

实例一: Mac 本地扫描.

	Port Scan has started…
	Port Scanning host: 127.0.0.1
	     Open TCP Port:     22          ssh
	     Open TCP Port:     80          http
	     Open TCP Port:     88          kerberos
	     Open TCP Port:     445         microsoft-ds
	     Open TCP Port:     548         afpovertcp
	     Open TCP Port:     1080        socks
	     Open TCP Port:     3306        mysql
	     Open TCP Port:     4490
	     Open TCP Port:     4491
	     Open TCP Port:     5900        rfb
	     Open TCP Port:     6258
	     Open TCP Port:     6263
	     Open TCP Port:     8090
	     Open TCP Port:     10050       zabbix-agent


实例二: 扫描 Router 本地路由器网关 可以得到路由器 Web管理地址.

	Port Scan has started…
	Port Scanning host: 192.168.11.1
	
	     Open TCP Port:     23          telnet
	     Open TCP Port:     53          domain
	     Open TCP Port:     80          http
	// 说明 路由器的 设置页面端口 是80  有些人会改这个端口 使得路由器更安全.

 



## Port 端口
# 比喻: IP 是一间房子  端口就是门.  一个 ip 有 2^16=65536 个门


电脑通过 TCP/IP 协议 发送和接收数据包. 
数据包根据 目标/对方 IP 来传送到目标电脑.

端口并不是一一对应的!!! 
比如你的电脑作为客户机访 问一台WWW服务器时，
WWW服务器使用“80”端口与你的电脑通信，
但你的电脑则可能使用“3457”这样的端口。

端口作用:
主机根据接收到的数据包里的端口号信息,决定这个数据包送给这么多同时运行的哪个进程(程序). 

一台拥有IP地址的主机可以提供许多服务，比如Web服务、FTP服务、SMTP服务等.
这些服务完全看似通过1个IP地址来实现。实际上是通过“IP地址+默认端口号”来区分不同的服务的。



电脑系统: 给有需求的进程(程序) → 分配协议端口(protocol port,也就是常说的端口)


发送数据包的进程要开启端口 → 数据包标识有源端口 → 接受方才能传回数据包到发送数据的端口。
目的主机接收到数据包 → 根据报文首部的目的端口号 → 把数据发送到打开相应端口的进程.


0-1023一般被用作知名服务器的端口，被预定，如FTP、HTTP、SMTP等
80: www 服务  IE输入网址不必指定端口号，因为在默认情况下WWW服务的端口是“80”。

www 使用其他端口号:在地址后面加上冒号“：”（半角），再加上端口 号。
比如使用“8080”作为WWW服务的端口，则需要在地址栏里输入“网址：8080”。




21: FTP 服务  





每个 TCP 连接都必须由一端（通常为 client )发起请求，
这个 port 通常是随机选择大于 1024的端口号



由于TCP和UDP 两个协议是独立的，因此各自的端口号也相互独立，
比如TCP有235端口，UDP也 可以有235端口，两者并不冲突。


如果攻击者使用软件扫描目标计算机，得到目标计算机打开的端口，也就了解了目标计算机提供了哪些服务。
我们都知道，提供服务就一定有服务软件的漏洞，根据这些，攻击者可以达到对目标计算机的初步了解。
如果计算机的端口打开太多，而管理者不知道，那么，有两种情况：
一种是提供了服务而管理者没有注意，比如安装IIS的时候，软件就会自动增加很多服务，而管理员可能没有注意到；
一种是服务器被攻击者安装木马，通过特殊的端口进行通信。这两种情况都是很危险的，
说到底，就是管理员不了解服务器提供的服务，减小了系统安全系数。


入侵者通常会用扫描器对目标主机的端口进行扫描，以确定哪些端口是开放的，从开放的端口，入侵者可以知道目标主机大致提供了哪些服务，进而猜测可能存在的漏洞，因此对端口的扫描可以帮助我们更好的了解目标主机，而对于管理员，扫描本机的开放端口也是做好安全防范的第一步。



三次握手(交换/传达信息): 
比喻: 我 你    为什么我要两次回应. 
第一次握手    我说: 我想打你
第二次握手    你回: 好的 并做好准备挨打的准备.
第三次握手    我说: 恩 我要开始打了
三次握手之后才能建立连接.  如果第三次



TCP封包会将（且只将） SYN旗标设定起来！表示这是整个联机的第一个封包；

如果另一端（通常为 Server ) 接受这个请求的话，
则会向请求端送回整个联机的第二个封包！其上除了 SYN旗标之外同时还将 ACK 旗标也设定起来，并同时在本机端建立资源以待联机之需；

然后，请求端获得服务端第一个响应封包之后，必须再响应对方一个确认封包，此时封包只带 ACK旗标（事实上，后继联机中的所有封包都必须带有 ACK 旗标）；

· 只有当服务端收到请求端的确认（ ACK ）封包（也就是整个联机的第三个封包）之后，两端的联机才能正式建立。这就是所谓的 TCP 联机的'三次握手（ Three-Way Handshake )'的原理。


经过三向交握之后，
 client 端的 port 通常是高于 1024 的随机取得的 port，
主机端 根据当时的服务是开启哪一个 port 而定，
例如 WWW 选择 80 而 FTP 则以 21 为正常的联机信道！


## Port

默认端口:

mysql 端口  3306


*查看端口

netstat -an | grep 3306


查看端口被哪个进程 占用
sudo lsof -n -P| grep :8087


lsof命令
通过list open file命令可以查看到当前打开文件，
在linux中所有事物都是以文件形式存在，包括网络连接及硬件设备。

lsof -i:80

-i参数表示网络链接，:80指明端口号，该命令会同时列出PID，方便kill



# 路由攻防


#### 扫描路由端口

拒绝服务( DoS ) 攻击主要有：
ICMP Flood、

一秒内 某ip 收到 规定数量的 ICMP 请求包

UDP Flood、
一秒内 某ip 的某个端口 收到超过规定数量的 UDP 包

SYN Flood、
某 ip 的某端口 收到超量的 TCP SYN 包.

WinNuke。
针对 Windows.  


拒绝服务 ( Dos—Denial of Service )
目的 用 极其大量的虚拟信息流 耗尽目标主机的资源.
目标主机被迫全力处理虚假信息流 从而影响正常信息流.

如果 攻击来自多个源地址 就称为  分布式拒绝服务 DDoS.

防护:
设置一个阈值. 一秒内 某 ip 的某种数据包 超过了一定数量 就认定发生了一次 洪泛工具
那么 接下来 2秒内的 忽略该ip 的这一类型的数据包.



比如  路由器 没有开启Dos 类攻击防护:
那么 ping 该 ip 结果是连续正常的.
如果 路由器开启了 ICMP Flood 防护 阈值设成 100PPS
单位为每秒数据包个数PPS＝Packet Per Second

那么 再 ping 路由器   就会不正常了. 
路由器 日志服务器 也能看到相应的攻击信息.





扫描类的攻击防护主要有二类：

- IP扫描，
一段时间内 一个源IP 发送ICMP 请求包到 10+ 以上的 ip.
- 端口扫描，
一段时间内一个源IP 发送 TCP SYN包到同一目的地的10+的不同的端口.


 


网管通常都会将路由器的默认端口(80)给更改掉.
路由器 Web 登录界面  破解.

借助“网页密码破解工具”“WebCrack”来帮忙。
简单点说，像这类网页密码破解就是应用穷举法，从配套的字典文件读取预设好的密码一个个去试，这个靠的就是电脑的速度和耐性。密码短简单的也许只要几分钟，密码要是太长太复杂也许就是几天几年...

　　下载WebCrack并安装。运行后首先点击“用户名文件”处的浏览按钮，创建文件。然后我们再去找些配套的字典文件，字典里是用转用软件生的各种不同的用户名和密码供软件一对对去匹配，例如admin、123456等常见的用户名，当然字典里面的数据越多，破解的概率就越大，密码输入格式为一行一个。回到WebCrack界面中，勾寻使用用户名字典”选项，并浏览选中刚才创建的文本文档。接着在“URL”中填入路由器的登录地址，设置完毕后，我们点击“开始”按钮进行探测。

　　探测结束后，我们可以点击“结果”按钮，然后切换到“发现密码”标签处查看检测结果。这个时候路由器就被我们接管，接下来你就可以为所欲为啦，但也不要太过份，小心别人拨网线哟！！

　


很明显，由于每台计算机运行的服务不同，你看到的扫描结果也大相径庭。 
但是如果你扫描Mac 和 PC 的话，通常你将会看到 
Web servers, SMB 。 
Windows 共享端口 445, 
AFP 苹果文件共享协议 548. 
也许会有 SSH server 在 22 端口。 
UDP servers. 和其他潜在的可能开放的端口。 

  
如果没有发现任何东西并且可以确定该目标上有服务正在运行。
- 要么是这台主机禁用了广播，目标主机拒绝了所有的请求，
- 要么就是前端配置了一个强壮的防火墙。 
\- 
  目标可以定在网络中的 Mac , Windows , IOS 设备  , Linux , 或者其他的网络设备上。 
  很明显 Network Utility 只限于Mac 使用，如果想使用 IOS 设备进行端口扫描 ， 那将是另外一篇文章啦.





[https://support.apple.com/zh-cn/HT202944][1]
[]()

8800 sunwebadmin  



7
TCP/UDP
echo
792
echo
-
20
TCP
文件传输协议 (FTP)
959
ftp-data
-
21
TCP
FTP 控制
959
ftp
-
22
TCP
Secure Shell (SSH)
4253
ssh
Xcode Server（托管和远程 Git+SSH；远程 SVN+SSH）
23
TCP
Telnet
854
telnet
-
25
TCP
简单邮件传输协议 (SMTP)
5321
smtp
邮件（用于发送电子邮件）；iCloud 邮件（正在发送）
53
TCP/UDP
域名系统 (DNS)
1034
domain
MacDNS、FaceTime
67
UDP
Bootstrap 协议服务器（BootP、bootps）
951
bootps
NetBoot via DHCP
68
UDP
Bootstrap 协议客户端 (bootpc)
951
bootpc
NetBoot via DHCP
69
UDP
普通文件传输协议 (TFTP)
1350
tftp
-
79
TCP
Finger
1288
finger
-
80
TCP
超文本传输协议 (HTTP)
2616
http
万维网、iCloud、QuickTime 安装程序、地图、iTunes U、Apple Music、iTunes Store、播客、互联网广播、OS X 软件更新（OS X Lion 及更低版本）、Mac App Store、RAID Admin、备份、日历、WebDAV、Final Cut Server、AirPlay、OS X 互联网恢复、描述文件管理器、Xcode Server（Xcode 应用、托管和远程 Git HTTP、远程 SVN HTTP）。
88
TCP
Kerberos
4120
Kerberos
Kerberos（包括屏幕共享鉴定）
106
TCP
密码服务器
（未注册使用）
-
3com-tsmux
Mac OS X Server 密码服务器
110
TCP
邮局协议 (POP3)
经身份验证的邮局协议 (APOP)
1939
pop3
邮件（用于接收电子邮件）
111
TCP/UDP
远程过程调用 (RPC)
1057、1831
sunrpc
端口映射器 (sunrpc)
113
TCP
标识协议
1413
ident
-
115
TCP
简单文件传输协议 (SFTP)
913
sftp
-
119
TCP
网络新闻传输协议 (NNTP)
3977
nntp
由读取新闻组的应用程序使用。
123
UDP
网络时间协议 (NTP)
1305
ntp
“日期与时间”偏好设置。用于网络时间服务器同步、AppleTV 网络时间服务器同步
137
UDP
Windows 互联网名称服务 (WINS)
-
netbios-ns
-
138
UDP
NETBIOS 数据报服务
-
netbios-dgm
Windows 数据报服务、Windows 网上邻居
139
TCP
服务器信息块 (SMB)
-
netbios-ssn
由 Microsoft Windows 文件和打印服务（如 Mac OS X 中的 Windows 共享）使用。
143
TCP
互联网消息访问协议 (IMAP)
3501
imap
邮件（用于接收电子邮件）
161
UDP
简单网络管理协议 (SNMP)
1157
snmp
-
192
UDP
OSU 网络监控系统
-
osu-nms
AirPort 基站 PPP 状态或发现（特定配置）、AirPort 管理实用工具、AirPort Express 助理
311
TCP
服务器安全管理
-
asip-webadmin
Server 应用、Server Admin、Workgroup Manager、Server Monitor、Xsan Admin。
312
TCP
Xsan 管理
-
vslmp
Xsan 管理（OS X Mountain Lion v10.8 及更高版本）
389
TCP
轻量级目录访问协议 (LDAP)
4511
ldap
由查找地址的应用程序（如“邮件”和“地址簿”）使用。
427
TCP/UDP
服务定位协议 (SLP)
2608
svrloc
网络浏览器
443
TCP
安全套接字层（SSL 或“HTTPS”）
2818
https
TLS 网站、iTunes Store、OS X 软件更新（Mountain Lion 及更高版本）、Spotlight 建议、Mac App Store、地图、FaceTime、Game Center、iCloud 鉴定和 DAV 服务（通讯录、日历和书签）、iCloud 备份和应用程序（日历、通讯录、查找我的 iPhone/查找我的朋友、邮件、文稿和照片流）、iCloud 键值存储 (KVS)、iPhoto 日志、AirPlay、OS X 互联网恢复、描述文件管理器、回到我的 Mac、听写、Siri (iOS)、Xcode Server（托管和远程 Git HTTPS、远程 SVN HTTPS、Apple Developer 注册）。
445
TCP
Microsoft SMB 域服务器
-
microsoft-ds
-
464
TCP/UDP
kpasswd
3244
kpasswd
-
465
TCP
用于“邮件”的信息提交（经身份验证的 SMTP）
 
smtp（旧版）
邮件（用于发送邮件）
500
UDP
ISAKMP/IKE
2408
isakmp
OS X Server VPN 服务、回到我的 Mac
500
UDP
Wi-Fi 通话
5996
IKEv2
Wi-Fi 通话
514
TCP
shell
-
shell
-
514
UDP
Syslog
-
syslog
-
515
TCP
行式打印机 (LPR)、行式打印机监控程序 (LPD)
-
printer
用于通过网络打印机打印、Mac OS X 中的打印机共享
532
TCP
netnews
-
netnews
-
548
TCP
通过 TCP 的 Apple 档案分享协议 (AFP)
-
afpovertcp
AppleShare、个人文件共享、Apple 文件服务
554
TCP/UDP
实时流协议 (RTSP)
2326
rtsp
QuickTime 流服务器 (QTSS)、流媒体播放器、AirPlay
587
TCP
用于“邮件”的信息提交（经身份验证的 SMTP）
4409
submission
“邮件”（用于发送邮件）、iCloud 邮件（SMTP 身份验证）
600-1023
TCP/UDP
基于 Mac OS X RPC 的服务
-
ipcserver
例如，由 NetInfo 使用
623
UDP
Lights-Out-Monitoring
-
asf-rmcp
由 Intel Xserves 的 Lights-Out-Monitoring (LOM) 功能使用；由 Server Monitor 使用
625
TCP
Open Directory Proxy (ODProxy)（未注册使用）
-
dec_dlm
Open Directory、Server 应用、Workgroup Manager；OS X Lion 及更低版本中的 DirectoryServices。注：此端口已注册给 DEC DLM。
626
TCP
AppleShare Imap Admin (ASIA)
-
asia
IMAP 管理（Mac OS X Server v10.2.8 或更低版本）
626
UDP
serialnumberd（未注册使用）
-
asia
Server 序列号注册（Xsan、Mac OS X Server v10.3 - v10.6）
631
TCP
互联网打印协议 (IPP)
2910
ipp
Mac OS X 打印机共享，通过多台普通打印机打印
636
TCP
安全 LDAP
-
ldaps
-
660
TCP
服务器管理
-
mac-srvr-admin
Mac OS X Server v10.4 及更低版本的服务器管理工具，包括 AppleShare IP。
687
TCP
服务器管理
-
asipregistry
Mac OS X Server v10.6 及更低版本的服务器管理工具，包括 AppleShare IP。
749
TCP/UDP
Kerberos 5 admin/changepw
-
kerberos-adm
-
985
TCP
NetInfo 静态端口
-
-
-
993
TCP
邮件 IMAP SSL
-
imaps
iCloud 邮件 (SSL IMAP)
995
TCP/UDP
邮件 POP SSL
-
pop3s
-
1085
TCP/UDP
WebObjects
-
webobjects
-
1099 和 8043
TCP
对 JBOSS 的远程 RMI 和 IIOP 访问
-
rmiregistry
-
1220
TCP
QT Server Admin
-
qt-serveradmin
用于管理 QuickTime 流服务器。
1640
TCP
证书注册服务器
-
cert-responder
描述文件管理器、SCEP
1649
TCP
IP 故障转移
-
kermit
-
1701
UDP
L2TP
-
l2f
Mac OS X Server VPN 服务
1723
TCP
PPTP
-
pptp
Mac OS X Server VPN 服务
1900
UDP
SSDP
-
ssdp
Bonjour、回到我的 Mac
2049
TCP/UDP
网络文件系统 (NFS)（第 3 版和第 4 版）
3530
nfsd
-
2195
TCP
Apple 推送通知服务 (APNS)
-
-
推送通知
2196
TCP
Apple 推送通知服务 (APNS)
-
-
反馈服务
2336
TCP
移动帐户同步
-
appleugcontrol
个人目录同步
3004
TCP
iSync
-
csoftragent
-
3031
TCP/UDP
远程 AppleEvent
-
eppc
程序链接、远程 Apple 事件
3283
TCP/UDP
网络助理
-
net-assistant
Apple Remote Desktop 2.0 或更高版本（报告功能）
3306
TCP
MySQL
-
mysql
-
3478-3497
UDP
-
-
nat-stun-port - ipether232port
FaceTime、Game Center
3632
TCP
分布式编译器
-
distcc
-
3659
TCP/UDP
简单身份验证和安全层 (SASL)
-
apple-sasl
Mac OS X Server 密码服务器
3689
TCP
数字音频访问协议 (DAAP)
-
daap
iTunes 音乐共享、AirPlay
3690
TCP/UDP
Subversion
-
svn
Xcode Server（匿名远程 SVN）
4111
TCP
XGrid
-
xgrid
-
4398
UDP
-
-
-
Game Center
4488
TCP
Apple 广域连接服务
 
awacs-ice
回到我的 Mac
4500
UDP
IPsec NAT Traversal
4306
ipsec-msft
OS X Server VPN 服务、回到我的 Mac。注：若在 NAT 模式下配置 AirPort 基站或 Time Capsule 上的“回到我的 Mac”，会妨碍与 NAT 模式下的 OS X Server VPN 服务的连接。
4500
UDP
Wi-Fi 通话
5996
IKEv2
Wi-Fi 通话
5003
TCP
FileMaker - 名称绑定和传输
-
fmpro-internal
-
5009
TCP
（未注册使用）
-
winfs
AirPort 实用工具、AirPort Express 助理
5060
UDP
会话启动协议 (SIP)
3261
sip
iChat
5100
TCP
-
-
socalia
Mac OS X 摄像头和扫描仪共享
5190
TCP/UDP
America Online (AOL)
-
aol
iChat 和 AOL Instant Messenger、文件传输
5222
TCP
XMPP (Jabber)
3920
jabber-client
iChat 和 Jabber 信息
5223
TCP
Apple 推送通知服务
-
-
iCloud DAV 服务（通讯录、日历和书签）、APNS、FaceTime、Game Center、照片流、回到我的 Mac
5269
TCP
XMPP 服务器到服务器的通信
3920
jabber-server
iChat 服务器
5297
TCP
-
-
-
iChat（本地通信）
5298
TCP/UDP
-
-
-
iChat（本地通信）
5350
UDP
NAT 端口映射协议通知
-
-
Bonjour、回到我的 Mac
5351
UDP
NAT 端口映射协议
-
nat-pmp
Bonjour、回到我的 Mac
5353
UDP
多址广播 DNS (MDNS)
3927
mdns
Bonjour、AirPlay、家庭共享、打印机查找、回到我的 Mac
5432
TCP
PostgreSQL
-
postgresql
可以在 Lion Server 上手动启动。之前已默认为 ARD 2.0 数据库启用。
5678
UDP
SNATMAP 服务器
-
rrac
端口 5678 上的 SNATMAP 服务用于确定主机的外部互联网地址，以便 iChat 用户之间的连接可在网络地址转换 (NAT) 下正常使用。SNATMAP 服务仅将已连接到它的互联网地址告知客户端。此服务在 Apple 服务器上运行，但不会将个人信息发送给 Apple。在使用了特定 iChat AV 功能的情况下，将与此服务建立联系。阻止此服务可能会导致与使用 NAT 的网络上的主机之间的 iChat AV 连接出现问题。
5897-5898
UDP
（未注册使用）
-
-
xrdiags
5900
TCP
虚拟网络计算 (VNC)
（未注册使用）
-
vnc-server
Apple Remote Desktop 2.0 或更高版本（监视/控制功能）
屏幕共享（Mac OS X 10.5 或更高版本）
5988
TCP
WBEM HTTP
-
wbem-http
Apple Remote Desktop 2.x（请参阅http://dmtf.org/standards/wbem）
6970-9999
UDP
-
-
-
QuickTime 流服务器
7070
TCP
RTSP（未注册使用）
自动路由器配置协议（ARCP - 已注册使用）
-
arcp
QuickTime 流服务器 (RTSP)
7070
UDP
RTSP 备用
-
arcp
QuickTime 流服务器
7777
TCP
iChat 服务器文件传输代理（未注册使用）
-
cbt
-
8000-8999
TCP
-
-
irdmi
Web 服务、iTunes Radio 流
8005
TCP
Tomcat 远程关闭
-
-
-
8008
TCP
iCal 服务
-
http-alt
Mac OS X Server v10.5 及更高版本
8080
TCP
Apache Web 服务的备用端口
-
http-alt
还包括 Mac OS X Server 10.4 及更低版本中的 JBOSS HTTP
8085-8087
TCP
Wiki 服务
-
-
Mac OS X Server v10.5 及更高版本
8088
TCP
“软件更新”服务
-
radan-http
Mac OS X Server v10.4 及更高版本
8089
TCP
Web 电子邮件规则
-
-
Mac OS X Server v10.6 及更高版本
8096
TCP
Web 密码重设
-
-
Mac OS X Server v10.6.3 及更高版本
8170
TCP
HTTPS（Web 服务/网站）
-
-
Podcast Capture/Podcast CLI
8171
TCP
HTTP（Web 服务/网站）
-
-
Podcast Capture/Podcast CLI
8175
TCP
Pcast 隧道
-
-
pcastagentd（用于控制操作、摄像头等）
8443
TCP
iCal 服务 (SSL)
-
pcsync-https
Mac OS X Server v10.5 及更高版本。曾为 Mac OS X Server 10.4 及更低版本中的 JBOSS HTTPS。
8800
TCP
地址簿服务
-
sunwebadmin
Mac OS X Server v10.6 及更高版本
8843
TCP
地址簿服务 (SSL)
-
-
Mac OS X Server v10.6 及更高版本
8821、8826
TCP
已存储
-
-
Final Cut Server
8891
TCP
ldsd
-
-
Final Cut Server（数据传输）
9006
TCP
独立的 Tomcat
-
-
Mac OS X Server v10.6 及更低版本
9100
TCP
打印
-
-
用于通过特定网络打印机打印
9418
TCP/UDP
git 包传输
-
git
Xcode Server（远程 git）
10548
TCP
Apple 文稿共享服务
-
serverdocs
OS X Server iOS 文件共享
11211
-
memcached（未注册）
-
-
日历服务器
16080
TCP
-
-
-
具有高性能缓存的 Web 服务
16384-16403
UDP
实时传输协议 (RTP)、实时控制协议 (RTCP)
-
connected、-
iChat AV（音频 RTP、RTCP；视频 RTP、RTCP）
16384-16387
UDP
实时传输协议 (RTP)、实时控制协议 (RTCP)
-
connected、-
FaceTime、Game Center
16393-16402
UDP
实时传输协议 (RTP)、实时控制协议 (RTCP)
-
-
FaceTime、Game Center
16403-16472
UDP
实时传输协议 (RTP)、实时控制协议 (RTCP)
-
-
Game Center
24000-24999
TCP
-
-
med-ltp
具有高性能缓存的 Web 服务
42000-42999
TCP
-
-
-
iTunes Radio 流
49152-65535
TCP
Xsan
-
-
Xsan 文件系统存取
49152-65535
UDP
-
-
-
回到我的 Mac
50003
-
FileMaker 服务器服务
-
-
-
50006
-
FileMaker 帮助程序服务
-
-
-

[1]:	https://support.apple.com/zh-cn/HT202944
