## Nmap 

## Manual :
LAN Scan Tool.  局域网扫描工具.

有终端命令模式 ;  也有 GUI 图形化界面: Zenmap


**命令结构:**
	nmap -sS -T2 -p 1-500 172.19.16.16 -oN metscan.txt

sS : 扫描类型  代表隐蔽扫描.默认开启.
发起 TCP 连接,但是永远不完成三次握手,从而避免察觉. (还是可以被探测到的)



T2 : timing 选项 nmap 扫描时的 速度.流量
p  : 扫描的端口.
172.19.16.16 : IP 或者网段 都可以.
oN : 输出选项.把扫描结果保存成文件.以便分析.










## 常用命令集合 :
- 扫描单主机  : `nmap 172.19.16.16`
- 扫描局域网  : `nmap 172.19.16.1/24`
- 扫描指定端口 : 
	` nmap -p80,443,22,21 172.19.16.164
	`` //只对80,443,1000,65534这几个特殊的端口进行扫描
	`` nmap -p1-219 0214.help
	`` // 扫描 1-219 范围内的端口.
	`
- 万能参数 -A   很慢! 时间长.
	` nmap -A 172.191.6.164
	`1. 1-10000的端口ping扫描
		2. 操作系统扫描
		3. 脚本扫描
		4. 路由跟踪
		5. 服务探测

**参数:
扫描路由器

-O  操作系统检查 大小的 o.

-F  快速扫描最可能开放的100个端口



sudo nmap -O 172.19.16.16




### Windows 查看开启端口
`netstat -an    列出所有的 TCP/UDP`

### Mac 查看开启端口.
`nmap 172.19.16.164   
`
135/tcp msrpc
139/tcp netbios-ssn
443/tcp http
445/tcp microsoft-ds
902/tcp iss-realsecure
912/tcp apex-mesh
2869/tcp icslap
3389/tcp ms-wbt-server

nmap -vv 172.19.16.164 端口结果详细输出.

#### **扫描局域网 IP+电脑名**

	nmap -sP 192.168.11.1/24

	Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-09 19:29 CST
	Nmap scan report for 192.168.11.1   
	// 这是 电信路由器下面的二级路由器.
	Host is up (0.047s latency).
	Nmap scan report for 192.168.11.108
	// 这是 手机 IPhone 5S
	Host is up (0.062s latency).
	Nmap scan report for 192.168.11.129
	// 这是 Mac RMBP.
	Host is up (0.014s latency).
	Nmap done: 256 IP addresses (3 hosts up) scanned in 23.51 seconds
	// 可以看出 本地网 有3台设备  一个是路由器 两个是电脑.


---- ---------------------------------------------------------------------
### 

- 主机探测：局域网主机列表. 
		nmap -sP 172.19.16.1/24
 
- 系统检测( PC & 路由器 )：目标大概操作系统. Windows / Linux / Mac

		sudo nmap -O 172.19.16.164 → Running: Microsoft Windows 2008|8.1|7|Phone|Vista
		// 实际 Win7 X64
		sudo nmap -O 172.19.16.72   → Running: Apple Mac OS X 10.10.X|10.11.X
		//实际 Mac os 10.11
		sudo nmap -O 172.19.30.1     → 
		Running (JUST GUESSING): D-Link embedded (88%), TRENDnet embedded (88%), Aerohive HiveOS 3.X|5.X (88%), Linux 2.6.X (86%), Avocent embedded (86%), ZoneAlarm embedded (85%)
		//实际 思科路由器.


- 版本检测：探测目标主机的网络服务，判断其服务名称及版本号。 

- 丰富的脚本库
- 扫描 Web 站点
- 绕开防火墙/ IDS/IPS


支持探测脚本的编写：使用Nmap的脚本引擎（NSE）和Lua编程语言。


可以源代码编译 /  也可以下载安装. Mac OS [Namp-7.01.dmg 下载链接][1]

　　
简要回顾Nmap简单的扫描方式：

