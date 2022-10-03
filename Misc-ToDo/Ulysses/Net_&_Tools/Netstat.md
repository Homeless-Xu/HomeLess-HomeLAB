## Netstat

**显示各种网络相关信息:**

网络连接，
**路由表**
接口状态 (Interface Statistics)，masquerade 连接，
多播成员 (Multicast Memberships) 等等。


-a (all)显示所有选项，默认不显示LISTEN相关  
-t (tcp)仅显示tcp相关选项  
-u (udp)仅显示udp相关选项  
-n 拒绝显示别名，能显示数字的全部转化成数字。  
-l 仅列出有在 Listen (监听) 的服務状态
-p 显示建立相关链接的程序名  
-r 显示路由信息，路由表  
-e 显示扩展信息，例如uid等  
-s 按各个协议进行统计  
-c 每隔一个固定时间，执行该netstat命令。
提示：LISTEN和LISTENING的状态只有用-a或者-l才能看到


列出所有端口 netstat -a


列出所有 tcp 端口 netstat -at

列出所有 udp 端口 netstat -au

2. 列出所有处于监听状态的 Sockets
  只显示监听端口 netstat -l

只列出所有监听 tcp 端口 netstat -lt

 只列出所有监听 udp 端口 netstat -lu

只列出所有监听 UNIX 端口 netstat -lx























3. 显示每个协议的统计信息
  显示所有端口的统计信息 netstat -s



显示 TCP 或 UDP 端口的统计信息 netstat -st 或 -su

4. 在 netstat 输出中显示 PID 和进程名称 netstat -p
netstat -p 可以与其它开关一起使用，就可以添加 “PID/进程名称” 到 netstat 输出中，这样 debugging 的时候可以很方便的发现特定端口运行的程序。


5. 在 netstat 输出中不显示主机，端口和用户名 (host, port or user)
当你不想让主机，端口和用户名显示，使用 netstat -n。将会使用数字代替那些名称。
同样可以加速输出，因为不用进行比对查询



6. 持续输出 netstat 信息
netstat 将每隔一秒输出网络信息



8. 显示核心路由信息 netstat -r



9. 找出程序运行的端口
并不是所有的进程都能找到，没有权限的会不显示，使用 root 权限查看所有的信息。



显示网络接口列表





















