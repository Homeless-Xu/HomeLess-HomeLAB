## VPS Rebuild (Debian)
## 重装VPS系统 ssh连接不上

- 原因:  ssh 秘钥验证不一致 
- 办法: 删除本地的 ssh 秘钥 再用 ssh 重新登陆.

	比喻:
		vps 系统 = 房子 
		ssh = 门锁
		换系统 = 彻底翻新(包括门)
	  
	换 VPS 系统会变换 VPS 上的 ssh 秘钥.
	 
	当 vps 换系统后(房子重新装修),你还用原来vps 的秘钥(以前门锁的钥匙),当然就连不进去了.
	 
	你得把以前的锁扔掉 
		→  vi /Users/v/.ssh/known\_hosts   
		→  删除带有 vps ip 的所有行  保存退出
	 
	重新配一把锁: 
	登陆ssh → 提示更新秘钥 →选 yes →输密码 

###### Mac 解决办法: 二选一

	一. 手动修改.   
	1. vi /Users/v/.ssh/known_hosts    
	2. 删除有关 vps ip 的行  保存退出
	
	
	二. 命令一键修改:   
	终端:运行 sed命令 直接删除 相关ip 行命令
	本命令适用:Mac   不适用:ubuntu  原因:系统不一样 sed命令 版本不一样.
	
	sed -i '' '/^198.74.49.76/d' /Users/v/.ssh/known_hosts





## 修改 SSH(22) 端口:
VPS首次登录:   ssh root@198.74.49.76  

###### 修改流程 :
- 修改文件 ------------------ 手动修改 / 自动二选一 (详细见下文)
- 重启sshd ----------------- systemctl restart sshd.service
- 重新登录 ------------------ ssh -p 5222 xujian@198.74.49.76

###### 一: 手动修改
|命令|操作|
|:---:|:---:|
| vi /etc/ssh/ssh\_config |   取消Port 22 前的注释，并将22改成2222 |  
| vi /etc/ssh/sshd\_config |  取消Port 22 前的注释，并将22改成2222 |

###### 二: 命令一键修改

	sed -i 's/^#...Port.22/Port 2222/g' /etc/ssh/ssh_config
	
	sed -i 's/^Port.22/Port 2222/g' /etc/ssh/sshd_config





## 修改 Root 密码

passwd  + 输入两次密码



## 安装 Git

- apt-get update
- apt-get upgrade
- apt-get install git


## 安装配置 ZSH / oh-my-zsh

- 查看在用 bash: ------------------------------------- echo $SHELL     
- 查看已装 bash: -------------------------------------  more /etc/shells   
- ZSH 安装: -------------------------------------------  apt-get install zsh
- oh-my-zsh 安装: (二选一)
	1. 用 Git 安装  需要先安装 Git  
		git clone git://github.com/robbyrussell/oh-my-zsh.git /.oh-my-zsh
		  
	2. 链接直接下载:  
		wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh


- 配置 ZSH:
	- Zsh配置文件位置: ～/.zshrc  (没有的话自己新建.zshrc文件)

	- 下载别人现成的 .zshrc 文件  文件内容 复制到新建文本里面.
		  
	- 设置 ZSH 成默认(需重新登录 ssh): ———    chsh -s /bin/zsh



## 修改 ssh 登录界面
##### 登录文字 + 最后登录时间

- 用户主目录 下 新建个.hushlogin 文件 就会用静默方式登录,什么提示都没用.
	  
		touch .hushlogin 
- 登录文字: /etc/motd   清空文件 写入自定义文字.
	  
	  
		echo Welcome here ----------xujian > /etc/motd

- 最后登录时间:  PrintLastLog yes →设置成 no (亲测试 不成功)

		sed -i 's/^PrintLastLog.yes/PrintLastLog no/g' /etc/ssh/sshd_config

## 安装 配置 autojump

##### 下载源文件 → 给可执行权限 → 安装 → .zshrc 添加内容 → 重启 zsh

- 下载源文件  
	  
		git clone https://github.com/joelthelion/autojump.git

- 赋予安装脚本文件可执行权限 
	  
		cd autojump 
		chmod 755 install.py
- root 运行安装脚本:
	  
		./install.py  
 
- 添加内容:根据脚本安装好之后提示:  
	大概 就是去 .zshrc 文件里  手动加两行内容,
	  
		[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh
		
		autoload -U compinit && compinit -u

- zsh中永久生效: (这命令 未测试.不必要)

		echo '. /usr/share/autojump/autojump.sh' \>\> /.zshrc             

- 重启(重新应用新的配置)zsh sehll :        source .zshrc

- 然后就能使用了.  j 加文件夹简写.
列子 cd /usr  然后去任何目录 再 j u  就到这个/ usr 目录了 




## 配置 vim

查看版本: vi -version





---- 
上面文件 制作脚本:

# !/bin/bash

sed -i '' '/^198.74.49.76/d' /Users/v/.ssh/known\_hosts
# 删除旧的秘钥

ssh root@198.74.49.76
# 首次登录 vps 它会问你是否保存 ssh key 选 yes.


xxxxxxxx
# 输入密码



  

1








1











1















1










1



1


1








1











1















1










1







1


1








1











1















1










1







1


1








1











1















1










1







1


1








1











1















1










1









