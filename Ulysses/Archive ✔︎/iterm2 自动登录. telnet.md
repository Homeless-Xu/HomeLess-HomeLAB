## iterm2  自动登录. telnet
1. Mac 电脑
2. 终端用 iTerm2 
3. 先写exp 格式的登陆脚本.   telnet.exp
4. 把脚本放到 /usr/local/bin下
5. 给脚本运行权限!!! 只能读写是不行的.`chmod +x 文件名路径
	`6. 去 iTerm 设置 → Profiles → 新建 
7. 输入 Name. 
8. send text as start:  输入脚本所在的完整路径.退出 

9. iTerm 菜单栏 → Profiles → 选择名字 
或者 ⌘+o 快捷键 → 上下键选择 → 回车. 就登进去额.


比如 cisco 交换机.   要输入两次密码的.


	#!/usr/bin/expect
	set timeout 20
	
	spawn telnet 172.19.16.46
	// 交换机的 IP
	send "\r"
	// mac 下会多个提示 按回车就好了
	expect "Password:"
	//输入 vty 密码
	send "IT@\r"
	
	expect "Password:"
	// 输入特权模式密码
	//(Cisco telnet 的话 必须要输入两个不同的密码才能登陆的.)
	send "IT@R\r"
	interact

