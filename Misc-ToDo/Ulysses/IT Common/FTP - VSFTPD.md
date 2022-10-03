## FTP / VSFTPD

> 匿名服务: 默认用户名 Anonymous 密码空

##### FTP 简介 : 

File Transfer Protocol. 文件传输协议 . 属于 应用层  
文件共享、跨平台使用.(兼容多种 文件存储系统（File system )

##### FTP 用户认证方式:
- 匿名用户 / 授权用户  
	- 授权用户:系统( 本地 )用户 / 虚拟用户
		- 虚拟用户: 本地db库文件 / mysql数据库 / LDAP
			// 虚拟用户 就是不能实际登录 Linux 只能登录 Ftp 的账户.

##### FTP 模式：主动和被动。

- 主动模式:

	客户端和服务器端 同时打开并且监听一个端口以创建连接。
	> 客户端安装了防火墙会产生问题。所以，创立了被动模式。

- 被动模式:

	服务器端打开并监听一个端口，不用管客户端的防火墙。




#### Win7 FTP 服务搭建

安装:  打开关闭 windows 功能:
安装 FTP 服务器 & Web 管理工具 所有子项

进入: 控制面板 管理工具 →  信息服务管理器( IIS )









#### VSFTPD : 

Very Secure FTP Daemon (守护进程)  
高安全性、小巧高速、带宽限制、虚拟用户、IPv6、  
Linux发行版中最受推崇的FTP服务器程序。
> 类似的 Linux FTP 服务: ProFTPD、PureFTPd和wuftpd等

##### Debian - Vsftpd 安装配置

-  vsftpd 安装:
	apt-get install vsftpd -y

#### 配置 FTP用户

实现: 用户 xu-jian 可以登录 FTP服务器. 登录目录为 /home/admin

- home 下 新建 admin 文件夹 .
	cd /home  → mkdir admin

- 创建用户名  + 用户密码 + 登录目录
	useradd -d /home/admin xu-jian 
	//增加用户xu-jian，并制定xujian用户的主目录为/home/admin
	
	passwd xujian //为xu-jian设置密码
	//需要 Root 权限运行

- 修改FTP目录权限
	chown -R xu-jian.xu-jian /home/admin
	//chown -R 命令改变 文档/目录 的所有者。

- 查看文件夹权限 → cd home  →  ls -l
	drwxr-xr-x 2 xu-jian xu-jian 4096 Mar 16 09:50 admin
	// 确认是否设置正确

- 权限设置：

	usermod -s /sbin/nologin xu-jian 
	//限定用户xu-jian不能telnet，只能ftp
	
	usermod -s /sbin/bash test 
	//用户test恢复正常
- 更改用户目录
	usermod -d /test xu-jian 
	//更改用户xu-jian的主目录为/test

- 限制用户只能访问/home/test.
	vi /etc/vsftpd/vsftpd.conf

	chroot_list_enable=YES //限制访问自身目录
	开启限制功能
	chroot_list_file=/etc/vsftpd/vsftpd.chroot_list
	//  去掉 #   设置 限制用户列表目录  → 在 :wq 保存退出

	接着创建vsftpd.chroot_list文件，将受限制的用户添加进去，每个用户名一行
	touch /etc/vsftpd.chroot_list && echo xu-jian > /etc/vsftpd.chroot_list

改完配置文件  → 重启vsftpd 服务器
	/etc/init.d/vsftpd restart

#### 配置 vsftp 

	vi /etc/vsftpd.conf

##### 配置文件 - 本地用户设置
	local_enable=YES/NO（YES）
	是否允许本地用户登入，YES 允许，NO不允许。
	
	local_root=/home/username
	本地用户登入时，登录到相应的目录。默认值为各用户的家目录。
	
	write_enable=YES/NO（YES）
	登陆用户有写权限。属于全局设置，默认值为YES。
	
	local_umask=022
	本地用户新增档案时的umask 值。默认值为077。
	
	Chroot_local_user=yes       是否将ftp本地用户禁锢在宿主目录里 
	
	Local_max_rate=0             本地用户最大的传输速率0为不限制 （单位为字节） 


- 检查 FTP目录权限
	ls -a 
	//ftp 目录 能看到 各用户的读写权限.

