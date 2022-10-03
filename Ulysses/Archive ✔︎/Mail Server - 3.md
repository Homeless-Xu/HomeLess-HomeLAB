## Mail Server

**新 Mail.itr.cn IP**
> 邮箱 能收不能发 的问题. pop3 设置里面 输入下面的 IP. 而不是
> mail.itr.cn
:202.177.31.253



邮箱默认密码 XJxj123!@# 

- outlook Win 导出 **.pst** 格式
- outlook Mac 导出 **.olm** 格式
	*Mac 单个邮件 直接拖动到桌面 变成 **.eml** 格式.
	.eml 格式能在 win 下打开. 但是也不能导入到 outlook

Mac 可以 导入 Windows 的. pst 文件
win 不能导入 mac 的 .olm 格式
> 解决办法: (同步到exchange 服务器,再导出 .pst)

服务器地址: mail.itr.cn / 202.177.31.182

服务器开启端口:(用 nmap 命令扫描.)
*25/tcp   open  smtp
80/tcp   open  http
*110/tcp  open  pop3
*143/tcp  open  imap
443/tcp  open  https
465/tcp  open  smtps
993/tcp  open  imaps
995/tcp  open  pop3s
1001/tcp open  unknown
8888/tcp open  sun-answerbook

---- -
**邮件发送方式: SMTP 
- SMTP:25    SMTP ssl: 465

**邮件接收方式: POP & IMAP   
- POP:110    POP ssl: 995
	- IMAP:143   IMAP SSL:993

		**POP 和 IMAP 区别: 
		邮件同步方式: 单向 & 双向.

		*POP: 单向操作. *
		客户端的删除等等,不影响服务器.

		*IMAP: 双向操作.*    
		客户端删了,服务器也删了.

**SSL: 
- 加密技术. 发送和接收都支持加密.
	- 加密和不加密的默认端口是不一样的.


## ITR 邮箱配置
 支持: POP3 和 IMAP 登录方式.默认选 POP.

1. 加密类型 :   无	
	2. 发送服务器:  需要验证


POP3 设置:  
端口:     110.
加密类型:  无    不要选 ssl

SMTP 设置
端口      25
加密类型:  无
发送服务器 需要验证.

注意:
设置的时候  
选的是 pop 那个接收端口选 110
选的是 imap 接收端口选择 143


客户端 需要支持 POP3/IMAP 才能登录企业邮箱.

如: outlook foxmail 等等

电脑:

用 outlook 连接到账户.


服务器: mail.itr.cn


安全类型:  无 



### Gmail: 手机版本 不可以!!!!! 16.5月 亲测.

## CloudMagic: Andriod 设置

→ IMAP
name: xujian 随便
email address xu.jian@itr.cn
IMAP username  留空
password: 输入密码
imap server address: mail.itr.cn
smtp server address: mail.itr.cn
use SSL   取消打钩

add



































