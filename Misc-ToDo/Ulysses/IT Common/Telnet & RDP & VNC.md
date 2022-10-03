## Telnet & RDP & VNC


---- -


## Telnet

Remote windows with terminal  

---- 

#### Turn on Telnet: 开启 Telnet

#### windows 别折腾 ssh, 不是原生的 各种问题.


##### Win Server 2003 

	I 
// Win+R 输入 services.msc 打开 服务面板. 

- 找到 Telnet 服务.   → 设置自动启动 
// Mac: nmap 172.19.16.152 查看服务器开启的端口. 有23 就成功开启

- “我的电脑”--\>“管理”--\>“本地用户和组”--\>“组”--\>“TelnetClients”--\>“添加”用户添加进去.
// 很多服务必须将相应的用户添加到组中才能使用.


---- 
 
#### Connect  Telnet

1. Mac: 

		telnet 172.19.16.152//输入 账号 密码 就进去了.

2. 域名登陆:
	telnet 172.19.16.14 24     → sh\boss → passwd
	//域名登录 Telnet .    用户名前必须加上域名 如 


#### Change Port 

- 本地修改telnet服务端端口方法：
		tlntadmn config port=24
		//telnet服务默认端口为23. 改成24安全点.

- 重启 Telnet 服务生效. 











## SSH
Linux电脑标配。
SSH是一种网络协议，用于计算机之间的加密登录。

Windows使用SSH，会用到另一种软件PuTTY 

基本用法:
ssh user@host

默认端口:22   也就是说，你的登录请求会送进远程主机的22端口。
修改端口: - p 参数
　　$ ssh -p 2222 user@host  → ssh直接连接远程主机的2222端口。




---- -
## ssh
SSH 简介

SSH 密钥对总是成双出现的，一把公钥，一把私钥。
	     公钥可以自由的放在您所需要连接的 SSH 服务器上，而私钥必须稳妥的保管好。
	
	     所谓”公钥登录”，原理很简单，就是用户将自己的公钥储存在远程主机上。
登录的时候，远程主机会向用户发送一段随机字符串，用户用自己的私钥加密后，再发回来。
远程主机用事先储存的公钥进行解密，如果成功，就证明用户是可信的，直接允许登录 shell，不再要求密码。

SSH  配置

实现ssh 连接:  自己的公钥复制给服务器  或者  服务器的私钥复制给自己.
把客户端xxx.pub拷贝到centos上的 \~/.ssh/authorized\_keys 上就好了  
                     拷贝方法:   客户端运行(输入服务器ip)    scp \~/.ssh/id\_rsa.pub root@IP:\~/.ssh/authorized\_keys
客户端 :
一个私钥 id\_rsa                       私钥文件    自己留着  
一个公钥 id\_rsa.pub             公钥文件    拷贝给服务器.

客户端 终端运行: ssh root@192.168.1.219      用户名@服务器ip地址   就连上服务器了.

配置文件路径:      vi/etc/ssh/sshd\_config  

Mac 生成密钥     服务器也生成密钥
生成方法:   终端输入 ssh-kengen -t rsa   回车 回车 出来一串东西就生成好了 .

注册公钥文件:
cat \~/.ssh/id\_ecdsa.pub \>\> \~/.ssh/authorized\_keys
 



安装ssh   yum install ssh
启动ssh service sshd start
开机启动ssh chkconfig sshd on



修改主机名  
vi/etc/hostname  编辑配置文件
清空文件内容 输入主机名.   :wq 保存退出.
vi/etc/hosts    编辑配置文件
里面的  localhost.localdomain  改成主机名.   :wq保存退出












ssh  →  secure shell   :对登陆认证信息 和 远程命令等进行加密传输 

ssh 常用认证方式 :
password（基于口令的安全验证）       用户名 和  密码 进行验证。
public key（基于密匙的安全验证）    对比本地的公钥 和 服务器的公钥 进行验证


指定ip连接：        ssh 172.17.0.3
指定的主机名连接：  ssh www.programfish.com
指定登陆用户名      ssh root@198.74.49.76

public key（基于密匙的安全验证）

1: 本地电脑 → 创建一对秘钥 : 公钥 和 私钥

2:本地公钥 传到 服务器上.    参考命令: ssh-copy-id
	服务器第一次用 shh 的话上传的公钥文件名 必须改成  authorized_keys

3: 任何客户端都是从服务器的  authorized\_keys文件里读公钥的，    一行对应一个  





秘钥验证原理:  远程登录服务器时  
本地电脑读取服务器上authorized\_keys里的公钥 与 本地 known\_hosts文件里的这个服务器ip的公钥作对比.