- 最基本配置:

	write_enable=YES  是否开启 . 要上传文件 必须开启.
	
	local_enable=YES    26行. 允许 服务器本地系统登录.


模板一: 不许匿名.只许本地
  
	anonymous_enable=YES “  23 行.  改为  “anonymous_enable=NO”
	//不允许匿名登录 

	//删除如下配置前的注释符号(#)：

	write_enable=YES
	// 29行. 允许写入权限
	chroot_local_user=YES
	112行 用户可以切换到上级目录
	chroot_list_enable=YES
	121行 启用 list 里面的用户列表 
	chroot_list_file=/etc/vsftpd.chroot_list
	//123行 哪些用户可以切换到到 上级目录

-  :wq 保存退出


- 启动、关闭、重启 vsftpd服务：
	service vsftpd start      或者 /etc/init.d/vsftpd start 

	service vsftpd stop

	service vsftpd restart 

- 查看端口
	netstat -npl
	就能看到 21端口开启了. 
	tcp        0      0 0.0.0.0:21              0.0.0.0:*               LISTEN      12219/vsftpd

##### 全局配置类
	Listen=yes  是否以独立运行的方式监听服务 
	Listen_port=21 设置监听ftp服务的端口 
	Write_enable=yes 启用任何形式的写入权限（如上传 删除文件等） 都需要开启此项 
	Download_enable=yes 是否允许下载文件（建立仅限于浏览，上传的ftp服务器是此项可设为NO） 
	Dirmessage_enable=yes 用户切换进入目录时显示message文件（如果存在）的内容 
	Xferlog_enable=yes 启用xferlog日志 默认记录到/var/log/xferlog文件 
	Xferlog_std_format=yes 启用标准的xferlog日志格式,若禁用此项,将使用vsftpd自己的日志格式
	Connect_from_Port_20=yes 允许服务器主动模式(从20端口建立数据连接) 
	Pasv_enable=yes 允许被动模式连接 
	Pasv_max_port=24600 设置用于被动模式的服务器的最大端口号 
	Pasv_ min_port=24500 设置用于被动模式的服务器的最小端口号 
	Pam_Service_name=vsftpd 设置用于用户认证的PAM文件位置 
	Userlist_enable=yes 是否启用use_list用户列表文件 
	Userlist_deny=yes 是否禁止user_list用户列表中的用户 
	Max_clients=0 最多允许多少个客户端同时连接(0为无限制) 
	Max_per_ip=0 对来自相同ip地址的客户端最多允许多少个并发连接数(0 为无限制) 
	Tcp_wrappers=yes 是否启用tcp_wrappers 机制 




##### 匿名用户类设置
	Anonymous_enable=yes 是否允许匿名用户访问 
	Anon_umask=022 设置匿名用户所上传文件的默认权限掩码
	Anon_root=/var/ftp 设置匿名用户的ftp根目录(不设置默认在/var/ftp目录下) 
	Anon_upload_enable=yes 是否允许匿名用户上传文件 
	Anon_mkdir_write_enable=yes 是否允许匿名用户创建目录的写入权限 
	Anon_other_write_enable=yes 是否允许匿名用户有其它写入权限如:改名覆盖及删除
	Anon_max_rate=0 限制匿名用户最多传输速率0为不限制 


#### 匿名用户（anonymous）设置
	anonymous_enable=YES/NO（YES）
控制是否允许匿名用户登入，YES 为允许匿名登入，NO 为不允许。默认值为YES。
	write_enable=YES/NO（YES）
是否允许登陆用户有写权限。属于全局设置，默认值为YES。
	no_anon_password=YES/NO（NO）
若是启动这项功能，则使用匿名登入时，不会询问密码。默认值为NO。
	ftp_username=ftp
定义匿名登入的使用者名称。默认值为ftp。
	anon_root=/var/ftp
使用匿名登入时，所登入的目录。默认值为/var/ftp。注意ftp目录不能是777的权限属性，即匿名用户的家目录不能有777的权限。
	anon_upload_enable=YES/NO（NO）
如果设为YES，则允许匿名登入者有上传文件（非目录）的权限，只有在write\_enable=YES时，此项才有效。当然，匿名用户必须要有对上层目录的写入权。默认值为NO。
	anon_world_readable_only=YES/NO（YES）
