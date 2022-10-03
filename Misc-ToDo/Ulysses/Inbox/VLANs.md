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


