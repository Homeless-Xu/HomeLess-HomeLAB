## PHP5 → PHP7 Mac 

`curl -s http://php-osx.liip.ch/install.sh | bash -s 7.0`


1. run the above commadn
	> download need some minutes.
	> it will install for you auto.

2. create a index.php file 
 3. webbrowser: localhaost/index.php
4. show php7 that is ok




%% as there is an old version.
%% the new install will comment out the PHP module inside the apache web config in /etc/apache2/httpd.conf
%% LoadModule php5_module libexec/apache2/libphp5.so
%% 
%% It will load the new PHP version via the /etc/apache2/other/+php-osx.conf file.
%% So to reverse the behaviour uncomment the older PHP module in httpd.conf and remove the new config in other.