如果设为YES，则允许匿名登入者下载可阅读的档案（可以下载到本机阅读，不能直接在FTP服务器中打开阅读）。默认值为YES。
	anon_mkdir_write_enable=YES/NO（NO）
如果设为YES，则允许匿名登入者有新增目录的权限，只有在write\_enable=YES时，此项才有效。当然，匿名用户必须要有对上层目录的写入权。默认值为NO。
	anon_other_write_enable=YES/NO（NO）
如果设为YES，则允许匿名登入者更多于上传或者建立目录之外的权限，譬如删除或者重命名。（如果anon\_upload\_enable=NO，则匿名用户不能上传文件，但可以删除或者重命名已经存在的文件；如果anon\_mkdir\_write\_enable=NO，则匿名用户不能上传或者新建文件夹，但可以删除或者重命名已经存在的文件夹。）默认值为NO。
	chown_uploads=YES/NO（NO）
设置是否改变匿名用户上传文件（非目录）的属主。默认值为NO。
	chown_username=username
设置匿名用户上传文件（非目录）的属主名。建议不要设置为root。
	anon_umask=077
设置匿名登入者新增或上传档案时的umask 值。默认值为077，则新建档案的对应权限为700。
	deny_email_enable=YES/NO（NO）
若是启动这项功能，则必须提供一个档案/etc/vsftpd/banner\_emails，内容为email address。若是使用匿名登入，则会要求输入email address，若输入的email address 在此档案内，则不允许进入。默认值为NO。
	banned_email_file=/etc/vsftpd/banner_emails
此文件用来输入email address，只有在deny\_email\_enable=YES时，才会使用到此档案。若是使用匿名登入，则会要求输入email address，若输入的email address 在此档案内，则不允许进入。
 

 
#### 欢迎语设置
//dirmessage\_enable=YES/NO（YES）
如果启动这个选项，那么使用者第一次进入一个目录时，会检查该目录下是否有.message这个档案，如果有，则会出现此档案的内容，通常这个档案会放置欢迎话语，或是对该目录的说明。默认值为开启。
	message_file=.message
设置目录消息文件，可将要显示的信息写入该文件。默认值为.message。
	banner_file=/etc/vsftpd/banner
当使用者登入时，会显示此设定所在的档案内容，通常为欢迎话语或是说明。默认值为无。如果欢迎信息较多，则使用该配置项。
	ftpd_banner=Welcome to BOB's FTP server
这里用来定义欢迎话语的字符串，banner\_file是档案的形式，而ftpd\_banner 则是字符串的形式。预设为无。
 
#### 控制用户是否允许切换到上级目录

在默认配置下，本地用户登入FTP后可以使用cd命令切换到其他目录，这样会对系统带来安全隐患。可以通过以下三条配置文件来控制用户切换目录。
	chroot_list_enable=YES/NO（NO）
设置是否启用chroot\_list\_file配置项指定的用户列表文件。默认值为NO。
	chroot_list_file=/etc/vsftpd.chroot_list
用于指定用户列表文件，该文件用于控制哪些用户可以切换到用户家目录的上级目录。
	chroot_local_user=YES/NO（NO）
用于指定用户列表文件中的用户是否允许切换到上级目录。默认值为NO。
通过搭配能实现以下几种效果：
①当chroot\_list\_enable=YES，chroot\_local\_user=YES时，在/etc/vsftpd.chroot\_list文件中列出的用户，可以切换到其他目录；未在文件中列出的用户，不能切换到其他目录。
②当chroot\_list\_enable=YES，chroot\_local\_user=NO时，在/etc/vsftpd.chroot\_list文件中列出的用户，不能切换到其他目录；未在文件中列出的用户，可以切换到其他目录。
③当chroot\_list\_enable=NO，chroot\_local\_user=YES时，所有的用户均不能切换到其他目录。
④当chroot\_list\_enable=NO，chroot\_local\_user=NO时，所有的用户均可以切换到其他目录。
 
#### 数据传输模式设置

FTP在传输数据时，可以使用二进制方式，也可以使用ASCII模式来上传或下载数据。
	ascii_upload_enable=YES/NO（NO）
设置是否启用ASCII 模式上传数据。默认值为NO。
	ascii_download_enable=YES/NO（NO）
设置是否启用ASCII 模式下载数据。默认值为NO。
 
