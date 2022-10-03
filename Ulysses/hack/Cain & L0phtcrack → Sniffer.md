## Cain & L0phtcrack   → Sniffer

## Cain    [官网下载链接:][1] 

*内网渗透 最常用的手段之一.   主要作用: 嗅探局域网密码 

**FTP**、**HTTP**、IMAP、**POP3**、**SMB**、**TELNET**、VNC、TDS、SMTP、MSKERB5-PREAUTH、MSN、RADIUS-KEYS、RADIUS-USERS、ICQ、

网络嗅探, 网络欺骗  显示缓存口令. 分析路由协议 监听内网 VOIP 电话,

Abel : 后台服务程序. 很少用到 开着就好.
Cain : 需要 先安装 Winpcap.  注: Winpcap → windows packet capture    [官网:][2] 
> 为程序提供 访问网络底层的能力. 提供强大的编程接口. 只能监听网络数据包.

### Function :
- 屏幕保护. PWL  文件共享 缓存 SMB VNC SQL RDP 密码
	   
## 界面介绍:

1. File :    文件

2. View :  设置软件窗口的界面布局.

3. Configure : 参数设置
	- Sniffer:
		1. 网卡的选择.
		2. Winpcap 版本信息.
		3. 当前网卡信息
		4. 警告: 只支持 以太网适配器
		5. 选项
			- 启动时 开启嗅探
			- 不使用混杂模式
				开启混杂模式 能捕捉到局域网所有数据.
			- 启动时 开启 ARP 攻击.

	- APR ( Arp Posion Routing )
		1. 使用真实的 IP 和 Mac

		2. 使用伪造的 IP 和 Mac ( 需要满足下面两个条件: )
			- 攻击者主机 需连在 hub 中. 不能在交换机中
			- 设置的 IP 需是 子网合法且未使用的 IP.

		3. Pre-posion ARP cache
			预欺骗 ARP 缓存 ???

		4. Posioning:
			- 欺骗 arp 缓存 每 xx 秒 
				// xp 默认 每2分钟 更新 arp 缓存表. 设置的太大 会达不到效果.
			- 使用 ARP reply 包

			- 使用 arp 请求包( 更多的网络流量 )


	- Filters and Ports  过滤器和端口设置
		关闭不需要的选项. 如 pop3 ICQ ….

	- Http Fields HTTP 过滤
		检查和过滤 HTTP 包中含有的 敏感字符: 用户名 和 密码.

	- Traceroute 路由跟踪


4. Tools:
	Processor Info 处理器信息
	Discinnect
	Route Table : 路由表
	TCP / UDP Tables :



- Decoders 解码器
	读取缓存中的密码 .选择一个类别 然后点 ✚ 号进行查看. 

	1. Protected Storage      保护存储   加密的硬盘?? 
		2. LSA Secrets                LSA 加密 一种算法.
		3. Wireless Passwords    已连接的 Wifi 密码  亲测可用.
		4. IE 7/8/9 Passwords     IE 6 亲测不行.
		5. Windows Mail Passwords
		6. Dialup Passwords       拨号口令
		7. Edit Boxes                  编辑框??
		8. Enterprise Manager   企业管理
		9. Credential Manager   凭证管理     → FTP 账号密码 亲测可用.
		10. Windows Vault



- Network

	鉴别 各 域控制器. SQLserver 打印服务 远程拨入. 终端服务 . 

	查看*网络结构*. 共享目录 和 服务

	电脑名+  操作系统(部分)  


### 工作组:

打印机服务器 :
  能发现 NAS!!! 如果 NAS 开启 Guest 就能看的 文件目录! 以及 能登录的用户账号列表!!


数据库服务器 :







### 域:

列出所有域电脑.


能列出域控主机 所有的用户.





- Sniffer 嗅探器  *最常用!!!重点功能  嗅探 + ARP 欺骗  

嗅探器:  局域网内各种密码.
仅支持 以太网嗅探.


