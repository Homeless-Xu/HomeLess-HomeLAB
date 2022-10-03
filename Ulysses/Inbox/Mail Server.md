## Mail Server

# Postfix 邮件服务基础

1 编译安装 + 服务控制 
准备工作: 避免发生端口冲突,要将系统自带的 sendmail 服务停用.并关闭开机默认启动.
由于 Postfix 是基于 sendmail, 建议保留 sendmail软件包,而不是直接卸载.
rpm -qa | grep sendmail
查看是否安装了 sendmail.

/etc/init.d/sendmail start
启动 sendmail
/etc/init.d/sendmail stop
停用 sendmail
chkconfig — level 2345 sendmail off 
设置2345级别不启动.

## Postfix 支持 SASL 认证.(需要安装 Cyrus-sasl)
rpm -qa | grep cyrus
查看有几个包

安装 Sasl 系统自带(不一定完整)
保证有如下几个包:
cyrus-sasl-lib-2.1.22-5.el5\_4.3 

cyrus-sasl-md5-2.1.22-5.el5\_4.3 
cyrus-sasl-devel-2.1.22-5.el5\_4.3 
cyrus-sasl-sql-2.1.22-5.el5\_4.3 
cyrus-sasl-2.1.22-5.el5\_4.3 
cyrus-sasl-plain-2.1.22-5.el5\_4.3 
到此，环境已经搭好了，接下来就是配置问题了 

缺少的话就安装 
yum -y inatall cyrus-sasl-devel


创建运行组/用户
 加强邮件服务器的权限控制
需要创建专门的
运行组账号. postfix 和 postdrop
groupadd -g 1200 postdrop
groupadd -g 1000 postfix

用户账号 Postfix

useradd -M -u 1000 -g postfix -G postdrop -s /sbin/nologin postfix




postconf -a    显示下面就配置正确
cyrus
dovecot


# Postfix 服务控制

邮件系统的控制 主要通过 /usr/sbin/postfix  命令进行
结合 start stop check reload 实现 启动 停止 检查 重载 
启动 Postfix start
状态 Postfix status



# 主要目录
/etc/postfix/  postfix  主配置文件 各类脚本 查询表
/usr/libexec/pistfix/ postfix 服务的 程序文件
/var/spiool/postfix/    Postfix 服务的 邮件队列 相关子目录 
incoming 传入 : 存放刚接收到的邮件
Active  活动: 正在投递的邮件
Deferred 推迟: 投递失败的邮件
Hold 约束: 被阻止发送的邮件
Corrupt错误: 存放不可写/不可读/ 等待分析的邮件.

/usr/sbin Postfix 各种管理工具程序 文件名以 post 开头
postalias 构造 修改和查询别名表
postconf 显示和编辑 main.cf 配置文件
Postfix 启动 停止 Postfix 服务 (要求 root 权限)
postmap 构造 修改 查询 表文件
postqueue 查看邮件队列
postsuper 管理邮件队列 root 权限.

# 主要配置文件
main.cf    服务配置文件 
master.cf   主程序 master 的配置文件 一般不需要修改.
 都在 /etc/Postfix/ 下


main.cf 配置参数 近千个 

Postconf 工具 可以辅助配置过程...
postconf 列出当前 Postfix 服务器 启用 的 所有配置参数
postconf -n  列出 使用非默认值的参数
postconf -d 查看默认参数配置

建议对 main.cf 进行适当简化 
只保留 与默认配置不同的参数.




## 日志文件
/var/log/maillog

# 邮件系统的基本构件

ip 173.16.16.2/24
邮件域: @benet.com
主机名: mail.benet.com
邮件账号: 本地系统用户
域名服务器: 搭建 DNS 服务器 能够提供 benet.com 域 的 解析服务 
并 为该域 添加到173.16.16.2 的 MX 邮件交换记录


## 安装 bind 软件 用于 dns 解析服务

yum -y install bind\* 
固定 ip
ifconfig wlp3s0 192.168.1.111 
然后重新 ssh 登录.


配置 SMTP 发信服务

编辑 main.cf

inet\_interfaces=173.16.16.2, 127.0.0.1
// 监听服务的 ip 地址 默认是 all

