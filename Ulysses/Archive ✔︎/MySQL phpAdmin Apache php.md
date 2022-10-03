## MySQL phpAdmin Apache php
简介:  
[MySQL][1]:  数据库
[phpMyAdmin][2]: 通过浏览器管理网络上的数据库。 必须安装在 web 服务器中,也就是必须启用 Apache
MySQL Workbench : 数据库管理(mysql专用/也能远程管理.)  分社区版 和 商业版
[Apache][3]: web 服务器
[php][4]: 脚本语言  主要用于创建动态网页.

# Apache  
|命令|作用|
|:---:|:---:|
|查看版本|Apachectl -v|
|启动服务|sudo Apachectl start|
|重启服务|sudo Apachectl restart|

开启 php :
编辑php配置文件 →169行 → 取消注释.
sudo vim /etc/apache2/http.conf

选做!!!    Listen 80 改成 Listen 8888    #這樣就可以和powder分開，不會彼此衝突。      



# phpMyAdmin 
- 官网下载压缩包 → 解压 → 文件夹重命名: phpmyadmin → 移到 /资源库/webserber/Documents/ 下
- 设置phpmyadmin:
	- config.sample.inc.php 重命名改成 config.inc.php,
	- 编辑这个文件  31行末尾   ‘localhost’ 改成 ’127.0.0.1′
	- 浏览器打开 http://localhost/phpmyadmin

使用方法: 登陆界面 → 选择语言 → MySQL的 用户名 / 密码         
   


远程设置:
修改PHPMyadmin目录下libraries/config.default.php，
830行:   AllowArbitraryServer，后面=号的false 改为true。


# MySQL

- Mac [.dmg安装包下载链接][5]

- 启动 MYSQL: 二选一
	- 系列偏好设置 → MySQL → 启动服务
	- sudo /usr/local/mysql/support-files/mysql.server start

- 终端登陆MySQL:
	- /usr/local/mysql/bin/mysql  
	- /usr/local/mysql/bin/mysql -u root -p 
	- 快捷登陆设置:只要输入;mysql就能登陆 mysql了.  
		键盘映射软件 → ;mysql 映射到 /usr/local/mysql/bin/mysql
- 终端退出MySQL: \q   



### Debian 安装 Mysql 数据库
- apt-get install mysql-server mysql-client  
- 设置 root 密码  空格.  
- mysql-server是服务器程序  
- mysql-client是客户端程序
- 登陆 mysql:  
	mysql -u root -p   ( -p 是要求输密码的意思. )
- 这个命令也能查 mysql 版本的.  
	mysql\>  出现这个就说明成功进去了.  

查看 mysql 版本




##### MySQL的几个重要目录
　　MySQL的数据库文件、配置文件和命令文件分别在不同的目录. 　　  
　　- 数据库目录    /var/lib/mysql/  
　　- 配置文件　/usr/share/mysql（mysql.server命令及配置文件）
　　\- 相关命令 /usr/bin(mysqladmin mysqldump等命令)  
　　- 启动脚本 /etc/rc.d/init.d/（启动脚本文件mysql的目录）
##### 修改登录密码  
- 命令 usr/bin/mysqladmin -u root password 'new-password'  
- 格式：mysqladmin -u用户名 -p旧密码 password 新密码  

	- 例:   给root加密码123456  
[root@test1 local]()\# /usr/bin/mysqladmin -u root password 123456  
注：因为开始时root没有密码，所以-p可以省略。  

	- 测试是否修改成功  
	[root@test1 local]()\# mysql -u root -p   
	Enter password: (输入修改后的密码123456)

##### 自动启动
- 察看mysql是否在自动启动列表中  
	[root@test1 local]()\#　/sbin/chkconfig –list  
	PS:系统默认是没有chkconfig这个命令的,需要自己安装,debian下安装很简单,有apt源.

- 把MySQL添加到你系统的启动服务组里面去  
	[root@test1 local]()\#　/sbin/chkconfig　– add　mysql
- 把MySQL从启动服务组里面删除。  
	[root@test1 local]()\#　/sbin/chkconfig　– del　mysql




## MySQL 常用操作
　　注意：MySQL中每个命令后都要以分号；结尾。  
　　　
# MySQL

	mysql> show databases;
	+----------+
	| Database |  
	+----------+
	| mysql　　| 
	| test　　 |
	+----------+　
- Mysql刚安装完有两个数据库：mysql和test。
- Mysql库非常重要，它里面有MySQL的系统信息  
	我们改密码和新增用户，实际上就是在这个库中进行操作。

###### 显示数据库中的表  

	mysql\> use mysql; （选择要使用的库）  
	mysql\> show tables;
	+-----------------+
	| Tables\_in\_mysql |
	+-----------------+
	| columns\_priv　　|
	| db　　　　　　　|
	| func　　　　　　|
	| host　　　　　　|
	| tables\_priv  |
	| user　　　　　　|
	+-----------------+
　　
