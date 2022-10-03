## Wireshark 

先选择一个网卡.

筛选器: 
显示过滤器  主界面.
捕捉过滤器. Capture -\> Capture Filters

表达式规则

 1. 协议过滤








2. IP 过滤
比如 ip.src ==192.168.1.102 显示源地址为192.168.1.102，
ip.dst==192.168.1.102, 目标地址为192.168.1.102

3. 端口过滤
tcp.port ==80,  端口为80的
tcp.srcport == 80,  只显示TCP协议的愿端口为80的。

4. Http模式过滤
http.request.method=="GET",   只显示HTTP GET方法的。

5. 逻辑运算符为 AND/ OR
常用的过滤表达式

比如:  显示过滤器

tcp:
只显示 tcp.睡觉觉上赛季

ip.dst == 192.168.0.255      
目的地 ip 为 255的 包,.
maiken. 

挂号处  2. 门诊收费  3. 住院收费  4. 门诊医生站  5. 门诊护士站  6. 住院医生站  7. 住院护士站
8. 药房：  9. 药库： 10.物资库：

linux. 

电脑 进行 网关的 静态绑定.  

xp:  cmd 回车 
arp -a  查看局域网   的 ip 地址+ mac  记录.





arp 计算机仅仅知道ip地址是无法通信的，ip数据报在封装到数据链路层中时需要加上比如以太网报头，报头中应该含有数据链路层能理解的地址即MAC地址。ARP就是着么一种将IP转换成MAC地址的协议。

如下例子，当我们Ping一台机器时，如果该ip在arp缓存中有，就可以直接找到mac地址，如果没有，就会广播一个请求询问对应ip的mac地址。

显示+修改 arp 缓存项目.


广播 高层协议:  
ARP address resolution protocol
NBNS  netbios name server..


name query NB   意思:






























#### Introduction    [官网][1] 

 网络分析神器 *网络故障分析*    第一时间发现蠕虫病毒 木马程序 以及 arp 欺骗 等问题的根源

**可嗅探:   Telnet  HTTP    FTP 
**不可探:   SSH     HTTPS

#### 过滤器 
默认设置有大量冗余信息，设置过滤规则,减少信息量.

*捕捉过滤器 :* CaptureFliter
捕捉什么样的信息,开始捕捉前设置!主要控制数据包数量
*显示过滤器 :* DisplayFliter
更强大复杂,在捕捉结果中准确找到你想要的东西.


##### **捕捉过滤器详解:
菜单栏 → 捕获 → 捕获过滤器 (选默认或者新建规则)
这里 设置常用的自定义过滤语法. 然后保存.

*用法:* ⌘+k → 选择网卡 → 底下 所选接口的捕获过滤器 → 
- 直接输入 自定义语法.
	- 点击黄色书签 选择你之前自定义的过滤语法.


*语法:*

1. Protocol           协议
可能值: IP ARP TCP UDP ……
默认值: 默认支持所有协议. 

您可以使用大量位于OSI模型第2至7层的协议。点击”Expression…”按钮后，您可以看到它们。
比如：IP，TCP，DNS，SSH

2. Direction          方向: src 来源口、dst 目的口

可能值: src、dst、src and dst、src or dst
默认值: src or dst

`host 172.19.16.16` = `src or dst host172.19.16.16`


3. Host               主机

可能值: net、port、host、portrange
默认值: host
`src 172.19.16.16` = `src host 172.19.16.16`


4. Logical Operation  逻辑运算: and、or、not

not 最高优先级. or、and 相同优先级. 运算从左到右进行.


not tcp port 80 and tcp port 8080
  等于:  (not tcp port 80) and tcp port 8080
不等于: not (tcp port 80 and tcp port 8080)











**Examples :

`tcp dst port 8080`
捕捉 目的 TCP 端口为 8080 的 封包

`ip src host 172.19.16.1 `
捕捉来源 ip 是 xxx 的封包


`host 172.19.16.16`
捕捉目的 或者来源 IP 是 xxx 的封包.

`ether host e0-05-c5-44-b1-3c `
//捕捉目的或来源MAC地址为e0-05-c5-44-b1-3c的封包。
如果你想抓本机与所有外网通讯的数据包时，可以将这里的mac地址换成路由的mac地址即可。

`src portrange 2000-2500 ` 
//捕捉来源为UDP或TCP，并且端口号在2000至2500范围内的封包。

`not imcp  `
//显示除了icmp以外的所有封包。（icmp通常被ping工具使用）

`src host 10.7.2.12 and not dst net 10.200.0.0/16 
`//显示来源IP地址为10.7.2.12，但目的地不是10.200.0.0/16的封包。
`(src host 10.4.1.12 or src net 10.6.0.0/16) and tcp dst portrange 200-10000 and dst net 10.0.0.0/8  
`//捕捉来源IP为10.4.1.12或者来源网络为10.6.0.0/16，目的地TCP端口号在200至10000之间，并且目的位于网络 10.0.0.0/8内的所有封包。
`src net 192.168.0.0/24 
``src net 192.168.0.0 mask 255.255.255.0  
`
//捕捉源地址为192.168.0.0网络内的所有封包。



当您想排除广播请求时，”no broadcast”就会非常有用



