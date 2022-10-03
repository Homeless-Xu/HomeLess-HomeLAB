## Apache / Httpd .conf 配置文件详解:

**Config **:

1. 端口设置
	**Lsiten 80 
	**Listen 443
	//默认是 80 可以同时监听多个端口如 Https (443)
	//也可以只响应某个 IP 端口的 http 请求.  (默认相应所有 IP 的Http请求)


2. **ServerRoot “/usr”
	指的是 httpd软件所在的安装/运行目录，一定不能错
	> /usr       :Unix 系统商 开发的程序.
	> /usr/local :用户自己安装的程序
	> /opt       :第三方厂商的程序 选装(option)


3. **LoadModule**

4. User Daemon 和 Group Daemon，

5. ServerAdmin，管理员邮箱，可改可不改

6. **DocumentRoot**
	 Web文档的存放根目录.你写的网页要反正这里 才能用网址访问到.
	**下面一行的 \<Directory 路径 也要改成和同样的值!!!!

7. **Directory
	对指定目录 做出访问权限控制. 必须的.

	\<Directory "D:/www"\>
	    Options None 
	    AllowOverride None
	    order Allow,Deny
	    allow from all
	    deny from www.google.com.hk
	\</Directory\>


	- **allowoverride:**
		> 建议值: none → 完全禁止使用. htaccess 文件.

允许读取 .htaccess 文件中的指令类型.

避免使用 .htaccess 主要原因是性能.
允许读取的话. apache  要在每个目录(包括上级目录!!)中查找. htaccess 文件
无论是否真正有用. 都会导致性能下降.
每个请求都要 读取一次 .htaccess 文件!!



8. **虚拟主机**
	NameVirtualHost *:80*


	\<VirtualHost *:80\>
	ServerAdmin xxx@example.com
	DocumentRoot "D:/test"
	ServerName xxx.com
	\</VirtualHost\>
	注意如果要访问，xp必须修改本机的 C:\WINDOWS\system32\drivers\etc目录下的hosts文件追加 
	127.0.0.1      xxx.com 
	配置完成即可以通过http://xxx.com


9. ** ServerAdmin@your.address**
	写上服务器管理员的地址, http 服务出错时 这个邮箱会给客户端看到. 客户 就可以联系管理员.报错.



**文档访问控制** 两种方法
针对目录进行文档的访问控制.
1. httpd.conf 文件中 用 \<Directory\> 对每个目录进行设置.
	> 每次改完配置 都要重启 httpd 进程.
	2. 每个目录下 设置访问控制文件 .htaccess

		\<Directory\>
		这个就是用来定义目录访问限制的.
		Apache 对目录的权限 是能被下一级目录继承的.
		根目录的设置 将影响 下级目录.



- **AllowOverride 设置，
	 
	使得Apache服务器不需要查看根目录下的访问控制文件，也不需要查看以下各级目录下的访问控制文件.
	直至httpd.conf（或access.conf ）中为某个目录指定了允许Alloworride，即允许查看访问控制文件。

	由于Apache对目录访问控制是采用的继承方式，如果从根目录就允许查看访问控制文件，
	那么Apache就必须一级一级的查看访问控制文件，对系统性能会造成影响。
	因此对于系统根目录设置AllowOverride None不但对于系统安全有帮助，也有益于系统性能。

	All 缺省值，使访问控制文件可以覆盖系统配置 
	　　**None** **服务器忽略访问控制文件的设置** 
	　　Options 允许访问控制文件中可以使用Options参数定义目录的选项 
	　　FileInfo 允许访问控制文件中可以使用AddType等参数设置 
	　　AuthConfig 允许访问控制文件使用AuthName，AuthType等针对每个用户的认证机制，这使目录属主能用口令和用户名来保护目录 
	　　Limit 允许对访问目录的客户机的IP地址和名字进行限制 

	　　
Options Indexes FollowSymLinks
　　 AllowOverride None
　　 Order allow,deny
　　 Allow from all
　　\</Directory\>


　　　
　　
　　每个目录具备一定属性，可以使用Options来控制这个目录下的一些访问特性设置，以下为常用的特性选项：
　　
　　**Options设置 服务器特性设置** 
　　All 所有的目录特性都有效，这是缺省状态 
　　None 所有的目录特性都无效 
　　**FollowSymLinks** 允许使用符号连接，**这将使浏览器有可能访问文档根目录（DocumentRoot）之外的文档** 
　　SymLinksIfOwnerMatch 只有符号连接的目的与符号连接本身为同一用户所拥有时，才允许访问，这个设置将增加一些安全性 
　　ExecCGI 允许这个目录下可以执行CGI程序 
　　Indexes 允许浏览器可以生成这个目录下所有文件的索引，使得在这个目录下没有index.html（或其他索引文件）时，能向浏览器发送这个目录下的文件列表 


此外，上例中还使用了Order、Allow、Deny等参数，这是Limit语句中用来根据浏览器的域名和 IP地址来控制访问的一种方式。
其中*Order定义处理Allow和Deny的顺序*，
而Allow、Deny则针对名字或IP进行访问控制设置，
*allow from all*:表示允许所有的客户机访问这个目录，而不进行任何限制。
　　
　
　　　　当在一台FreeBSD上运行Apache服务器时，这台计算机上的所有用户都可以有自己的网页路径，
`http://freebsd.example.org.cn/~user`
使用波浪符号加上用户名就可以映射到用户自己的网页目录上。
映射目录为用户个人主目录下的一个子目录，其名字就用UseDir这个参数进行定义，缺省为public_html。
如果不想为正式的用户提供网页服务，使用DISABLED作UserDir的参数即可。_ 


Apache服务器本身就具备代理的功能，然而这要求加载入`mod_proxy`模块。
这能使用*IfModule语句进行判断*，
如果存在mod_proxy模块，就使用ProxyRequests打开代理支持.
此后的Directory用于设置对Proxy功能的访问权限设置，以及用于设置缓冲的各个参数设置。





**虚拟主机**
　一台Web服务器，可以为多个单独域名提供Web服务，并且每个域名都完全独立.



\<VirtualHost 192.168.0.1\>（虚拟主机IP）
　　 ServerAdmin 111@xxx.com（第一个虚拟主机Email）
　　 DocumentRoot H:/web001（第一个虚拟主机目录）
　　 ServerName www.xxx.org（第一个虚拟主机域名）
　　 ErrorLog logs/www.xxx.org-error.log（第一个虚拟主机错误日志）
　　 CustomLog logs/www.xxx.org-access.log common（第一个虚拟主机数据）
　　\</VirtualHost\>
　　
　　\<VirtualHost 192.168.0.2\>（虚拟主机IP）
　　 ServerAdmin 111@xxx.com（第二个虚拟主机Email）
　　 DocumentRoot H:/web002（第二个虚拟主机目录）
　　 ServerName www.xxx2.org（第二个虚拟主机域名）
　　 ErrorLog logs/www.xxx2.org-error.log（第二个虚拟主机错误日志）
　　 CustomLog logs/www.xxx2.org-access.log common（第二个虚拟主机数据）
　　\</VirtualHost\>
　　
　　以此类推，可以增加更多虚拟主机。


