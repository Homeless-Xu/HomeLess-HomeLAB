## Caupture Fileter
**捕捉过滤器** & **显示过滤器**

## 捕捉过滤器
**必须在捕捉前设置完成.**
工具栏 → 捕获 → 捕获筛选器 → 选择/新建过滤规则 → 双击选中规则 → 选择一个网卡 → 开始
软件界面最上方会显示选择的网卡名字 和 过滤规则名字


*protoc 协议:
可能值: ether fddi ip arp rarp decnet lat sca moprc mopdl tcp udp
默认值:所有协议


*direction 方向 
可能值: src; dst; src and dst ; scr or dst ;
默认值: scr or dst 

*host
可能值: net; port; host; portrange ;

*Logical Operations（逻辑运算）:
可能的值：not, and, or.
否("not")具有最高的优先级。
或("or")和与("and")具有相同的优先级，

**例子：
1. `tcp dst port 3128`
	显示目的TCP端口为3128的封包。

	2. `ip src host 10.1.1.1`
		显示来源IP地址为10.1.1.1的封包。

		3. `host 10.1.2.3`
			显示目的或来源IP地址为10.1.2.3的封包。

		4. `src portrange 2000-2500`
			显示来源为UDP或TCP，并且端口号在2000至2500范围内的封包。

		5. `not imcp`
			显示除了icmp以外的所有封包。（icmp通常被ping工具使用）

		6. `src host 10.7.2.12 and not dst net 10.200.0.0/16`
			显示来源IP地址为10.7.2.12，但目的地不是10.200.0.0/16的封包。 



工具栏下面 一行内 输入:

ip.addr==192.168.0.219  
输出 与此 ip 相关的数据包

ip.src==192.168.0.105
输出 此源ip 是这个的 数据包

ip.dst==119.147.74.18
输出 这个目的 ip的数据包

http :   只输出 http 协议包






## 显示过滤器:  

查看语法:  显示过滤条 右边 有个例外: 双击  然后查找



# 例子：  

snmp || dns || icmp
显示SNMP或DNS或ICMP封包。

ip.addr == 10.1.1.1
显示来源或目的IP地址为10.1.1.1的封包。

ip.src != 10.1.2.3 or ip.dst != 10.4.5.6
显示来源不为10.1.2.3或者目的不为10.4.5.6的封包。


ip.src != 10.1.2.3 and ip.dst != 10.4.5.6
显示来源不为10.1.2.3并且目的IP不为10.4.5.6的封包。


tcp.port == 25
显示来源或目的TCP端口号为25的封包。

tcp.dstport == 25
显示目的TCP端口号为25的封包。

tcp.flags
显示包含TCP标志的封包。

tcp.flags.syn == 0x02
显示包含TCP SYN标志的封包。

如果过滤器的语法是正确的，表达式的背景呈绿色。
如果呈红色，说明表达式有误。