myhostname=mail.benet.com 
// 邮件服务器的主机名

myorigin=$mydomain
// 邮件域

mydestination=$mydomain,$myhostname
// 外发邮件时 发件人地址中的邮件域

home\_mailbox=Mialdir/
//允许投递到本地的目标邮件域



vim /etc/postfix/main.cf
设置邮件储存位置和格式



重新加载服务
Postfix reload

## 创建邮箱账号


telent

例子
xiaoqo@benet.com 发信人
目的地 lisi@benet.com

- telent mail.benet.com 25
- mail from:xiaoqi@benet.com

rcpt to:lisi@benet.com

data
 告知 要发送的数据

subject:a test mail
//邮件标题
dear lisi
// 邮件正文
this is a test mail by xiaoqi.. 
单独的点号 表示正文结束
quit 断开连接并退出.


发送成功后 
就能到 服务器 lisi 用户 主目录下查看
新收到的邮件 保存在 maildir/new/ 目录下

现在  只能在服务器上 查看收到的邮件
要别的电脑 能收到邮件 需要进一步 配置 pop3 或者 imap 服务器

现在就用到 Dovecot 出场了

儲存檔案後離開文字編輯器, 然後設定 Dovecot 開機自動執行及重新啟動:

# systemctl enable dovecot
# systemctl start dovecot
启动 dovecot

systemctl status dovecot  
查看状态




启动 dovecot 服务  并监听状态
dovecot 默认配置 监听 pop3 和 imap
启动后 就能看到 143 110的 端口 开始监听了
netstat -anpt | grep dovecot
查看开启的端口.

PoP3 接受邮件测试
telnet  连接到 邮件服务器的110端口  输入 pop3 操作命令  测试过程:

telnet mail.benet.com 110
user lisi  // 指定用户名
pass 123 指定登录密码
list //查看邮件列表
retr 1 查看第一封邮件








newaliases
service postfix restart
service dovecot restart


弄好之后 就能用第三方 软件  来 收发邮件了.










































# Linux 邮件系统: Postfix  / sendmail(难用)

搭建组件:postfix + dovecot
  
Postfix:  邮件收发

dovecot:  邮件管理 ( 上传、下载、删除等 )

查看是否已经安装
如果选择 CentOS 网络平台安装 是自带装好的.
rpm -qa postfix

安装 Postfix
yum install postfix

安装 dovecot
yum install dovecot





功能:
smtp 认证套件: 
pop3: imap
邮件过滤 procmail

# 配置 Postfix
> vi /etc/postfix/main.cf


操作方法 浏览器 输入账号密码
http://mail.example.com/webmail/webmail




更换 源 → 阿里云
1 备份
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

2 下载新的 CentOS-Base.repo
到 /etc/yum.repos.d/

wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

3 运行 yum makecache 生成缓存




## Email
看似容易,其实构成蛮复杂的.

Outlook，Foxmail等都是用来收信和发信的，称之为MUA：Mail User Agent，邮件用户代理。

Foxmail (MUA) 并非直接将邮件发送至收件人手中，而是通过MTA：Mail Transfer Agent，邮件传输代理代为传递，Sendmail和Postfix就是扮演MTA的角色。

一封邮件从MUA发出后，可能通过一个或多个MTA传递，最终到达MDA：Mail Delivery Agent，邮件投递代理，邮件到达MDA后，就存放在某个文件或特殊的数据库里，我们将这个长期保存邮件的地方称之为邮箱。

一旦邮件到达邮箱，就原地不动了，等用户再通过MUA将其取走，就是用Outlook，Foxmail等软件收信的过程。

所以一封邮件的流程是：

发件人：MUA --发送--\> MTA -\> 若干个MTA... -\> MTA -\> MDA \<--收取-- MUA：收件人

MUA到MTA，以及MTA到MTA之间使用的协议就是SMTP 邮件传输协议协议，
而收邮件时，MUA到MDA之间使用的协议最常用的是POP3或IMAP。

