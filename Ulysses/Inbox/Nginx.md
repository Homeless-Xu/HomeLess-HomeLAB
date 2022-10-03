## Nginx
是一个网页服务器， 性能高.多进程模式

启动后 会有 一个 master 和 多个 worker 进程
master 管理 worker  





它能反向代理HTTP, HTTPS, SMTP, POP3, IMAP的协议链接，以及一个负载均衡器和一个HTTP缓存

版本: nginx -v

相较于Apache、lighttpd具有占有内存少，稳定性高等优势。

整体采用模块化设计是nginx的一个重大特点，甚至http服务器核心功能也是一个模块。要注意的是：nginx的模块是静态的，添加和删除模块都要对nginx进行重新编译，这一点与Apache的动态模块完全不同。


其特点是占有内存少，并发能力强，事实上nginx的并发能力确实在同类型的网页服务器中表现较好，中国大陆使用nginx网站用户有：百度、新浪、网易、腾讯等。
