## CentOS

##### 常用命令:
- 防火墙设置 ————————iptables -L 
- 所有安装软件 ———————rpm -qa
- CPU 信息  ———————— cat /proc/cpuinfo 
- 主机名(改名) ——————— hostname ( sudo hostname xx )
- 系统运行信息 —————— uptime 
- 活动用户 ———————— w 
 - 硬盘硬件信息 —————— cat /proc/partitions 
- 硬盘分区信息 —————— fdisk -l 
- 内存硬件信息 —————— cat /proc/meminfo 
- 内存信息 ———————— free -m 
- 路由表信息 ——————— route -n  
- 所有监听端口——————  netstat -lntp  
- 查看已建立连接—————  netstat -antp 
- 网络统计信息 —————— netstat -s 
- 显示进程(静态) ——————  ps -ef  
- 显示进程(动态) ——————  top 
- 用户的信息(群组/权限) ——— id xujian 
- 用户登录日志 ——————— last 
- 当前用户计划任务 ————— crontab -l  
- 所有系统服务———————  chkconfig -list  



