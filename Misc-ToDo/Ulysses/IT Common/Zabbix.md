## Zabbix 
  
- [官网][1]:
- 企业级的 CPU、内存、硬盘、网络、端口、日志的 监视软件.

- 支持主流 Linux、Mac OS . 但是 Windows 只能跑客户端!!!!!

- 软件版本: 
	- LTS: Long Time Support 长期支持.
	- Zabbix 3.0 LTS  2016 2.16 发行.

- 用网页来显示系统状态.

- 触发器(trigger):  CPU 达到 90% 自动发邮件给你警告

- 实时绘图: 更直观显示服务器状态.


源码编译:
[源码压缩包官网链接][2]  (wget 要用到) .

源代码压缩包只有一个: 包含了 Server + Agent.  按需求选择安装就好了.
 
	wget [http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.0.1/zabbix-3.0.1.tar.gz]

- Zabbix 组成: Server 监控端 + Agent (被监控端);


###### zabbix 进程结构:

	zabbix\_agentd
	zabbix\_get
	zabbix\_proxy
	zabbix\_sender
	zabbix\_server
	zabbix\_java\_gateway (可选)

-  进程介绍:

	zabbix\_agentd

客户端守护进程，收集客户端数据，如cpu、内存、硬盘使用使用情况.

	zabbix_get
获取被监控客户端信息的命令,常用于排错。

	zabbix_sender
发送数据给server或者proxy，通常用于耗时比较长的检查。
脚本执行完毕之后，使用sender主动提交数据。

	zabbix_server
服务端守护进程。所有数据最终都是提交到server
备注：有些数据主动交给server,也有的是server主动去获取数据。

	zabbix_proxy
代理守护进程。功能类似server，唯一不同的是它只是一个中转站.
它需要把收集到的数据提交/被提交到server里。
为什么要用代理:代理是做什么的？


## Zabbix server :
> 一定要先安装依赖组件,不然报错
> 
	yum install net-snmp-devel libxml2-devel libcurl-devel 
	
	cd /usr/local/src
	
	wget "http://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/2.2.2/zabbix-2.2.2.tar.gz?r=http%3A%2F%2Fwww.zabbix.com%2Fdownload.php&ts=1395066528&use_mirror=jaist"
	
	tar -xzvf zabbix-2.2.2.tar.gz
	
	cd zabbix-2.2.2
	
	./configure --prefix=/usr/local/zabbix-2.2.2/ --enable-server —enable-agent --with-mysql --with-net-snmp --with-libcurl --with-libxml2
	
	make
	make install

- Zabbix server一般充当两个角色：server、angent， 
	所以上面的配置参数也同时加上了--enable-agent。


 备注：请先安装好MySQL，snmp，curl开发库。

安装 SNMP:  

	brew install net-snmp

或者
	    wget http://ftp.ntua.gr/mirror/net-snmp/ucd-snmp/4.2.3/ucd-snmp-4.2.3.tar.gz
	    tar -zxvf ucd-snmp-4.2.3.tar.gz
	    cd ucd-snmp-4.2.3
	    ./configure
	    make
	    make install


##### curl


cURL是一个利用URL语法在命令行下工作的文件传输工具，
它支持文件上传和下载，所以是综合传输工具。
cURL还包含了用于程序开发的libcurl。