#### 访问控制设置

两种控制方式：一种控制主机访问，另一种控制用户访问。

①控制主机访问：
tcp\_wrappers=YES/NO（YES）
设置vsftpd是否与tcp wrapper相结合来进行主机的访问控制。默认值为YES。如果启用，则vsftpd服务器会检查/etc/hosts.allow 和/etc/hosts.deny 中的设置，来决定请求连接的主机，是否允许访问该FTP服务器。这两个文件可以起到简易的防火墙功能。
比如：若要仅允许192.168.0.1—192.168.0.254的用户可以连接FTP服务器，则在/etc/hosts.allow文件中添加以下内容：
vsftpd:192.168.0. :allow
all:all :deny
②控制用户访问：
对于用户的访问控制可以通过/etc目录下的vsftpd.user\_list和ftpusers文件来实现。
userlist\_file=/etc/vsftpd.user\_list
控制用户访问FTP的文件，里面写着用户名称。一个用户名称一行。

userlist\_enable=YES/NO（NO）
是否启用vsftpd.user\_list文件。
userlist\_deny=YES/NO（YES）
决定vsftpd.user\_list文件中的用户是否能够访问FTP服务器。若设置为YES，则vsftpd.user\_list文件中的用户不允许访问FTP，若设置为NO，则只有vsftpd.user\_list文件中的用户才能访问FTP。
/etc/vsftpd/ftpusers文件专门用于定义不允许访问FTP服务器的用户列表（注意:如果userlist\_enable=YES,userlist\_deny=NO,此时如果在vsftpd.user\_list和ftpusers中都有某个用户时，那么这个用户是不能够访问FTP的，即ftpusers的优先级要高）。默认情况下vsftpd.user\_list和ftpusers，这两个文件已经预设置了一些不允许访问FTP服务器的系统内部账户。如果系统没有这两个文件，那么新建这两个文件，将用户添加进去即可。
 
#### 访问速率设置
	anon_max_rate=0
设置匿名登入者使用的最大传输速度，单位为B/s，0 表示不限制速度。默认值为0。
	local_max_rate=0
本地用户使用的最大传输速度，单位为B/s，0 表示不限制速度。预设值为0。
 
#### 超时设置
	accept_timeout=60
设置建立FTP连接的超时时间，单位为秒。默认值为60。
	connect_timeout=60
PORT 方式下建立数据连接的超时时间，单位为秒。默认值为60。
	data_connection_timeout=120
设置建立FTP数据连接的超时时间，单位为秒。默认值为120。
	idle_session_timeout=300
设置多长时间不对FTP服务器进行任何操作，则断开该FTP连接，单位为秒。默认值为300 。
 
#### 日志文件设置
	xferlog_enable= YES/NO（YES）
是否启用上传/下载日志记录。如果启用，则上传与下载的信息将被完整纪录在xferlog\_file 所定义的档案中。预设为开启。
	xferlog_file=/var/log/vsftpd.log
设置日志文件名和路径，默认值为/var/log/vsftpd.log。
	xferlog_std_format=YES/NO（NO）
如果启用，则日志文件将会写成xferlog的标准格式，如同wu-ftpd 一般。默认值为关闭。
	log_ftp_protocol=YES|NO（NO） 
如果启用此选项，所有的FTP请求和响应都会被记录到日志中，默认日志文件在/var/log/vsftpd.log。启用此选项时，xferlog\_std\_format不能被激活。这个选项有助于调试。默认值为NO。
 
#### 定义用户配置文件

在vsftpd中，可以通过定义用户配置文件来实现不同的用户使用不同的配置。
	user_config_dir=/etc/vsftpd/userconf
设置用户配置文件所在的目录。当设置了该配置项后，用户登陆服务器后，系统就会到/etc/vsftpd/userconf目录下，读取与当前用户名相同的文件，并根据文件中的配置命令，对当前用户进行更进一步的配置。
例如：定义user\_config\_dir=/etc/vsftpd/userconf，且主机上有使用者 test1,test2，那么我们就在user\_config\_dir 的目录新增文件名为test1和test2两个文件。若是test1 登入，则会读取user\_config\_dir 下的test1 这个档案内的设定。默认值为无。利用用户配置文件，可以实现对不同用户进行访问速度的控制，在各用户配置文件中定义local\_max\_rate=XX，即可。
 
