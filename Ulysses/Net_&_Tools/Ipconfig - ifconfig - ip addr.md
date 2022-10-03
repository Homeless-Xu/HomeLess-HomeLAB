## Ipconfig / ifconfig / ip addr
> 获取网卡信息.
> 设置 IP & 掩码 & 广播 & MAC地址 & 激活/禁用网卡 …… 
> 用 ifconfig 配置的信息.网卡重启之后就不存在了. 要永久保存 只能修改网卡配置文件

*Mac: ifconfig*
*Win: ipconfig*
*Linux：ip addr*

Linux 网卡命名规则:
1. eth0 第一块网卡
	2. eth1 第二块网卡
		3. Lo   环回接口. 127.0.0.1

	ifconfig 
//显示所有网卡信息.
lo0    en0    en1

	ifconfig en5
//显示 en5 单块网卡信息

有线网卡
en5: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
// UP:网卡开启  Running:网线已连接  Multicast:支持组播  mtu:最大传输单元
options=10b<RXCSUM,TXCSUM,VLAN_HWTAGGING,AV>
ether ac:87:a3:02:06:da
inet6 fe80::ae87:a3ff:fe02:6da%en5 prefixlen 64 scopeid 0xb
inet 172.19.16.188 netmask 0xffffff00 broadcast 172.19.16.255

nd6 options=1<PERFORMNUD>
media: autoselect (1000baseT <full-duplex,flow-control>)
status: active


无线网卡
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
ether 3c:15:c2:d6:0e:fa
inet6 fe80::3e15:c2ff:fed6:efa%en0 prefixlen 64 scopeid 0x4
inet 172.19.16.68 netmask 0xffffff00 broadcast 172.19.16.255
nd6 options=1<PERFORMNUD>
media: autoselect
status: active

































