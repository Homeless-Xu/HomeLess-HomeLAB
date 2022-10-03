  


## Forget Root Passwd

例如重新进入单人维护模式
Live CD 开机后挂载根目录去修改 /etc/shadow,
将里面的 root 密码字段清空, 再重新启动后
root 将不用密码就可登入!
登入后再赶忚以 passwd 命令去设定 root 密码卲可。  



## 变换身份
(平时用一般账户 必要时用 root)
su -  直接变 root 账户  要root密码    用 login-shell 来登陆

su  变换身份(让自己的身份变成 root 而已.) 默认直接以 root 登陆  需要输入 root 密码. 以 non-login shell登陆
很多变量 用的还是变为 root 之前的变量.






sudo 命令  要自己的密码 (前提是管理员  给你开通 sudo 的功能.)

visudo    直接修改 /etc/sudoers 文件.


账户登陆问题
有些账户是不需要登陆shell 的  但是可以使用系列资源.
比如说 邮件服务.  那么多邮箱账号 只要能收取邮件就可以了  不需要登陆 ssh.


和 别的用户交流.  
先查看 谁在线.
write xujian pts/0
hello  按下 ctrl d 结束输入. 对方就能看到了.


wall i will shutdown the server   告诉所有人.



## Linux: mailbox  
每个用户都有一个 邮箱.
用户不在线的话 就用 mailbox 来发信息吧.
mail xujian -s “nice to meet you”
hello 
.   结束时 最后一行 写一个小数点. 再回车.

收件  直接运行 mail


最好用命令增加用户. 因为加一个用户涉及很多文件 要是漏了一个 会出问题.

  程序 :linux 触发任何一个事件  系统都当成一个程序 给这个程序 一个 ID → 就是 PID
比如 用root登陆ssh  ssh 服务器会给你发一个 pid 然后你用 root 执行命令 服务器也会给这么命令发一个 pid 
登陆 ssh  就是父进程 .
执行命令  子进程


终端 输入 ps -l
→
UID   PID  PPID        F CPU PRI NI       SZ    RSS WCHAN     S             ADDR TTY           TIME CMD
  501 12345 12344     4006   0  31  0  2455576   2916 -      S                   0 ttys000    0:00.09 -zsh
  501 12387 12345     4006   0  31  0  2446696   1304 -      S                   0 ttys000    0:00.01 bash
  501 12391 12387     4006   0  31  0  2463768   2976 -      S                   0 ttys000    0:00.07 zsh

 Parent PID (PPID)  
杀掉子进程 父进程会再创建一个子进程     杀掉父进程才有用.

程序 在硬盘  触发后加载到内存  一个程序有好多中权限 root / user   系统通过 pid 判断这个程序 是否有权限进行工作.
就比如 登陆是 ssh  bash 这个程序.   root 进去是 root 的相应权限.


常驻内存的程序 就是服务. daemon 
网络服务 启动后 会开启一个可以负责网络监听的端口 以便外部的客户端 可以连接.

linux 默认提供 6个文字界面 就是能开6个 ssh.   和 一个图形界面.

linux 绝对不会死机的   如果一个窗口没反应  切换到别的窗口  ps -aux 找出刚才错误的程序  kill  再回去 有可以了.



bash 下 工作控制  前台 foreground   后台 background (能自动运行的 无法停止的 用 bg fg 来呼叫该工作)
一次进行多个任务. 比如后台下载.
cp file1 file2 &      &:就是后台执行的意思.

后台程序 最好将输出数据 利用 数据流导向 导到文件里. 
tar -zpcvf /tmp/etc.tar.gz /etc \> /tmp/log.txt 2\>&1 &

暂停程序到后台. 比如 vi 编辑文件时 需要找别的文件.  按下 ctrl z 

观察目前的 后台状况.  jobs
后台转前台 fg (foreground)

vi 编辑文件 正常退出 不会有交换文件残留      不正常退出 就会有交换文件 方便找回数据,

静态 ps  
ps aux  观察系统所有数据程序
ps -l   查自己用户 bash 的数据程序  

动态top
查看进程.


tty 终端机的位置.  远程登录则使用动态接口 pts/n

sz 代表 内存用量
wchan 代表 程序是否活的.


f 程序旗标   4 是 root 权限
c cpu 使用率
pri/ni Priority/Nice 的缩写，
代表此程序被 CPU 所执行癿优先级，数值越小代表该程序越忚
被 CPU 执行。

找父程序 pstree


程序执行顺序
cpu 一秒能运行 好几 G 的指令次数 每个进程在一秒内  或多或少都会被 cpu 执行.
优先级高的 优先运行
priority 优先执行顺序  
PRI 优先值



