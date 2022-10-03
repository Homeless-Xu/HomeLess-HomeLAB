## CURL

文件传输工具.  获取网页


`curl -V` 查看支持的协议类型
> 可以看到 确实没有 HTTPS.

curl-7.49.1 curl -V
curl 7.49.1 (x86_64-apple-darwin15.6.0) libcurl/7.49.1 zlib/1.2.5
Protocols: dict file ftp gopher http imap ldap ldaps pop3 rtsp smtp telnet tftp
Features: IPv6 Largefile libz UnixSockets



*Mac 支持 Https 解决方法*:
下载curl源码包. 编译的时候 加上— with-darwinssl 选项
`./configure --with-darwinssl`

然后 make   
然后 sudo make install
然后再看看 curl -V 就有 https 了.


---- -
*reinstall curl :*

[下载源代码][1]   选tar.gz 这个格式.


tar -xzf curl-***.tar.gz
cd curl-*.*.*
./configure --with-darwinssl
make
sudo make install

这里的 --with-darwinssl 是关键.




[1]:	https://curl.haxx.se/download.html