需要注意的是，专业邮件服务商都有大量的机器来为用户服务，所以通常MTA和MDA并不是同一台服务器，因此，在Outlook等软件里，我们需要分别填写SMTP发送服务器的地址和POP3接收服务器的地址。

注意:专业邮件服务商都有大量的机器来为用户服务，所以通常MTA和MDA并不是同一台服务器，
因此，在Outlook等软件里，我们需要分别填写SMTP发送服务器的地址和POP3接收服务器的地址。



# 主流邮件系统简介:
## 商业邮件系统:
Exchange: Windows 最著名邮件服务器软件. 微软出品
Notes/Domino: IBM 出品 跨平台 多用于 政府/银行.

## 开源邮件系统:
sendmail: Linux 平台 资质最老,稳定性好,安全性欠佳.
Postfix: sendmail 的替代品. 采用模块化设计.多个组件.实现不同的功能.

# 邮件系统简介:
邮件是一整套系统,邮件收取 传递 都是不同组件实现的.

DNS 服务器  邮件域的解析
WEB 服务器  邮箱操作界面
SASL 验证 smtp

MTA 邮件传输代理 服务器软件 Mail Transfer Agent
常说的邮箱服务器主要指的就是这个.
接收员工需要发送的邮件 并将邮件传输给其他服务器的 MTA 程序. 
Exchange、Sendmail、Postfix 

MUA 邮件用户代理  客户端软件  Mail User Agent
  为用户提供  发送、接收、管理电子邮件的界面.
  
  Windows 常用 MUA 软件: Outlook、Express、Foxmail
  Linux   常用 MUA 软件: Thunderbird、Kmail、Evolution

MDA 邮件分发代理  Mail Delivery Agent
将邮件分到用户的邮箱目录.

# 邮件通信协议:
传输(发送+传输)、接收 由不同协议完成的.

传输协议: SMTP (Simple Mail Transfer Protocol)    端口 25
接收协议: POP3 / IMAP (功能比 POP3 强大)
POP3  邮局协议 (Post Office Protocol)  端口110
IMAP 互联网消息访问协议: (Internet Message Access Protocol)  端口143



# 邮箱账户管理


具体搭建:

下面开始用Postfix搭建Linux下的邮件服务器。目标服务器是RedHat Enterprise Linux 4，

首先需要停止Sendmail：

/etc/init.d/sendmail stop

并从启动组里移除：
chkconfig sendmail off

然后，通过rpm包安装Postfix：

# rpm -Uvh postfix-2.x.x.xxx.rpm

配置 Posrfix
只需修改  /etc/postfix/main.cf  其他配置文件可以直接使用默认设置。

第一个需要修改的参数是myhostname，指向真正的域名，例如：

myhostname = mail.example.com
mydomain参数指向根域：

mydomain = example.com
myorigin和mydestination都可以指向mydomain：

myorigin = $mydomain
mydestination = $mydomain
Postfix默认只监听本地地址，如果要与外界通信，就需要监听网卡的所有IP：

inet_interfaces = all
Postfix默认将子网内的机器设置为可信任机器，如果只信任本机，就设置为host：

mynetworks_style = host
配置哪些地址的邮件能够被Postfix转发，当然是mydomain的才能转发，否则其他人都可以用这台邮件服务器转发垃圾邮件了：

relay_domains = $mydomain
现在，Postfix已经基本配置完成，我们需要对邮件的发送进行控制：

对于外域到本域的邮件，必须接收，否则，收不到任何来自外部的邮件；
对于本域到外域的邮件，只允许从本机发出，否则，其他人通过伪造本域地址就可以向外域发信；
对于外域到外域的邮件，直接拒绝，否则我们的邮件服务器就是Open Relay，将被视为垃圾邮件服务器。

先设置发件人的规则：

smtpd_sender_restrictions = permit_mynetworks, check_sender_access hash:/etc/postfix/sender_access, permit
以上规则先判断是否是本域地址，如果是，允许，然后再从sender_access文件里检查发件人是否存在，拒绝存在的发件人，最后允许其他发件人。

然后设置收件人规则：

