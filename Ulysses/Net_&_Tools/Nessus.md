## Nessus
最好的 unix 漏洞扫描工具.

Hping2：一种网络探测工具，是ping的超级变种
这个小工具可以发送自定义的ICMP，UDP和TCP数据包，并接收所有反馈信息。它的灵感来源于ping命令，但其功能远远超过ping。它还包含一个小型的路由跟踪模块，并支持IP分段。此工具可以在常用工具无法对有防火墙保护的主机进行路由跟踪/ping/探测时大显身手。它经常可以帮助您找出防火墙的规则集，当然还可以通过它来学习TCP/IP协议，并作一些IP协议的实验。]]]


Kismet：一款超强的无线嗅探器
Kismet是一款基于命令行（ncurses）的802.11 layer2无线网络探测器、嗅探器、和入侵检测系统。它对网络进行被动嗅探（相对于许多主动工具，例如NetStumbler），可以发现隐形网络（非信标）。它可以通过嗅探TCP、UDP、ARP和DHCP数据包来自动检测网络IP段，以Wireshark/TCPDump兼容格式记录通讯日志，更加可以将被检测到的网络分块并按照下载的分布图进行范围估计。如您所想，这款工具一般被wardriving所使用。嗯！还有warwalking、warflying和warskating……


 Tcpdump：最经典的网络监控和数据捕获嗅探器
在Ethereal（Wireshark）出现之前大家都用Tcpdump，而且很多人现在还在一直使用。它也许没有Wireshark那么多花里胡哨的东西（比如漂亮的图形界面，亦或数以百计的应用协议逻辑分析），但它能出色的完成很多任务，并且漏洞非常少，消耗系统资源也非常少。它很少添加新特性了，但经常修复一些bug和维持较小的体积。它能很好的跟踪网络问题来源，并能监控网络活动。其Windows下的版本叫做WinDump。Libpcap/WinPcap的包捕获库就是基于TCPDump，它也用在Nmap等其它工具中。



 Cain and Abel：Windows平台上最好的密码恢复工具  
UNIX用户经常声称正是因为Unix平台下有很多非常好的免费安全工具，所以Unix才会成为最好的平台，而Windows平台一般不在他们的考虑范围之内。他们也许是对的，但Cain & Abel确实让人眼前一亮。这种只运行于Windows平台的密码恢复工具可以作很多事情。它可以通过嗅探网络来找到密码、利用字典破解加密密码、暴力破解密码和密码分析、记录VoIP会话、解码非常复杂的密码、星号查看、剥离缓存密码以及分析路由协议。另外其文档也很齐全（well documented）。


John the Ripper：一款强大的、简单的以及支持多平台的密码破解器
John the Ripper是最快的密码破解器，当前支持多种主流Unix （官方支持11种，没有计算不同的架构）、DOS、Win32、BeO和OpenVMS。它的主要功能就是检测弱Unix密码。它支持主流Unix下的多种（3种）密码哈希加密类型，它们是Kerberos、AFS以及Windows NT/2000/XP LM。其它哈希类型可以通过补丁包加载。如果您希望从一些单词表开始的话，您可以在这里、这里和这里找到。

 Ettercap：为交换式局域网提供更多保护  
Ettercap是一款基于终端的以太网络局域网嗅探器/拦截器/日志器。它支持主动和被动的多种协议解析（甚至是ssh和https这种加密过的）。还可以进行已建立连接的数据注入和实时过滤，保持连接同步。大部分嗅探模式都是强大且全面的嗅探组合。支持插件。能够识别您是否出在交换式局域网中，通过使用操作系统指纹（主动或被动）技术可以得出局域网结构。


Nikto：非常全面的网页扫描器
Nikto是一款开源的（GPL）网页服务器扫描器，它可以对网页服务器进行全面的多种扫描，包含超过3200种有潜在危险的文件/CGIs；超过625种服务器版本；超过230种特定服务器问题。扫描项和插件可以自动更新（如果需要）。基于Whisker/libwhisker完成其底层功能。这是一款非常棒的工具，但其软件本身并不经常更新，最新和最危险的可能检测不到。


13 Ping/telnet/dig/traceroute/whois/netstat：基本命令
虽然有很多重型的高科技网络安全工具，但是不要忘记其基础！所有网络安全人士都要对这些基本命令非常熟悉，因为它们对大多数平台都适用（在Windows平台上whois为tracert）。它们可以随手捏来，当然如果需要使用一些更高级的功能可以选择Hping2和Netcat。