ARP 原理: 操纵两台主机的ARP缓存表，以改变它们之间的正常通信方向，
这种通信注入的结果就是ARP欺骗攻击。
利用这个 可以获取明文信息. 



- 先配置 ( configure )
	→ 选择要嗅探的网卡.




	→APR ( Arp Posion Routing )
	→ 选择使用 伪造 IP 和 MAC 进欺骗
	伪造的 ip 不能和已有的冲突.... 
过滤端口 选择你要的 比如要嗅探远程桌面密码 : 3389.

然后 点击 ☢图标 进行嗅探.
嗅探 N 久之后 点击下面的 截获密码.   密码会包括 http ftp vnc smtp icq 等密码.






## ARP 欺骗

Sinffer 
→ ARP 
→ ✚ 
→ 跳出 新建 ARP 欺骗对话框 
→ 左边选网关 右边线被欺骗的 IP



## DNS 欺骗:
实现: 访问 www.hao123.com  自动跳转到 www.google.cn


Sinffer
→ ARP-DNS  →  ✚  新建对话框:  
上面填 DNS 名称  www.hao123.com   
下面填  ip   11.22.33.11
→ 点击 解析  
→ 填入 www.google.cn 
点击 放射图标 开始欺骗.
`#Resp.spoofed  就是目标主机被欺骗的次数
`




## 远程桌面欺骗:
用 中间人攻击 Man-In-The-Middle 接活目标主机的 3389 登录密码.


小技巧：在肉鸡上对密码进行嗅探的时候，可以按Alt +Delete对界面进行隐藏，按Alt + Page Down隐藏都任务栏，按Alt +Page up呼出界面。这个技巧在内网渗透的时候非常有用!





- Cracker

## 密码破解:

可以破解md5,md4,pwl,mssql等加密的密文，我这里示范如何使用Cain破解md5密文。

有暴力破解 字典破解.


- Traceroute
- CCDU
- Wireless
- Query


要使用 Sniffer 
首先要激活 :  单击  start/stop Sinffer.

sniffer 下面 先选 host

空白处 右击 选择 Mac 地址选择. 
设置:
All hosts in my subnet  扫描子网全部主机.
range 范围扫描

Promiscuous-mode Scanner 混杂模扫描器.

ok 开始


得到很多 ip+ mac 

然后切换到 sniffer 下的 arp.
空白处 添加: 
左边选 被骗的主机.  右边 一台或者多台 pc.
这时候 将捕捉 所有被欺骗主机 和 其他主机之间的 通信数据!!!
点击 ok.


arp-cert 数字证书收集器. 配合 ARP-https 使用.
arp-dns: dns 欺骗用. 点击就能添加:
Dns name:  被欺骗主机原来想要访问的网站.
回应包 输入 你想让他去的网站.


arp-ssl ssl 远程登录协议. arp 可以利用 MTTM 中间人攻击.

arp-https  捕捉 和 揭秘 主机和服务器之间的通信.

arp-rdp  捕捉远程桌面连接的密码.


sinffer → Passwords 
可以看能支持的协议. 用户名和密码 都是以明文显示的. 捕捉数据前 要先启动.

sniffer → Voip
保存 voip 的通话内同.




破解器:  实际意义不大 . 破解速度很慢.
- 支持很多 hash 算法的破解 及 加密方法
- 暴力破解
- 字典破解





## L0phtcrack  

Win 密码破解. Charged Software.  expensive.  Lastest Version 6.0.20 ( 2016.4.20 )

Windows 系统所有账户密码 都在  `%systemroot%system32\config\sam文件里 `

L0phtCrack软件可以对sam文件内的帐户密码进行破解。 

教程:

1. 选择 本地 还是 远程 还是局域网嗅探 

2. 选是  简单 普通 复制 自定义 解密

3. 打钩所有选项...

4. Wait





[1]:	http://www.oxid.it/cain.html
[2]:	http://www.winpcap.org/