

## FreeRADIUS

官网 :  [http://freeradius.org][1]

debian 7 下教程:
[https://ttboa.wordpress.com/2014/09/26/freeradius-on-debian-7/][2]

服务器: Debian 8:

安装freeradius:     sudo apt-get install freeradius

开启测试账号密码:(用完后 记得删掉.) 
vim /etc/freeradius/users
76-84 行 前的# 去掉.

testuser Cleartext-Password := "testpassword"

重启服务   service freeradius restart

查看服务状态:  service freeradius status

进行测试
radtest steve testing localhost 0 testing123



如果看到Access-Accept就说明连接成功了。
连接失败
radtest testuser testpassword localhost 0 testing123
radclient: no response from server for ID 25 socket 3










5. 下载ppp源码，因为要用到其中的配置文件：

	1   # wget ftp://ftp.samba.org/pub/ppp/ppp-2.4.5.tar.gz
	2   # tar zxvf ppp-2.4.5.tar.gz
	3   # cp -R /root/ppp-2.4.5/pppd/plugins/radius/etc/ /usr/local/etc/radiusclient
6. 编辑/usr/local/etc/radiusclient/servers，加上一组服务器和密钥，本例中为“MyVPN”： IT网，http://www.it.net.cn
	1   # vim /usr/local/etc/radiusclient/servers
	2   localhost MyVPN
7. 编辑/usr/local/etc/radiusclient/dictionary，将最后一行改为：

INCLUDE /usr/local/etc/radiusclient/dictionary.microsoft IT网，http://www.it.net.cn
可以再添加一行：
INCLUDE /usr/local/etc/radiusclient/dictionary.merit IT网，http://www.it.net.cn
1   # vim /usr/local/etc/radiusclient/dictionary
2   INCLUDE /usr/local/etc/radiusclient/dictionary.microsoft
3   INCLUDE /usr/local/etc/radiusclient/dictionary.merit
8. 编辑/etc/raddb/clients.conf，把client localhost段下的secret改成刚才指定的密钥。 Linux学习，http:// linux.it.net.cn
9. 编辑/etc/raddb/radiusd.conf，找到$INCLUDE sql.conf，去掉前面的#；找到$INCLUDE sql/mysql/counter.conf，去掉前面的#。
10. 添加MySQL用户及数据库，你可以使用现成的phpMyAdmin等工具，也可以在终端下操作。本例中，创建了radius的用户和同名的数据库：

	1   # mysql -uroot -p
	2   (如果有密码，请输入)
	3   \> CREATE USER 'radius'@'localhost' IDENTIFIED BY '\*\*\*';
	4   \> CREATE DATABASE IF NOT EXISTS `radius` ;
	5   \> GRANT ALL PRIVILEGES ON `radius` . \* TO 'radius'@'localhost';
11. 编辑/etc/raddb/sql.conf，配置login（用户名），password（密码），radius\_db（数据库名）等字段，并找到readclients一行，设为yes并去掉注释符号#。

12. 编辑/etc/raddb/sites-enabled/default，根据下面的说明注释或取消注释相应的行：

    authorize段，关掉files，打开sql，也可以把unix关掉
    preacct段，关掉files
    accounting段，打开sql，也可以把unix关掉
    session段，打开sql
    post-auth段，打开sql
    pre-proxy段，关掉files IT网，http://www.it.net.cn
到这一步，我们的FreeRADIUS就算配置好了，用户信息都将保存在MySQL数据库中。至于数据库中的表，我们在后面统一导入。
配置daloRADIUS

13. 首先下载并安装daloRADIUS，其中需要安装一个Pear-DB的包：
	1   # wget http://sourceforge.net/projects/daloradius/files/daloradius/daloradius-0.9-8/daloradius-0.9-8.tar.gz
	2   # pear install DB
	3   # mkdir /usr/share/daloRadius
	4   # tar zxvf daloradius-0.9-8.tar.gz
	5   # mv daloradius-0.9-8/\* /usr/share/daloRadius/
	6   # rm -r daloradius-0.9-8
14. 这时我们将daloRADIUS中附带的sql文件导入MySQL数据库，别忘了输入密码： Linux学习，http:// linux.it.net.cn
	1   # mysql -uroot -p radius \< /usr/share/daloRadius/contrib/db/fr2-mysql-daloradius-and-freeradius.sql
15. 编辑/usr/share/daloRadius/library/daloradius.conf.php，这是daloRADIUS的配置文件。首先是MySQL登录信息：
	1   # /usr/share/daloRadius/library/daloradius.conf.php
	2   $configValues['CONFIG\_DB\_HOST']() = 'localhost';
	3   $configValues['CONFIG\_DB\_USER']() = 'radius';
	4   $configValues['CONFIG\_DB\_PASS']() = '\*\*\*'; // 设为自己的密码
	5   $configValues['CONFIG\_DB\_NAME']() = 'radius';
下面有一个daloRADIUS的bug，默认配置中有一个表名和我们导入的不一样，把它改过来：
$configValues['CONFIG\_DB\_TBL\_RADUSERGROUP']() = 'radusergroup';
然后修改daloRADIUS的路径：
$configValues['CONFIG\_PATH\_DALO\_VARIABLE\_DATA']() = '/usr/share/daloRadius/var';

16. 添加Apache虚拟主机，如果有Web控制面板什么的自然就方便多了，不然就编辑/etc/httpd/conf/httpd.conf，加入： Linux学习，http:// linux.it.net.cn
	1   # vim /etc/httpd/conf/httpd.conf
	2   Alias /vpn "/usr/share/daloRadius/"
	3   \<Directory "/usr/share/daloRADIUS"\>
	4   \</Directory\>
17. 重启重启Apache和MySQL： Linux学习，http:// linux.it.net.cn
	1   # service httpd restart
	2   # service mysqld restart
18. 打开浏览器，进入daloRADIUS的管理页面（本例中为http://your.domain/vpn），使用默认用户名administrator和密码radius登录。
daloRADIUS似乎写的不怎么样，最新稳定版已经是三年之前的了，不过作者直到现在还在更新SVN，下次有机会可以用最新的SVN版本试试看。在Management中添加一个新用户，注意密码类型选择Cleartext-Password。 IT网，http://www.it.net.cn
19. 在终端里再次启动radius -X，同时在另一个终端中用radtest username password localhost 0 MyVPN测试一下，看看现在是不是还能正常接通，如果没问题就OK，让我们把这套系统接驳到PPP上。
配置pppd

20. 编辑/etc/ppp/options.pptpd，里面已经有许多配置选项了，我们要保证有下面的几行，如果没有就添加上去，为了保障用户登录的安全我们限制只使用MS-CHAPv2： IT网，http://www.it.net.cn
	1   # vim /etc/ppp/options.pptpd
	2   refuse-pap
	3   refuse-chap
	4   refuse-mschap
	5   require-mppe-128
	6   require-mschap-v2
	7    
	8   # 在配置文件最后加上3行：
	9       
	10  plugin radius.so
	11  plugin radattr.so
	12  radius-config-file /usr/local/etc/radiusclient/radiusclient.conf
启动服务

21. 一切完成后我们不需要使用debug模式启动radiusd了：
	1   # service radiusd start
22. 当然，我们可以把radiusd和pptpd设为开机启动服务：
	1   # chkconfig radiusd on
	2   # chkconfig pptpd on
至此，PPTP+FreeRADIUS+MySQL+daloRADIUS全部配置完毕，我们在本机上使用添加的用户名和密码拨入VPN，可以正常使用。在daloRADIUS中，还可以看到各个用户每次连接的时长，上传和下载的数据量统计等。daloRADIUS其他的使用方法，本文不再叙述。
文章来源于互联网，具体链接一时忘记未有记下。。。如下几点则为具体配置中所出现的问题及解决方法

1、执行第十三点时报如下错误：

pear not found

经谷歌，解决方法如下：

1   ＃ yum install php-pear
2   ＃ pear upgrade PEAR
2、daloRadius登录界面，用户名为administrator，没记错的话密码是radius。修改密码到config-\>Opeartors修改。 Linux学习，http:// linux.it.net.cn
3、MySQL错误：Database connection error Error Message: DB Error: extension not found
解决方法：

1   ＃ yum install php-mysql -y
4、无法连接MySQL：Database connection error Error Message: DB Error: connect failed

1   # vim /usr/share/daloRadius/library/daloradius.conf.php
2   # $configValues['CONFIG\_DB\_HOST']() = '127.0.0.1'; # 默认为 localhost
5、无法拨入，客户端报691错误： IT网，http://www.it.net.cn
1   ＃ vim /usr/local/etc/radiusclient/dictionary
2   #INCLUDE /etc/radiusclient/dictionary.microsoft
3   INCLUDE /usr/local/etc/radiusclient/dictionary.merit
4   INCLUDE /usr/local/etc/radiusclient/dictionary.microsoft
5   INCLUDE /usr/local/etc/radiusclient/dictionary.ascend
6   INCLUDE /usr/local/etc/radiusclient/dictionary.compat
 

PS：添加流量控制：

1、建立表格

1   \> INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Auth-Type',':=','Local');
2   \> INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Service-Type',':=','Framed-User');
3   \> INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Framed-IP-Address',':=','255.255.255.255');
4   \> INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Framed-IP-Netmask',':=','255.255.255.0');
5   \> INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Acct-Interim-Interval',':=','600');
6   \> INSERT INTO radgroupreply (groupname,attribute,op,VALUE) VALUES ('user','Max-Monthly-Traffic',':=','5368709120');
7   \> INSERT INTO radgroupcheck (groupname,attribute,op,VALUE) VALUES ('user','Simultaneous-Use',':=','1');
以上前四行不用改动，acct-interim-interval是计算流量的间隔（600秒），意味着每隔10分钟记录当前流量。倒数第二行是每月最大流量，这里是5G（单位是字节）。最后一行是允许同时连接数目。 IT网，http://www.it.net.cn
2、修改配置

1   # vim /etc/raddb/sql/mysql/dialup.conf
2   sql\_user\_name = "%%{Stripped-User-Name:-%%{User-Name:-none}}"
3   # 取消前面的注释并注释下一行
4   # 同时如果需要打开simultanoues-use（控制同时在线用户数）的话需要把simul\_query\_check取消注释。
3、输入测试用户信息：
1   \> INSERT INTO radcheck (username,attribute,op,VALUE) VALUES ('test','Cleartext-Password',':=','test');
2   \> INSERT INTO radusergroup (username,groupname) VALUES ('test','user');
(用户名与密码必须以明文/NTLM Crypt形式保存，因为MS-CHAPv2不支持MD5保存的密码。) IT网，http://www.it.net.cn
4、由于上步中有非内置的attribute Max-Monthly-Traffic，所以需要在/usr/local/etc/raddb/dictionary里面定义：

ATTRIBUTE Max-Monthly-Traffic 3003 integer IT网，http://www.it.net.cn
5、初步测试： IT网，http://www.it.net.cn
1   # /etc/init.d/freeradius stop
2   # radiusd -X \>
3   # radtest test test localhost 1649 testing123
如果结果中有Access-Accept就代表成功了，否则退回去检查设置。

6、测试成功的话添加在认证时检测流量的语句，打开/usr/local/etc/raddb/sites-enabled/default，找到authorize一节插入：

1   # vim /usr/local/etc/raddb/sites-enabled/default
2       update request {
3       Group-Name := "%sql:SELECT groupname FROM radusergroup WHERE username='%{User-Name' ORDER BY priority}"
4       }
5       if ("%sql: SELECT SUM(acctinputoctets+acctoutputoctets) FROM radacct WHERE username='%{User-Name' AND date\_format(acctstarttime, '%Y-%m-%d') \>= date\_format(now(),'%Y-%m-01') AND date\_format(acctstoptime, '%Y-%m-%d') \<= last\_day(now());}" \>= "%sql: SELECT value FROM radgroupreply WHERE groupname='%{Group-Name' AND attribute='Max-Monthly-Traffic';}") {
6       reject
7       }
7、设置radiusclient：

打开/usr/local/etc/radiusclient/radiusclient.conf，修改

authserver localhost:1812
acctserver localhost:1813

修改server：

最后加上localhost secret（就是FreeRadius的client.conf里面定义的secret）

修改dictionary：

最后加上 IT网，http://www.it.net.cn
INCLUDE /usr/local/etc/radiusclient/dictionary.merit
INCLUDE /usr/local/etc/radiusclient/dictionary.microsoft Linux学习，http:// linux.it.net.cn
如果没有dicitionary.microsoft的话看这里：http://wiki.freeradius.org/PopTop

8、启动服务

1   # service radiusd start
2   # chkconfig radiusd on
3   # chkconfig pptpd on
至此，完成了所有配置了。。。 Linux学习，http:// linux.it.net.cn
(责任编辑：IT)






客户端 安装客户端  1.1.7 
[http://freeradius.org/freeradius-client/][10]

接下来 是防火墙的联动 
这个暂且不详细说，每个厂商的防火墙配置方法都不同，思路是差不多的，客户端如果想完成认证，必须通过radius认证，这个时候，pc的数据包到达防火墙后，防火墙会把客户端丢过来的认证信息发送到radius服务器上面，由radius服务器去辨别是否通过认证

  6.radius里关键的配置文件为radius.conf 与clients.conf
               radius.conf:这个文件记录的是radius服务相关的信息，包括服务器监听的接口、允许认证的客户端IP等
               clients.conf:定义客户端与服务器之间的共享密钥，认证信息等



























[1]:	http://freeradius.org
[2]:	https://ttboa.wordpress.com/2014/09/26/freeradius-on-debian-7/
[10]:	http://freeradius.org/freeradius-client/