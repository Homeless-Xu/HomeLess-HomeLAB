## MySQL php Apache php
  
|[MySQL][1] |  数据库软件  
|[phpMyAdmin][2] |  通过浏览器管理网络上的数据库。  
| MySQL Workbench | 数据库管理(mysql专用/可远程管理.) 
| [Apache][3] |  web 服务器
| [php][4] |  脚本语言  主要用于创建动态网页.

---- 

 

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




MySQL:

# 修改登录密码  
mysqladmin -u root password newpassword
　　　
# 显示数据库  
show databases;  

# 显示表  
use mysql; （先选择要使用的数据库）  
  show tables; (显示数据库中的表)
　　
# 显示表内容

select \* from user

# 新建数据库
create database xujian; 

# 新建表结构框架
- 比如 明珠医院 护士联系表
	- 只建立 工号 姓名 性别 学位  数据类型/长度 和默认值.
- create table 表名 (字段名 类型 数据宽度 是否为空 是否主键 自动增加 默认值)  
	    create table mzyy (  
	    \>id int(4) not null primary key auto\_increment,
		>name char(20) not null,
		>sex int(4) not null default '0',
		>degree double(16,2));
		
		以上例子不能直接复制运行. 
		原因是这个命令实在太长了,为了书写好看 把它分成好几行了.
		终端里你 可以用 \+回车键 来另起一行 而不打断输入命令.

# 修改表结构 ( 增加,删除,修改字段 )
- 添加字段:
		格式: alter table 表名 add 字段 类型 其他;  
		
		例: alter table mzyy add phone int(4) not null;
- 删除字段:
		格式: alter table 表名 drop index phone;
  
- 修改字段:  
	    格式: alter table 表名 chande 原名 新名 类型;
		例子

# 查看表结构
	mysql\> describe mzyy;
　
　
# 插入表格内容
- 新加内容: insert into 表格名 values('字段1','字段2','字段3','字段4');

- insert into mzyy values('219','xujian','男','1971-10-01');


# 删除表内容: delete from table 表格名 where id=1;

# 　修改表内容   update
　　例如：将张三的出生年月改为1971-01-10
　　mysql\> update name set csny='1971-01-10' where xm='张三';
　　
# 　　　删库和删表 
　　drop database 库名; 
　　drop table 表名；
　　
# 　　增加MySQL用户
　　格式：grant select on 数据库.\* to 用户名@登录主机 identified by "密码" 

  
# 查询前10条记录，  
但在mysql中 不支持这个写法，它用limit 10。   

十一. 常见问题：
1."Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' "错误
解决方法：
这是没启动mysql的守护进程，执行service mysqld start就行了
 




SQL server


能做什么？
SQL 数据查询   插入/删除/更新 数据

创建 新数据库/表
设置表、存储过程和视图的权限

SQL 可在数据库中创建存储过程
SQL 可在数据库中创建视图 


SQL有很多版本，但是 主要的关键词
比如 SELECT、UPDATE、DELETE、INSERT、WHERE 等等是通用的.
对大小写不敏感

## SELECT - 从数据库表中获取数据
## UPDATE - 更新数据库表中的数据
## DELETE - 从数据库表中删除数据
## INSERT INTO - 向数据库表中插入数据

## CREATE DATABASE - 创建新数据库
## ALTER DATABASE - 修改数据库
## CREATE TABLE - 创建新表
## ALTER TABLE - 变更（改变）数据库表
## DROP TABLE - 删除表
## CREATE INDEX - 创建索引（搜索键）
## DROP INDEX - 删除索引


从表中选择一列数据的内容
select name form company;
读取表里面所有内容
select \* from company



update delete insert 
select \* from table limit10/top10


mysqladmin root password xujian


显示前五行数据

select top 5 \* from icd10

更新数据 

某行某列 (直接修改 并应用)

格式 update 表格 set 要修改字段 = ‘新内容’ where 哪行 = ‘行号’
update icd10 set icd = ‘a09.90’ 
where icdname = ‘哮喘’

某行多列
update icd10 set icd = ‘a09.90’ , icdnumber = ’20’ 
where icdname = ‘哮喘’

删除某行号
delete from icd10 where 序号 = 100




插入数据

insert into ICD10 VALUES (100, 'A04.904', '实物', NULL, 'sw', 100)

数据 不用加’’   那个空值 NULL 也不用加’’

倒序查询.
select top 100 \* from ICD10 order by RecordID desc

注释行 # 









[1]:	http://www.mysql.com
[2]:	https://www.phpmyadmin.net
[3]:	http://www.apache.org
[4]:	https://secure.php.net