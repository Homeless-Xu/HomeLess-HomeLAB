## Apache Basic

[官网地址:][1]        [wiki中文文档][2]
[2.4 官方文档.EN][3]  [2.2 官方文档.CN][4]
[Mac-Apache 最好教程][5]

apache 搭配 php.
写个 php 脚本  
`<?php phpinfo();?>`
运行看看  能显示页面就正常. 还能看是什么版本,
显示的是 源文本 说明 php 没设置成功.

/etc/apache2/httpd.conf
配置文件 注释这行
`#LoadModule php5_module libexec/apache2/libphp5.so`
 就会 从
`/etc/apache2/other/+php-osx.conf file.
`这里 读取配置文件  启用最新版本 也就是 php7.0




Apache: 最流行的 *网页服务器*
> 还有 IIS 和 nginx

*查 Apache 版本:*  一下二选一        
sudo apachectl -v   /  httpd -v

I*Apache 安装成功标志:*
1. 启用Apache 服务
	2. 浏览器输入 (二选一)
		http://localhost 		// 你网站在 系统目录下的
		http://localhost/v/   // 你网站在 用户目录下的 (v 改成你自己的用户名)

		3. 出现“It works!”就表示运行正常。

*Apache 开/关/重启
sudo apachectl start  / stop / restart
> Mac 默认开机启动apache 服务.

*sudo apachectl -k restart
> 排错重启:会提示配置文件哪里有错误.

sudo apachectl graceful
> 重新启动apache服务器，但不会中断原有的连接

sudo apachectl configtest
> 检查配置文件中的语法是否正确



Apache 配置文件夹:    	/etc/apache
*Apache 主要配置文件*		/etc/apache2/httpd.conf
> 记得备份原文件!! sudo cp a.txt a.txt.backup

*系统目录:* http://localhost

*用户目录:* http://localhost/v (这里填你自己的用户名)
> 也就是 Mac OS Home下的 Sites(站点).
 
*Apache 默认网站根目录: 
/library/webserver/documents

这个文件夹下 放个 php 文件 如: info.php
访问: http://localhost/info.php 
就能看到info.php 的网页内容了

每次都把项目 复制到 /library/webserver/documents
下 太麻烦了. 所以要 改下 apache 的配置文件.
/etc/apache2/httpd.conf  实现输入 127.0.0.1  就能进入用户目录! 


需要进行如下修改：
 
1. **指定文件夹下 创建 或者 修改 V.conf 文件.   (用户名.conf)   

	vi etc/apache2/usrs/v.conf

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

2.  vi /etc/apache2/httpd.conf