#### FTP的工作方式与端口设置

FTP有两种工作方式：PORT FTP（主动模式）和PASV FTP（被动模式）
	listen_port=21
设置FTP服务器建立连接所监听的端口，默认值为21。
	connect_from_port_20=YES/NO
指定FTP使用20端口进行数据传输，默认值为YES。
	ftp_data_port=20
设置在PORT方式下，FTP数据连接使用的端口，默认值为20。
	pasv_enable=YES/NO（YES）
若设置为YES，则使用PASV工作模式；若设置为NO，则使用PORT模式。默认值为YES，即使用PASV工作模式。
	pasv_max_port=0
在PASV工作模式下，数据连接可以使用的端口范围的最大端口，0 表示任意端口。默认值为0。
	pasv_min_port=0
在PASV工作模式下，数据连接可以使用的端口范围的最小端口，0 表示任意端口。默认值为0。
 
#### 与连接相关的设置
listen=YES/NO（YES）
设置vsftpd服务器是否以standalone模式运行。以standalone模式运行是一种较好的方式，此时listen必须设置为YES，此为默认值。建议不要更改，有很多与服务器运行相关的配置命令，需要在此模式下才有效。若设置为NO，则vsftpd不是以独立的服务运行，要受到xinetd服务的管控，功能上会受到限制。
max\_clients=0
设置vsftpd允许的最大连接数，默认值为0，表示不受限制。若设置为100时，则同时允许有100个连接，超出的将被拒绝。只有在standalone模式运行才有效。
max\_per\_ip=0
设置每个IP允许与FTP服务器同时建立连接的数目。默认值为0，表示不受限制。只有在standalone模式运行才有效。
listen\_address=IP地址
设置FTP服务器在指定的IP地址上侦听用户的FTP请求。若不设置，则对服务器绑定的所有IP地址进行侦听。只有在standalone模式运行才有效。
setproctitle\_enable=YES/NO（NO）
设置每个与FTP服务器的连接，是否以不同的进程表现出来。默认值为NO，此时使用ps aux |grep ftp只会有一个vsftpd的进程。若设置为YES，则每个连接都会有一个vsftpd的进程。
 
#### 虚拟用户设置

虚拟用户使用PAM认证方式。

pam\_service\_name=vsftpd
设置PAM使用的名称，默认值为/etc/pam.d/vsftpd。
guest\_enable= YES/NO（NO）
启用虚拟用户。默认值为NO。
guest\_username=ftp
这里用来映射虚拟用户。默认值为ftp。
virtual\_use\_local\_privs=YES/NO（NO）
当该参数激活（YES）时，虚拟用户使用与本地用户相同的权限。当此参数关闭（NO）时，虚拟用户使用与匿名用户相同的权限。默认情况下此参数是关闭的（NO）。
 
16.其他设置
text\_userdb\_names= YES/NO（NO）
设置在执行ls –la之类的命令时，是显示UID、GID还是显示出具体的用户名和组名。默认值为NO，即以UID和GID方式显示。若希望显示用户名和组名，则设置为YES。
ls\_recurse\_enable=YES/NO（NO）
若是启用此功能，则允许登入者使用ls –R（可以查看当前目录下子目录中的文件）这个指令。默认值为NO。
hide\_ids=YES/NO（NO）
如果启用此功能，所有档案的拥有者与群组都为ftp，也就是使用者登入使用ls -al之类的指令，所看到的档案拥有者跟群组均为ftp。默认值为关闭。
download\_enable=YES/NO（YES）
如果设置为NO，所有的文件都不能下载到本地，文件夹不受影响。默认值为YES。










---- -




