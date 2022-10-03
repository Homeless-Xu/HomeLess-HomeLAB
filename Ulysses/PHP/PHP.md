## PHP
http://php-osx.liip.ch/     官网
 
启用 PHP
Mountain Lion 中已经集成了 PHP 5.3.13 版本，也需要手动开启。你可以用 vi 或者 nano 编辑器打开下面这个文件：
sudo nano /etc/apache2/httpd.conf
然后搜索“php”，第一条匹配的应该是下面这句代码：
LoadModule php5\_module libexec/apache2/libphp5.so
请将这句代码前面的#去掉，然后保存文件。
接下来再一次重启 Apache：
sudo apachectl restart
现在 PHP 应该已经开始工作了，你可以在用户级根目录下(/Sites/)放一个PHP测试文件，代码如下：
\<?php phpinfo(); ?\>
 
 