ssh 文件夹 都在用户主目录下 :  cd \~/.ssh 
先看服务器主目录有没有 .ssh 目录   没有的话 新建 并设置 755权限
mkdir .ssh              chmod 755 .ssh

本地电脑 :   cd .ssh
用ssh-copy-id命令  
→  先本地电脑 cd .ssh 目录
 → ssh-copy-id  -i  \~/.ssh/id\_rsa.pub  root@198.74.49.76

如果需要多台主机无密码访问该远程主机
（即要多次添加不同的id\_rsa.pub到服务器 authorized\_keys文件里）
用 ssh-copy-id 会自动在authorized\_keys文件结尾添加而非覆盖，所以更方便。



参考文件: http://www.programfish.com/blog/?p=124














---- -

## SSH
# SSH :网络协议，用于计算机之间的加密登录。
默认端口:22
Windows使用SSH，会用到另一种软件PuTTY

- 是否安装 ssh 服务
>  rpm -qa |grep ssh
> 安装 yum install ssh

开启ssh服务
>  service sshd start  


## SSH 配置文件，
> vi /etc/ssh/sshd.config   
 如果要修改端口，把 port 后面默认的22端口改成别的端口即可（注意前面的#号要去掉）

如果需要远程连接SSH，需要把22端口在防火墙上开放。
.关闭防火墙，或者设置22端口例外

## 默认端口登录:
> ssh root@192.168.1.100
其他端口登录: 
> ssh -p 2222 root@192.168.1.100




---- -


## SSH
# SSH 简介:
ssh  →  secure shell   :对登陆认证信息 和 远程命令等进行加密传输 

ssh 常用认证方式 :
password（基于口令的安全验证）       用户名 和  密码 进行验证。
public key（基于密匙的安全验证）    对比本地的公钥 和 服务器的公钥 进行验证

指定ip连接：        ssh 172.17.0.3
指定的主机名连接：  ssh www.programfish.com
指定登陆用户名      ssh root@198.74.49.76
指定端口用户登录       ssh -p 2222 root@198.74.49.76



# SSH-keygen

**SSH 密钥对总是成双出现的.**  
**private key 公钥 id\_rsa.pub 加密专用  ** 
> 给别人(服务器)用的 这个内容还要拷贝到服务器authorized\_keys

**public key  私钥 id\_rsa 解密专用  自己留着的 **

- \*\* 私钥 id\_rsa \*\*
	 
**公钥登录原理: 就是用户将自己的公钥储存在远程主机上。**
> 相当于服务器上开后门? 以后直接进
 
 
## 验证流程:
  \>客户端请求 ssh 登录服务器发生内容:

1. 客户端 自己的公钥 public key 发送给服务器. (公钥本来就是公开的,可能很多人知道)  
2. 如果这个public key是被服务器所允许的(服务器authorized\_keys 有记录.)
3. 服务器发送一个用你的public key加密的随机数据给你，这个数据只有你的private key能解密.
4. 客户机将解密后的信息发还给服务器，服务器验证正确后即确认客户机是可信任的，
## SSH 免密码登录:
> 上传或下载二选一.

一. 上传: 自己的公钥上传到服务器  (本地 生成一对秘钥)

二. 下载: 服务器私钥下载到自己客户端. (服务器 生成一对秘钥)


### 上传方法详解:
> 流程: 本地电脑生成一对秘钥(私钥+公钥), 用命令把公钥上传到服务器.  
>       注册你的公钥文件(把你的公钥添加到 authorized\_keys 文件中).

- 本地:创建秘钥
	 
		ssh-keygen -t rsa
		# -t 指定算法  -f 指定路径 -N 指定密码.

- cd 到本地. ssh 目录
> 创建秘钥的时候有秘钥储存位置提示的.  
>  
	    Mac OS: cd /Users/v/.ssh/

- 确定服务器. shh 目录:   一般是  \~/.ssh/ 

		scp id_rsa.pub root@198.74.49.76:~/.ssh/
		
		输入 root 用户的 ssh 密码. 就上传成功了.
	 
	 
	 
- 注册公钥文件: 把你的公钥添加到公钥验证列表.
cat \~/.ssh/id\_ecdsa.pub \>\> \~/.ssh/authorized\_keys

> 也可以直接重命名上传的文件.  mv id\_rsa.pub authorized\_keys
这样的话 这个服务器 只有你能ssh 秘钥免密码登录了.




配置文件路径:      vi/etc/ssh/sshd\_config  



 



安装ssh   yum install ssh
启动ssh service sshd start
开机启动ssh chkconfig sshd on