[http://blog.csdn.net/aspirationflow/article/details/7983368][2]




### 安装 下载 编译 

简单扫描:

	nmap 0214.help
	输出如下内容:
	Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-09 18:44 CST
	Nmap scan report for 0214.help (120.24.39.106)
	Host is up (0.14s latency).
	Not shown: 995 closed ports
	PORT     STATE    SERVICE
	21/tcp   open     ftp
	22/tcp   open     ssh
	111/tcp  open     rpcbind
	445/tcp  filtered microsoft-ds
	4444/tcp filtered krb524
	
	Nmap done: 1 IP address (1 host up) scanned in 10.21 seconds



Nmap 简单扫描, 返回详细结果:
	nmap -vv 0214.help
	
	Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-09 18:46 CST
	Initiating Ping Scan at 18:46
	Scanning 0214.help (120.24.39.106) [2 ports]
	Completed Ping Scan at 18:46, 0.05s elapsed (1 total hosts)
	Initiating Parallel DNS resolution of 1 host. at 18:46
	Completed Parallel DNS resolution of 1 host. at 18:46, 0.18s elapsed
	Initiating Connect Scan at 18:46
	Scanning 0214.help (120.24.39.106) [1000 ports]
	Discovered open port 22/tcp on 120.24.39.106
	Discovered open port 111/tcp on 120.24.39.106
	Discovered open port 21/tcp on 120.24.39.106
	Completed Connect Scan at 18:46, 4.14s elapsed (1000 total ports)
	Nmap scan report for 0214.help (120.24.39.106)
	Host is up, received conn-refused (0.22s latency).
	Scanned at 2016-03-09 18:46:27 CST for 4s
	Not shown: 995 closed ports
	Reason: 995 conn-refused
	PORT     STATE    SERVICE      REASON
	21/tcp   open     ftp          syn-ack
	22/tcp   open     ssh          syn-ack
	111/tcp  open     rpcbind      syn-ack
	445/tcp  filtered microsoft-ds no-response
	4444/tcp filtered krb524       no-response
	
	Read data files from: /usr/local/bin/../share/nmap
	Nmap done: 1 IP address (1 host up) scanned in 4.46 seconds



Nmap 自定义范围扫描:
> nmap 默认扫描 1-10000 内的端口. -p 参数手动扫描端口.


#### 路由跟踪:

##### 工作原理：
利用ICMP及IP header的TTL（Time To Live）栏位（field）。

首先，traceroute送出一个TTL是1的IP datagram到目的地，
当路径上的第一个路由器（router）收到这个datagram时，它将TTL减1。此时，TTL变为0了，
所以该路由器会将此datagram丢掉，并送回一个「ICMP time exceeded」消息（包括发IP包的源地址，IP包的所有内容及路由器的IP地址），traceroute 收到这个消息后，便知道这个路由器存在于这个路径上，

接着traceroute 再送出另一个TTL是2 的datagram，发现第2 个路由器...... traceroute 每次将送出的datagram的TTL 加1来发现另一个路由器，这个重复的动作一直持续到某个datagram 抵达目的地。当datagram到达目的地后，该主机并不会送回ICMP time exceeded消息，因为它已是目的地了，那么

traceroute如何得知目的地到达了呢？
Traceroute在送出UDP datagrams到目的地时，
它所选择送达的port number 是一个一般应用程序都不会用的号码（30000 以上），
所以当此UDP datagram 到达目的地后该主机会送回一个「ICMP port unreachable」的消息，而当traceroute 收到这个消息时，便知道目的地已经到达了。
Traceroute提取发 ICMP TTL到期消息设备的IP地址并作域名解析。每次 ，Traceroute都打印出一系列数据,包括所经过的路由设备的域名及 IP地址,三个包每次来回所花时间。




用于确定 IP 数据报访问目标所采取的路径 和 在各路段花费的时间。

需要 Root 权限运行

命令用 IP 生存时间 (TTL) 字段和 ICMP 错误消息来确定从一个主机到网络上其他主机的路由。

Tracert 工作原理
通过向目标发送不同 IP 生存时间 (TTL) 值的“Internet 控制消息协议 (ICMP)”回应数据包，Tracert 诊断程序确定到目标所采取的路由。要求路径上的每个路由器在转发数据包之前至少将数据包上的 TTL 递减 1。数据包上的 TTL 减为 0 时，路由器应该将“ICMP 已超时”的消息发回源系统。
Tracert 先发送 TTL 为 1 的回应数据包，并在随后的每次发送过程将 TTL 递增 1，直到目标响应或 TTL 达到最大值，从而确定路由。通过检查中间路由器发回的“ICMP 已超时”的消息确定路由。某些路由器不经询问直接丢弃 TTL 过期的数据包，这在 Tracert 实用程序中看不到。




	sudo nmap --traceroute 0214.help
	
	Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-09 19:01 CST
	Nmap scan report for 0214.help (120.24.39.106)
	Host is up (0.036s latency).
	Not shown: 995 closed ports
	PORT     STATE    SERVICE
	21/tcp   open     ftp
	22/tcp   open     ssh
	111/tcp  open     rpcbind
	445/tcp  filtered microsoft-ds
	4444/tcp filtered krb524
	
	TRACEROUTE (using port 256/tcp)
	HOP RTT      ADDRESS
	1   24.87 ms 192.168.11.1
	2   24.06 ms 192.168.1.1
	3   25.42 ms 1.204.82.218.broad.xw.sh.dynamic.163data.com.cn (218.82.204.1)
	4    5.16 ms  124.74.49.77
	5   29.18 ms 101.95.41.109
	6   27.30 ms 101.95.120.142
	7   51.44 ms 202.97.82.82
	8   ...
	9   41.77 ms 119.147.220.222
	10  ...
	11  45.61 ms 42.120.239.246
	12  36.04 ms 42.120.242.218
	13  37.27 ms 42.120.240.25
	14  ... 15
	16  36.49 ms 120.24.39.106
 
 
解析:
记录从 1 开始. 每个记录 就是一跳. 每跳表示一个网关.

RTT  同一封包来回时间  Round-Trip Time


#### 操作系统类型 推测
通过目标开放的端口来 推测 主机所运行的操作系统类型。
这是信息收集中很重要的一步，确定 对方是 Win7 / XP / Mac …


例一: 真机是 Mac - RMBP 10.11

	sudo nmap -O 192.168.11.129
	
	Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-09 19:40 CST
	Nmap scan report for 192.168.11.129
	Host is up (0.00014s latency).
	Not shown: 992 closed ports
	PORT     STATE SERVICE
	22/tcp   open  ssh
	80/tcp   open  http
	88/tcp   open  kerberos-sec
	445/tcp  open  microsoft-ds
	548/tcp  open  afp
	3306/tcp open  mysql
	5900/tcp open  vnc
	8090/tcp open  unknown
	Device type: general purpose
	Running: Apple Mac OS X 10.10.X|10.11.X
	OS CPE: cpe:/o:apple:mac_os_x:10.10 cpe:/o:apple:mac_os_x:10.11
	OS details: Apple Mac OS X 10.10 (Yosemite) - 10.11 (El Capitan) (Darwin 14.0.0 - 15.0.0)
	Network Distance: 0 hops
	
	OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
	Nmap done: 1 IP address (1 host up) scanned in 16.11 seconds


例二: 真机是 iPhone 5S
	sudo nmap -O 192.168.11.108
	
	Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-09 19:43 CST
	Nmap scan report for 192.168.11.108
	Host is up (0.0064s latency).
	Not shown: 999 closed ports
	PORT      STATE SERVICE
	62078/tcp open  iphone-sync
	MAC Address: 54:AE:27:78:EE:C9 (Apple)
	OS details: Apple Mac OS X 10.7.0 (Lion) - 10.10 (Yosemite) or iOS 4.1 - 8.3 (Darwin 10.0.0 - 14.5.0)
	Network Distance: 1 hop
	
	OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
	Nmap done: 1 IP address (1 host up) scanned in 48.96 seconds


例三: Debian 7.5 

	sudo nmap -O 0214.help
	Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-09 19:33 CST
	Nmap scan report for 0214.help (120.24.39.106)
	Host is up (0.037s latency).
	Not shown: 995 closed ports
	PORT     STATE    SERVICE
	21/tcp   open     ftp
	22/tcp   open     ssh
	111/tcp  open     rpcbind
	445/tcp  filtered microsoft-ds
	4444/tcp filtered krb524
	Aggressive OS guesses: DD-WRT v24 (Linux 3.10) (95%), HP P2000 G3 NAS device (95%), Linux 2.6.32 - 3.13 (93%), Linux 3.10 (93%), Linux 3.2 - 3.13 (93%), Linux 2.6.32 - 2.6.39 (92%), Linux 3.2 - 3.8 (92%), OpenWrt Chaos Calmer (Linux 3.10 - 3.14) (92%), OpenWrt Barrier Breaker (Linux 3.10) (92%), MikroTik RouterOS 6.19 (Linux 3.3.5) (92%)
	No exact OS matches for host (test conditions non-ideal).
	Network Distance: 16 hops
	
	OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
	Nmap done: 1 IP address (1 host up) scanned in 16.02 seconds


例四:
	sudo nmap -O mzyy0219.oicp.net
	
	Starting Nmap 7.01 ( https://nmap.org ) at 2016-03-09 19:36 CST
	Nmap scan report for mzyy0219.oicp.net (174.128.255.230)
	Host is up (0.18s latency).
	Not shown: 997 filtered ports
	PORT   STATE SERVICE
	81/tcp open  hosts2-ns
	82/tcp open  xfer
	88/tcp open  kerberos-sec
	Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
	Device type: general purpose|load balancer|media device|specialized|WAP
	Running (JUST GUESSING): Linux 2.6.X|3.X (92%), Kemp embedded (92%), Crestron 2-Series (90%), Hikvision embedded (90%)
	OS CPE: cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:3 cpe:/h:kemp:loadmaster_2400 cpe:/o:crestron:2_series cpe:/o:linux:linux_kernel:2.6.10 cpe:/h:hikvision:ds-7600 cpe:/o:linux:linux_kernel:2.6.22 cpe:/o:linux:linux_kernel:3.10
	Aggressive OS guesses: Linux 2.6.32 - 3.10 (92%), Kemp LoadMaster LM-2400 Firmware 7.1 (92%), Linux 2.6.32 (92%), ProVision-ISR security DVR (90%), Crestron XPanel control system (90%), HIKVISION DS-7600 Linux Embedded NVR (Linux 2.6.10) (90%), OpenWrt Kamikaze 7.09 (Linux 2.6.22) (90%), Linux 3.2 (89%), DD-WRT v24-sp2 (Linux 3.10) (88%), OpenWrt 0.9 - 7.09 (Linux 2.4.30 - 2.4.34) (88%)
	No exact OS matches for host (test conditions non-ideal).
	OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
	Nmap done: 1 IP address (1 host up) scanned in 63.09 seconds


































[1]:	https://nmap.org/dist/nmap-7.01.dmg
[2]:	http://blog.csdn.net/aspirationflow/article/details/7983368