## Debian PPTP
# [经典教程链接][1]: 
# 安装 PPTP    apt-get install pptpd
1. 升级本地软件包  apt-get update (类似检查更新 可忽略)
	   
# 配置 PPTP    vi /etc/pptpd.conf

将文件底部 最后两行 改为： 
localip 192.168.217.1
remoteip 192.168.217.234-238,192.168.217.245
 
第一行:这个是连接 VPN 成功后 vpn 服务器的 IP 地址，随便写，但不要和本地 路由器分配的IP 地址冲突就行。
第二行:这个是连接 VPN 成功后 本地客户端 的 IP 地址,  相当于路由器的 DHCP 功能.



# 添加 VPN 帐户    vi /etc/ppp/chap-secrets 
 
用户名 pptpd 你的密码 \*（别忘记最后这个星号） 一行一个账户+密码
例子: xujian pptp 0219 \*

 

# 修改 DNS 服务器    vi /etc/ppp/options

找到 两行ms-dns  (12 13 行) 去掉#号 更改成如下内容
ms-dns 8.8.8.8
ms-dns 8.8.4.4


# 开启 IPv4 转发    vi /etc/sysctl.conf

去掉 net.ipv4.ip\_forward=1 前的注释(28行)，
然后运行 sysctl -p 使配置生效







# 重启 PPTP 服务

/etc/init.d/pptpd restart



# 安装 iptables  apt-get install iptables

# 开启iptables转发

iptables -t nat -A POSTROUTING -s 192.168.217.0/24 -o eth0 -j MASQUERADE

iptables-save \> /etc/iptables.pptp
 


# 手动在/etc/network/if-up.d/目录下创建iptables文件 写入内容 并给与运行权限

cd /etc/network/if-up.d/         cd 到目录
touch iptables                   新建文件
vi iptables                      编辑文件

添加如下内容：  然后保存退出
\#!/bin/sh
iptables-restore \< /etc/iptables.pptp

给脚本添加执行权限：
chmod +x /etc/network/if-up.d/iptables






连接不上:  mac → 系统信息 → 日志 → vpn 日志 


[1]:	http://www.vpser.net/manage/linode-vps-pptp-vpn-howto.html