修改主机名  
vi/etc/hostname  编辑配置文件
清空文件内容 输入主机名.   :wq 保存退出.
vi/etc/hosts    编辑配置文件
里面的  localhost.localdomain  改成主机名.   :wq保存退出



 

查看钥匙
ls -l .ssh

传输文件












public key（基于密匙的安全验证）

1: 本地电脑 → 创建一对秘钥 : 公钥 和 私钥

2:本地公钥 传到 服务器上.    参考命令: ssh-copy-id
	服务器第一次用 shh 的话上传的公钥文件名 必须改成  authorized_keys

3: 任何客户端都是从服务器的  authorized\_keys文件里读公钥的，    一行对应一个  





秘钥验证原理:  远程登录服务器时  
本地电脑读取服务器上authorized\_keys里的公钥 与 本地 known\_hosts文件里的这个服务器ip的公钥作对比.


ssh 文件夹 都在用户主目录下 :  cd \~/.ssh 
先看服务器主目录有没有 .ssh 目录   没有的话 新建 并设置 755权限
mkdir .ssh              chmod 755 .ssh

本地电脑 :   cd .ssh
用ssh-copy-id命令  
→  先本地电脑 cd .ssh 目录
 → ssh-copy-id  -i  \~/.ssh/id\_rsa.pub  root@198.74.49.76

如果需要多台主机无密码访问该远程主机
（即要多次添加不同的id\_rsa.pub到服务器 authorized\_keys文件里）
用 ssh-copy-id 会自动在authorized\_keys文件结尾添加而非覆盖，所以更方便。



参考文件: http://www.programfish.com/blog/?p=124




远程登录: ssh

windowd: 安装 putty 软件.

秘钥认证: 公钥+秘钥  免密码登录.
公钥:任何人都能看  用于加密.
秘钥:拥有者才有 用于解密.
服务器和客户端 都有自己的公钥和秘钥.


流程: 服务器 生成秘钥. 

ssh-keygen -t rsa
等等按回车:  默认秘钥放在 /root/.ssh/id\_rsa\_
两次输入秘钥密码 (可以不输,输了就要输复制密码)

同时把vps上生成的id\_rsa.pub文件改名为authorized\_keys
mv /root/.ssh/id\_rsa.pub /root/.ssh/authorized\_keys

然后修改下这个文件的权限为600
chmod 600 /root/.ssh/authorized\_keys 

然后还需要对ssh进行相关的配置
修改/etc/ssh/sshd\_config 文件，将RSAAuthentication 和 PubkeyAuthentication 后面的值都改成yes ，保存。
重启sshd服务，执行/etc/init.d/ssh restart。

可以正常登录以后
最后需要把用口令登录关闭掉，只能使用密钥登录。
1、修改/etc/ssh/sshd\_config 文件
将PasswordAuthentication yes 修改成 PasswordAuthentication no
2、重启sshd服务/etc/init.d/ssh restart


然后 把服务器生成的 私钥 id\_rsa\_ 







## Remote :     RDP & VNC 

- 电脑系统分两大类:   Win 和 Unix 

- 远程桌面也分两类: 平台内远程 和 跨平台远程.

	1. Win 远程 Win : 用系统自带的 远程桌面  

	2. 跨平台远程 必须用支持 VNC 的工具 

---- --
# RDP :

Remote Desktop Protocol     默认端口 *3389 TCP* 

远程桌面协议. 连接 Windows 系统专用.

# Win

#### Change Port :

打开注册表:
	Win+R  →  regedit

	HKEY_LOCAL_MACHINE     →   System    →    CurrentControlSet    →    Control    →
	Terminal Server    →    Wds    →    Rdpwd    →    Tds    →    Tcp    → PortNumber
	0xd3d，这个是16进制，就是3389啦      选择十进制   改成2222 就行了

#### 连接方法:  mstsc → 172.19.16.15:2222  


#### 开启远程 :
- Windows2008 服务器:
	 
计算机 →  属性 →  远程设置 → 将“远程协助”打上对钩 →再“允许运行任意计算机连接”。

- 客户端: 

计算机属性 → 远程 → 启用. 

#### 最大连接数:
// 默认设置是2, 超过两人进行远程连接 就会出错.

解决方法:

1. 每次退出都注销.

2. 修改默认最大连接数.
		tscc.msc  →  RDP-Tcp 

3. Telnet 进服务器. 踢出别的用户.

	- 服务器开启 Telnet 服务.  
	- Telnet 登录服务器
		query user
			// 查看 登录用户列表. 每个用户都有一个ID.

	- 踢掉用户
		logoff ID号码  如 logoff 1

