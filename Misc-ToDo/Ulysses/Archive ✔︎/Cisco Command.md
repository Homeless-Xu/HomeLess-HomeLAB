
## Cisco Command:

`#show run`
*显示所有配置* 

*常用命令：

`switch>enable`
*进入特权模式

`switch#config terminal`
*进入全局配置模式*  需要输入密码

`switch(config)#hostname`
设置交换机名字* 
`switch(config)#enable secret xxx `
设置特权加密口令

`switch(config)#enable password xxa `
设置特权非密口令

`switch(config)#line console 0 `
进入控制台口

`switch(config-line)#line vty 0 4`
进入虚拟终端

`switch(config-line)#login ；允许登录`

`switch(config-line)#password xx `
设置登录口令xx

`exit`  退出命令





*配置导出* 
tftp 配置文件从交换机到本机

copy running-config tftp:

copy



  

`#show ip int brief`
*显示所有接口状态*    

`#show vlan brief`
*显示所有 VLan 信息* 

`#vlan database`
*vlan 维护模式


创建 VLAN

把端口划分给 vlan













*交换机VLAN设置：
switch(vlan)#vlan 2 ；建VLAN 2
switch(vlan)#no vlan 2 ；删vlan 2
switch(config)#int f0/1 ；进入端口1
switch(config-if)#switchport access vlan 2 ；当前端口加入vlan 2
switch(config-if)#switchport mode trunk ；设置为干线
switch(config-if)#switchport trunk allowed vlan 1，2 ；设置允许的vlan
switch(config-if)#switchport trunk encap dot1q ；设置vlan 中继
switch(config)#vtp domain  ；设置发vtp域名
switch(config)#vtp password  ；设置发vtp密码
switch(config)#vtp mode server ；设置发vtp模式
switch(config)#vtp mode client ；设置发vtp模式



交换机*设置IP地址：
switch(config)#interface vlan 1 ；进入vlan 1
switch(config-if)#ip address   ；设置IP地址
switch(config)#ip default-gateway  ；设置默认网关
switch#dir flash: ；查看闪存



*交换机显示命令：
switch#write ；保存配置信息
switch#show vtp ；查看vtp配置信息
switch#show run ；*查看当前配置信息
switch#show vlan ；查看vlan配置信息
switch#show interface ；查看端口信息
switch#show int f0/0 ；查看指定端口信息    







## 路由器显示命令：
router#show run ；显示配置信息
router#show interface ；显示接口信息
router#show ip route ；显示路由信息
router#show cdp nei ；显示邻居信息
router#reload 　 　 ；重新起动



路由器口令设置：
router\>enable ；进入特权模式
router#config terminal ；进入全局配置模式
router(config)#hostname  ；设置交换机的主机名
router(config)#enable secret xxx ；设置特权加密口令
router(config)#enable password xxb ；设置特权非密口令
router(config)#line console 0 ；进入控制台口
router(config-line)#line vty 0 4 ；进入虚拟终端
router(config-line)#login ；要求口令验证
router(config-line)#password xx ；设置登录口令xx
router(config)#(Ctrl+z) ； 返回特权模式
router#exit ；返回命令


路由器配置：
router(config)#int s0/0 ；进入Serail接口
router(config-if)#no shutdown ；激活当前接口
router(config-if)#clock rate 64000 ；设置同步时钟
router(config-if)#ip address   ；设置IP地址
router(config-if)#ip address  second ；设置第二个IP
router(config-if)#int f0/0.1 ；进入子接口
router(config-subif.1)#ip address  ；设置子接口IP
router(config-subif.1)#encapsulation dot1q  ；绑定vlan中继协议
router(config)#config-register 0x2142 ；跳过配置文件
router(config)#config-register 0x2102 ；正常使用配置文件
router#reload ；重新引导




路由器文件操作：
router#copy running-config startup-config ；保存配置
router#copy running-config tftp ；保存配置到tftp
router#copy startup-config tftp ；开机配置存到tftp
router#copy tftp flash: ；下传文件到flash
router#copy tftp startup-config；下载配置文件




## 交换机配置导出:

  

  
eg. TFTP -i 192.168.1.111 put 111.txt
 
二、PC与交换机通信
  
方法一：采用console线+网线连接，软件可使用远程终端对交换机进行操作。  
方法二：采用网线连接，软件可使用SecureCRT.EXE对交换机进行telnet。  
两种方法都需要将PC机和交换机的IP设置为同一网段。
 
三、交换机配置的导出
  
在交换机上输入命令 copy running-config tftp  
后按照提示输入你搭建的TFTP服务器IP(即PC机的IP)和目的文件名（文件路径为TFTP服务器根目录）
 
四、交换机配置的导入
  
TIPS:  
1、startup-config是写入路由器的配置文件，每次路由器启动的时候都会从中读取配置信息。startup-config存储在NVRAM中，NVRAM是非易失性随机访问存储器 (Non-Volatile Random Access Memory)，是指断电后仍能保持数据的一种RAM。
2、running-config是正在交换机内存中运行的配置文件，即正在生效的。running-config存储在DRAM中，断电后全部丢失。
 
在交换机上输入命令 copy tftp running-config 或者copy tftp startup-config  
后按照提示输入你搭建的TFTP服务器IP(即本机IP)和源文件名（文件路径为TFTP服务器根目录）完成配置文件的导入。
 
从交换机断电配置文件会丢失的角度来看，  
输入命令copy tftp running-config后需要copy running-config startup-config或者reload，那么交换机断电后，配置文件不会丢失；  
输入命令copy tftp startup-config后交换机断电，配置文件不会丢失。
 
TIPS:  
1、reload命令：热重启交换机，配置文件不会丢失。配置完数据之后从新启动，配置的数据就会保存在设备里面。  
2、断电重启：冷重启交换机，running-config文件会丢失。





