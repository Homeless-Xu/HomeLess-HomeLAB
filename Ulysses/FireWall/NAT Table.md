
### NAT Table 
 查看NAT表: `iptables -t nat --list`

内建三种链:

1. *PREROUTING 链* 
	 
		处理刚到达本机并在路由转发前的数据包。
		它会转换数据包中的目标IP地址（destination ip address），
		通常用于DNAT(destination NAT)。

	2. *POSTROUTING 链*
		 
			处理即将离开本机的数据包。
			它会转换数据包中的源IP地址（source ip address），
			通常用于SNAT（source NAT）。

		3. *OUTPUT 链* 
			 
				处理本机产生的数据包。