4. 限制已断开链接的会话存在时间 

	1、从终端服务配置中修改 
	运行－Tscc.msc(终端服务配置)－连接－双击RDP-Tcp或右击－属性－会话－选中第一个的替代用户设置(O)－结束已断开的会话［将默认值“从不”改为一个适当的时间，比如30分钟］ 

	2、从组策略修改 
	开始－运行－gpedit.msc－计算机配置－管理模板－windows组件－终端服务－会话 
	右边窗口选择 为断开的会话设置时间限制 －选择已启用，选择一个时间 



5. 增加最多链接数 

	1、从终端服务配置中修改：运行－Tscc.msc(终端服务配置)－连接－双击RDP-Tcp或右击－属性，选择“网卡”选项卡－修改“最大连接数”改成你所需的值，当然这个值不也能太大，否则会占用较多的系统资源。不过这里修改的值好像不起作用，设置成无限制时照样还是会出现本文所说的情况。   
	2、组策略级别要高于终端服务配置，当启用组策略后终端服务配置中的相应选项会变成灰色不可修改 
	运行－gpedit.msc－计算机配置－管理模板－Windows组件－终端服务 
	双击右边的”限制连接数量“－选择”已启用“－填入允许的最大连接数 


# 嗅探 劫持 3389 方法

1:CAIN 工具嗅探

2: 看对方机器是谁连过去的 
然后 架设 rdp proxy   然后 arp 欺骗
然后从 rdp proxy 嗅探记录里面 直接拿到 登录明文.

3 钓鱼攻击 Arp 劫持 欺骗本机为目标机器 
然后 本机安装  本地密码记录软件.
如: winlogonhack   winpswlogger
这些工具 都要改. 改成 即使 错误密码也要记录. 
然后坐等管理员连接. 得到密码后 恢复 arp 劫持.

4 arp 劫持 + 中间人 转发数据
 
 cain 要在双向欺骗下 才能 嗅探到 rdp
 
 
 arp 可以挂掉 网站 20分钟 说明 arp 表刷新时间是 20分钟一次
 

 
 rdpproxy: 
 一个转发 rdp 协议数据包的软件. 用于转发3389 的数据 然后破解
 
 hijackport: 劫持端口用的 一般和 rdp proxy 配套用.
 Cain 著名黑客工具
 RDP Parser: 解密 RDP 数据包 取得按键信息 拼接用户名+密码
 
#  cain:


Cain &  



从 CAIN 嗅探到的 rdp 数据包中 如何得到账号 密码.
 如果 是 rdp 本地保存密码的 直接有明文
 如果不是本地保存的  每次连接都要输入 密码的
 那么嗅探到的 rdp 数据包 里面 有一段是专门解密的
 每行一个密码字母  多找几行 就完整了 
 要 搜索 key pressed key released 就可以得到.
 注意 方向键 不然密码顺序有可能出错
 
 
 
 防止嗅探方法:
 先输后半段 然后 用鼠标 点到最前面补全. 不能用方向键.
 因为 键盘能记录 光标是不能记录的.
 
 解压 rdp 数据包 工具.
 名叫 rdp parser 
 可以 解开 rdp 数据包文件 提取一些按键信息 拼接出 用户名和密码
 
 
 
 





---- ----


# VNC




# Mac Remote win/Mac
软件: jump desktop.

# win Remote win


# win Remote Mac


# Mac Remote Kali2:


vmc 配置
liunx：（服务端）                                      
1 安装 vnc server
2开启vnc：终端里面 输入vncserver
3：输入 vnc连接的密码 （两遍）
修改密码用vncpasswd 命令
 
mac（客户端）
安装vncviewer 破解版
打开软件 输入linux的ip：1 
输入密码
跳出命令界面（连接成功）
















## 电脑远程 - Remote

电脑系统分两大类:   Win 和 unix (mac os; debian ;kali2 等等等等 )

远程桌面也分两类: 平台内远程 和 跨平台远程.

win 远程 win  用系统自带的 远程桌面  

跨平台远程 必须用支持 VNC 的工具 


# Mac Remote win/Mac
软件: jump desktop.



# win Remote win


# win Remote Mac





# Mac Remote Kali2:




vmc 配置
liunx：（服务端）                                      
1 安装 vnc server
2开启vnc：终端里面 输入vncserver
3：输入 vnc连接的密码 （两遍）
修改密码用vncpasswd 命令
 
mac（客户端）
安装vncviewer 破解版
打开软件 输入linux的ip：1 
输入密码
跳出命令界面（连接成功）










Mac 相互远程 

双方都是 Mac   用 自带的 imessage  可以共享屏幕.

 














