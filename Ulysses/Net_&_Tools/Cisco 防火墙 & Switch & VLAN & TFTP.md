## Cisco 防火墙 & Switch & VLAN & TFTP

1. Console线首次配置，
2. 开启Telnet/ssh 以后都用远程登录。
	> 注意：交换机和路由器的命令都是一样的.

*查看 ARP:*   `show arp`

### Man命令导出
	man ls > a.txt   
导出的文件 会有很多特殊的符号. 不方便打印

	man ls | col -bfp > ls.txt
	man tftp | col -bfp > xx.txt
加参数就好了.



### 命令行模式:    用户 → 特权 → 全局 → 接口 模式.
> 权限一级一级进的. 用户模式不能直接进入全局模式.

#### *用户模式*    ： route\> / switch\>
默认进入的是用户模式，受限制极大.

#### *特权模式*    switch# / route\#
*“enable”(可简写为“en”)*
可以查看并修改路由器或交换机的配置。

**特权模式常用命令：
- show version ：查看系统IOS版本
	* - show running-config ：查看当前的配置信息*
	- copy running-config startup-config ：保存当前的配置 或者使用 write
		- erase startup-config ：删除已保存的配置
			* - show startup-config ：查看保存好的配置*
			- show mac-address-table ：查看交换机的mac地址表
				- show int 接口名称 ：查看接口的信息
			* - show arp ：查看ARP缓存表*
			* - show ip route ：查看路由表信息*
			- show ip int brief ：查看所有接口的IP地址信息。
				- no ip domain-lookup ：禁用DNS查询
				- line con 0
				- exec-timeout 0 0 ：不超时连接
			- logging synchronous ：不启用时间同步，信息不打断输入命令

#### *全局模式*    
route(config)\#
*“config terminal”(可简写为conf t)*

可配置路由器的静态条目等

ip route 目标网络 子网掩码 下一跳地址 ：配置静态路由
ip route 0.0.0.0 0.0.0.0 下一跳地址  ：配置默认路由

reload ：重启路由器

#### *接口模式*  ：  route(config -if)\#
inter fastethernet 接口名称 简写 *int f*

可配置此接口的名称，所做的配置也只对这个接口有效。

route(config)# inter fastethernet 0/1

主要是给接口配置IP地址以及开启接口等配置。

ip address IP地址 子网掩码 ：给接口配置地址
no shutdown ：开启接口
注意：在这些命令模式下，如果想要进入上层模式，可以使用以上命令，如果是想要返回下次模式呢？这时可以使用“exit”命令，逐层返回。
  

**二、配置接口的IP地址以及配静态路由**
要想给接口配置IP地址就必须进入到接口模式，所以我先要进入接口模式。

*配置接口IP地址:*
route(config)# int f0/0
route(config-if)#ip add 192.168.1.1 255.255.255.0   #列如配置一个192.168.1.1的ip地址
no shutdown ：开启该接口
*配置静态路由:*
ip route 10.10.10.0 255.255.255.0 192.168.1.1
由于交换机不用设置IP地址，但是需要开启端口。
switch(config)#int range f0/1 -24  
switch(config-if)#no shutdown
开启交换机的0-24个接口。
  

### 路由器、交换机密码的管理

1. 配置的console口密码
	`route(config)#line console 0
	``route(config-line)#password 密码
	``route(config-line)#login
	`
2. 配置特权模式密码
	`route(config)#enable password 密码
	`
3. 配置密文密码
	上述配置的密码都是以明文显示，查看当前配置即可以查看到密码，这样很不安全，所以我们来使用以下方法来配置密码。
	`route(config)#enable secret 密码  
	`上述是配置加密的特权密码，在同时使password和secret设置特权密码时，后者生效。
	`route(config)#service password-encryption
	`上述方法可以将明文设置的密码进行加密。

4. 恢复路由器密码
	*路由器的密码存在startup-config中*，所以我们启动路由器时，必须绕过startup-config配置，然后重新设置密码。
	如果要绕过startup-config配置只有修改寄存器的值,默认是 0x2102(十六进制的)，将其改为0x2142即可。
	下面总结一些路由器破解密码的步骤。
	1. 重启路由器，并同时按下Ctrl+Break键中断IOS的加载，路由器将进入ROMMonitor模式。
		2. 将配置寄存器的值改为0x2142，并重新启动路由器。
			rommom\>confreg 0x2142
			rommom\>reset
		3. 路由器再次重启，由于更改了 配置寄存器的值，路由器无法加载配置文件，因此不需要密码验证，进入配置模式后，手动将配置文件加载回来。
			Route#copy startup-config running-config
		4. 这时可以使用show running-config查看路由器配置了那些密码，逐一更改密码即可。
		5. 将配置寄存器的值更改回来，并将所做的配置保存,重启路由即可生效。
			Router(config)#config-register 0x2012
			Router(config)#exit
			Router#copy running-config startup-config
			Router#reload
