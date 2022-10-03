## Nslookup

*查询DNS的记录，查看网络中的 DNS 服务器 的域名解析是否正常.*

 nslookup www.taobao.com
Server:		172.19.16.16        // DNS 服务器.
Address:	172.19.16.16#53
Non-authoritative answer:
www.taobao.com	canonical name = www.taobao.com.danuoyi.tbcache.com.
Name:	www.taobao.com.danuoyi.tbcache.com
Address: 124.160.132.254
Name:	www.taobao.com.danuoyi.tbcache.com
Address: 140.207.232.122



正向解析

逆向解析



直接查询 返回的是 A 记录.



A记录: (address)
用来 指定主机名/域名 对应的 IP 地址记录.



- A     地址记录 
- CNAME 别名记录 
	允许您将多个名字映射到同一台计算机。 通常用于同时提供WWW和MAIL服务的计算机。

例:
有一台计算机名为“host.mydomain.com”（A记录）。 它*同时提供 WWW 和 MAIL服务.*
为了便于用户访问服务。*可以设置两个别名（CNAME）*：WWW 和 MAIL。 
1. www.mydomain.com
	2. mail.mydomain.com。
		> 实际上他们都指向“host.mydomain.com”。




- MX    邮件服务器记录



	 
- NS    名字服务器记录 

AAAA          地址记录 
AFSDB Andrew  文件系统数据库服务器记录 
ATMA          ATM地址记录 
HINFO         硬件配置记录，包括CPU、操作系统信息 
ISDN          域名对应的ISDN号码 
MB            存放指定邮箱的服务器 
MG            邮件组记录 
MINFO         邮件组和邮箱的信息记录 
MR            改名的邮箱记录 
PTR           反向记录 
RP            负责人记录 
RT            路由穿透记录 
SRV           TCP服务器信息记录 
TXT           域名对应的文本信息 
X25           域名对应的X.25地址记录




1. A记录 又称IP指向，用户可以在此设置子域名并指向到自己的目标主机地址上，从而实现通过域名找到服务器。说明：·指向的目标主机地址类型只能使用IP地址；   

附加说明：   

           1) 泛域名解析即将该域名所有未指定的子域名都指向一个空间。在“主机名”中填入*，“类型”为A，“IP地址/主机名”中填入web服务器的IP地址，点击“新增”按钮即可。   

           2) 负载均衡的实现：负载均衡(Server Load Balancing，SLB)是指在一系列资源上面动态地分布网络负载。负载均衡可以减少网络拥塞，提高整体网络性能，提高自愈性， 并确保企业关键性应用的可用性。当相同子域名有多个目标地址时，表示轮循，可以达到负载均衡的目的，但需要虚拟主机服务商支持。
  

 2. CNAME 通常称别名指向。您可以为一个主机设置别名。比如设置test.mydomain.com，用来指向一个主机www.rddns.com那么以后就可以用test.mydomain.com来代替访问www.rddns.com了。
说明：·
            CNAME的目标主机地址只能使用主机名，不能使用IP地址；·主机名前不能有任何其他前缀，如：http://等是不被允许的；·A记录优先于CNAME记录。即如果一个主机地址同时存在A记录和CNAME记录，则CNAME记录不生效。   

3. MX记录 邮件交换记录。用于将以该域名为结尾的电子邮件指向对应的邮件服务器以进行处理。如：用户所用的邮件是以域名mydomain.com为结尾的，则需要在管理界面中添加该域名的MX记录来处理所有以@mydomain.com结尾的邮件。   

说明：·
            MX记录可以使用主机名或IP地址；·MX记录可以通过设置优先级实现主辅服务器设置，“优先级”中的数字越小表示级别越高。也可以使用相同优先级达到负载均衡的目的；·如果在“主机名”中填入子域名则此MX记录只对该子域名生效。
附加说明：
         1) 负载均衡服务器负载均衡(Server Load Balancing，SLB)是指在一系列资源上面智能地分布网络负载。负载均衡可以减少网络拥塞，提高整体网络性能，提高自愈性，并确保企业关键性应用的可用性。当域名的MX记录有多个目标地址且优先级相同时，表示轮循，可以达到负载均衡的目的，但需要邮箱服务商支持。    

4. NS记录 解析服务器记录。用来表明由哪台服务器对该域名进行解析。这里的NS记录只对子域名生效。
   例如用户希望由12.34.56.78这台服务器解析news.mydomain.com，则需要设置news.mydomain.com的NS记录。
   说明：·“优先级”中的数字越小表示级别越高；·“IP地址/主机名”中既可以填写IP地址，也可以填写像ns.mydomain.com这样的主机地址，但必须保证该主机地址有效。
   如，将news.mydomain.com的NS记录指向到ns.mydomain.com，在设置NS记录的同时还需要设置ns.mydomain.com的指向，
   否则NS记录将无法正常解析；·NS记录优先于A记录。即，如果一个主机地址同时存在NS记录和A记录，则A记录不生效。这里的NS记录只对子域名生效。   

5.   

   相关说明    

   1) 负载均衡服务器负载均衡(Server Load Balancing，SLB)是指在一系列资源上面智能地分布网络负载。负载均衡可以减少网络拥塞，提高整体网络性能，提高自愈性，并确保企业关键性应用的可用性。当相同子域有多个目标地址，或域名的MX记录有多个目标地址且优先级相同时，表示轮循，可以达到负载均衡的目的，但需要虚拟主机和邮箱服务商支持。
    2) TTL值TTL值全称是“生存时间（Time To Live)”，简单的说它表示DNS记录在DNS服务器上缓存时间。东方网景DNS服务器默认即时生效，客户的增加修改一般不超过15分钟可以使用。  



