smtpd_recipient_restrictions = permit_mynetworks, check_recipient_access hash:/etc/postfix/recipient_access, reject
以上规则先判断是否是本域地址，如果是，允许，然后再从recipient_access文件里检查收件人是否存在，允许存在的收件人，最后拒绝其他收件人。

/etc/postfix/sender_access的内容：

example.com REJECT
目的是防止其他用户从外部以xxx@example.com身份发送邮件，但登录到本机再发送则不受影响，因为第一条规则permit_mynetworks允许本机登录用户发送邮件。

/etc/postfix/recipient_access的内容：

postmaster@example.com OK
webmaster@example.com OK
因此，外域只能发送给以上两个Email地址，其他任何地址都将被拒绝。但本机到本机发送不受影响。

最后用postmap生成hash格式的文件：

# postmap sender_access
# postmap recipient_access
启动Postfix：

# /etc/init.d/postfix start

设置到启动组里：

# chkconfig postfix on
现在就可以通过telnet来测试了：（红色是输入的命令）

220 mail.example.com ESMTP Postfix

helo localhost

250 mail.example.com

mail from:test@gmail.com

250 Ok

rcpt to:webmaster@example.com

250 Ok

data

354 End data with\<CR\>\<LF\>.\<CR\>\<LF\>

hello!!!!!!

.

250 Ok: queued as D68E41407D0

mail from:test@gmail.com

250 Ok

rcpt to:haha@example.com

554\<haha@example.com\>: Recipient address rejected: Access denied

quit

221 Bye

如果配置了SMTP认证，就可以让用户远程发送时能通过认证后再发送邮件，目前还没有配置，准备继续研究后再配置。需要注意的是，配置SMTP认证后，设置规则应该是：

外域-\>本域：不需认证，允许，否则将接受不到任何外部邮件；
本域-\>外域：需要认证，否则拒绝。
因为我们作为发送服务器的MTA和转发的MTA实际上是由一个MTA完成的，所以需要以上规则。对于大型邮件服务商，发送服务器的MTA和转发的MTA是分别部署的，例如，sina的发送服务器是smtp.sina.com，需要经过用户认证，而转发服务器是mx???.sina.com，不需要认证，否则无法转发邮件。

最后不要忘了在DNS的MX记录中将域名mail.example.com添上。



垃圾邮件:
广告 病毒 


安装垃圾邮件过滤软件 / 创建过滤器

使用一次性邮箱

邮箱名字设置复杂点 (有些人会猜测邮箱地址 来发送垃圾邮件  邮箱名字复杂就不容易被猜对)

报告垃圾邮件.
互联网服务提供商 (ISP) 都会禁止用户发送垃圾邮件


基于邮件内容进行过滤

垃圾邮件  有可能是用别人的电脑发垃圾邮件的  垃圾邮件制作者 不一定有僵尸电脑的合法控制器 垃圾邮件的格式 就不会很标准..  可以通过这个来过滤一部分垃圾邮件.

反垃圾联盟:
我们的黑名单采用的是DNS方式的实时黑名单技术，
在Postfix中都使用RBL参数来配置。
Postfix 2.x：直接在过滤条件中（如smtpd_client_restrictions ）使用reject_rbl_client来拒绝黑名单连接，可以用多个 reject_rbl_client 分隔，依次使用多个RBL：
smtpd_client_restrictions =...
reject_rbl_client cblless.anti-spam.org.cn,...
如果您想先测试一下RBL服务是否工作正常，可以在reject_maps_rbl指令和reject_rbl_client指令前加上warning_if_reject来改变默认的拒绝动作为警告（警告信息会在邮件日志中看到）。等确认工作正常后再去掉警告指令。

创建筛选器



客户端
邮件过滤方法?



 邮件发送认证:
 该技术要求用户在通过邮件服务器发送邮件时，必须先向邮件服务器提交自己的用户名和密码。
 服务器确认用户身份合法后，才进行发送，否则会拒绝用户的邮件发送请求。
 该技术可以保证通过该邮件服务器发送邮件的用户都是合法用户，
 防止邮件服务器被垃圾邮件制造者利用或者中继






## Exchange 邮件服务器

Exchange邮件服务器，包括邮件系统规划、故障处理、反垃圾邮件、健康监控等。