5. 交换机密码的恢复
	*Cisco交换机密码存在flash中的配置文件config.text里*，可以通过命令“dir”查看.
	恢复密码和路由器的原理是一样的，都是绕过配置文件启动交换机即可，
	路由器我们知道是修改寄存器的值，那么交换机呢？我们改怎么做呢？
	原理很简单，将config.text文件改个名字，让系统在加载配置文件时找不到它，这样交换机在启动后就回到了出厂设置，登录交换机也就不需要密码了。
	但是需要注意的是，进入IOS后，要不原来的配置恢复回来，在把密码改成自己的。
**交换机密码恢复步骤如下：
1. 拔掉交换机的电源线，因为交换机没有开关机的按键，所以需要把电源重启交换机.
	在重新接上交换机后，立刻按住交换机上的“mode”键，当看到配置界面显示“swith:”命令提示，便可松开“mode”键。
	表示已近进入到一个专门用来中故障恢复的简单IOS。
	2. 使用提示的命令`flash_init` 初始化flash。

		3. 将config.text文件改名,并重启交换机。
			`switch:rename flash:config.text flash:config.txt`
			`switch:boot`
		4. 现在就可正常进入IOS了，但是还需要做相关的配置才可以修改密码，
		先要把配置文件的名字改回来，然后手动加载配置文件，最后就可以查看设置了那些密码，逐一更改即可。
		`switch# rename flash:config.txt flash:config.text`
		`switch# copy flash:config.text system:running-config`
		`switch# show running-config`
		5. 最后保存配置即可。
			`switch#copy running-config flash:config.text`
			  

### 远程管理路由器，交换机
1. 配置管理IP
	由于路由器是三层设备，可以直接在器接口上配置IP地址，所以直接使用接口地址作为管理IP即可。
	二交换机是二层设备，必须配置管理IP地址。我们可以通过给交换的虚拟接口配置IP，列如：交换机的管理IP为192.168.10.1
	`switch(config)#int vlan 1`
	`switch(config)#ip add 192.168.10.1 255.255.255.0`
	`switch(config)#no shutdown`

2. 配置VTY密码远程登录一台设备时，可以通过VTY(虚拟类型终端)密码做验证，基于安全考虑，没有配置VTY密码是无法实现远程登录的。
	`switch(config)#line vty 0 4    #表示同时允许VTY0-VTY4等5个虚拟终端连接`
	`switch(config-line)#password 123 #VTYmima`
	`switch(config-line)#login`

3. 需要注意的是，如果仅仅是配置上述内容，还是无法达到远程管理的程度，应远程用户只有看，而没有修改的权限，所以需要设置一个特权密码即可。
	`switch(config)#enable secret 123`

4. 如果远程的交换机与管理员的主机不在同一个网段，就必须给交换机指定默认网关，否则无法实现远程登录。
	`switch(config)#ip default-gateway 192.168.10.254`
	  

**路由器，交换机的IOS备份与恢复
*路由器，交换机的IOS备份与恢复工作，主要是使用TFTP.*但是现在新型的路由器，交换机已近支持TCP协议传输了。

在此我就以TFTP描述备份和还原IOS的过程。
IOS备份工作如下：
1、下载Cisco TFTP Server工具，并创建TFTP服务器根目录。
2、在路由器上使用一下命令备份IOS。
`Route# copy flash tftp
``Address or name of remote host ? 192.168.10.2  #tftp服务器的地址
``Source filename ? c2800nm-ipbase-mz.123-6e.bin  #系统ios的名称，可以使用dir命令查看
``Destinaon filename c2800nm-ipbase-mz.123-6e.bin ?   #这里回车确认。
`
这时可以查看tftp的根目录，就会发现已近有一个备份好的iso了。
如果要实现恢复工作则将Route# copy tftp flash 即可


###  导出配置文件 （交换机&防火墙&路由器 通用）
1. 先在Win下面用 tftpd32 搭建好FTP 服务器.
	2. Telnet 进设备，en 进入高级模式
	`#copy startup-config tftp`
	 输入 tftpd服务器 IP
	输入要导出的文件名
	回车. 
	去服务器上看导出的文件.