查看是否安装 /usr/local 下面 有没有 curl 文件夹.
官网
[https://curl.haxx.se/][3]




###### Server 安装常见错误:

configure: error: MySQL library not found




### 创建用户
为了安全考虑zabbix只使用普通用户运行，
假如你当前用户是ttlsa，那么你运行他，他便使用ttlsa身份运行。
假如你当前用户是root  那么zabbix将会主动使用zabbix用户来运行。
但是如果你的系统没有名叫zabbix的用户，你需要创建一个用户，如下：

groupadd zabbix
useradd -g zabbix zabbix


### 初始化数据库
zabbix server与proxy需要数据库，angent不需要。

尤其要注意的是proxy只需要导入一个sql文件(多导入会报错!)，而server一共要导入3个sql文件。

假设:你安装好了MySQL，用户名为root，密码为ttlsapwd

mysql -uroot -pttlsapwd
mysql\> create database zabbix default charset utf8;
mysql\> quit;
mysql -uroot -pttlsapwd zabbix \< database/mysql/schema.sql

备注：创建数据库请别忘记加default charset utf8，有可能会导致你出现中文乱码问题，

#### 如果你仅仅是初始化proxy的数据库，那么够了。
如果初始化server，那么接着导入下面两个sql

mysql -uroot -pttlsapwd zabbix \< database/mysql/images.sql
mysql -uroot -ppttlsapwd zabbix \< database/mysql/data.sql


###### 配置 Zabbix

配置zabbix\_server配置文件,zabbix源码目录下

mkdir /etc/zabbix
cp config/zabbix\_server.conf /etc/zabbix/
vim /etc/zabbix/zabbix\_server.conf
DBName=zabbix
DBUser=root
DBPassword=ttlsapwd
DBPort=3306 “”

###### 启动 Zabbix server  默认端口10051

/usr/local/zabbix-2.2.2/sbin/zabbix\_server




## Zabbix agent :
可下载源代码 或者 有现成的软件?
这个可以运行在 winserver 上!

cd /usr/local/src
wget "http://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/2.2.2/zabbix-2.2.2.tar.gz?r=http%3A%2F%2Fwww.zabbix.com%2Fdownload.php&ts=1395066528&use\_mirror=jaist"
tar -xzvf zabbix-2.2.2.tar.gz
cd zabbix-2.2.2
./configure --prefix=/usr/local/zabbix-2.2.2/ --enable-agent
make
make install


### 客户端配置

配置zabbix\_server配置文件,zabbix源码目录下

vim /usr/local/zabbix-2.2.2/etc/zabbix\_agentd.conf
Server=127.0.0.1
ServerActive=127.0.0.1
Hostname=Zabbix server


Server和ServerActive都指定zabbixserver的IP地址，

不同的是，前者是被动后者是主动。

Server这个配置是用来允许127.0.0.1这个ip来我这取数据。
serverActive的127.0.0.1的意思是，客户端主动提交数据给他。明白了吗？
为什么要分主动和被动？后续再来讨论这个问题！

其他主机安装客户端记得添加zabbix用户。


#### zabbix客户端启动    默认端口10050

/usr/local/zabbix-2.2.2/sbin/zabbix\_agentd





## zabbix管理网站配置

拷贝前端文件

mkdir /data/logs/nginx
mkdir /data/site/monitor.ttlsa.com/zabbix
cp -rp frontends/php/\* /data/site/monitor.ttlsa.com/zabbix



配置虚拟主机
请相应修改你的配置文件路径


vim /usr/local/nginx-1.5.8/conf/vhost/monitor.ttlsa.com.conf
server {
listen       80;
server\_name monitor.ttlsa.com;
access\_log  /data/logs/nginx/monitor.ttlsa.com.access.log  main;
 
index index.html index.php index.html;
root /data/site/monitor.ttlsa.com;
 
location /
{
try\_files $uri $uri/ /index.php?$args;
}
 
location  ^(.+.php)(.)$ {
fastcgi\_split\_path\_info ^(.+.php)(.\*)$;
include fastcgi.conf;
fastcgi\_pass  127.0.0.1:9000;
fastcgi\_index index.php;
fastcgi\_param  PATH\_INFO          $fastcgi\_path\_info;
}
}


在线配置zabbix
浏览器打开http://monitor.ttlsa.com/zabbix。
如下是zabbix 2.2的安装界面，包括欢迎界面一共6步.

4.3.1 欢迎界面
4.3.2 php需求检查   需要全部 OK
4.3.3 MySQL配置
4.3.4 zabbix服务端详细信息
4.3.5 zabbix安装前信息列表
4.3.6 安装完成
如果失败了，一般情况是php对zabbix没有写权限

登陆zabbix，默认用户名：Admin，密码：zabbix






---- 


## Zabbix - Debian8

\*\*[教程链接 (英文)][4] Debian-8 + CentOS-7

##### 一: 更新系统
	sudo apt-get update

##### 二: 安装源代码编译的依赖环境

	sudo apt-get install build-essential gcc curl wget libsnmp-dev libcurl4-gnutls-dev libxml2-dev

##### 三: 安装 MariaDB 数据库

	sudo apt-get install mariadb-server mariadb-client libmysqld-dev
> 会要你输入数据库默认 Root 的密码  本文输入 xujian 

##### 四: 保证数据库安全:
> 如: 不许匿名登录 / Root 远程登录 / 移除测试数据库.

	mysql_secure_installation   
> 按照屏幕提示 第一个选 N 其他选 Y .

1. Change the root password? [Y/n]() n
2. Remove anonymous users? [Y/n]() y
3. Disallow root login remotely? [Y/n]() y
4. Remove test database and access to it? [Y/n]() y
5. Reload privilege tables now? [Y/n]() y


##### 五: 安装 Apache + PHP
> Apache 很多功能都是根据 PHP 语言写的. 不得不装 PHP.
> Zabbix 对 PHP 还有特别的要求. 所以还要安装一些 PHP 的额外组件.
> 安装过程 输入 Y  .

	sudo apt-get install apache2 php5 php5-mysql php5-gd php5-cli php5-xmlrpc

##### 六: 修改 PHP 配置文件
> Zabbix 对PHP 有特殊要求.
> 下面的 二选一 编辑器不同而已.  个人习惯用 VI.
	sudo nano /etc/php5/apache2/php.ini
	sudo vi /etc/php5/apache2/php.ini

查找下列内容 并 修改成如下值
	post_max_size = 16M
	max_execution_time = 300
	max_input_time = 300
	date.timezone = Asia/Shanghai  
	always_populate_raw_post_data = -1

注意: 时区选择[http://php.net/manual/en/timezones.php][10]
监控和备件款的两台电脑 时区一定要一致! 不然进 Zabbix 界面会错误红色提示.
大陆/城市   这里选择 Asia/Shanghai . 

修改后 重启 Apache 服务来生效
	sudo systemctl restart apache2.service


##### 七: 编译 Zabbix-Server

- 下载:
	wget http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.0.1/zabbix-3.0.1.tar.gz

- 解压:
	tar -xf zabbix-3.0.1.tar.gz
	cd zabbix-3.0.1.tar.gz
	ls

- 编译! 需要开启一些功能  不能直接 ./configure ?
	./configure --enable-server --enable-agent --with-mysql --enable-ipv6 --with-net-snmp --with-libcurl --with-libxml2 
	make
	make install



##### 八: 给 Zabbix 创建用户组 (安全起见不允许用 root来监控?)


	groupadd zabbix
	//创建 用户组
	
	useradd -g zabbix -d /usr/local/share/zabbix -s /bin/false zabbix
	//-g ( GROUP )     指定新用户  所属组.
	//-d ( HOME_DIR )  指定新用户  登录目录.
	//-s ( SHELL )     指定新用户  Shell.  默认使用 bash




##### 九: 给 Zabbix 配置数据库.

	mysql -u root -p 
	//登录 MySQL, 输入你 第三步 设置的密码 这里是 xujian.
	MariaDB> create database zabbix;
	//创建数据库
	MariaDB> grant all privileges on zabbix.* to 'zabbix'@'localhost' identified by 'xujian';
	//给 zabbix 用户权限. xujian 改成你自己的密码
	MariaDB> flush privileges;
	//更新权限
	MariaDB> exit
	//退出 MySQL.

> 数据库 不一定 装在 Zabbix-Server 服务器上的.
> 如果你的数据库是装在 别的电脑上的话:
> 下面的 % 改成你的 ip , 密码 改成你数据库的密码.
	MariaDB> grant all privileges on zabbix.* to 'zabbix'@'%' identified by 'your_password';


- 导入数据库表结构:

	cd zabbix-2.4.5/
	//进入 解压出来的 源代码文件夹.
	# ls database/mysql/
	// 你会发现文件夹下面有三个文件. 把这 三个表 导入到数据库中就好了.
	# mysql -u zabbix -p zabbix \< database/mysql/schema.sql
	# mysql -u zabbix -p zabbix \< database/mysql/images.sql
	# mysql -u zabbix -p zabbix \< database/mysql/data.sql



##### 十: 配置 Apache Web

	rm /var/www/html/index.html15.
	//先把 原理 Apache 默认的网页删掉
	cp -rf frontends/php/* /var/www/html/
	//替换成 Zabbix 3 源代码里 frontends/php/ 面的文件.
	
	
	
	usermod -aG www-data zabbix 
	// -aG 把用户加到额外的组(一人能有好几个组的)
	a2enmod ssl
	//a2enmod  属于apache2.2-common包下的一个工具 允许你配置apache的一个模块，启用或者禁用。
	//这里 是启用 ssl (一种安全协议 互联网通信用的 已过时.)
	a2ensite default-ssl
	systemctl restart apache2.servic
	//重启 Apache 服务.


##### 十一: 配置 Zabbix-Server

编辑 服务端的配置文件: 
	vi /usr/local/etc/zabbix_server.conf
改成如下值.
	ListenPort=10051
	LogFile=/var/log/zabbix_server.log
	DBHost=localhost      ## 如果数据库不在本机: localhost 换成数据库服务器的 IP.
	DBName=zabbix         ## 数据库名称
	DBUser =zabbix        ## 数据库用户名
	DBPassword=password   ## 第二步的数据库密码
	DBSocket=/var/run/mysqld/mysqld.sock
	DBPort=3306


- 创建数据库日志文件 并 给与权限.
	touch /var/log/zabbix\_server.log
	chmod 775 /var/log/zabbix\_server.log
	chgrp zabbix /var/log/zabbix\_server.log
	//改变文件的 群组属性.



启动服务!

	/usr/local/sbin/zabbix_server
	/usr/local/sbin/zabbix_agentd
	/usr/local/sbin/zabbix_agent
用下面命令 查看 服务是否启动成功.
	netstat -tulpn



##### 十二: 安装 Web 前端页面接口
任意电脑 打开浏览器 输入 Zabbix-Server 的 IP
	http://服务器 IP 地址/setup.php  /或者/  https://服务器 IP 地址/setup.php
本文: 0219.oicp.net/setup.php

然后就能看的 Zabbix 的 网页配置界面了 ! 激动 兴奋 啊....

总有6步:
- 第二步: 最好全部 是 OK.
- 第三步: 数据库设置
	选择数据库类型 这里选 MySQL
	数据库 IP // 选默认 Localhost 或者 数据库在别的服务器. 就填IP
	数据库 名称   zabbix
	数据库 用户名 zabbix
	数据库 密码   xujian
- 第四步: Zabbix Server 配置
	Host:Localhost
	Port:10051
	Name:zabbix


	chown -R www-data /var/www/html/conf/   
	//第五步之前 要 允许 Apache 有写入配置的权限.

- 然后 下一步 下一步  直到 Finish

Finsh 完成之后  还要 给 root 某些权限.
	chown -R root /var/www/html/conf/

之后就能用下面的 账号密码 登录了
	0214.help/index.php
	Username: admin
	Password: zabbix

这下 就能进 Web 界面了.

##### 十三: 开机启动
编辑这个文件
	vi /etc/rc.local
把下面三行 加到 exit 0 (尾行)   上面就行.
	/usr/local/sbin/zabbix_agentd
	/usr/local/sbin/zabbix_agent
	/usr/local/sbin/zabbix_server

接下去就是 去被监控的电脑 安装客户端了. 安装好客户端再回来配置下 Web 界面就好了



##### 十四 : 客户端配置 Debian8 (被监控的电脑上安装)
[客户端教程链接][11]

- 创建运行账号
	useradd zabbix -s /sbin/nologin

- 安装依赖
	apt-get install -y gcc curl


- 下载+解压+编译安装 agent

	cd /tmp

	wget http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.0.1 zabbix-3.0.1.tar.gz


- 解压 tar -xf 压缩包
-x 意思是解压  / f 参数必须. 记住就行.

- 编译
	./configure --prefix=/usr/local/zabbix   --enable-agent
	//prefix 配置安装位置
	//—enable-agent  只安装 agent !!


- 配置客户端
	vi /usr/local/zabbix/etc/zabbix\_agentd.conf

	Server=0219.oicp.net            #被动模式，允许哪台zabbix服务器可以连接.
	ServerActive=0219.oicp.net      #主动模式，允许向哪台zabbix服务器上报.
	Hostname=0214.help              #客户端本机IP，如有DNS解析可填主机名
	UnsafeUserParameters=1          #允许用户自定义参数  278行
	EnableRemoteCommands=1          #允许执行远程命令   69行

- 创建init服务  未测试!!!!!  
	  
	cp misc/init.d/fedora/core/zabbix\_\* /etc/init.d
	sed -i 's/BASEDIR=\/usr\/local/BASEDIR=\/usr\/local\/zabbix/g' /etc/init.d/zabbix\_agentd

- 设置开机自启动   未测试 !!!!!  

	chkconfig zabbix\_agentd on
	service zabbix\_agentd start



##### 十五: 回去配置 Zabbix Web 界面.

configuration → Hosts → Create host
Hostname : 被监控 ip
visiblename:  被监控 ip
Group 右边随便选一个? 大概就是 你有很多服务器要监控 .可以给这些服务器 分组.
Agent interfaces  ip DNS port 如实填写.
→ ADD

然后 Temple 模板 选择一个?  被监控的是什么系统的 就选什么吧....

[http://miclesvic.blog.51cto.com/2152735/1136222][12]    ?? 教程 … 



自带很多模板  添加这些模板 就能实现很多功能了.



##### 服务器重启之后:
要开启 Apache  Server 等 才能登录WEB管理界面

sudo systemctl restart apache2.service


	http://0219.oicp.net/zabbix.php?action=dashboard.view
	登录网址



















































































































































---- --
## Zabbix - Mac OS

MySQL 版本: 
	mysql --version

PHP 版本:
	php --v

Apache 版本:
	httpd --v



Zabbix-Server:

下载 解压 编译 安装.

这里不能用默认编译. 因为还要开启一些额外的功能.

	./configure --enable-server --enable-agent --with-mysql --with-net-snmp --with-libcurl --with-libxml2 --prefix=$$HOME/Library/Zabbix


3. Set up the database
Create a new database user. Choose a database user password. I chose al9a0941h9.
$ /Library/PostgreSQL/8.3/bin/createuser zabbix --no-superuser
--createdb --no-createrole --pwprompt -U postgres
Enter password for new role: \<database user password\>
Enter it again: \<database user password\>
Password: \<superuser password\>
4. Create a new database
$ /Library/PostgreSQL/8.3/bin/createdb zabbix -U zabbix -W
Password: \<database user password\>
Populate the database with tables and data...
$ cat create/schema/postgresql.sql | /Library/PostgreSQL/8.3/bin/psql -U zabbix -W
Password for user zabbix: \<database user password\>
...
$ cat create/data/data.sql | /Library/PostgreSQL/8.3/bin/psql -U zabbix -W
Password for user zabbix: \<database user password\>
...
$ cat create/data/images\_pgsql.sql | /Library/PostgreSQL/8.3/bin/psql -U zabbix -W
Password for user zabbix: \<database user password\>
...




5. Configure the zabbix server
$ mkdir /Library/Zabbix/etc
$ cp misc/conf/zabbix\_server.conf /Library/Zabbix/etc/
Edit /Library/Zabbix/etc/zabbixserver.conf. Leave everything as default, but change the following two values...
DBUser=zabbix
DBPassword=al9a0941h9
Start the zabbix server...
./zabbix\_server --config=$$HOME/Library/Zabbix/etc/zabbix\_server.conf
6. Install & Configure MAMP
MAMP is the quickest way to get a full-blown Apache up and running with PHP5. Download it here and install the regular (non-pro) version.
Configure PHP by editing /Applications/MAMP/conf/php5/php.ini. Change...
max\_execution\_time = 300
Then go to the bottom of the file and add your timezone
date.timezone = America/Vancouver
Install the Zabbix front-end so MAMP can serve it
$ mv frontends/php /Library/Zabbix/frontend
$ ln -s /Library/Zabbix/frontend /Applications/MAMP/htdocs/zabbix




7. Launch MAMP & Configure Zabbix front-end
Double-click the main MAMP application and see that the servers start up.
Navigate to http://localhost:8888/zabbix/
Go through the configuration screens.
On the database screen, choose PostgreSQL, set the username to "zabbix" and the password to whatever database user password you chose.
On the zabbix server details screen, set the port to 8888.
You can now log on in with the username/password of Admin/zabbix
Notes on Security
This is a test installation on my home network, so I've foregone best practices for security and reliability. If you are relying on this zabbix installation for a production environment, you should consider taking some precautions...
▪ PostgreSQL and Zabbix should both run as separate users
▪ Zabbix should be started at boot via launchd
▪ In order for launchd to monitor Zabbix, the zabbix\_server process should not background itself. I don't think this is currently possible without changing the server's source code.
▪ Don't use MAMP for a production service. Configure Apache and PHP properly to start up at boot and run as a separate user.












---- 

## Zabbix 客户端 WinServer 2008

官网下载  Win 全系列 通用包.

解压. 出来  两个文件夹: Bin + conf 

bin 文件夹 选择相应的系统版本 . 
相应版本下的 文件夹. ,移动到C:Program Files  zabbix\_agent目录下
这个目录得自己手动先建立



4.选择conf文件夹下
zabbix\_agentd.win.conf配置文件，修改为「zabbix\_agentd.conf」。

并移动到C:Program Fileszabbix\_agent win64目录下
 然后下载 notepad++  编辑这个文件



LogFile=c:zabbix\_agentd.log
LogFile=C:Program Fileszabbix\_agentwin64zabbix\_agentd.log  # 此处为agent的log文件存放地址。
Server=127.0.0.1
Server=X.X.X.X        # 此处为zabbix服务器IP。
Hostname=Windows host
Hostname=Windows2008    # 此处修改主机名。




## 极品教程

[http://www.tecmint.com/install-and-configure-zabbix-monitoring-on-debian-centos-rhel/2/][13]





最后一步

不能写入文件 
可以wget下载  然后放到指定位置.

下载后要改名. 

或者直接新建文件 内容粘帖进去  然后给777 权限   再本地浏览器刷新  就 ok 了


时区设置   不然 web 界面会红色报错.
date.timezone = Asia/Chongqing 



界面是能 换成中文的 
可能要 被监控那里 下载中文语言包


 收集不到数据.??  



## 依赖环境

- Apache —————— 用网页显示服务器状态.
- PHP———————— 编程语言. Apache 用到.
- MySQL———————保存收集到的数据.
- Zabbix Server  ——— 监控+收集信息 .
- Zabbix Agent ———— 只有收集信息.

> 通常: 这四个角色 可以安装在一台电脑.
> Apache / PHP / MySQL 版本越新越好.


其他环境:

OpenIPMI、libssh2、fping、libcurl、libiksemel、net-snmp




## 基本环境配置

	yum install gcc gcc-c++ make openssl-devel curl wget net-snmp net-snmp-utils net-snmp-libs net-snmp-devel gnutls gnutls-devel libxml2 libxml2-devel






















[1]:	http://www.zabbix.com/
[2]:	http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/3.0.1/zabbix-3.0.1.tar.gz
[3]:	https://curl.haxx.se/
[4]:	http://www.tecmint.com/install-and-configure-zabbix-monitoring-on-debian-centos-rhel/
[10]:	http://php.net/manual/en/timezones.php
[11]:	http://www.kar-chan.com/?p=2541
[12]:	http://miclesvic.blog.51cto.com/2152735/1136222
[13]:	http://www.tecmint.com/install-and-configure-zabbix-monitoring-on-debian-centos-rhel/2/