OpenSSH / PuTTY / SSH：访问远程计算机的安全途径
SSH（Secure Shell）现在普遍应用于登录远程计算机或在其上执行命令。它为不安全网络上的两台不互信计算机间通讯提供安全加密，代替非常不可靠的telnet/rlogin/rsh交互内容。大多UNIX使用开源的OpenSSH服务器和客户端程序。Windows用户更喜欢免费的PuTTY客户端，它也可以运行在多种移动设备上。还有一些Windows用户喜欢使用基于终端的OpenSSH模拟程序Cygwin。还有其它很多收费和免费的客户端。您可以在这里和这里找到。



THC Hydra：支持多种服务的最快的网络认证破解器
如果您需要暴力破解一个远程认证服务，Hydra经常会是选择对象。它可以同时对30个以上的端口进行基于字典的快速破解，包括telnet、ftp、http、https、smb、多种数据库及其它服务。和THC Amap一样，此Hydra版本来自于民间组织THC。


# 19 THC Amap：一款应用程序指纹扫描器
Amap是一款很棒的程序，它可以检测出某一端口正在被什么程序监听。因为其独有的version detection特性，所以其数据库不会象Nmap一样变得很大，在Nmap检测某一服务失败或者其它软件不起作用时可以考虑使用之。Amap的另一特性是其能够解析Nmap输出文件。这也是THC贡献的另一款很有价值的工具。



Aircrack：最快的WEP/WPA破解工具  
Aircrack是一套用于破解802.11a/b/g WEP和WPA的工具套装。一旦收集到足够的加密数据包它可以破解40到512位的WEP密匙，它也可以通过高级加密方法或暴力破解来破解WPA 1或2网络。套装中包含airodump（802.11数据包捕获程序）、aireplay （802.11数据包注入程序）、aircrack（静态WEP和WPA-PSK破解），和airdecap（解密WEP/WPA捕获文件）。


Netfilter：最新的Linux核心数据包过滤器/防火墙
Netfilter是一款强大的运行于标准Linux核心上的包过滤器。它集成了用户空间IP列表工具。当前，它支持包过滤（无状态或有状态）、所有类型的网络地址和端口转换（NAT/NAPT）并支持多API层第三方扩展。它包含多种不同模块用来处理不规则协议，例如FTP。其它UNIX平台请参考Openbsd PF（只用于OpenBSD）或者IP Filter。许多个人防火墙（personal firewalls）都支持Windows （Tiny、Zone Alarm、Norton、Kerio…），但都不提供上述IP列表。微软在Windows XP SP2中集成了一款非常基础的防火墙，如果您不安装它，它就会不断地提示您安装。



L0phtcrack：Windows密码猜测和恢复程序
L0phtCrack也叫作LC5，用来尝试通过哈希（通过某种访问方式获得的）方法破解诸如Windows NT/2000工作站、联网服务器、主域控制器、或活动目录密码，有时它也可以通过嗅探获得密码的哈希值。它还可以通过多种手段来猜测密码（字典、暴力破解等等）。Symantec公司2006年已经停止了LC5的开发，但LC5 installer的安装文件随处可以找到。免费试用版只能使用15天，Symantec已经停止出售此软件的注册码，所以如果您不想放弃使用它，就必须找到一个与其对应的注册码生成器（key generator）。因为Symantec不再维护此软件，所以最好尝试用Cain and Abel或John the Ripper来代替之。

 Airsnort：802.11 WEP加密破解工具
AirSnort是一款用来恢复加密密码的无线LAN（WLAN）工具。Shmoo Group出品，工作原理是被动监控传输信息，当收集到足够多的数据包后开始计算加密密码。Aircrack和它很像。


 BackTrack：一款极具创新突破的Live（刻在光盘上的，光盘直接启动） 光盘自启动Linux系统平台  
这款卓越的光盘自启动Linux系统是由Whax和Auditor合并而成。它以其超级多的安全和防护工具配以丰富的开发环境而闻名。重点在于它的用户模块化设计，用户可以自定义将哪些模块刻到光盘上，例如自己编写的脚本、附加工具、自定义内核等等。



[http://www.ha97.com/2678.html][1]











































[1]:	http://www.ha97.com/2678.html