## Kali SSH
允许 root, 允许空密码,重启服务.就可以了.


-  Server Setup : 
	自带 SSH.    启动服务就行.

	1. 启动 ssh 服务
	2. 编辑 配置文件. 
	3. 允许 root 用密码登录
	4. 允许空密码登录.
	5. 重启服务.

*配置文件 :*      `vi /etc/ssh/sshd_config`
*服务状态 :* 二选一
/etc/init.d/ssh status 
service ssh status

*启动/重启 服务 :* 二选一
/etc/init.d/ssh start / restart  
service ssh start / restart

配置文件默认设置:

1. 默认不许 空密码登录 !   修改配置文件.
	改成这样就可以了       `PermitEmptyPasswords yes `

	2. 默认 Root  不能用密码登录! 
		这行 值改成 yes.      `PermitRootLogin yes` 

	3. **然后重启服务!**         `/etc/init.d/ssh restart`


-  Client Setup :

ZSH:    `ssh root@172.19.16.164`

 连接错误:

1. *Connection refused*  
	→ Server 没有开启 ssh 服务.

	2. 连不上  
		可能之前连过一次. 系统重装了 那个什么秘钥就变了.
		得去客户端. 删除相应 ip 的那行 再重新连.