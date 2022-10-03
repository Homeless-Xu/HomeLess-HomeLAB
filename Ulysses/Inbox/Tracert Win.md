## Tracert Win

**确定数据包在网络上的停止位置。**
  
`tracert [-d] [-h maximum_hops] [-j host-list] [-w timeout] target_name`-d 指定不将 IP 地址解析到主机名称。  
-h maximum_hops 指定跃点数以跟踪到称为 target_name 的主机的路由。  
-j host-list 指定 Tracert 实用程序数据包所采用路径中的路由器接口列表。  
-w timeout 等待 timeout 为每次回复所指定的毫秒数。  
target_name 目标主机的名称或 IP 地址。  
使用 tracert 命令跟踪路径  
打开 命令提示符，然后键入：  
tracert host_name  
或者键入 tracert ip_address  
其中 host_name 或 ip_address 分别是远程计算机的主机名或 IP 地址。  


例如，要跟踪从该计算机到 www.ha97.com 的连接路由，请在命令提示行键入：
`tracert www.ha97.com
`  
如果 tracert 失败，可以使用命令输出来帮助确定哪个中介路由器转发失败或耗时太多。  
