## 防火墙: netfilter + iptables 组成

### iptables  简介:

- Linux 系统自带,基于命令操作,的防火墙.
- 可以设定规则来允许/阻止/转发 网络数据.

### iptables 结构:  
      rules → chains → tables → iptables
	  规则组成链,链组成表,表组成iptables.


#### iptables 由 Filter , NAT , Mangle , RAW 组成


##### Filter 表:  默认表,过滤数据包 内建三种链:  
- 查看 filter 表命令:
 
	    iptables --list


- INPUT 链 –------------- 处理来自外部的数据。
	 
		比如: 客户端 ssh 本机.  
		iptables 会首先匹配 连入的 ip 地址 和 端口号.   不符合就拒绝登陆.
- OUTPUT 链 –---------- 处理向外发送的数据。

- FORWARD 链 –------- 将数据转发到本机的其他网卡设备上。
	 
		例: 路由器收到的数据 绝大多数都要转发给电脑主机.




#### NAT 表 内建三种链:
 - 查看 NAT 表: 
	 
		iptables -t nat --list

- PREROUTING链 
	 
		处理刚到达本机并在路由转发前的数据包。
		它会转换数据包中的目标IP地址（destination ip address），
		通常用于DNAT(destination NAT)。

- POSTROUTING链
	 
		处理即将离开本机的数据包。
		它会转换数据包中的源IP地址（source ip address），
		通常用于SNAT（source NAT）。

- OUTPUT链 
	 
		处理本机产生的数据包。

#### Mangle 表:  如何处理数据包. 它能改变TCP头中的QoS位。内建5种链：
- 查看 Mangle 表: 
	 
		iptables -t mangle --list
- PREROUTING
- OUTPUT
- FORWARD
- INPUT
- POSTROUTING

#### Raw 表: 处理异常，内建2个链
- 查看 Raw 表:
	 
		iptables -t Raw --list
- PREROUTING chain
- OUTPUT chain






### 规则(Rules)
- Rules包括一个条件和一个目标(target)
- 如果满足条件，就执行目标(target)中的规则或者特定值。
- 如果不满足条件，就判断下一条Rules。

#### 目标值（Target Values）
- ACCEPT – 允许防火墙接收数据包
- DROP – 防火墙丢弃包
- QUEUE – 防火墙将数据包移交到用户空间
- RETURN – 防火墙停止执行当前链中的后续Rules，并返回到调用链(the calling chain)中。


规则解释:

|选项|解释|
|:---:|:---:|
| num | 规则编号 |
| target | 目标值 |
| prot | 协议: tcp udp icmp 等 |
| source | 数据包源 IP 地址 |
| destination | 数据包目标 IP 地址 |



常用命令:

- 清空 iptables 规则:
	 
		iptables -F
		有些 linux 版本 用这个命令 不会清除 NAT 表里面的规则
		需要手动清除:
		iptables -t NAT -F

 
 
### 规则永久生效
系统重启后 规则会失效. 要永久有效:不同系统不同操作  
 
##### Debian / Ubuntu  

 - 保存现有规则
		iptables-save > /etc/iptables.rules

