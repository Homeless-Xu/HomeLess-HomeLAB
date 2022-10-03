## TTL 
> 不同的操作系统 TTL 默认值是不同的. 可以根据这个来判断对方的操作系统.
默认 TTL 值:
- Linux                          64/255
	- Windows 98                     32
	- Windows NT/2000/xp             128
	- Unix                           255
	- LINUX Kernel 2.2.x & 2.4.x     64
	- LINUX Kernel 2.6.x             47
		……

如果把windows服务器的 TTL 值 默认128 改成255. 
那么扫描工具就会把这个服务器当成 Unix 系统.这就安全多了.

- 修改方法: 通过注册表.
	  


