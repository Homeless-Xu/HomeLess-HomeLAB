
## Mac vpn Setup :

设置 
  →  网络 
→ 左下角 加号 
  → 接口名称/服务名称:随便取 
→ 创建 

配置:默认
服务器地址:vps 服务器的 ip 外网 ip . 固定 ip
账户名: 设置的 VPN 账户名  
加密: 自动
鉴定设置:选择密码   输入VPN密码

高级: 通过 vpn 连接发送所有流量  打钩.

点击连接 . ok



## VPN 国内外完美访问.

1. 自行搭建 VPN 服务器或购买 VPN 提供商的服务。

2. 系统偏好设置 
	→ 网络 
	→ 增加 VPN 设置，(类型选择PPTP)
	根据提示设置用户名密码等信息即可。

3. 下载 chnroutes.py，相关网址：Downloads - chnroutes - Scripts to generate special routes for china ips

4. 打开终端进入下载文件的目录，执行：python chnroutes.py -p mac，该目录下会生成两个文件「ip-up」和「ip-down」。

5. 把这两个文件复制到 /etc/ppp 下，然后进入该目录执行：sudo chmod a+x ip-up ip-down


*测试:*
1. 执行：`netstat -nr` 查看路由表的输出信息。
	2. 连接 VPN，再次执行：`netstat -nr`

	3. 对比两次输出的路由信息: 你会发现路由表已经发生了变化。

	这时再去访问国内的网站，你发现他们又变得嘻唰唰了，
	同时还能访问 Twitter 和 Facebook！



