- 到/etc/network/if-pre-up.d/目录  
- 新建一个 bash 脚本  (新建文件就行 内容用#!/bin/bash开头 就是脚本文件.)
- 脚本内容如下(两行)
	 
		#!/bin/bash
		iptables-restore < /etc/iptables.rules
		
		这样 每次系统重启后 iptables 规则会被自动加载.


基本操作

|功能|命令|  
|:---:|:---:|
| 启动 iptables | service iptables start |
| 启动iptables | /etc/rc.d/init.d/iptables start |
| 关闭 iptables | service iptables stop |
| 关闭iptables | /etc/rc.d/init.d/iptables stop |
| 重启 iptables | service iptables restart |
| 查看 iptables状态 | service iptables status |
| 保存 iptables配置 | service iptables save |

|功能|命令|
|:---:|:---:|
| Iptables 服务配置文件 | /etc/sysconfig/iptables-config |
| Iptables 规则保存文件 | /etc/sysconfig/iptables |




命令:
 
	    iptables [ -t 表名] 命令选项 [链名] [条件匹配] [-j 目标动作或者跳转]

常用命令:

阻止 IP 地址为 10.10.10.10 的所有连接。  
     
	    iptables -A INPUT -s 10.10.10.10 -j DROP

阻止一组 ip 的所有连接  (可以用 子网掩码 或者 /来表示一个子网)
 
	    iptables -A INPUT -s 10.10.10.0/24 -j DROP

阻止特定 ip 的 ssh 连接.  
     
	    iptables -A INPUT -p tcp --dport ssh -s 10.10.10.10 -j DROP
	    ssh 可以换成别的协议  
	    -p tcp 是告诉 iptables 连接使用的是什么协议.

阻止所有 ip 的 ssh 连接
 
	    iptables -A INPUT -p tcp —dport ssh -j DROP


查看iptables规则 
 
	    iptables –L（iptables –L –v -n） 

删除iptables现有规则

	    iptables –F 
删除一条规则
 
	    iptabels -D INPUT 2 

修改一条规则
 
	    iptables -R INPUT 3 -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT 

允许远程主机进行SSH连接
 
	    iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT 
	    iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT 

允许本地主机进行SSH连接  
     
	    iptables -A OUTPUT -o eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT   
	    iptables -A INTPUT -i eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT 

允许HTTP请求  
     
	    iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT 
	    iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT 



限制ping 192.168.146.3主机的数据包数，平均2/s个，最多不能超过3个  

	    iptables -A INPUT -i eth0 -d 192.168.146.3 -p icmp --icmp-type 8 -m limit --limit 2/second --limit-burst 3 -j ACCEPT 

限制SSH连接速率(默认策略是DROP)

	    iptables -I INPUT 1 -p tcp --dport 22 -d 192.168.146.3 -m state --state ESTABLISHED -j ACCEPT  
	    iptables -I INPUT 2 -p tcp --dport 22 -d 192.168.146.3 -m limit --limit 2/minute --limit-burst 2 -m state --state NEW -j ACCEPT 

增加一条规则到最后

	    iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT 



### 安全设置:
#### 防止syn攻击
 思路：限制单个ip的最大syn连接数  
         
	    iptables –A INPUT –i eth0 –p tcp --syn -m connlimit --connlimit-above 15 -j DROP 


#### 防止DOS攻击
利用recent模块抵御DOS攻击  
     
	    iptables -I INPUT -p tcp -dport 22 -m connlimit --connlimit-above 3 -j DROP 

单个IP最多连接3个会话
 
	    iptables -I INPUT -p tcp --dport 22 -m state --state NEW -m recent --set --name SSH  



只要是新的连接请求，就把它加入到SSH列表中
 
	    Iptables -I INPUT -p tcp --dport 22 -m state NEW -m recent --update --seconds 300 --hitcount 3 --name SSH -j DROP  

5分钟内你的尝试次数达到3次，就拒绝提供SSH列表中的这个IP服务。被限制5分钟后即可恢复访问。


防止单个ip访问量过大  
     
	    iptables -I INPUT -p tcp --dport 80 -m connlimit --connlimit-above 30 -j DROP 

防止ping攻击  
     
	    iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/m -j ACCEPT 


基本操作

|选项|功能|  
|:---|:---:|  
| -A (append) | 指定链末尾 添加规则 | 
| -D (delete) | 删除一条规则 |  
| -I (insert) | 指定链开头 添加规则 |  
| -R (replace) | 替换规则 |
| -L (list) | 列出所有规则 |
| -F (flush) | 清空所有规则 |
| -N (new chain) | 新建自定义规则 |
| -P (policy) | 设置指定链的默认策略 |
| -v (verbose) | 查看规则列表时 显示详细信息 |
| -V (Version) | 查看 iptables 版本详细 |





打开iptables转发：echo "1"\> /proc/sys/net/ipv4/ip\_forward




iptables -L -v  
查看 输入输出转发的 数据量.   如果转发量是 0 就说明没有开启转发.

注意: 很多时候都是 输入输出 双向通信的.   一般都需要同时配置输入和输出 防火墙.  比如 ssh / ping


默认行为:没有设置规则时候 做出的行为. 
iptables -L    查看当前 iptables 的配置.
-v 显示数据包和字节信息,
-n 不将 ip 解析成域名.


policy Accept   允许连接.
policy Drop     丢弃数据包
policy Reject   不允许连接并返回一个信息. 不想让某个 ip 远程你 返回信息防火墙阻止你登陆.


iptables -A    将额外的规则 添加到现有规则.




- Ubuntu 默认关闭防火墙. 
	Uncomplicated Fire Wall(UFW):  iptable 的管理工具(使用简单).
	安装 UFW :    sudo apt-get install ufw 
	启用防火墙:　　sudo ufw enable 




/etc/sysconfig/iptables


iptables：应用防火墙规则：iptables-restore: line 17 failed

/etc/init.d/iptables stop关闭
/etc/init.d/iptables start启动
/etc/init.d/iptables restart重启








