## Linux 
# Linux-Basic  简介

- Linux: 由 unix 演变过来, Linux 的内核是免费的.
- 发行版: Linux内核 + 应用软件 做一个打包. 有些收费,有些免费.
- 知名发行版: Ubuntu、RedHat、CentOS、Debian、Fedora、SuSE…….
- CentOS :ReaHat 企业版的克隆.相当稳定.

> 学习建议: 学命令窗口,不用图形界面.  
> init: 系统所有进程的起点(老祖宗)没有这个进程,任何进程都启动不了.


| Hotkeys  |         简介        |
|:-------- |:------------------:|
| Tab      | 命令目录补全         |
| Ctrl + C | 终止当前命令.        |
| Ctrl + D | 退出当前终端 = exit |
| Ctrl + Z | 暂停进程,fg 恢复     |
| Ctrl + L | 清屏.              |


# Man  查看帮助文档.




# 系统根目录结构

	bin   dev  home  lib64    media  opt   root sbin  sys  usr
	boot  etc  lib   lost+found  mnt  proc  run srv   tmp  var

- /bin  Binary (二进制)的缩写。这个目录存放着最经常使用的命令。
- /boot Linux 核心文件，包括一些连接文件以及镜像文件。
- /dev  Device(设备)的缩写。存放 Linux 的外部设备，  
	> 在 Linux 中访问设备的方式和访问文件的方式是相同的。
- /etc 所有的系统管理所需要的配置文件和子目录。
- /home 用户的主目录,每个用户一个目录.
- /lib 这个目录里存放着系统最基本的动态连接共享库，其作用类似于 Windows 里的 DLL 文件。几乎所有的应用程序都需要用到这些共享库。
- /media 例如U盘、光驱等等，当识别后，linux 会把识别的设备挂载到这个目录下。
- /mnt 系统提供该目录是为了让用户临时挂载别的文件系统的，如:光驱.
- /opt 这是给主机额外安装软件所摆放的目录。比如你安装一个 ORACLE 数据库则就可以放到这个目录下。默认是空的。
- /proc 这个目录是一个虚拟的目录，它是系统内存的映射，我们可以通过直接访问这个目录来获取系统信息。这个目录的内容不在硬盘上而是在内存里，我们也可以直接修改里面的某些文件，比如可以通过下面的命令来屏蔽主机的 ping 命令，使别人无法 ping 你的机器：
echo 1 \> /proc/sys/net/ipv4/icmp\_echo\_ignore\_all。
- /root 该目录为系统管理员，也称作超级权限者的用户主目录。
- /sbin s 就是 Super User 的意思，这里存放的是系统管理员使用的系统管理程序。
- /srv 该目录存放一些服务启动之后需要提取的数据。
- /tmp 这个目录是用来存放一些临时文件的。
- /usr 重要目录，用户的很多应用程序和文件都放在这.
> 类似与 windows 下的 program files目录。
- /usr/bin：系统用户使用的应用程序。
- /usr/sbin：超级用户使用的比较高级的管理程序和系统守护程序。
- /usr/src：内核源代码默认的放置目录。
- /var 这个目录中存放着在不断扩充着的东西，我们习惯将那些经常被修改的目录放在这个目录下。包括各种日志文件。

在 linux 系统中，有几个目录是比较重要的，平时需要注意不要误删除或者随意更改内部文件。  
/etc： 这个是系统中的配置文件，更改该目录可能会导致系统不能启动。  
/bin, /sbin, /usr/bin, /usr/sbin: 这是系统预设的执行文件的放置目录，比如 ls 就是在 /bin/ls 目录下的。值得提出的是，/bin, /usr/bin 是给系统用户使用的指令（除 root 外的通用户），而 /sbin, /usr/sbin 则是给 root 使用的指令。  
/var： 这是一个非常重要的目录，系统上跑了很多程序，那么每个程序都会有相应的日志产生，而这些日志就被记录到这个目录下，具体在 /var/log 目录下，另外 mail 的预设放置也是在这里。



### 如何正确关机

如果你要关机，必须要保证当前系统中没有其他用户在线。  
查看在线用户: who 这个指令，  
查看网络状态， netstat -a 这个指令，  
查看背景执行的程序: ps -aux 这个指令。

#### 正确的关机流程为：sysnc ? shutdown ? reboot ? halt
sync 将数据由内存同步到硬盘中。
shutdown 关机指令，你可以man shutdown 来看一下帮助文档。例如你可以运行如下命令关机：
shutdown –h 10 ‘This server will shutdown after 10 mins’ 这个命令告诉大家，计算机将在10分钟后关机，并且会显示在登陆用户的当前屏幕中。
Shutdown –h now 立马关机
Shutdown –h 20:25 系统会在今天20:25关机
Shutdown –h +10 十分钟后关机
Shutdown –r now 系统立马重启
Shutdown –r +10 系统十分钟后重启
reboot 就是重启，等同于 shutdown –r now
halt 关闭系统，等同于shutdown –h now 和 poweroff
最后总结一下，不管是重启系统还是关闭系统，首先要运行 sync 命令，把内存中的数据写到磁盘中。关机的命令有 shutdown –h now halt poweroff 和 init 0 , 重启系统的命令有 shutdown –r now reboot init 6。


### 忘记 root 密码如何做
Windows 忘记管理员密码，用光盘清除密码.  
linux   忘记 root 密码，进入单用户模式更改一下 root 密码即可。

