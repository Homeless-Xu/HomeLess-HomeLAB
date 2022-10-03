
无 IP. Web Building .solution.



*反向代理*

在公共端点 和 本地 Web 服务器之间建立一个安全的通道.

可以用外网来访问内网(无外网 ip 的内网)的网站.


*应用场景:*
Web 开发

临时把本地的 Web 部署到外网. 供他人体验.或协助调试.

*传统方案:*
1. 花生壳 动态域名解析.
	2. 自己搭建 VPN 做端口映射.




1. SSH   → ssh -R
	需要额外的一台电脑中转 (总共要三台电脑.)


2. ngrok [全球官网][1]
	21. ngrok 自己搭建服务器 (有 vps.)
	22. ngrok [国内公共服务器][2]  
		> 全球官网可能被Wall 


3. P2P 虚拟局域网
	- n2n 被作者自己删了...
	- [Zero Tier][3] (Recommand)
		直接把几个分散在全球的设备 拉到一个内网上面.







[1]:	https://ngrok.com/
[2]:	http://www.ngrok.cc/
[3]:	https://www.zerotier.com/