## Aircrack-ng

## 简介
Aircrack-ng 破解无线802.11WEP及WPA-PSK加密的工具套装

包含 好多组件:

aircrack-ng
主要用于WEP及WPA-PSK密码的恢复，只要airodump-ng收集到足够数量的数据包，aircrack-ng就可以自动检测数据包并判断是否可以破解

airmon-ng
用于改变无线网卡工作模式，以便其他工具的顺利使用

airodump-ng
用于捕获802.11数据报文，以便于aircrack-ng破解


aireplay-ng
在进行WEP及WPA-PSK密码恢复时，可以根据需要创建特殊的无线网络数据报文及流量


airserv-ng
可以将无线网卡连接至某一特定端口，为攻击时灵活调用做准备


airolib-ng
进行WPA Rainbow Table攻击时使用，用于建立特定数据库文件


airdecap-ng
用于解开处于加密状态的数据包



## 1-开启监听模式 monitor
sudo airmon-ng start wlan0mon 
;wlan0mon 参考 ifconfig 里的无线网卡名称
本来是 wlan0 开启监听模式后 就变成 wlan0mon 了  

 





应该都用过各式各样的嗅探工具来抓取密码之类的数据报文。
用于嗅探的网卡是一定要处于monitor监听模式地。
对于无线网络的嗅探也是一样。

在Linux下，我们使用Aircrack-ng套装里的airmon-ng工具来实现，


显示有些进程会 影响 这个命令的运行  把这些进程删掉 然后再试
kill 进程号码   就能杀死进程了 







## 2-进行 嗅探 抓取无线数据包
开启监听之后  
sudo airmon-ng wlan0mon  就能进行嗅探了

 
能查看 本机无线网卡 能收到的 所有路由器的信息.

BSSID   路由器 MAC 地址  
pwr
beacons 
# data
# /s
CH       无线工作信道
HB
ENC
CIPHER
AUTH
ESSID  路由器 无线名称  




## 3-查路由器下的客户端 Mac
sudo airodump-ng wlan0mon

会 比第二步 多
bssid station pwr rate lost packets probes

bssid  是路由器 mac 地址
station 是客户端/手机的 mac 地址

这里能看到 那个路由器下面 连了哪个手机.






高级过滤设置:


sudo airodump-ng --ivs –w longas -c 6 wlan0mon
 —ivs  设置过滤    减少文件大小
—c  设置 要进行攻击/破解的路由器的 工作频道 
—w 保存文件名 w=write 的意思  
生成的文件 文件名会变成 longas-01.ivs  
第一次攻击 就是longas-01.ivs  
第二次攻击 就是  longas-02.ivs



## 4-ArpRequest注入攻击

若连接着该无线路由器/AP的无线客户端正在进行大流量的交互，比如使用迅雷、电骡进行大文件下载等，则可以依靠单纯的抓包就可以破解出WEP密码。

但是无线黑客们觉得这样的等待有时候过于漫长，于是就采用了一种称之为“ARP Request”的方式来读取ARP请求报文，并伪造报文再次重发出去，以便刺激AP产生更多的数据包，从而加快破解过程，这种方法就称之为ArpRequest注入攻击。


具体输入命令如下：

aireplay-ng -3 -b AP的mac -h 客户端的mac wlan0mon 

参数解释：
-3 指采用ARPRequesr注入攻击模式；
-b 后跟AP的MAC地址，这里就是前面我们探测到的SSID为TPLINK的AP的MAC；
-h 后跟客户端的MAC地址，也就是我们前面探测到的有效无线客户端的MAC；
最后跟上无线网卡的名称，这里就是mon0啦。
回车后将会看到如下图12所示的读取无线数据报文，从中获取ARP报文的情况出现。