**显示过滤器**

	snmp || dns || icmp 
//显示SNMP或DNS或ICMP封包。 
	ip.addr == 10.1.1.1  
//显示来源或目的IP地址为10.1.1.1的封包。
	ip.src != 10.1.2.3 or ip.dst != 10.4.5.6  
//显示来源不为10.1.2.3或者目的不为10.4.5.6的封包。
换句话说，显示的封包将会为：
来源IP：除了10.1.2.3以外任意；目的IP：任意
以及
来源IP：任意；目的IP：除了10.4.5.6以外任意

ip.src != 10.1.2.3 and ip.dst != 10.4.5.6  
//显示来源不为10.1.2.3并且目的IP不为10.4.5.6的封包。
换句话说，显示的封包将会为：
来源IP：除了10.1.2.3以外任意；同时须满足，目的IP：除了10.4.5.6以外任意

tcp.port == 25  
//显示来源或目的TCP端口号为25的封包。 

tcp.dstport == 25  
//显示目的TCP端口号为25的封包。 

tcp.flags  //显示包含TCP标志的封包。 

tcp.flags.syn == 0×02  //显示包含TCP SYN标志的封包。 

如果过滤器的语法是正确的，表达式的背景呈绿色。如果呈红色，说明表达式有误。





## 软件界面介绍

上面:   数据包列表  简单信息
中间:   协议树    详细信息
下面:  16进制 显示 数据包内容 : 数据在物理层上传输时的最终形式

no.  数据包 数量
Time 每个数据包的捕捉时间 

source:  源地址
destination:  目的地址
protocal:  所属协议
length:  数据包长度
info: 数据包简单信息
frame number:
主机 mac 地址:  ethernetII  
ip 地址   : internet protocol 
TCP 端口号: transmission control protocol
HTTP 协议具体内容: Hypertext transfer protocol 


右键 有追踪流 功能: 获取更详细的信息 



192.168.0.255 是广播的意思 


## 简单设置
默认设置: 会得到大量的无用信息 以至于很难找到自己需要的信息
 这就需要 设置 过滤规则 来减少信息量了.




## 使用步骤
1: 选择接口  (网卡)
主界面 自己双击你要的接口. 

2: 设置捕捉过滤器
默认情况下，Wireshark捕捉一切看得见的数据，这可能正是你一开始想要做的事情。但是一旦你了解了流量的类型，就可以设置捕捉过滤器，那样你仅仅捕捉发往/来自特定机器的流量，或特定的协议。

## 柏克莱封包过滤器（BPF）
Berkeley Packet Filter，缩写 BPF

洪泛模式/混杂模式
如果网卡支持这种模式, 当网卡处于此种模式，可以收到网络上的所有包，不管他们的目的地是不是所在主机。






实例!
#### Telnet 账号密码嗅探
环境:
本机抓包 172.19.16.188 
客户端 172.19.16.166
服务器172.19.16.16

本机 
设置捕捉过滤器: host 172.19.16.16   并 开始抓包. 

客户端: 
进bash  或者用 putty 软件 用 telnet 方式 连接服务器. 
输入账号密码并且要成功登陆. 

本机 
停止抓包 
显示过滤器 里面输入: telnet  (只显示和 telnet 协议有关的封包)

然后一个个包看   (看详细内容 中的 Telnet 模块 展开 )
这里会有 所有你用 putty 输入的每个字母. 每个字母一个封包. 
特殊字段 `\rlogin:`    后面的包就是账户.
特殊字段 `\rpassword:` 后面的包就是密码.
组合起来就是完整的账号密码.



或者 直接找一个 telnet 包 → 右键 → 追踪流 → TCP 流
出现一个表格. 里面 就有账号密码. 账号可能会有重复.



#### HTTP 嗅探:
网址 & 图片 & 浏览器版本 & 电脑系统版本 & 







开嗅探器 → 对方上网 看网页 看图片 → 结束嗅探 → 过滤出 http  
详细里面找 格式 是 JPEG 或 PNG 的封包. 
原始数据 导出到本地 , 改名+后缀 , 本地就能查看了.




#### 网页邮箱 账号密码嗅探: ( HTTP 明文 )
1. 抓包 → 
2. 过滤 post 数据    `    http.request.method== "POST"    `
3. 追踪过滤出来的 POST 的 TCP 流. 
4. 找到账号密码.

	> *POST 数据:
	> 因为当你输入用户名和密码并点击登录按钮时，
	> 将会产生一个POST将你输入的数据发送到远程服务器上。



#### HTTP 加密嗅探
邮箱网站 会对 用户发送的密码 求哈希值.而不是直接明文.
这个就需要 识别该哈希对应的密码值.


要用 hash-identifier 工具来确定密码的哈希值到底是什么类型的 hash.

打开终端，然后输入“hash-identifier”并将上面的哈希值粘贴到终端，回车之后hash-identifier将会给出可能的匹配值。





facebook   没开启 https 不一定能获取 账号密码 但是可以获取 cookies
抓包 cookie 然后 导出文本  

然后用 火狐浏览器 安装cookie 注入 工具  → 粘帖 就能登录了.

 

[1]:	https://www.wireshark.org/#download