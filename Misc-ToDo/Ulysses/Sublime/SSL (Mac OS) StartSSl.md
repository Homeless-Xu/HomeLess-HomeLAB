







AES advanced encryption standard   高级加密标准
CA Certificate Authority       证书认证机构
DES data encryption stand   数据加密标准
HTTPS hypertext transfer protocol secure 安全超文本传输协议
MAC  message authentication code   消息验证码
MD5 message digest 5   消息摘要算法5
PKI public key infrastructure  公共基础设施
RSA  rivest shamir and adleman  非对称秘钥算法的一种
SHA secure hash algorithm    安全散列算法
SSL secure sockets layer   安全套接层
VPN virtual private network   虚拟专有网络






*证书作用:*
验证域名所有权.  还有加密信息功能.保护客户和网站之间的信息传输不给窃听.

- 交易类网站 需要有 SSL 才显得网页安全和正规.


*CA:*
 SSL 证书 需要向 CA 申请


*SSL证书类型*

- 域名证书DV SSl:普通信任级:验证网站真实性
- 企业证书OV SSl:较高信任级:验证企业身份.
- 增强证书EV SSL:最高信任级:银行/证券机构.
	> 可激活绿色网址图标

*个人博客/中小企业. 只需要 DV SSL 就足够了...*
其实没值得真正加密的信息.  



*DV SSL: 申请流程简单 费用低 (还有免费的)*
> 沃通（Wosign）免费DV证书：  
> 签发快，界面和官方资料都是中文。
> 问题是上次CNNIC的二级CA冒签Gmail的证书引起争议，在国内有些人预防性拉黑所有国内CA的证书，包括沃通的。他们浏览你的站点时会被拦截和警告。


*StartSSL  DV 证书免费 有效期一年* [Website Link.][1]




**申请流程:**    [详细教程链接][2]


- 去官网注册账号(sign-up)
- 填写邮箱,接受验证码.并填回进行验证.
- 自动给你浏览器 安装一个:  
	唯一属于自己管理 startssl的个人证书.
	(浏览器 F12→ security 查看证书. 看到有效期)



## 1. 申请证书 并下载:
网站给你.csr
自己生成一个 .key

01. 生成本地私钥:
	`openssl genrsa -out privateKey.pem 2048 `
	privatekey.pem  是您的私钥,妥善保管.
02. 生成证书请求文件:
	`openssl req -new -key privateKey.pem -out server.csr`
	> server.csr 是您的证书请求文件. 用这个文件的内容去申请证书.
03. 获取 csr 文件内容:  用 vi / sublime 打开
04. 前往 Startssl 网站 填入 csr 内容.申请证书.
05. 申请 & 下载:action → retrieve 取回/下载的意思…
	下载好是一个 .zip  解压出来
	用 sublime  打开. 里面会有4个文 小的 zip

	1. apacheserver.zip
		2. iisserver.zip
		3. nginxserver.zip
		4. otherserver.zip





## 本地 配置:
下载来的 csr 找到对应的 web 服务器.

比如:apache.网站.
  apacheserver.zip 下有两个文件.
> nginx 就不用 已经直接帮你合并好了.

要手动把 两个文件合并成一个新文件:
1. root .crt 里面的内容 复制到 域名. crt 文件中
	2. 保存 生成一个新 .crt文件.
		这个涉及到 证书链. 具体看下面.





### Mac Apache SSL setup:

准备好 新的 .crt 和  之前命令生成的 .key 就可以直接在 apache 上配置了.



*首先我们需要生成私钥。*
StartSSL可以为你生成一个私钥，但私钥最好是自己来生成。因为CA证书的私钥只有自己可以看，不能给任何他人看.


`openssl genrsa -aes256 -out my-private-encrypted.key 4096`

这样一个 加密的 私钥就生成了. my-private-encrypted.key


**解密私钥!**

`openssl rsa -in my-private-encrypted.key -out my-private-decrypted.key`

私钥就被解密了 变成: private-decrypted.key

公钥由经过解密的私钥生成!!!!!

。它将要求你输入一些信息。我们可以一路按回车键，不输入信息，因为StartSSL不会理睬CSR文件中的这些信息，它只关心CSR里的公钥。






获得了一个 CA 证书.(由两个文件合并成一个的 新的 crt)
> 这步 也就是 证书链路.
把这个文件 保存到服务器上. 并起名:
0214.help.crt












*证书链:*

CA证书是用来证明你的服务器是经过CA机构认证的。

那么怎么来认证这些CA机构呢？
怎么才能让浏览器信任这个CA机构呢？

CA机构分两类:
- Root CA，
- 中介CA。

1. 如果给你签发证书的机构是一个Root CA，那么现在证书链已经创建好了，
	因为浏览器中内置了Root CA名单，这些Root CA都是受浏览器信任的。

2. 但如果你的CA证书是由中介CA签发的话，那么我们还需要取得Root CA对中介CA签发的中介CA证书。

	因为我们从StartSSL取得的免费CA证书是由StartSSL中介CA签发的。

	所以我们现在需要取得StartSSL的中介CA证书。
	然后，将你的CA证书和StartSSL的中介CA证书合并在一个文件中，

