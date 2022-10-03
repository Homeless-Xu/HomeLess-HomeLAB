## Mail server
: Postfix  / sendmail(难用)
Postfix 邮件传输代理 安装配置简单

功能:
smtp 认证套件: 
pop3: imap
邮件过滤 procmail

配置 Postfix 
/etc/postfix/main.cf


操作方法 浏览器 输入账号密码
http://mail.example.com/webmail/webmail




更换 源 → 阿里云
1 备份
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

2 下载新的 CentOS-Base.repo
到 /etc/yum.repos.d/

wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

3 运行 yum makecache 生成缓存





mac 固定域名 绑定动态 ip 方法

1.	我们首先需要一个支持实时修改IP地址映射的DNS服务器；
2.	我们还需要一个上传本地IP地址到远程DNS服务器的客户端程序。

