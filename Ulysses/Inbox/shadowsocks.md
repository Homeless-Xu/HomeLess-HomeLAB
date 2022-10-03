## shadowsocks
Ubuntu:
python — version    查看版本. 

然后安装 PIP 环境
apt–get install python–gevent python–pip

安装  shadowsocks
pip install shadowsocks


接下来配置也比较简单，
新建一个 config.json，或者其他名字的都行，
位置可以放在/etc/shadowsocks/下
默认没有这个文件，你要自己创建一个），或者home或者其他任何地方。


{
“server”:“198.74.49.76”,  
“server_port”:8388,  
“local_port”:1080,  
“password”:“password”,  
“timeout”:600,  
“method”:“aes-256-cfb”  
}


关于nohup，是可以让程序在后台运行的命令。
同时可以用命令行参数覆盖 /etc/shadowsocks.json 里的设置：
sslocal -s 服务器地址 -p 服务器端口 -l 本地端端口 -k 密码 -m 加密方法
ssserver -p 服务器端口 -k 密码 -m 加密方法
备注：sslocal是客户端程序；ssserver是服务端程序。


5、 防火墙设置（如有）
编辑防火墙配置文件/etc/sysconfig/iptables，将服务器端口（server_port）放行。
新增一条防火墙规则：
-A INPUT -m state --state NEW -m tcp -p tcp --dport 8989 -j ACCEPT
重启防火墙iptables：
service iptables restart
至此，服务器端的 Shadowsocks 安装和配置完毕。




在ubuntu下安装shadowsocks
1. sudo apt-get update
2. sudo python --version
3. apt-get install python-gevent python-pip
4. pip install shadowsocks
5. 找到shadowsocks文件夹的命令： sudo find / -name shadows* "/"是根目录下， *是通配符
进入ss文件夹 新建文件 并修改
6. 修改config.js
{
"server":"127.0.0.1",
"server_port":8388,
"local_port":10808,
"password”:”0219“,
"timeout":600,
"method":null
}
7. 后台长期启动shadowsockts
nohup ssserver -c /usr/local/lib/python2.7/dist-packages/shadowsocks/config.json \> log &
查看后台启动任务： jobs
关掉 fg %n
 
8. 开机自动启动：
cd /etc/
sudo vim rc.local
加上一行：
/usr/local/bin/ssserver -c /usr/local/lib/python2.7/dist-packages/shadowsocks/config.json
 

 

启动SS客户端
前两步很简单，可是有人就纳闷了安装好了不知道怎么用，其实可以用sslocal -help来查看帮助就知道了。
sslocal -s server_ip -p server_port  -l 1080 -k password -t 600 -m aes-256-cfb
-s表示服务IP, -pt指的是服务端的端口，-l是本地端口默认是1080, -k 是密码（要加""）, -t超时默认300,-m是加密方法默认aes-256-cfb，
可以简单的写为：sslocal -s ip  -p  port -k "password"    #用-s -p -k这三个参数就好，其他的默认将服务端的加密方法设为aes-256-cfb。然后就可以启动代理。




