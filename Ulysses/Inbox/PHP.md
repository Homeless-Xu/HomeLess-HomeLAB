## PHP:

-  卸载PHP5 : 删除下面文件夹 (只需执行sudo).

		/private/etc/               
	sudo rm -rf php-fpm.conf.default php.ini php.ini.default    
		/usr/bin/
	sudo rm -rf php php-config phpdoc phpize    
		/usr/include                
	sudo rm -rf php

		/usr/lib                    
	sudo rm -rf php

		/usr/sbin                   
	sudo rm -rf php-fpm

		/usr/share                  
	sudo rm -rf php

		/usr/share/man/man1         
	sudo rm -rf php-config.1 php.1 phpize.1

		/usr/share/man/man8         
	sudo rm -rf php-fpm.8


- 安装 PHP7 :  
	> brew / 编译源代码 二选一.

- brew 安装:

		brew install --devel https://raw.githubusercontent.com/guoxiao/homebrew-php7/master/php7.rb

- 源代码编译:
	- 官网下载: https://downloads.php.net/ab/
	- 下载到桌面 → 终端 cd 到桌面  → 解压 安装包  
		    tar -xf php-7.0.4RC1.tar.gz

- cd 到解压文件夹 
	- ./configure
	- make 
	- make inatall




# PHP

zabbix 对 PHP 参数、 PHP 模块有特殊要求;

#### PHP - Zabbix 特例

Zabbix 要额外安装下面的PHP模块:
  
安装方法: ./configure 后面加  --enable-bcmath --enable-mbstring 等等.

bcmath        --enable-bcmath
mbstring    --enable-mbstring
sockets        --enable-sockets
gd            --with-gd
libxml        --with-libxml-dir=/usr/local
xmlwriter    同上
xmlreader    同上
ctype        默认支持
session        默认支持
gettext        默认支持


以下是教程PHP的配置参数 \作用是换行. php-5.5.7 都换成你下载的版本.

	./configure  --prefix=/usr/local/php-5.5.7 \
	—with-config-file-path=/usr/local/php-5.5.7/etc --with-bz2 --with-curl \
	—enable-ftp --enable-sockets --disable-ipv6 --with-gd \
	—with-jpeg-dir=/usr/local --with-png-dir=/usr/local \
	—with-freetype-dir=/usr/local --enable-gd-native-ttf \
	—with-iconv-dir=/usr/local --enable-mbstring --enable-calendar \
	—with-gettext --with-libxml-dir=/usr/local --with-zlib \
	—with-pdo-mysql=mysqlnd --with-mysqli=mysqlnd --with-mysql=mysqlnd \
	—enable-dom --enable-xml --enable-fpm --with-libdir=lib64 --enable-bcmath
	然后:
	make && make install





#### PHP - Zabbix 修改 php.ini

打开php.ini配置文件 /etc，
修改参数为如下值，否则zabbix安装不了。

	max_input_time = 300          121行
	max_execution_time = 300      371行
	post_max_size = 16M           660行
	date.timezone PRC             910行
	memory_limit = 128M
	upload_max_filesize = 2M
 