### **RiverStone 网关 配置导出**
1. telnet 进网关. 
2. en进特权模式

3. 输入 `?` 
	看看支持什么命令!!!!!.  发现有 copy

4. 输入 `copy ?`
	看 copy 支持的命令
	[keyword]              - One of the following keywords:
	 scratchpad          - Copy from the scratchpad configuration database
	 dns-server          - Copy from a DNS server
	 rcp-server          - Copy from a RCP server
	 tftp-server         - Copy from a TFTP server
	 startup             - Copy from the startup configuration database
	 active              - Copy from active configuration database (running
	   system)

5. 输入 `copy active` 变成下面这样了.
	> SH-OFFICE-GATEWAY(copy-active)\#
6. 输入 `?`       看支持的命令 :   to / Ctrl-Z / top
7. 输入 `to ?`     看支持命令. 这里选 tftp-server
8. 输入 `to tftp-server`
	输入TFTP服务器 IP 
	输入要导出的文件名(这个文件名必须已经在服务器中存在.)
	大概就是 网关只能通过 tftp 修改已经存在的文件.而不能创建新文件. 也不能修改文件名.



### 路由器文件 (哪些要备份)







## VLAN

### **VLAN 好处:**

1. 控制广播
	- 每个VLAN都是一个单独的广播域，广播信息只会在这个广播域里面传播。
		从而大大减少了广播对网络宽带的占用，也提高了网络传输效率.
		- 并且一个VALN出现了广播风暴不会影响到其他的VLAN。

	2. 增强网络安全性

		不同的VLAN的电脑之间不能直接相互访问，就限制个别主机访问服务器资源。提高网络的安全性。

	3. 简化网络管理
		由于VLAN可以根据不同的环境进行划分，
		可以将不同地理位置的主机划分到同一个VLAN中，而不需要移动物理设备，
		所以利用VLAN技术可以大大的减少管理员的工作量。
		  

### **VLAN的种类

1. *静态VLAN* （端口VLAN）
	*最常见的VLAN实现方式。*
	需要明确指定交换机的端口属于哪个VLAN。

	2. *动态VLAN*
		目前最普遍的实现方法是*基于主机网卡MAC地址*的动态VLAN。


		列如：在思科交换机上使用VLAN数据库模式配置一个ID为VLAN 10的VLAN。
		Switch#vlan database
		Switch(vlan)#vlan 10
		Switch(vlan)#exit
		列如：在思科交换机上使用全局配置模式配置一个ID为VLAN 20的VLAN。
		Switch#configure terminal
		Switch(config)#vlan 20
		Switch(config-vlan)#exit
		删除VLAN可以使用 Switch(vlan)#no vlan 10或Switch(config)#no vlan 20
		2、将交换机的端口加入到相应的VLAN中。
		列如：将交换机的f0/1-f0/10号端口加入到VLAN 10中。
		Switch(config)#int range f0/1 -10
		Switch(config-if-range)#switchport access vlan 10
		Switch(config-if-range)#no sh
		Switch(config-if-range)exit
		3、查看交换机VLAN的配置信息。
		SWitch#show vlan brief
		  

		配置VLAN Trunk
		接入链路：通常属于一个VLAN，主机与交换机之间连接的链路就是接入链路。
		中继链路：可以承载多个VLAN，中继链路常用来将一台交换机连接到其他交换机，或者是交换机连接到路由器。
		Trunk的作用：使同一个VLAN能够跨交换机通信，中继链路之间都使用Trunk。
		Trunk的配置
		列如：将交换机的f0/24号端口配置为Trunk模式。
		Switch(config)#int f0/24
		Switch(config-if)#switchport mode trunk
		Switch(config-if)no sh
		Switch(config-if)exit
		注意：只有中继链路两端都配置Trunk模式，中继链路才会生效。



		EthernetChannel(以太网通道)
		EthernetChannel通过捆绑多条以太链路来提高链路带宽，并运行一种机制，将多个一台网端口捆绑成一条逻辑链路。以太网通道最多可以捆绑8条物理链路。其中物理链路可以是双绞线的，也可以是光纤的。
		配置以太网通道的前提条件
		1、参与捆绑的端口必须属于同一个VLAN。如果是在中继模式下，要求所参与捆绑的端口都是在中继模式下(也就是Trunk模式)，并且所有端口上配置相同的准许VLAN范围。
		2、所有参与捆绑的端口的物理参数设置必须相同，应该有同样的速度和双工模式。
		以太网通道的配置
		例如：将交换机中继链路的f0/23和f0/24号端口捆绑成以太网通道。
		Switch(config)#int range f0/23 -24
		Switch(config-if-range)#switchport mode trunk
		Switch(config-if-range)#channel-group 1 mode on
		Switch(config-if-range)#no sh
		Switch(config-if-range)#exit


