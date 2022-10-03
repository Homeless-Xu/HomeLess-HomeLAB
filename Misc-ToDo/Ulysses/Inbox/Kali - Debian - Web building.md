## Kali / Debian - Web building

**环境要求:** Apache + PHP + Mysql
> 一般三个都是自带的.只要配置下就可以用了.
> 可以查看版本信息来判断有没有安装  `apache -v`/`apache2 -v`  `php -v`  `mysql -V`
> 没有的话: 
> apt-get install apache2
> apt-get install mysql-server mysql-client 
> PHP服务 是不需要启动的!!  只要配置好就可以的.



1. 启动Apache服务. 
	2. 写个最简单的 xx.html xx.php 
		放到: /var/www/html/ 文件夹下 (**必须放在这个文件夹下**)
		3. 浏览器 http://210.22.92.254/xx.php 就能看到 php 网页了.

### Kali Apache 配置

**主配置文件** /etc/apache2/apache2.conf

*service apache2 status / start / stop / restart*

Default Web Page:
别的电脑网页 输入 172.19.16.169:80 能看到默认页面了.说明 apache 正确安装了.
> 前提是 要启动 apache 服务啊.

**默认网页位置:** `/var/www/html/index.html`
`vi index.html` 文件 就可以把网址改成你自己想要的了.

> 默认页面 有很多有用的东西的 建议仔细看看.




### Kali PHP

PHP 不需要启动!!!!!
`/var/www/html` 目录 放 xx.php 文件就可以用 http://127.0.0.1/xx.php 来访问.


1. 首先  写个 php 文件
	2. `vi /var/www/info.php`
		<?php
		phpinfo()
		?>

	3. 浏览器:  http://172.19.16.169/info.php  就能看的 php 的网页界面了.


### Apache + PHP
Apache 是否能识别 PHP 引擎.
进入 php 信息页 (info.php  内容是 phpinfo() 这个的 php 脚本.)
可以看到 是否 支持 PHP / Mysql / IPv6 等等
还有 Document Root 的路径  这个就是你网页放的路径!!!!!




### kali Mysql / Debian Mysql

**启用远程访问数据库: 3306
> 默认不能远程连接数据库的. 
`vi /etc/mysql/mysql.conf.d/mysqld.cnf`
将bind-address = 127.0.0.1注销


**启动服务**
`service mysql status / start / stop / restart `

**开机启动 Mysql
 `vi /etc/rc.local`  → 加入启动 mysql的命令: `service mysql start`

**进入 Mysql
1. root 没有密码:
	`mysql -u root` 就能进入 mysql 控制面板了.

	2. root 有密码:
		`mysql -u root -p`  ↵ → 输入密码

**Mysql 使用**

`use mysql;`          选择一个数据库
`show tables;`        显示表.
`select * ftom user;` 显示表内容.





---- -------
 环境都搭好了 然后就写网页了..

