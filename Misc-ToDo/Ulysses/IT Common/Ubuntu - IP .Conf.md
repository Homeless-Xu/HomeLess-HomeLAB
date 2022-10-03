## Ubuntu - IP .Conf

网络配置文件
`/etc/network/interfaces`


**开启 DHCP**
1. vi 配置文件

	2. 加入下面两行
		`auto eth0`
		`iface eth0 inet dhcp`
		3. `wq!` 保存退出 vi

		4. `sudo dhclient eth0`

		5. `ip addr` 就能获取到 IP 了.




`ip addr`
看有几个网卡. 网卡的名称.

ifconfig eth0 up


ifconfig 
启用网卡:







2. 静态 IP










