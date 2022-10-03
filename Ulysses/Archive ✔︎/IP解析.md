## IP解析
1. 买域名. 绑定身份证.

2. 找个固定 IP (公司 ip) 210.22.92.254

3. IP 绑定 域名. 
也就是 解析设置. 
去购买域名的网站设置里面添加 A记录

**具体解析设置

1. *记录类型:
	- **A记录：**
		*域名指向IPv4地址*（例如：10.10.10.10），需要增加A记录
		- CNAME记录：
			*域名指向一个域名*，实现与被指向域名相同的访问效果，需要增加CNAME记录
			- MX记录：
				建立电子*邮箱服务*，将指向邮件服务器地址，需要设置MX记录
			- NS记录：
				域名解析服务器记录，如果要将子域名指定某个域名服务器来解析，需要设置NS记录
			- TXT记录：
				可任意填写（可为空），通常用做SPF记录（反垃圾邮件）使用
			- **AAAA记录**：
				*域名指向IPv6地址*（例如：ff03:0:0:0:0:0:0:c1），需要添加AAAA记录
			- SRV记录：
				记录了哪台计算机提供了哪个服务。格式为：服务的名字.协议的类型（例如：_example-server._tcp）
			- 显性URL：
				将域名指向一个http（s)协议地址，访问域名时，自动跳转至目标地址（例如：将www.net.cn显性转发到www.hichina.com后，访问www.net.cn时，地址栏显示的地址为：www.hichina.com）。
			- 隐性URL：
				与显性URL类似，但隐性转发会隐藏真实的目标地址（例如：将www.net.cn隐性转发到www.hichina.com后，访问www.net.cn时，地址栏显示的地址仍然为：www.net.cn）。


		2. *主机记录:
		3. *解析线路:
		4. *记录值
		5. *MX 优先级
		6. *TTL



### 0214.help  和 www.0214.help  的区别

0214.help      是*顶级域名*
www.0214.help  是*子域名*
game.0214.help 是*子域名*

基域名通常会指向 www. 域名  这个子域名.  因为 www 是最常用的.

> 其实 0214.help  和 www.0214.help 是两个域名.

 


### CNAME
别名（CNAME）解析允许您**将多个域名映射到同一台计算机**。
例如，有一台计算机名为“host.mydomain.com”（A 记录），它同时提供 WWW 和 MAIL 服务；为了便于用户访问服务，可以为该计算机设置两个别名（CNAME）：WWW 和 MAIL。这两个别名的全称就是“www.mydomain.com”和“mail.mydomain.com”。实际上他们都指向“host.mydomain.com”。
域名 CNAME 解析设置方法：


### 301 重定向







MX记录：就是邮件服务器，大家知道邮箱是***@***.***的形式，***
邮件点“发送”：
首先你的邮件服务商要根据你的收件人邮箱的域名去找它的MX记录，
然后再把邮件发给相应的（另一家）邮件服务商，比如我的域名yihui.name的MX记录是ASPMX.L.GOOGLE.COM，也就是Google Apps的邮件服务地址，当你给xie@yihui.name发邮件的时候，系统先去找一下yihui.name的MX记录，一看，哦，是Google啊，那就投递到Google家去，Google收到邮件，一看，哦，要发给xie用户啊，那就发给xie的收件箱中吧；我记得以前搜狗似乎也提供过免费的邮件服务，不知现在还在不在，我已经用Google Apps很久了。

CNAME：即别名，这玩意儿就是个域名“面具”，比如我把google.yihui.name的CNAME设置为google.com，那么你们访问前者的时候实际上就在访问Google，域名中包含的任何路径都会原封不动传递给google.com，比如google.yihui.name/services/就是在访问google.com/services/，但你的浏览器地址栏中的地址不会显示后者，而是显示那个“伪装”的地址。所以只要我高兴，我可以随意制造消息，比如“Google换网址了，新网址是http://google.xiexie.name”。

其它设置：不说了，理论上一个A记录就够用了，别的都不用管。


