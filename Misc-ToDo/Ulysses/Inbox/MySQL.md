## MySQL


#### 远程登录 Mysql

	Mac OS 平台:
- 推荐软件: navicat premium 
	- 新建连接  
	- 设置 常规:
		- mysql 的用户名 和  密码
	- 设置 ssh
		- 使用 ssh 通道 打钩
		- 主机名 写 vps 的 ip
		- 端口 默认22, 或者填你修改后的 ssh 端口号
		- 用户名 vps 的登录账号和密码.

---- 


### MySQL 重要目录　  

|文件|目录|解释|  
|:---:|:---:|:---:|  
| 数据库文件 | /var/lib/mysql/   |  
| 配置文件　 | /usr/share/mysql  |（mysql.server命令及配置文件）
| 相关命令   | /usr/bin          | (mysqladmin mysqldump等命令)  
| 启动脚本   | /etc/rc.d/init.d/ |（启动脚本文件mysql的目录）


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
	**注意：MySQL中每个命令后都要以分号；结尾。 ** 　　　　
### 显示数据库  

	    mysql> show databases;  
> - Mysql 自带有几个数据库
- Mysql库非常重要，它里面有MySQL的系统信息  
	我们改密码和新增用户，实际上就是在这个库中进行操作。

### 显示数据库表  

	mysql\> use mysql; （先选择要使用的数据库）  
	mysql\> show tables; (显示数据库中的表)
　　
### 显示数据表内容

	显示表内容:  select * from 表名;  
	
	    例：显示 mysql库 中 user表 的内容。(MySQL用户都在此表中)  
	
	    Select * from user; 　

### 新建数据库 
	    例：创建一个名字xujian 的数据库.
	
	        create database xujian; 


### 新建表结构.
- 只是帮你建一个表格框架,没有具体内容.
- 比如 明珠医院 护士联系表
	- 只建立 工号 姓名 性别 学位  数据类型/长度 和默认值. 
	- 不会有哪个护士的具体工号名字 什么的. 


- 命令格式 :
- create table 表名 (字段名 类型 数据宽度 是否为空 是否主键 自动增加 默认值)  
	    实例:
		create table mzyy (  
		>id int(4) not null primary key auto_increment,
		>name char(20) not null,
		>sex int(4) not null default '0',
		>degree double(16,2));
		
		以上例子不能直接复制运行. 
		原因是这个命令实在太长了,为了书写好看 把它分成好几行了.
		终端里你 可以用 \+回车键 来另起一行 而不打断输入命令.

### 修改表结构 ( 增加,删除,修改字段 )
- 添加字段:
		格式: alter table 表名 add 字段 类型 其他;  
		
		例: alter table mzyy add phone int(4) not null;
- 删除字段:
		格式: alter table 表名 drop index phone;
  
- 修改字段:  
	    格式: alter table 表名 chande 原名 新名 类型;
		例子

### 查看表结构
	mysql\> describe mzyy;
	
	
	+-------+---------------+-----+---------+----------------+
	| Field |       Type    | Null | Key | Default | Extra　　　|
	+-------+---------------+-----+---------+----------------+
	| id　　 | int(4)　      |　NO　| PRI | NULL　　| auto_increment |
	| name　 | char(20)     |  NO　|　　 | NULL　　 |　　　　　　　　|
	| sex　  | int(4)       |  NO　|　　 | 0    　　|　　　　　　　　|
	| degree | double(16,2) | YES　|　　 | NULL　　 |　　　　　　　　|
	+-------+---------------+-----+---------+----------------+
　
　
#### 表格内容
- 新加内容: insert into 表格名 values('字段1','字段2','字段3','字段4');

- insert into mzyy values('219','xujian','男','1971-10-01');





- 删除内容: delete from table 表格名 where id=1;









## 数据类型:

整数运算速度快 占内存少. 比较实用.  比如 123

包含小数点  要用 single double currency



| 数据类型 | 大小 <br> (字节) | 精度范围 |
|:---:|:---:|:---:|
|varchar||汉字用这个|
| Byte <br> 字节型 | 1 | 0-255 |
| Boolean <br> 布尔型/逻辑型 | 2 | True 或 False |
| Integer <br> 整数型 | 2 | -32,768 到 32767 |
| Long <br> 长整型 | 4 | -2,147,483,648 \~ 2,147,483,647 |
| Single <br> 单精度浮点型 | 4 | 负数范围:-3.402823E38 \~ -1.401298E-45 <br> 正数范围:1.401298E-45 \~ 3.402823E38 |  
| Double <br> 双精度浮点型 | 8 |负数范围: <br> -1.797,693,134,862,32E308 \~-4.940,656,458,412,47E-324<br>正数范围: <br> 4.940,656,458,412,47E-324 \~1.797,693,134,862,32E308  |
| Currency <br> 货币类型 | 8 |  -922,337,203,685,477.5808 \~ 922,337,203,685,477.5807|
| Date <br> 日期型 | 8 | 100年1月1日\~9999年12月31日 |















　
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
 



## MySQL - Mac OS


Mac OS 安装 + 登录
 -  [.dmg安装包下载链接][5]

- 启动 MYSQL: 二选一
	- 系列偏好设置 → MySQL → 启动服务
	- sudo /usr/local/mysql/support-files/mysql.server start

- 终端登陆 MySQL:

	/usr/local/mysql/bin/mysql  
	/usr/local/mysql/bin/mysql -u root -p 

- 快捷登陆: 
	  只要输入;mysql就能登陆 mysql了.  
	键盘映射软件 → ;mysql 映射到 /usr/local/mysql/bin/mysql

- 终端退出MySQL: \q   




一.安装mysql 

1.mysql下载地址http://dev.mysql.com/downloads/mysql/
下载相应的  mysql-5.6.10-osx10.7-x86\_64.dmg安装包； 

2.安装软件包位于硬盘映象(.dmg)文件中，必须首先双击搜索起中的图标来安装该文件。



注释：在继续安装前，一定要使用MySQL管理器应用程序(在Mac OS X服务器上)或通过命令行的mysqladmin shutdown关闭所有运行MySQL服务器实例。 

MySQL的Mac OS X PKG安装到/usr/local/mysql-VERSION，
并且还会安装一个符号连接，/usr/local/mysql，指向新的位置。
如果有/usr/local/mysql目录，首先将它改名为/usr/local/mysql.bak。
安装完后，安装器执行mysql\_install\_db在MySQL数据库中创建授权表。



## MySQL- 卸载
如果之前装过 mariadb 的.

V/ 下面的  mariadb 删掉!!!!




## MySQL - Debian
#### Debian: 安装登录

- 安装 Mysql
	apt-get install mysql-server mysql-client  
	> 安装过程 要求设置 root 密码   自行设置(这里使用空格).
> mysql-server是服务器程序
> mysql-client是客户端程序

- 登陆 mysql:
	mysql -u root -p  
- 输入你设置的 root 密码就能登进去了  
- -p 是要求输密码的意思.
- 这个命令也能查 mysql 版本的.  
- mysql\>  出现这个就说明成功进去了.  




[5]:	http://dev.mysql.com/downloads/file.php?id=459287