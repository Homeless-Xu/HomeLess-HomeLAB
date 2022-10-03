## NAS
## NAS（Network Attached Storage）
> 网络附属存储  
> 本质: 一台unix 服务器,支持多种协议. 功能非常强大.

### NAS 好处:
- 资料集中存放+备份.
- 任何设备,随时随地 访问文件
- 实用软件商店.

## 固定主机名(IP) :
> xujian.myDS.me  
> 外网访问的前提.

## SSH:
控制面板 →  终端机 → 启用 ssh → 设置端口 2222 → 应用.
默认 只能 root/admin 可以登录.
ssh -p 2222 root@192.168.1.7 


## 官网端口详细解释:
[https://www.synology.cn/zh-cn/knowledgebase/faq/299][3]
5000 端口. xujian.myDS.me:5000 就能外网进网页管理界面了.
22 (2222 修改后的ssh 端口)   外网 ssh nas 了.





## 一: 文件访问
### Mac:
- 内网:网上邻居
- 外网访问: Finder → 前往服务器 → smb://xujian.myDS.me

### windows :
- 内网:网上邻居
- 外网访问:     我的电脑 → 地址栏 → \\xujian.myDS.me → 账号密码.





## VPN
[官网教程连接][1]

### 群晖: 下载并启动 vpn服务 外加:开启外网端口1723

### Mac:

- 网络设置 → 新建 pptp 连接 
- 服务器地址 : xujian.myDS.me
- 账户名字 xujian
- 加密方式 认证方式:两边设置一样.   
	> nsa 选 MS-CHAP v2  电脑选择密码登录.

### windows:





### 数据库 Mariadb

登录方法: nas 安装 phpmmyadmin 登录.

或者 ssh 
mysql -u root -p    进入



#### 第三方软件(Nacicat)登入:  
数据库 必须新建一个用户. 默认root 用户连不上  亲测
##### 局域网登录
新建连接 → 常规设置下:  

- IP (NAS) :192.168.1.7
- 端口 3306 
- 数据库用户名密码

##### 万维网登录:

控制面板 → 外部访问 → 添加端口
主机名称 xujian.myDS.me
路由器配置  要新增端口2222  . 然后就能 ssh 了.
这个 数据库可以用 root 登录.


\@: Git-server
## Gitserver:


DSM中创建一个GIT用户:xujian
打开GIT SERVER窗口，将允许访问GIT库的用户打上勾。


控制面板 \> 终端机并启用 SSH 服务。

到这一步，DSM的设置任务就完成了。


接着通过SSH连接到你的这个DS213J上。登陆的时候当然采用root登陆，密码就是admin的密码。



首先进入你的磁盘卷，一般名字是volumeX,X表示你创建的磁盘空间数量，  
一般这个机器就两个硬盘，一般就是volume1了

	cd /     #进入根目录 
	cd /volume1   #进入硬盘

创建一个git库目录 (文件夹)

	mkdir git_xx

目录里面创建一个项目(文件夹)

	cd git_xx
	
	mkdir xx

进入项目目录

	cd gittest

进行GIT初始化

	git init --bare

将这个Git库的整个目录的主人 修改为你的git用户

	chown -R xujian:users  git_xx
	
	如果你还想让其他用户也一起共享的话，
	还需要将其他用户的权限设置为可写
	chmod -R 775 git_xx

这里的git\_xx是整个库目录，我是为了省事情，  
如果不同项目需要区别对待，那就对里面的项目目录进行设置就可以了。

总的原则就是某个用户要想能推送文件到服务器:  
必须打开这个用户对整个项目目录，包括子目录的写权限，否则就会失败。

 


在客户端进入git 命令行，测试一下是否可以下载和上传。

git clone ssh://xujian@192.168.1.7:2222/volume1/git\_xx/xx
然后要同意什么协议.  然后就可以了.
改过 ssh 端口的话 IP: 端口号 就行了


然后就是使用教程了:
git clone 下来后 本地就有了个 xx 文件夹.
把文本文件手动拖入 git 文件夹.  也可以用命令加文件  :echo "t1.txt" \>t1.txt
终端去 cd 到 xx 目录先.

	git add -A    # 本地 不管是加了文件 还是删了文件 都用这个 .   
	
	git commit -m "备注/每次 push前都要 注释下这次 push的作用"

推送到GIT SERVER上

	git push origin master

显示成功！

[1]:	https://www.synology.cn/zh-cn/knowledgebase/tutorials/592