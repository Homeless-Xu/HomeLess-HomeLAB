## 启用/测试 PHP 5.0

 1. sudo vi /etc/apache2/httpd.conf

	2. 去掉这行前面的注释 
		LoadModule php5_module libexec/apache2/libphp5.so

	3. 重启 Apache：
		`sudo apachectl restart`

		现在 PHP 应该已经开始工作了，
		你可以在用户级根目录下(/Sites/)放一个PHP测试文件，
		代码如下：
		`<?php phpinfo(); ` 保存 a.php



**测试PHP**

1. 默认网站目录下 放个最简单的index.php文件
	- 目录:	`/Library/WebServer/Documents`
	- index.php 文件内容
		`<?php phpinfo();`
		注意! 最后是没有 `>` 符号的
		> 需要 `sudo vi index.info`   
		> 不然没权限新建文件.

2. 浏览器输入: `localhost:index.php`

	3. 出现复杂页面就说明对了.
		 

---- 
*启用用户目录 (option)*

1. `cd /etc/apache2/users/`  
	新建个配置文件
	- `sudo vi username.conf`  这里是 → `sudo vi v.conf`
		> username为登录的用户名
		内容为：
		` <Directory "/Users/v/Sites/">``
		``  AllowOverride All`
		`  Options Indexes MultiViews followSymlinks`
		`  Require all granted`
		`  </Directory>`

		- 将username.conf的权限改为644。
			`sudo chmod 644 v.conf`


		2. `vi /etc/apache2/httpd.conf`
			将下面四句话的注释(#号)去掉：
			`LoadModule authz_core_module libexec/apache2/mod_authz_core.so `
			`LoadModule authz_host_module libexec/apache2/mod_authz_host.so `
			`LoadModule userdir_module libexec/apache2/mod_userdir.so       `
			`Include /private/etc/apache2/extra/httpd-userdir.conf          `
			`>最后一行作用是启用用户目录配置	  `

		3. `sudo vi /etc/apache2/extra/httpd-userdir.conf`
			去掉下面行的 注释
			`Include /private/etc/apache2/users/*.conf`

		4. `sudo apachectl restart`  →  重启apache,

		5. 浏览器访问:`http://loacal/~username/`
			> sites 下面要新建个 index.html 文件. 浏览器访问的就是这个网页
