## Apache - Web Server
官网:   [ http://httpd.apache.org/download.cgi ]()

Apache 版本信息
	sudo apachectl -v      

安装成功:
启用Apache后, 浏览器输入 http://localhost 
出现“It works!”就表示运行正常。

Apache 开/关/重启
	sudo apachectl start    
	sudo apachectl restart   
	sudo apachectl stop    


## 系统目录: http://localhost

## 用户目录: http://localhost/username
也就是 Mac OS Home下的 Sites(站点).
 
## 要实现输入 127.0.0.1  就能进入用户目录! 为验证!!
 需要进行如下修改!
 
#### 一:
	vi etc/apache2/usrs 
下面创建/或者修改 V.conf 文件. (用户名.conf)   
内容改成如下: 
 
	<Directory “/Users/username/Sites/”>
	Options Indexes MultiViews FollowSymLinks
	AllowOverride All
	Order allow,deny
	Allow from all
	Require all granted
	</Directory> ‘’ 
> 请将username改成你的用户名

保存退出后 → 修改权限 → 755   手动全部读写   

#### 二:
编辑下面文件
	vi /etc/apache2/httpd.conf 

删除下列这些代码前的注释符号(#号)
	Include /private/etc/apache2/extra/httpd-userdir.conf
	LoadModule authz_core_module libexec/apache2/mod_authz_core.so
	LoadModule authz_host_module libexec/apache2/mod_authz_host.so
	LoadModule userdir_module libexec/apache2/mod_userdir.so

编辑下面文件
	/etc/apache2/extra/httpd-userdir.conf

删除下列这些代码前的注释符号(#号)
	Include /private/etc/apache2/users/\*.conf

重启 Apache
	sudo apachectl restart

这时，用户目录 已经可以用了：
用户目录: [http://localhost/V/][2]

 
 

# 虚拟主机:  ???
 


这步骤的教程链接     http://note.rpsh.net/posts/2013/11/27/osx-10-9-apache-server-php-mysql      
 
 
首先我们一个服务器不可能只有一个网站 所以要开启虚拟主机功能.
新建的网站会自动出现 独立配置文件 如 (3) 
file:///private/etc/apache2/extra/httpd-vhosts.conf   
 
打开后会找到
\<VirtualHost \*:80\> 
ServerAdmin webmaster@dummy-host.example.com 
DocumentRoot “/usr/docs/dummy-host.example.com” 
ServerName dummy-host.example.com
ErrorLog “/private/var/log/apache2/dummy-host.example.com-error\_log” 
CustomLog “/private/var/log/apache2/dummy-host.example.com-access\_log” common 
\</VirtualHost\>
 
ServerAdmin 就是网站管理员 这个无所谓随便
DocumentRoot 是网站默认目录 这个无需更改
ServerName 最重要 这里改成你自己网站要绑定的域名. 
随后两个是日志 如无特殊要求无需修改. 
 
修改好后 重启apache . 
 
目前就所有都宣告配置完成...
 
 
 
 
# Apache - Zabbix 配置.

用(系统目录)127.0.0.1  → 进入 用户目录

修改/etc/apache2/httpd.conf内容

DocumentRoot /Users/username/Sites
\<Directory /Users/username/Sites\>
Options Indexes MultiViews
# apache 2.2
# AllowOverride All
# Order allow,deny
# Allow from 127.0.0.1

# apache 2.4
Require local
\</Directory\>
这样Sites目录就是网站根目录了，
通过http://localhost就可以访问了。





## Apache

http://tieba.baidu.com/p/2747109517                                                                         全面配置
 
http://note.rpsh.net/posts/2013/11/27/osx-10-9-apache-server-php-mysql        apache ??

mac自带的
 
http://httpd.apache.org/download.cgi   官网下载
 
终端里面 输入  sudo apachectl -v      显示apache版本
 
sudo apachectl start    启动方法            系统默认开启的.
 
sudo apachectl restart      重启
sudo apachectl stop          停止
启用 Apache 之后，你可以直接在浏览器中访问 http://localhost，如果出现“It works!”就表示运行正常。
上面那个是系统的目录   还有个主要的用户目录 按照下面的配置.
1.    Etc apache2 usrs 下面创建V.conf    (用户名.conf)    如果已经存在   那就修改下内容  .
内容 
 
\<Directory “/Users/username/Sites/”\>  
Options Indexes MultiViews FollowSymLinks  
AllowOverride All  
Order allow,deny  
Allow from all  
Require all granted  
\</Directory\>
 
(请将username改成你的用户名)
保存后 修改权限  755   手动全部读写   
2  
编辑 /etc/apache2/httpd.conf 文件，删除下列这些代码前的注释符号： \#
Include /private/etc/apache2/extra/httpd-userdir.conf
LoadModule authz\_core\_module libexec/apache2/mod\_authz\_core.so  
LoadModule authz\_host\_module libexec/apache2/mod\_authz\_host.so  
LoadModule userdir\_module libexec/apache2/mod\_userdir.so
编辑 /etc/apache2/extra/httpd-userdir.conf 文件，删除下列这些代码前的注释符号： \#
Include /private/etc/apache2/users/\*.conf
重启 Apache
sudo apachectl restart
这时，这个网址应该已经可以用了：
http://localhost/username/
 
 
 
这步骤的教程链接     http://note.rpsh.net/posts/2013/11/27/osx-10-9-apache-server-php-mysql      
 
\`
\` 
 
首先我们一个服务器不可能只有一个网站 所以要开启虚拟主机功能.
新建的网站会自动出现 独立配置文件 如 (3) 
file:///private/etc/apache2/extra/httpd-vhosts.conf   
 
打开后会找到
\<VirtualHost \*:80\> 
ServerAdmin webmaster@dummy-host.example.com 
DocumentRoot “/usr/docs/dummy-host.example.com” 
ServerName dummy-host.example.com
ErrorLog “/private/var/log/apache2/dummy-host.example.com-error\_log” 
CustomLog “/private/var/log/apache2/dummy-host.example.com-access\_log” common 
\</VirtualHost\>
 
ServerAdmin 就是网站管理员 这个无所谓随便
DocumentRoot 是网站默认目录 这个无需更改
ServerName 最重要 这里改成你自己网站要绑定的域名. 
随后两个是日志 如无特殊要求无需修改. 
 
修改好后 重启apache . 
 
目前就所有都宣告配置完成...
 
 
 
 
 
 


















[2]:	http://localhost/V/ "用户目录"