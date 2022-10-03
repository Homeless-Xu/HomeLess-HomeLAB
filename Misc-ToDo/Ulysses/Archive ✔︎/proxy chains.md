## proxy chains


   linux 全局代理

kali   全局代理:

proxychains + tor 

前者 系统自带.  设置下就可以.

vi /etc/proxychains.conf



前面三个选项是 
dynamic_chain & strict_chain  & random_chain。三选一!!!
1. dynamic_chain:
proxychains会严格按照代理列表中提供的代理遍历下去，直到找到一个可用的，然后就使用它。
2. strict_chain: 默认开启这个的.
: 代理列表中的所有代理都是可用的时候，才能使用代理。
3. random_chain :
proxychain会在代理列表中随机选择一个可用的代理并使用它。跟在后面的是chain_len选项，这个选项只对random_chain有效，它指定了在这个模式下代理链的长度。
一般来说我们的选项应该是第一个，
如果使用了默认的第二个选项，会使得当你提供的代理列表中的某一个代理无法使用时，就无法使用其它的代理。
第三个选项推荐在扫描的时候使用，这时提供一个很长的代理列表，被扫描的主机就无法检测出你的扫描行为了。

---- --
安静模式（quiet_mode）:
这个模式开启后，你就不会在命令行看见那些烦人的连接信息了。不过如果你发现你连不上代理，那些信息很可能会帮到你。
proxy_dns
:这个选项用来指定是否通过代理服务器转发DNS请求，如果你不开启它，那么你的行踪很可能被你的DNS提供者记录下来，有时候VPN连接也会泄露你的行踪，就是因为你的VPN程序忘了通过代理转发DNS请求。
下面两个是一些超时选项，如果你的代理延迟很高，搞过了默认的这俩值，那就把这两个值调高一点吧。
跟在[ProxyList]()后面的就是代理列表了，这个列表的格式是这样的：
【代理类型】 【代理IP】 【端口】 【用户名】 【密码】
比如说我的shadowsocks的本地服务泡在127.0.0.1:10801，那我就这么写
socks5 127.0.0.1 10801
用户名和密码是可选的，如果代理没有加密，那就不用管这两个东西。
在需要使用代理的时候，只要在你的命令前加上proxychains就行了，比如说你想通过代理扫描这个博客的主机，那就这样做：
proxychains nmap –sS –Pn blog.guetsec.org














Kali ftp 传输

连接 服务器:

ftp 172.19.16.16
输入账号密码  boss + ***** 就进去了 


查看 ftp 命令 :   ?
http://blog.csdn.net/tianlesoftware/article/details/5818990






.deb 安装:

cd 到目录  直接. dpkg -i+ 软件包名字.

http://www.evil0x.com/posts/11627.html



