## MariaDB
## MariaDB 编译安装: [官网连接][1]

### 官网下载/解压/进入文件夹:
	wget http://mirror.aarnet.edu.au/pub/MariaDB//mariadb-10.1.8/source/mariadb-10.1.8.tar.gz ; tar -xzf mariadb-10.1.8.tar.gz ; cd mariadb-10.1.8

### 安装 cmake 编译工具 [官网][2]
> - mariadb 由 cmake 编译而成.
> - 编译 cmake 又需要 安装几个相应组件.

	apt-get install gcc
	
	sudo apt-get install build-essential
	
	apt-get install libncurses5-dev
	上面三条是安装相应组件
	下面是安装 下载 编译 cmake
	wget https://cmake.org/files/v3.4/cmake-3.4.0-rc2.tar.gz ; tar -xzf cmake-3.4.0-rc2.tar.gz ; cd cmake-3.4.0-rc2
	
	./configure ; make ; make install

然后 回到 mariadb 目录 进行编译安装 (安装很慢的.)

	cd ..   ; cmake . ; make ; make install
  
> - cmake指定编译选项的方式不同于make
> - 编译不成功 再次编译需要清楚缓存  再编译.       
> - rm CMakeCache.txt


安装好 后  mysql -V 查看版本



以下會介紹在 Debian 安裝及設定 MariaDB Server 的步驟:
1. 安裝 “python-software-properties” 套件
# apt-get install python-software-properties
# apt-key adv –recv-keys –keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
2. 加入 MariaDB 官方 repository:
# add-apt-repository ‘deb http://mariadb.biz.net.id//repo/10.1/debian sid main’
# apt-get update
3. 安裝 MariaDB Server 及 Client:
# apt-get install mariadb-server mariadb-client
安裝時系統會詢問新的 MariaDB root 密碼, 建議設定新的密碼, 不要用預設的空密碼。
完成安裝後, 可以用以下指令嘗試連接到 MariaDB, 密碼是剛剛設定的密碼。如果可以成功連接, 那便表示安裝成功了。
# mysql -u root -p
Quick Adsense WordPress Plugin: http://quicksense.net/

mac os  安装 mariadb

brew install cmake

brew install gcc




下载 mariadb 解压  

	wget http://mirror.aarnet.edu.au/pub/MariaDB//mariadb-10.1.8/source/mariadb-10.1.8.tar.gz ; tar -xzf mariadb-10.1.8.tar.gz ; cd mariadb-10.1.8
	
	cmake .
	make
	make install
 
 





























[1]:	https://downloads.mariadb.org/mariadb/repositories/
[2]:	https://cmake.org/download/