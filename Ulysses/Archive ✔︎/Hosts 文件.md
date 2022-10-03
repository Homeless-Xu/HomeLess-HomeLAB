## Hosts 文件

*网址 和 IP 建立关联的数据库.*

*浏览器 访问 网站之前,必须先对 Hosts 文件进行检查. 
-  **找到:**  就立刻打开对应ip.	
	-  **没找到** *提交给 DNS 域名解析服务器* 

Mac 的 host 文件:
> 路径:    /etc/hosts 

  1 ##
  2 # Host Database
  3 #
  4 # localhost is used to configure the loopback interface
  5 # when the system is booting.  Do not change this entry.
  6 ##
  7 127.0.0.1   localhost
  8 255.255.255.255 broadcasthost
  9 ::1             localhost


## Hosts 文件作用

1. 加快域名解析! → 提高访问网站速度.
经常访问的网站 可以直接通过 host 文件,配置 域名和 ip 的映射关系

2. 屏蔽网站 (域名重定向)

很多网站 不经用户同意就安装各种插件到你电脑.
可以把这些网站.映射到 0.0.0.0  这样他们就访问不internet 网了.

> 如: 0.0.0.0 www.baidu.com