二、ftp用户配置
1.先检查一下nologin的位置，通常是/usr/sbin/nologin或者/sbin/nologin。
2.接着创建系统账户
# useradd -d /home/www/ftproot -s /usr/sbin/nologin ftpuser  
/home/www/ftproot 为该系统用户家(home)目录，ftpuser为用户名  
为该帐户设置密码:  
#passwd ftpuser  
输入两次相同密码即可
3.然后修改指定目录的权限
# chown -R ftpuser.ftpuser /home/www/ftproot  
chown -R命令改变文档/目录所有者。详解
4.配置vsftp
编辑vsftp配置文件，命令如下：  
#vi /etc/vsftpd.conf  
将配置文件中”anonymous_enable=YES “改为 “anonymous_enable=NO”  
删除如下配置前的注释符号(#)：  
local_enable=YES  
write_enable=YES  
chroot_local_user=YES  
chroot_list_enable=YES  
chroot_list_file=/etc/vsftpd.chroot_list  
:wq 保存退出
接着创建vsftpd.chroot_list文件，并将ftp用户名添加进去  
#touch /etc/vsftpd.chroot_list && echo ftpuser \> /etc/vsftpd.chroot_list
5.修改shell配置
vi编辑/etc/shells，如果该文件里没有/usr/sbin/nologin或者/sbin/nologin（具体看当前系统配置）则追加进去
6.重启vsftp服务并测试登录
# service vsftpd restart  
然后用帐号ftpuser测试下是否可以登陆ftp。目录是/home/www/ftproot
三、vsftp安全配置
前面配置了用户访问权限管理中的使用nologin禁止FTP帐户登录Linux服务器，现在再配置些更安全的。
1.限制恶意占有带宽的用户
在vsftp中，匿名用户和本地用户的速度限制是分开的。前者是anon_max_rate，后者是local_max_rate。 它们的单位都是byte（字节）。
如果让匿名用户和本地的用户都以最高300KB的速度下载，那么这个数字应该是1024×300=307200。在vsftpd.conf文件末尾中加入下面的两行即可：
anon_max_rate=307200  
local_max_rate=307200
然后重启vsftpd服务即可。
另外，还可以限制FTP的最大连接数和每个IP的最大连接数。这两个参数分别是Max_clients和Max_per_ip。和上面一样，也只需要在vsftpd.conf文件末尾添加参数即可，如下设成了最大连接数100，每个IP的最大连接数5个：
max_clients=100  
max_per_ip=5
2.防止FTP密码被恶意嗅探
由于vsftpd发送的数据是以明文方式传输，尤其是密码容易被恶意的嗅探（Sniffering）到，所以通常需要采用SSL（Secure Sockets Layer，安全套接字层）技术，使得vsftpd支持SSL加密传输，以此来抵御恶意嗅探攻击。
使用SSL技术，依赖于另外一个软件：OpenSSL，它是一个可以自由使用的SSL实现，首先需要安装这个软件。用户可以从网站 http://www.openssl.org/source/上下载Linux下OpenSSL的稳定版本，编译安装，然后执行命令生成密钥。
# wget http://www.openssl.org/source/openssl-1.0.1f.tar.gz  
#tar -xvzf openssl-1.0.1f.tar.gz  
#cd openssl-1.0.1f  
#./config  
#make  
#make install
安装成功！  

接下来开始生成密钥
1.检查/etc/ssl/private 目录是否存在，不存在就创建
mkdir -p /etc/ssl/private  
chmod 700 /etc/ssl/private
2.执行命令生成密钥
# openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
3.修改vsftpd配置文件
# vi /etc/vsftpd.conf  
在末尾增加如下代码


33
# Turn on SSL
ssl_enable=YES
 
# Allow anonymous users to use secured SSL connections
allow_anon_ssl=YES
 
# All non-anonymous logins are forced to use a secure SSL connection in order to
# send and receive data on data connections.
force_local_data_ssl=YES
force_anon_data_ssl=YES
 
# All non-anonymous logins are forced to use a secure SSL connection in order to send the password.
force_local_logins_ssl=YES
force_anon_logins_ssl=YES
 
# Permit TLS v1 protocol connections. TLS v1 connections are preferred
ssl_tlsv1=YES
 
# Permit SSL v2 protocol connections. TLS v1 connections are preferred
ssl_sslv2=NO
 
# permit SSL v3 protocol connections. TLS v1 connections are preferred
ssl_sslv3=NO
 
# Disable SSL session reuse (required by WinSCP)
require_ssl_reuse=NO
 
# Select which SSL ciphers vsftpd will allow for encrypted SSL connections (required by FileZilla)
ssl_ciphers=HIGH
 
# This option specifies the location of the RSA certificate to use for SSL
# encrypted connections.
rsa_cert_file=/etc/ssl/private/vsftpd.pem
 

然后重启vsftp  
#service vsftpd restart




