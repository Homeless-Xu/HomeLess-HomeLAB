## TFTP (MAC & Win)

Trivial File Transfer Protocol (TFTP)
基于UDP协议的简单的、低开销的文件传输协议， (思科开发的)  

允许客户端get或者put文件到远程服务器上。

1. Cisco 设备 导出配置 网络上必须有 tftp server
	2. Cisco 设备 就是一个 tftp 的客户端
		> Tftp  服务器开启后好像是扫描不到端口的 

### Windows TFTP 搭建.
 找台电脑装个 tftpd32 软件. 把这电脑当成 TFTP 的服务器.
 进 tftp 软件.选择网卡 .就好了.登录交换机 上传配置到 服务器.

### **Mac Tftp :**

*配置文件位置  // 一般不用去修改.
`/System/Library/LaunchDaemons/tftp.plist`

> Mac系统自带TFTP服务. 只需开启就可以把 Mac当TFTP 服务器.
开启方法:
	sudo launchctl load -w /System/Library/LaunchDaemons/tftp.plist

*TFTP默认文件位置: (上传到服务器的文件 都在这目录下)
`/private/tftpboot`

**Mac 注意点:
如果你要把文件传到 Mac 的 TFTP 服务器.
Mac 的默认TFTP 文件位置下面.必须存在一个文件, (且文件必须是对外公开的.)
文件名必须和你要上传的文件名一样 
(也就是 你要想在服务器上新建个1.txt 文件先.然后去交换机 用 tftp 命令上传,
上传的时候 输入的导出文件名称只能是之前创好的1.txt)

也就是执行下面两个命令. 先创建文件. 再给权限
	sudo touch /private/tftpboot/config.txt
	sudo chmod a+w /private/tftpboot/config.txt

*实例:* 
登录进进交换机的特权模式
	copy running-config tftp://172.19.16.188/config.txt
 // 交换机的文件就上传到 Mac 的服务器的 TFTP 的默认文件夹位置下了.





## 启动Tftp:

	sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist
	sudo launchctl start com.apple.tftpd  

## 关闭Tftp

	sudo launchctl unload -F /System/Library/LaunchDaemons/tftp.plist  
	sudo launchctl stop com.apple.tftpd  





## Windows TFTP32

**69端口.

直接下载软件 最快. tftpd32.exe

设置根目录.  到桌面吧

服务器接口: 电脑的 IP 172.19.16.146


交换机 去 ping 下 172.19.16.146 看看通不通


查看需要备份的文件
`# show flash
`config.text
vlan.dat
……

备份文件:
`# copy config.text tftp://172.19.16.146/startfolder`







## tftp 命令
安装 yum install tftp
yum install tftp-server



配置 tftp 服务器.