##### 显示数据表的结构:
　　describe 表名;
　　显示表中的记录:  
　　select \* from 表名;  
　　例如：显示mysql库中user表中的纪录。(MySQL用户都在此表中)  
　　Select \* from user;  
- 建库： 
　　create database 库名; 
　　例如：创建一个名字位aaa的库
　　mysql\> create databases aaa;

6、建表： 
　　use 库名； 
　　create table 表名 (字段设定列表)；
　　例如：在刚创建的aaa库中建立表name,表中有id(序号，自动增长)，xm（姓名）,xb（性别）,csny（出身年月）四个字段
　　use aaa;
　　mysql\> create table name (id int(3) auto\_increment not null primary key, xm char(8),xb char(2),csny date);
　　可以用describe命令察看刚建立的表结构。
　　mysql\> describe name;
　　+-------+---------+------+-----+---------+----------------+
　　| Field | Type　　| Null | Key | Default | Extra　　　　　|
　　+-------+---------+------+-----+---------+----------------+
　　| id　　| int(3)　|　　　| PRI | NULL　　| auto\_increment |
　　| xm　　| char(8) | YES　|　　 | NULL　　|　　　　　　　　|
　　| xb　　| char(2) | YES　|　　 | NULL　　|　　　　　　　　|
　　| csny　| date　　| YES　|　　 | NULL　　|　　　　　　　　|
　　+-------+---------+------+-----+---------+----------------+
　
　　7、增加记录
　　例如：增加几条相关纪录。
　　mysql\> insert into name values('','张三','男','1971-10-01');
　　mysql\> insert into name values('','白云','女','1972-05-20');
　　可用select命令来验证结果。
　　mysql\> select \* from name;
　　+----+------+------+------------+
　　| id | xm　 | xb　 | csny　　　 |
　　+----+------+------+------------+
　　|　1 | 张三 | 男　 | 1971-10-01 |
　　|　2 | 白云 | 女　 | 1972-05-20 |
　　+----+------+------+------------+
　　8、修改纪录
　　例如：将张三的出生年月改为1971-01-10
　　mysql\> update name set csny='1971-01-10' where xm='张三';
　　9、删除纪录
　　例如：删除张三的纪录。
　　mysql\> delete from name where xm='张三';
　　10、删库和删表 
　　drop database 库名; 
　　drop table 表名；
　　九、增加MySQL用户
　　格式：grant select on 数据库.\* to 用户名@登录主机 identified by "密码" 
例1、增加一个用户user\_1密码为123，让他可以在任何主机上登录，并对所有数据库有查询、插入、修改、删除的权限。首先用以root用户连入MySQL，然后键入以下命令：
　　mysql\> grant select,insert,update,delete on *.* to user\_1@"%" Identified by "123"; 
例1增加的用户是十分危险的，如果知道了user\_1的密码，那么他就可以在网上的任何一台电脑上登录你的MySQL数据库并对你的数据为所欲为了，解决办法见例2。
　　例2、增加一个用户user\_2密码为123,让此用户只可以在localhost上登录，并可以对数据库aaa进行查询、插入、修改、删除的 操作（localhost指本地主机，即MySQL数据库所在的那台主机），这样用户即使用知道user\_2的密码，他也无法从网上直接访问数据库，只能 通过MYSQL主机来操作aaa库。
　　mysql\>grant select,insert,update,delete on aaa.\* to user\_2@localhost identified by "123";
　　用新增的用户如果登录不了MySQL，在登录时用如下命令：
　　mysql -u user\_1 -p　-h 192.168.113.50　（-h后跟的是要登录主机的ip地址）
我们知道，在ms sql server中或access中，  
若要查询前10条记录，使用top 10即可，  
但在mysql中 不支持这个写法，它用limit 10。   
  
我们可以利用MySQL中 SELECT支持的一个子句——LIMIT——来完成这项功能。   
LIMIT可以实现top N查询，也可以实现M至N（某一段）的记录查询，具体语法如下：   
SELECT * FROM MYTABLE  
ORDER BY AFIELD   
LIMIT offset, recnum  
其中offset为从第几条（M+1）记录开始，recnum为返回的记录条数。例：   
select * from mytable  
order by afield   
limit 2, 5   
即意为从第3条记录开始的5条记录。
　　
　　
十一. 常见问题：
1."Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' "错误
解决方法：
这是没启动mysql的守护进程，执行service mysqld start就行了
 
 

[1]:	http://www.mysql.com
[2]:	https://www.phpmyadmin.net
[3]:	http://www.apache.org
[4]:	https://secure.php.net
[5]:	http://dev.mysql.com/downloads/file.php?id=459287
