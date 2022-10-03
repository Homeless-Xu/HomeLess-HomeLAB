## Cent os 7
安装方法:
- 下载 cent os镜像(everything的那个)   ✚ centos u盘制专用作工具  .                     
- 准备8G u盘 并制作 启动盘.
- 安装注意点:
  标准分区模式; 必须分区: / 和 swap ;建议分区: /boot 500M, /home 自定义大小
 
IP 配置  ( 需要用root用户操作) 
cd /etc/sysconfig/network-scripts/         进网卡配置目录  

3:     尾行添加              ipaddr0=192.168.1.219
vi ifcfg-eno1                                    用vi编辑这个网卡配置文件                                                  prefixo0=24       设置子网掩码
修改     1:     bootproto=static         启用静态ip地址   第二行                                            gatewat0=192.168.1.1  设置网关
 2:    onboot=yes                    自动连接网络    最后一行.                 dns1=202.96.209.133  dns2=202.96.209.5
 然后:wq 保存退出.  
 重启网络: service network restart        测试网络:  ping www.baidu.com    ctrl+c 中止ping



























