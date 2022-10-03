## Docker ssh

**ssh installed??
use `ssh -V`
if nothing show .so you need install openssh-server.


**install

`apt-get update`   必要的.
`apt-get install openssh-server -y`
`ssh -V` you can see the version now.



*SSH 配置文件 :*      `vi /etc/ssh/sshd_config`

*服务状态 :* 
service ssh status

*启动/重启 服务 :* 二选一
/etc/init.d/ssh start / restart  
service ssh start / restart


**ssh configure

1. 默认不许 空密码登录 !   修改配置文件.
	`PermitEmptyPasswords no `  →   `PermitEmptyPasswords yes `

	2. 默认Root不能用密码登录! 
		`PermitRootLogin prohibit-password`  →  `PermitRootLogin yes`

	3. 然后重启服务!         `/etc/init.d/ssh restart
		`

