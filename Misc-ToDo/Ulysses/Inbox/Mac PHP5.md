## Mac PHP5

**开启 PHP5:**
`vi /etc/apache2/httpd.conf`
找到`LoadModule php5_module libexec/apache2/libphp5.so`
将其放开注释就行了。


测试 写个 \<?php phpinfo(); ?\> 的 index.php
浏览器输入
`http://localhost/~username/index.php`
有网页显示就行了  不能都是文字的.