## command

- 版本信息:  `show version`  

switch(config)#hostname 
- 更改交换机名字.

检查、查看命令
show (sh) 开始

show flash 查看内存

show mac-address-table  查看 Mac 地址列表



两种方式 创建 vlan
全局配置模式下: vlan 10

或者 vlan database 下 创建 vlan:
switch(vlan)vlan 20


更好局域网交换机名字
终端下 输入 hostname xx  就变成 xx 了.

*创建 vlan*
xx(config) vlan 10
xx(config-vlan)# name xujian
xx(config-vlan)# exit


把端口给 vlan

switch(config)# interface fastethernet0/1  进入端口配置模式
switch(config)# switchport mode access 配置端口为 access 模式
switch(config)# swtchport access vlan 10 把端口划分给 vlan 10

一次把多个端口 分给某Vlan :interface range

xx(config-if-range)#interface range fa0/5 -6


查看vlan信息 
switch# show vlan


静态路由配置

了解静态原理



如:  
一网络  里面 三个网段
192.168.1.1
192.168.2.1
192.168.3.1

1.1 下面的电脑 要访问  2.1/3.1 
需要 数据包 发给 1.1 的路由器 
1.1 的路由器  由于没有 2.1/3.1 的路由
所以需要 手动来 配置  静态路由.
数据是双向的  .

路由器1 需要
ip route 192.168.2.0 255.255.255.0 10.1.12.2 
// 把 前往2.0网段的数据 发送给总的网关. 再进行转发.



动态路由:





静态路由:
网管 手工配置路由信息.
当拓扑图发生变化时候  网管要手工去改 路由表中的静态路由信息.

静态路由信息 默认情况下是 私有的 不会传递给别的路由器.
当然 网管可以通过对路由器进行设置使之成为共享的.


静态路由 适用简单网络环境. 网管比较了解网络的拓扑结构,方便正确设置路由信息.




 优点: 网络安全 保密性高. 很少占用路由器 cpu 和 RAM 和线路带宽


动态路由: 
路由器之间需要频繁的交换各自的路由表,
通过分析这些路由表 可以分析 出网络的 拓扑结构+网络地址等信息. 因此有安全隐患.	


大型网络  不宜选用静态路由 

一方面 网管难以全面了解 整个网络拓扑结构
另一面 当网络拓扑发生改变 静态路由表 需要大范围的调整 难度和复杂度非常高




静态路由举例:
> IP 省略前面的 192.168.

PCA (0.2 ) \<---\> ( 0.1 ) Router1 ( 1.1 )  \<---\> ( 1.2 ) Router2 ( 2.1 ) \<---? PCB ( 2.2 )


默认 A B 是不能通信的.
A 不知道 B 的网段 ( 也就是没有去玩 B 网段的路由表 ) 
B 不知道 A 的网段
→ 通信失败.

这时候 就需要 在
R1 R2 上 分别配置静态路由来使得 AB 可互通.

R1 上执行 添加静态路由的命令:
ip route 192.168.2.0 255.255.255.0 192.168.1.1 
// 告诉 R1 如果有去2.0网段的 IP 包, 将包发个 192.168.1.1

R2 上执行 
ip route 192.168.0.0 255.255.255.0 192.168.1.1
// 告诉 R2 如果有去0.0网段的 IP 包, 将包发个 192.168.1.2


这样 A→B 的包  会通过 R1 的 0.0网段 转给 1.1的网口 再转给R2的 1.2的网口 再转给2.0 网段



默认路由: ( 属于 静态路由的一种 )

指的是 当路由表中与包地址 之间没有匹配项目时 路由能做出选择,
如果 没有默认路由 那么 没有匹配项的包将被丢弃.




路由器得查看路由表 决定 如何转发数据包.
用静态路由 一个一个配置 太烦易错.






如果 路由器 有个邻居 知道怎么前往所有目的地 可以把路由表匹配任务交给他 省事.
这个邻居 就是网关. 
如果 路由器 连到网关, 那么 所有的数据包都会转发给网关.


默认路由 是 0.0.0.0 (就是 你 不去手动去设置网关)
匹配 ip 地址的时候 0 表示 wildcard / 通配符 . 任何值都可以.











