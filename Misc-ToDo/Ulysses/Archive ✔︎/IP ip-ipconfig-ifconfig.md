## IP   ip/ipconfig/ifconfig

Display TCP & IP 属性:     
- IP       → Liunx 新版本
- IPCONFIG → Windows
- IFCONFIG → Linux 老版本

#### ipconfig:

	ipconfig ?         // 显示 帮助消息. 列出所有用法.

	ipconfig /all     // 显示完整配置信息

	ipconfig /release  // 归还 ip 地址给 DHCP 服务器.  也就断网!!  要重新启用网卡.
	ipconfig /renew    // 更新所有适配器... 也就是重启网卡?


#### ifconfig

- 查看所有网卡
	ifconfig
	// 比如 lo0 en0 en1 en2 
- 查看特定网卡
	ifconfig en0 
	//所有网卡里面选个名字就行.

- 激活网卡:
	sudo ifconfig wlan0 up / down 
	//相当于 windows 的 启用/禁用


#### IP 

- 查询   ip :    
	addr    查看ip 信息

- 加/删 ip :    
	sudo ip addr add 192.168.0.193/24 dev wlan0

- 查看固定网卡 ip :  
	ip addr  show wlan0

- 查看路由器:   
	ip route show

查看 一个ip的路由包 从哪里来的 ip route get 58.217.200.13 (百度的ip)



#### Misc

网络接口类型:

lo  本地回环接口

eth(0-9)  以太网接口

pppx 点对点 接口










---- --

# IP - Internal Protocol

网络协议




 ip addr

# 网卡信息
ip link show 

## 启用网卡:

ip link set wlp3s0 up 
   
## 查看无线网卡IP/Mac信息 
iw dev
 
## 扫描 wifi
iw wlp3s0 scan | grep SSID  

## 连接 WIFI
wpa_supplicant -B -i wlp3s0 -c \<(wpa_passphrase “TP-LINK_901” “123456789”)


将ssid 替换为实际的网络名称，
psk 替换为无线密码，请保留引号。

Successfully initialized wpa_supplicant //    连接成功标志


## 开启 DHCP (必要！)
dhclient wlp3s0
要等好久的！

连上wifi后.
把iw wpa_supplicant dialog这三个都装了


fdisk -l 查看挂载信息
(识别不等于挂载)
/dev/sdd

lsblk  看 U盘是哪个!!

## 创建目录来挂载 U盘
  mkdir /mnt/usb
## 挂载U盘
mount/dev/sdd4 /mnt/usb   
## 卸载U盘
umount /dev/sdd 
## 查看U盘内容
cd /mnt/usb


## 删除目录  
rm -rf home

## 复制文件夹 
cp -r /mnt/usb /v/desktop




## 查ip.

日志查询?

qq 聊天  
用的是 udp . 自动监控 udp 端口. 并记录. 


4、命令查询法
这种方法是通过Windows系统内置的网络命令“netstat”，来查出对方好友的IP地址，不过该方法需要你先想办法将对方好友邀请到QQ的“二人世界”中说上几句话才可以。下面就是该方法的具体实现步骤:
首先单击“开始”/“运行”命令，在弹出的系统运行对话框中，输入“cmd”命令，单击“确定”按钮后，将屏幕切换到MS-DOS工作状态;然后在DOS命令行中执行“netstat -n”命令，在弹出的界面中，你就能看到当前究竟有哪些地址已经和你的计算机建立了连接(如果对应某个连接的状态为“Established”，就表明你的计算机和对方计算机之间的连接是成功的);
其次打开QQ程序，邀请对方好友加入“二人世界”，并在其中与朋友聊上几句，这样你的计算机就会与对方好友的计算机之间建立好了TCP连接;此时，再在DOS命令行中执行“netstat -n”命令，看看现在又增加了哪个tcp连接，那个新增加的连接其实就是对方好友与你之间的UDP连接，查看对应连接中的“Foreign Address”就能知道对方好友的IP地址了。



在线传输就是不通过腾讯服务器在2个QQ号直接直接通过UDP打洞传输数据，qq 所以只有在线传输文件这个办法可行。也就是说我们可以在给对放在线传输文件的时候，用wireshark之类的抓包，就能得到对方的ip地址。


构造一个邮件发送给对方，对方点开则很可能暴露ip
这个方法仍然需要你有一台自己的http主机，如果发送一封引用了自己网站图片的邮件给对方，假设邮件服务提供商安全做的不好，那么对方的浏览器在点开邮件的一瞬间，就会访问加载你http主机上的图片，对方的ip就留在你http服务器的log中了。

[http://qsalg.com/?p=103][1]





# IPV4 转发

ip转发(ip 路由)简介:
接收一个IP包 → 决定往哪发送 → 发送 IP 包


Linux 默认 不需要开启 ip 转发功能.

如果需要架设 VPN服务 / Linux 路由器 就需要开启该功能.



编辑配置文件 永久生效 ( 0就是关闭  1就是开启 )
vi /etc/sysctl.conf 启动 ipv4 
28行 去掉注释 把行尾的值改成1

配置好后 需要让配置生效:
sysctl -p /etc/sysctl.conf

debian/ubuntu 用该命令   /etc/init.d/procps.sh restart
红帽系列:可以通过重启网络服务使之生效：
service network restart






[1]:	http://qsalg.com/?p=103