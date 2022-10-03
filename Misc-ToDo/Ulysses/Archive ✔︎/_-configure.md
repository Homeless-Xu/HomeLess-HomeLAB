## ./configure

**源码包安装**
1. 配置 `./configure`
	2. 编译 `make`
		3. 安装 `make install`
		> 这一步本质上就是把上一步编译出来的结果复制到我们指定的目录而已

**Configure是一个可执行脚本**
> 在待安装的源码路径下使用命令
`./configure –h` 输出详细的选项列表。

`--prefix`  **安装的路径**
*默认安装位置*
**可执行文件**  `/usr/local/bin`
**库文件**      `/usr/local/lib`
**配置文件**    `/usr/local/etc`
**其它文件**    `/usr/local/share`

*配置prefix*
`./configure --prefix=/usr/local/test`
> 把所有文件放在/usr/local/test的路径中.
*prefix 好处*
**卸载软件：**删除该安装目录，就可完全卸载干净；
**移植软件：**拷贝整个目录到另外一个机器即可；

*make*
一个程序有好多文件需要编译.
这些文件是有依赖关系的
makefile 管理这些关系.
一个个去编译 太麻烦 所以就有了 make.


*makefile: *
源代码包解压出来一堆文件
这些文件是有依赖关系的
用来指导 make 命令该怎么工作 .
 
makefile 是自动生成的.  自动生成 makefile 需要两个文件.  分别是 configure 和 makefile.in  
 configure 文件是由 autoconf 命令 生成的.
 makefile.in 是由 automake 命令 生成的.
 
 软件包为什么要带 configure 文件呢  直接给 makefile 不就成了么.
 因为 configure 要 根据你系统平台 来生成 makefile 文件.
 

gcc:    GNU CC  也就是C编译器，
g++:    才是cpp编译器




在电脑中自动安装、配制、卸载和升级软件包的工具组合.

在Linux发行版中，几乎每一个发行版都有自己的软件包管理系统。  
常见有:  
管理deb软件包的dpkg以及它的前端apt（使用于Debian、Ubuntu）。  
rpm以及它的前端yum（使用于Fedora）、前端ZYpp（使用于openSUSE）、 前端urpmi（使用于Mandriva Linux、Mageia）等。  
使用软件包管理系统将大大简化在Linux发行版中安装软件的过程。




RPM，全称为RPM Package Manager，是由Red Hat推出的软件包管理系统，现在在各种发行版中普遍使用。

dpkg是Debian Package的简写，由Debian发行版开发，用于安装、卸载和供给和deb软件包相关的信息。



软件包管理系统:
分成两组
 一组使用RPM(Red Hat Package Manager),  
 而另一组使用dpkg包管理器.  
  我们选择两种基于RPM的发行版, CentOS和SUSE, 在企业中流行. 取代使用Debian作为一个基于dpkg的发行版,  
 我们选择Ubuntu因为他在初学者中广泛流行. 由于Ubuntu派生于Debian, 讨论Ubuntu的章节也适用于Debian不需要大的修改.


预编译软件:缺点 不会安装最新的版本到你电脑. 也就是更新慢.

从源码安装软件是configure, make, make install的同义词. 我们将使用发型吧的包管理器来从源码编译新的软件.


从源码编译
有时有需要来安装最新版本的软件或者包含一些预编译软件没有支持的模块. 这需要从源码编译软件. 大多数开源软件包是作为一个TAR压缩包发布的. TAR实际上可以指用于创建TAR文件的程序(名称是tape archive的简写)或者合成文件的文件格式. 一个TAR文件也通常是压缩的来减少体积. 文件名将会表示压缩的格式. 一个文件名以.tgz或者.tar.gz结尾使用gzip. 一个文件名以.tbz, .tb2, 或者.tar.bz2结尾使用bzip2压缩. 为了编译软件我们解压这个文件, 然后执行命令configure, make和make install在解压的文件夹内.
然而有更好的方式利用发行版的包管理系统来编译软件. 不是所有的TAR文件帮助这个容易实现, 但是FreeRADIUS是这样一个成熟的项目, 允许在任意这3个发行版上从源码编译软件.



编译包的优势
下面是一些从源码编译包的优势
• 容易安装, 升级, 卸载或发布软件.
• 容易检查那个版本的软件是安装的.
• 能够看到哪些文件被安装, 哪些发行版相关的修改.
既然你已经确定用这种方式编译包, 我们将会为每个发行版来做他.


从源码编译FreeRADIUS需要许多开发库. 标准的SLES仓库不需要全部包含他们他们, 甚至当使用的SDK DVD是SLES的一部分. 我们因此需要添加OpenSUSE仓库. 这将会满足所有的开发库需求.

