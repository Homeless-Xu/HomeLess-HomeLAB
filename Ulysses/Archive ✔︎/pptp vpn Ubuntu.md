
## pptp vpn Ubuntu:

1. 安装 pptp :        apt-get install pptpd

2. 编辑 pptp.conf     vi /etc/pptpd.conf
3. 将以下内容行的注释去掉：(18 / 99 / 100 行)
option /etc/ppp/pptpd-options
localip 192.168.0.1
remoteip 192.168.0.201-245
这两句设置了当外部计算机通过pptp联接到vpn后所能拿到的ip地址范围和服务器的ip地址设置。



4. 添加登录用户
vi /etc/ppp/chap-secrets
添加一行，格式如下
用户名 pptpd "你想要的密码" * 用户名不要引号
密码要用半角双引号括起来
千万不能忘了 星号.星号是说允许从任何IP地址联接，如果你想单独设定IP地址也可以。

理论上到这里一个vpn就已经搭建完毕了。无论你用的是Windows还是OSX，或者是iPhone OS，都可以通过建立一个pptp链接来联入这个VPN。




不过你并不能通过这个来上Internet，因为所有的数据都作用于那台pptpd的服务器上， 而不会传入拨入的计算机设备上。要上Internet还需要这么干：

设置DNS解析，编辑pptpd-options
vi /etc/ppp/pptpd-options















