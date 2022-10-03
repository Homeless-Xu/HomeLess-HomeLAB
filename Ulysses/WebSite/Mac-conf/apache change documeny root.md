
通过下面的虚拟主机 默认设置  也可以改路径成你自己的 如桌面文件夹.


[https://jason.pureconcepts.net/2014/11/configure-apache-virtualhost-mac-os-x/][1]


而不用改 httpd.conf 的默认 路径. 
只要新加个 虚拟主机设置就可以了..
要改回去 只要注释掉新加的行就行.

/Users/myname/Desktop/Stuff/Development




Yes you can't just change DocumentRoot without giving the permission to new path. If you must use it you have to add chmod +x to each path, in your case those are
User myname ... Development
It is not safe to do so. I would user a folder doesn't involved Users.



\<VirtualHost *:80\>
  2          DocumentRoot "/Users/v/Desktop/cs"
  3          ServerName 0214.help.local
  4          ErrorLog "/private/var/log/apache2/0214.help.local-error_log"
  5          CustomLog "/private/var/log/apache2/0214.help.local-access_log" common
  6
  7          \<Directory "/Users/v/Desktop/cs"\>
  8              AllowOverride All
  9              Require all granted
 10          \</Directory\>
 11 \</VirtualHost\>

[1]:	https://jason.pureconcepts.net/2014/11/configure-apache-virtualhost-mac-os-x/