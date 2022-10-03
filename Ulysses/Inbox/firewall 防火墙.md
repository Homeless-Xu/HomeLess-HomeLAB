## firewall 防火墙
Ubuntu 默认关闭防火墙. 
iptables: 系统自带防火墙(复杂 难上手).
Uncomplicated Fire Wall(UFW):  iptable 的管理工具(使用简单).

安装 UFW :    sudo apt-get install ufw 

启用防火墙:　　sudo ufw enable 








service iptables status             查看iptables状态
service iptables restart iptables  服务重启
service iptables stop iptables     服务禁用


查看filter表：iptables -L
清空filter表：iptables -F


启动iptables: /etc/rc.d/init.d/iptables start
关闭iptables:/etc/rc.d/init.d/iptables stop

/etc/sysconfig/iptables


iptables：应用防火墙规则：iptables-restore: line 17 failed

/etc/init.d/iptables stop关闭
/etc/init.d/iptables start启动
/etc/init.d/iptables restart重启

