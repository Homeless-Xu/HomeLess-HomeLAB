
## MySQL - Mac


\*install: `brew install mysql` or  [下载.dmg安装包][1]


*启动 MYSQL:* 二选一
- 系列偏好设置 → MySQL → 启动服务
	- sudo /usr/local/mysql/support-files/mysql.server start

*终端登陆 MySQL:*

`/usr/local/mysql/bin/mysql`  
`/usr/local/mysql/bin/mysql -u root -p`

- 快捷登陆: 
	  只要输入;mysql就能登陆 mysql了.  
	键盘映射软件 → ;mysql 映射到 /usr/local/mysql/bin/mysql

- 终端退出MySQL: q   

\*MySQL- uninstall
如果之前装过 mariadb 的.
V/ 下面的  mariadb 删掉!!!!


[1]:	http://dev.mysql.com/downloads/file.php?id=459287