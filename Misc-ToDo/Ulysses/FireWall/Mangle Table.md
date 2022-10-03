#### Mangle Table :  
> 查看 Mangle 表:  `iptables -t mangle --list`
**如何处理数据包.** 它能改变TCP头中的QoS位。内建5种链：

1. PREROUTING
	2. OUTPUT
		3. FORWARD
		4. INPUT
		5. POSTROUTING