1   通过下面的URL定位离你最近的OpenSUSE镜像: http://mirrors.opensuse.org
2   使用root用户开始YAST.
3   选择Software | Software Repositories并且然后选择Add来添加到一个仓库.
4   添加在开始时你选择的OpenSUSE镜像. 对于我的OpenSUSE11.3最近的URL是: ftp://opensuse.mirror.ac.za/opensuse/distribution/11.3/repo/oss/suse
5   你可能要被接受GnuPG密钥的导入对于新的仓库. 选择Import来继续.
这个设置编译FreeRADIUS RPM的阶段. 现在遵循下面的步骤:
1   从官网下载最新的.tar.bz2格式的FreeRADIUS源码.
2   SLES包括一个目录结构专门用于编译RPM. 位于/usr/src/packages. 拷贝原始的bz2源文件到SOURCES目录. 替换x和y为对应的版本. cp freeradius-server-2.x.y.tar.bz2 /usr/src/packages/SOURCES/.
3   从TAR文件解压SUSE RPM .spec文件, 替换x,y为对应版本.# cd /usr/src/packages/SOURCES/
4   # tar -xvjf freeradius-server-2.x.y.tar.bz2 freeradius-server-2.x.y/suse/freeradius.spec
5  
6   拷贝下面的文件到/usr/src/packages/SPECS目录:# cp freeradius-server-2.x.y/suse/freeradius.spec ../SPECS/
7  
8   编辑spec文件的下面的行, 修改%{fillup\_and\_insserv -s freeradius START\_RADIUSD}为%{fillup\_and\_insserv freeradius}.
9   运行下面的命令来决定依赖. rpmbuild -ba /usr/src/packages/SPECS/freeradius.spec
10  这个将会列出必要的开发包来安装, 为了FreeRADIUS RPM被编译. 在你的系统上的列表可能不同. 下面是我的系统上的结果(用zypper安装他们)zypper in db-devel e2fsprogs-devel gcc-c++ gdbm-devel gettext-devel glibc-devel ncurses-devel openldap2-devel openssl-devel pam-devel postgresql-devel python-devel unixODBC-devel zlib-devel apache2-devel cyrus-sasl-devel krb5-devel libapr1-devel libmysqlclient-devel
11  
12  再次运行rpmbuild命令. 如果所有的依赖都满足, RPM的编译将会开始. 把结果tee到一个文件用于将来的调查.rpmbuild -ba /usr/src/packages/SPECS/freeradius.spec | tee /tmp/build\_out.txt
13  
14  当编译完成, RPM位于/usr/src/packages/RPMS/\<architecture\>/目录.
15  使用下面命令安装新的FreeRADIUS包.# cd /usr/src/packages/RPMS/\<architecture\>/
16  # zypper in freeradius-server-2.x.y-0.i586.rpm freeradius-server-libs-2.x.y-0.i586.rpm freeradius-server-utils-2.x.y-0.i586.rpm
17  
18  注意默认FreeRADIUS将会已用户radiusd运行. 这个用户是在安装FreeRADIUS过程中创建的. 给这个用户certs目录的权限. 否则会安装失败.chown -R radiusd. /etc/raddb/certs
19  
20  通过radiusd -X来确认radiused可以正确启动.
21  Ctrl+C将会停止正在运行的FreeRADIUS. 你现在可以使用下面的启动脚本来启动FreeRADIUS/etc/init.d/freeradius start







功能 : 免去手动编译安装  

|系统|软件管理器|
|:---:|:---:|
|Mac| brew(手动安装)  |
|CentOS | yum (自带) | 
|ubuntu | apt-get | 
|Debian ||


# Mac brew

## 使用方法   （以wget为例）
|命令|作用|
|:---:|:---:|
查找软件包              列出已安装的软件包         安装软件包                   删除软件包
brew search wget         brew list          brew install wget      brew remove wget


查看软件包信息           列出软件包的依赖关系
brew info wget            brew deps wget

 更新brew       列出过时的软件包                更新过时的软件包（全部或指定）
brew update      brew outdated           brew upgrade  或  brew upgrade wget






Centos  yum

源 [http://itgeeker.net/centos-7-epel-china-mirror-repository/][1]
查找软件 yum search
更新软件 yum update
列出软件信息 yum list installed ppp





# Debian:

默认自带 apt-get  用 sudo 运行  

|            命令            |                    作用                    |
| :----------------------: | :--------------------------------------: |
|           安装软件           |         apt-get install softname         |
|           卸载软件           |         apt-get remove softname          |
|           重装软件           |        apt-get —reinstall install        |
|           搜索软件           |             apt-cache search             |
|          更新已装软件          |              apt-get update              |
|          修复安装软件          |       apt-get -f install softname        |
|          删无用软件           |              apt-get clean               |
|          了解使用依赖          |            apt-cache depends             |
|         下载软件源代码          |              apt-get source              |
|         列出软件包的内容         |        apt-file list packagename         |
|           完整卸载           |      apt-get --purge remove 删除配置文件.      |
|           彻底卸载           | apt-get autoremove --purge 删除依赖软件包+配置文件. |
|                          |                                          |
|                          |                                          |
|     apt-get check #      |                检查是否有损坏的依赖                |
|     dpkg -S filename     |            查找filename属于哪个软件包             |
| apt-file search filename |            查找filename属于哪个软件包             |
|     apt-file update      |              更新apt-file的数据库              |

## T软件安装方法:

用软件包管理器: 直接安装. 的

|||

| :---: | :---: |
| ----- | ----- |
|       |       |



huo'z 

|      |      |      |
| ---- | ---- | ---- |
|      |      |      |
|      |      |      |
|      |      |      |




[1]:	http://itgeeker.net/centos-7-epel-china-mirror-repository/