3. 当浏览器查看unified.crt证书文件时，首先看到的是StartSSL给你签发的免费CA证书，然后往下看到Root CA给StartSLL签发的中介CA证书。这两个证书与浏览器内置的Root CA名单形成了一个完整的证书链。







把证书安装在自己 web 服务器上!!!


## nginx:

1. 将经过解密的私钥复制到/etc/ssl/private/目录下：
2. 将合成的证书文件复制到/etc/ssl/certs/目录下：


3. 然后编辑Nginx配置文件
	作如下修改，301重定向将使所有HTTP请求转成HTTPS。


server {
	 listen 80;
	 server_name linuxbabe.com;
	 return 301 https://$server_name$request_uri;
}

server {
	 listen 443 ssl;
	 server_name linuxbabe.com;
	
	 ssl_certificate /etc/ssl/certs/unified.crt;
	 ssl_certificate_key /etc/ssl/private/my-private-decrypted.key;
	
	 root /var/www/html;
	 index index.php index.html index.htm index.nginx-debian.html;


保存文件后，输入下面的命令测试Nginx的配置是否正确：
sudo nginx -t
然后重启Nginx：
sudo service nginx restart 或 sudo systemctl restart nginx







## apache 安装
必须 解密私钥.



在使用证书证书之前还需要对生成的秘钥解密，可使用命令openssl rsa -in ssl.key -out ssl\_decrypted.key，或者是StartSSL提供的工具: Tool Box - Decrypt Private Key，生成的内容另存为文件，如ssl\_decrypted.key。





6、Apache下的安装
参考这篇文章（http://blog.mowd.tw/index.php?pl=950）
 
如果使用的是加密的ssl.key 则每次启动apache时都要输入密码。（未测试）
 
在httpd.conf 中增加一下内容：注意ssl.key 是解密的。
 SSLCertificateFile /etc/pki/tls/certs/ssl.crt  
SSLCertificateKeyFile /etc/pki/tls/private/ssl.key  
SSLCertificateChainFile /etc/pki/tls/sub.class1.server.ca.pem  
SSLCACertificateFile /etc/pki/tls/ca.pem




1.  首先检查 apache  有没有安装 `mod_ssl`



接下來將 ssl.key 上傳到 /etc/pki/tls/private/
將 ssl.crt 上傳到 /etc/pki/tls/certs/
將 sub.class1.server.ca.pem 以及 ca.pem 上傳到 /etc/pki/tls/




3. 前面提到我們取得的私鑰 ssl.key 是加密過後的  
	如果沒有解密的話，每次 Apache 啟動後都要輸入密碼  
	解密步驟如下：
# cd /etc/pki/tls/private/
# openssl rsa -in ssl.key -out ssl.key
接下來會提示你輸入私鑰密碼，輸入完就解密囉


4. 再來打開 /etc/httpd/conf.d/ssl.conf  
	將 ssl.conf 內各項憑證的路徑及檔案修改如下
SSLCertificateFile /etc/pki/tls/certs/ssl.crt
SSLCertificateKeyFile /etc/pki/tls/private/ssl.key
SSLCertificateChainFile /etc/pki/tls/sub.class1.server.ca.pem
SSLCACertificateFile /etc/pki/tls/ca.pem
5. 儲存後重新載入 Apache，SSL 就生效囉




## Mac Apache SSL 设置


1. 申请并获得两个证书 .crt & .key   
	> ssl 申请网站给的                .key 自己电脑生成的.

2. 把这两个文件 放在服务器的 某个目录:如:

	-  SSLCertificateFile /private/etc/apache2/ssl/server.crt
	-  SSLCertificateKeyFile /private/etc/apache2/ssl/server.key

3. 配置几个文件



	/private/etc/apache2/httpd.conf ，编辑这个文件去掉下面三行前面的 '#'
	`LoadModule ssl_module libexec/apache2/mod_ssl.so`
	`Include /private/etc/apache2/extra/httpd-ssl.conf`
	`Include/private/etc/apache2/extra/httpd-vhosts.conf`


	(Mac 10.11 是已经开启的 确认下就好.)
	/private/etc/apache2/extra/httpd-ssl.conf，编辑这个文件去掉下面两行前面的 '#'
	\`SSLCertificateFile "/private/etc/apache2/server.crt"
	\`\`SSLCertificateKeyFile "/private/etc/apache2/server.key"
	\`



	/private/etc/apache2/extra/httpd-vhosts.conf ，编辑这个文件在 'NameVirtualHost\*:80' 后面添加：
	`NameVirtualHost *:443`






4. 确保 443 服务器 443 端口已经打开

5. 用 apache 来监听 443






apache 支持 ssl  需要
1. 安装 openssl
	> Mac验证方法: openssl version

2. 安装  apache. (Mac 自带 )

3. 验证 ssl 模块是否存在.
































[1]:	[https://www.startssl.com/]
[2]:	https://www.freehao123.com/startssl-ssl-apache-ngnix/