静态路由信息在默认情况下是私有的，不会通告给其它路由器，也就是当在一个路由器上配置了某条静态路由时，它不会被通告到网络中相连的其它路由器上。但网络管理员还是可以通过重发布静态路由为其它动态路由，使得网络中其它路由器也可获此静态路由。


静态路由是具有单向性的，也就是它仅为数据提供沿着下一跳的方向进行路由，不提供反向路由。所以如果你想要使源节点与目标节点或网络进行双向通信，就必须同时配置回程静态路由。这在与读者朋友的交流中经常发现这样的问题，就是明明配置了到达某节点的静态路由，可还是ping不通，其中一个重要原因就是没有配置回程静态路由。


如果某条静态路由中间经过的跳数大于1（也就是整条路由路径经历了三个或以上路由器结点），则必须在除最后一个路由器外的其它路由器上依次配置到达相同目标节点或目标网络的静态路由，这就是静态路由的“接力”特性，否则仅在源路由器上配置这么静态路由还是不可达的。
   就像你要从长沙到北京去，假设中间要途经的站点包括：武汉-郑州-石家庄，可人家只告诉你目的地是北京，以及从长沙出发的下一站是武汉。对于一个没有多少旅游经验的人来说，你是不可能知道到了武汉后又该如何走，必须有人告诉你到了武汉后再怎么走，到了郑州后又该怎么走，……。这就是“接力性”。


经验之谈】路由器各端口上所直接连接的各个网络都是直接互通的，因为它们之间默认就有直连路由，无需另外配置其它路由。也即连接在同一路由器上的各网络之间的跳数为0。



## VLANs
[英文 VLAN pri配置教程]()

虚拟局域网

ddwrt 设置教程


设置 → VLANs → 每个端口 分配给不同的 组
比如 
端口 w 分给 vlan 2
端口 1 分给 vlan 3
端口 2 分给 vlan 4
端口 3 分给 vlan 5
端口 4 分给 vlan 6


然后去 网络下面   端口配置
Vlan  3456 都不要选择预设 选择未配置 .
然后 给每个 vlan 都设置 ip段 + 子网掩码


然后还要开启 dhcp 功能: 也就是多路 dhcpd 功能  

这里 添加 4个 dhcpd 服务器.  每个服务器 选择相应的 vlan 分组 就好了. ok.







设备的管理是维护设备正常运行的基本条件，所以这里我们就来了解一下思科路由器和交换机的一些基本管理命令和方法。
管理路由器和交换机的方法以及命令主要分为一下几个方面：
1、了解命令行的模式。
2、配置接口的IP地址以及相关的路由条目。
3、路由器、交换机密码的管理。
4、远程管理路由器、交换机。
5、系统IOS的备份与恢复。






## GNS3 

互联网操作系统（**Internetwork Operating System，简称IOS**）
思科公司为其网络设备开发的操作维护系统。

官网下载 1.4.5 免费. 跨平台网络虚拟软件( 路由系统 )

GNS3整合了如下的软件：
•	Dynamips：电脑运行Cisco系统(IOS)的模拟器
•	Dynagen：是Dynamips的文字显示前端
•	Pemu：PIX防火墙设备模拟器。
•	Winpcap：为win32应用程序提供访问网络底层的能力。
 
功能简介：
•	设计优秀的网络拓扑结构
•	模拟Cisco路由设备和PIX防火墙
•	仿真简单的Ethernet, ATM和帧中继交换机





用户通过命令行人机界面对网络设备进行功能设置，提供的功能大致为以下几点：网络设备及连接端口的功能首选项设置、运行网络协议与网络功能设备间之数据传输安全管理设置。


**GNS3 推荐IOS:**   c3640, c3660, c3725, c3745 and c7200 .            // 别的不一定兼容.  



## Cisco Router + 模拟器

模拟器:  模拟设置.学习用. 类似 VM VB 等虚拟机.

1. Cisco Packet Tracer 6.2 网络模拟器中文正式版，带中文汉化补丁，
	将文件Chinese.ptl拷贝到C:\Program Files (x86)\Cisco Packet Tracer 6.2sv\languages目录下，
	运行Cisco Packet Tracer 6.2，在选项中修改语言。


## GNS3  
不是支持 所有设备的虚拟.  有些.bin 文件  →  Sorry, this is not a valid IOS image!
免费软件 官网下载 .  和虚拟机一样 需要 cisco 路由系统的镜像文件( .bin 格式的 )

设置 → Dynamips → ios routers →  选择下载的 .bin 镜像. → 一路 NEXT. 

开机: 拖出路由器到主界面.  右键 start  
进入命令窗口: 开机后双击路由图标




  





