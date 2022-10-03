## ✔️VPN - 流控


# Debian L2TP


一、安装 IPSec。IPSec 会对 IP 数据包进行加密和验证。  
推荐用 openswan 这个后台软件包来跑 IPSec。
用以下命令安装 openswan:
sudo apt-get  install openswan


1.1 配置sysctl参数
 
   sudo mv /etc/sysctl.conf /etc/sysctl.conf.bak
备份文件 

    sudo vim /etc/sysctl.conf

    —————新建文件 并输入如下内容-------------
    net.ipv4.ip_forward = 1
    net.ipv4.conf.all.accept_redirects = 0
    net.ipv6.conf.all.accept_redirects = 0
    net.ipv4.conf.all.send_redirects = 0 