删除下列这些代码前的注释符号(#号)
	Include /private/etc/apache2/extra/httpd-userdir.conf
	LoadModule authz_core_module libexec/apache2/mod_authz_core.so
	LoadModule authz_host_module libexec/apache2/mod_authz_host.so
	LoadModule userdir_module libexec/apache2/mod_userdir.so


3. vi /etc/apache2/extra/httpd-userdir.conf

删除下列这些代码前的注释符号(#号)
	Include /private/etc/apache2/users/\*.conf

4. 重启 Apache
	sudo apachectl restart

这时，用户目录 已经可以用了：
用户目录: [http://localhost/V/][6]
如果改过端口的: http://localhost:8090/index.php


# 虚拟主机:  ???
 
首先我们一个服务器不可能只有一个网站 
所以要开启虚拟主机功能.

DocumentRoot 是网站默认目录 这个无需更改

ServerName 最重要 这里改成你自己网站要绑定的域名. 
 
修改好后 重启apache . 
 
目前就所有都宣告配置完成...

 



---- -------
**httpd.conf    详细配置

- Listen 80.
Apache 的监听端口.
外网要访问本地,请在路由上开放这个端口.


- **DocumentRoot**
	> 235行. 网页的目录.
如果要改:  必须 同步修改:
`<directory “/srv/http”>` 和 `DocumentRoot`   

记得修改下面 否则报错
`Require all denied → Require all granted
`
Document 目录 及其父目录必须有可执行权限!!!
( 用 chmod o+x /path/to/documentroot )



- Allowoverride none
如果要使用 .htaccess 请允许 这个选项




*用户目录:*
默认设置 可以通过 http://localhost/username/index.html  里面的内容,
(可以通过/etc/httpd/conf/extra/httpd-userdir.conf 设置). 

要禁用这个访问，请注释掉 /etc/httpd/conf/httpd.conf 文件中的如下行：
Include conf/extra/httpd-userdir.conf



*请正确设置目录的权限，
网页文件及父目录 必须可执行

重启 httpd.service 服务以应用更改。


管理多个主机
如果要管理的主机非常多，希望更方便的维护，建议为每一个虚拟主机创建一个配置文件并文件存储到一个文件夹中 /etc/httpd/conf/vhosts。
创建目录：
# mkdir /etc/httpd/conf/vhosts
编写单独的配置文件:
# nano /etc/httpd/conf/vhosts/domainname1.dom
# nano /etc/httpd/conf/vhosts/domainname2.dom
...
在 /etc/httpd/conf/httpd.conf 中 Include 单独的配置文件:
# Enabled Vhosts:
Include conf/vhosts/domainname1.dom
Include conf/vhosts/domainname2.dom
通过注释或取消注释可以单独启用或禁用一个虚拟主机。

DocumentRoot “/usr/local/www/data“
　　
　　　　DocumentRoot定义这个服务器对外发布的超文本文档存放的路径，客户程序请求的UR L就被映射为这个目录下的网页文件。这个目录下的子目录，以及使用符号连接指出的文件和目录都能被浏览器访问，只是要在URL上使用同样的相对目录名。


AllowOverride的设置 对每个目录访问控制文件作用的影响 
　　All 缺省值，使访问控制文件可以覆盖系统配置 
　　None 服务器忽略访问控制文件的设置 
　　Options 允许访问控制文件中可以使用Options参数定义目录的选项 
　　FileInfo 允许访问控制文件中可以使用AddType等参数设置 
　　AuthConfig 允许访问控制文件使用AuthName，AuthType等针对每个用户的认证机制，这使目录属主能用口令和用户名来保护目录 
　　Limit 允许对访问目录的客户机的IP地址和名字进行限制 

　虚拟主机是在一台Web服务器上，可以为多个单独域名提供Web服务，并且每个域名都完全独立，包括具有完全独立的文档目录结构及设置，这样域名之间完全独立，不但使用每个域名访问到的内容完全独立，并且使用另一个域名无法访问其他域名提供的网页内容。
　　
　　　　虚拟主机的概念对于ISP来讲非常有用，因为虽然一个组织可以将自己的网页挂在具备其他域名的服务器上的下级往址上，但使用独立的域名和根网址更为正式，易为众人接受。传统上，必须自己设立一台服务器才能达到单独域名的目的，然而这需要维护一个单独的服务器，很多小单位缺乏足够的维护能力，更为合适的方式是租用别人维护的服务器。ISP也没有必要为一个机构提供一个单独的服务器，完全可以使用虚拟主机能力，使服务器为多个域名提供Web服务，而且不同的服务互不干扰，对外就表现为多个不同的服务器。






**主要配置:

1  ServerRoot "/application/apache2.2.22"   # apache根目录，应只能root访问

 2  Listen 80                            # apache服务默认的监听端口80 如果需要同时监听多个端口可以在后面加行：listen 81


 5  User daemon                          # apache的用户，默认为daemon
    6  Group daemon                         # apache的用户，默认为daemon



 9  ServerAdmin you@example.com          # 系统管理员邮箱，如果出现问题，会在首页显示



二、Apache扩展的配置文件
/application/apache/conf/extra          # apache扩展的配置文件




三、httpd-vhosts.conf虚拟主机配置文件注释
[root@es extra]()\# egrep -v "^.*\#|^$"  httpd-vhosts.conf |nl
    1  NameVirtualHost *:80                                # 基于名称的虚拟主机配置（ *:80表示监听本机所有ip）
    2  \<VirtualHost *:80\>                                  # 定义一个虚拟主机
    3      ServerAdmin webmaster@dummy-host.example.com    # 配置管理员邮箱
    4      DocumentRoot "/application/apache2.2.22/docs/dummy-host.example.com"  # 程序的站点目录
    5      ServerName dummy-host.example.com               # 域名服务，需要apache mode_alias模块支持
    6      ServerAlias www.dummy-host.example.com          # 虚拟主机别名
    7      ErrorLog "logs/dummy-host.example.com-error_log"# 错误的日志路径
    8      CustomLog "logs/dummy-host.example.com-access_log" common  #访问日志配置（生产环境我们用combined格式代替common格式）
    9  \</VirtualHost\>
   10  \<VirtualHost *:80\>
   11      ServerAdmin webmaster@dummy-host2.example.com
   12      DocumentRoot "/application/apache2.2.22/docs/dummy-host2.example.com"
   13      ServerName dummy-host2.example.com
   14      ErrorLog "logs/dummy-host2.example.com-error_log"
   15      CustomLog "logs/dummy-host2.example.com-access_log" common
   16  \</VirtualHost\>





四、Apache服务存放站点的目录
/application/apache/htdocs              # 默认存放网页的路径，输入IP 到此目录 能够见到it's wroks! 就是此目录
[root@es htdocs]()\# less  index.html
\<html\>\<body\>\<h1\>It works!\</h1\>\</body\>\</html\>




五、Apache服务目录结构说明
[root@es htdocs]()\# ls /application/apache/
bin  build  cgi-bin  conf  error  htdocs  icons  include  lib  logs  man  manual  modules
bin启动文件目录说明
|-- bin                    # apache服务的命令目录
|   |-- ab                 # http服务性能测试工具
|   |-- apachectl          # apache启动命令
|   |-- apr-1-config      
|   |-- apu-1-config
|   |-- apxs               # http服务编译和安装扩展模块使用工具，在DSO方式模块编译时用到
|   |-- checkgid
|   |-- dbmmanage
|   |-- envvars
|   |-- envvars-std
|   |-- htcacheclean       # 清理磁盘缓冲区的控制命令
|   |-- htdbm
|   |-- htdigest
|   |-- htpasswd           # 建立和更新基本认证文件
|   |-- httpd              # httpd为apache的控制命令程序
|   |-- httxt2dbm
|   |-- logresolve
|    -- rotatelogs         # apache自带的日子轮询命令（cronolog生产环境使用比较多）。
  

conf配置文件目录
[root@es htdocs]()\# ls /application/apache/conf/
extra  httpd.conf  magic  mime.types  original
/application/apache/conf/         # apache配置所有的配置文件目录
|-- extra                         # 额外的apache配置文件目录 如：httpd-vhost.conf
|   |-- httpd-autoindex.conf      
|   |-- httpd-dav.conf
|   |-- httpd-default.conf
|   |-- httpd-info.conf
|   |-- httpd-languages.conf
|   |-- httpd-manual.conf
|   |-- httpd-mpm.conf
|   |-- httpd-multilang-errordoc.conf
|   |-- httpd-ssl.conf
|   |-- httpd-userdir.conf
|   |-- httpd-vhosts.conf
|-- httpd.conf                     # apache主配置文件
|-- magic
|-- mime.types
|-- original
|   |-- extra
|   |   |-- httpd-autoindex.conf
|   |   |-- httpd-dav.conf                 # dav支持配置
|   |   |-- httpd-default.conf             # 这个文件里配置的是apache的相关服务参数：超时时间、保持链接
|   |   |-- httpd-info.conf
|   |   |-- httpd-languages.conf           # 语言支持
|   |   |-- httpd-manual.conf
|   |   |-- httpd-mpm.conf # 服务器池管理，也是优化apache的一个配置文件（apache的模式以及配置链接数，常用模式为worker模式和profork模式，默认porfork）
|   |   |-- httpd-multilang-errordoc.conf
|   |   |-- httpd-ssl.conf                 # 提供apache ssl支持配置文件
|   |   |-- httpd-userdir.conf
|   |   |-- httpd-vhosts.conf              # 虚拟机的配置文件
|   |-- httpd.conf





## localhost 拒绝访问






## 
make_sock: could not bind to address [::]:80


- address is already in use
80被别的软件占用了
进 活动监视器 的 network 看端口被谁用了。




怎么看是不是 apache 使用了 80端口
修改下 apache 配置文件的 listen 端口  成8090
重启apache。
再nmap 127.0.0.1 看看80 是不是消失了 变成8090了.


然后 浏览器 localhost:8090
You don't have permission to access / on this server.



总结:
httpd: 主要配置:


1.  监听端口


2. DocumentRoot “/Users/v/desktop/site/”

3. \<Directory “/Users/v/desktop/site/”\>

> 2 3 两处的路径必须一致.

> /Users/v/desktop/site/ 
所有父级文件夹 必须有 x 可执行权限.




## opt 文件夹.
放 可选程序.


[1]:	http://httpd.apache.org/download.cgi
[2]:	https://wiki.archlinux.org/index.php/Apache_HTTP_Server_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
[3]:	https://httpd.apache.org/docs/2.4/zh-cn/
[4]:	http://httpd.apache.org/docs/2.2/
[5]:	https://getgrav.org/blog/mac-os-x-apache-setup-multiple-php-versions
[6]:	http://localhost/V/ "用户目录"
