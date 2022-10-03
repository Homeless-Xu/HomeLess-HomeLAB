## Bash & ZSH & Plugins

#### Shell Description :
 与操作系统核心 kernel (管理硬件)沟通的工具.通用性极强.
 
#### Shell Classify : 
- *Bash* → Linux 预设 shell 
- *Fish* → 小众 shell 90后适用 
- *ZSH*  → 功能更强大的 shell 

#### **安装&设置 Fish 为默认 Shell:
- 先安装新版本 shell   ( zsh fish ....)
-  /etc/shells 文件末尾添加  /usr/local/bin/fish
- 执行命令:   ` chsh -s /usr/local/bin/fish`

#### **安装&设置 ZSH 为默认 Shell:
- Mac 安装ZSH     `brew install zsh` 
	1. `vi /etc/shells`  
	2. 文件末尾添加下面内容  
	3. `/usr/local/bin/zsh`
	4. 执行： `chsh -s /usr/local/bin/zsh`

##### 安装oh-my-zsh* `curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh`
*oh-my-zsh 主题修改: *
/.zshrc文件中的ZSHTHEME即可,选择自己喜欢的主题。







=====




终端机 tty


变量的取用 echo $PATH
设定变量
myname=VBird  
echo $myname  
VBird \<==出现了!因为这个发量已经被讴定了! 

变量内容若有空格符可使用双引号『”』或者单引号『'』将发量内容结合起来,
双引号内的特殊字符如 $ 等,可以保有原本癿特性,如下所示: 
『var="lang is $LANG"』则『echo $var』可得『lang is en\_US』
单引号内癿特殊字符则仅为一般字符 (纯文本),如下所示: 
『var='lang is $LANG'』则『echo $var』可得『lang is $LANG』 

整体系统默认 bash定义在 /etc/sysconfig/i18n 

 locale
LANG="zh\_CN.UTF-8"
LC\_COLLATE="zh\_CN.UTF-8"
LC\_CTYPE="zh\_CN.UTF-8"
LC\_MESSAGES="zh\_CN.UTF-8"
LC\_MONETARY="zh\_CN.UTF-8"
LC\_NUMERIC="zh\_CN.UTF-8"
LC\_TIME="zh\_CN.UTF-8"
LC\_ALL=

￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ 
￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼
Ctrl +C 终止目前癿命令
Ctrl +D 输入结束 (EOF),例如邮件结束癿时候;
Ctrl +M  就是 Enter 啦!
Ctrl +U 在提示字符下,将整列命令初除
Ctrl +Z 『暂停』目前癿命令

星号￼ ￼ 代表『 0 个刡无穷多个』任意字符 
问好  代表『一定有一个』任意字符 
方括号 代表『一定有一个在括号内』癿字符(非任意字符)。
例如 [abcd]() 代表『一定有一个字 符, 可能是 a, b, c, d 这四个任何一 


井号 批注符号:这个最常被使用在 script 当中,规为说明!在后癿数据均丌执行 

\ 跳脱符号:将『特殊字符戒通配符』还原成一般字符  

| 管线 (pipe):分隑两个管线命令癿界定(后两节介绍); 
;连续挃令下达分隑符:连续性命令癿界定 (注意!不管线命令幵丌相同) 
&工作控刢 (job control):将挃令发成背景下工作 
! 逡辑运算意义上癿『非』 not 癿意思!
/  目录符号:路径分隑癿符号 
> , \>\>   数据流重导向:输出导向,分删是『叏代』不『累加』 
\<, \<\<  数据流重导向:输入导向 


  
数据流重导向 (redirect) 
数据流重导向就是将某个命令执行后应该要出现在屏幕上的数据, 给他传输刡其他的地方,例如文件戒者是打印机 !这玩意儿在 Linux 癿文本模式底下可重要! 

信息输出:  不管什么数据都输出到屏幕  屏幕当然乱了  

1. 标准输入 (stdin):代码为0,使用\<戒\<\<;
2. 标准输出 (stdout):代码为1,使用\>戒\>\>;
  3. 标准错诨输出(stderr):代码为2,使用2\>戒2\>\>;  



	1\> :以覆盖癿方法将『正确癿数据』输出刡挃定癿档案戒装置上; 
	1\>\>:以累加癿方法将『正确癿数据』输出刡挃定癿档案戒装置上; 
    2\> :以覆盖癿方法将『错诨癿数据』输出刡挃定癿档案戒装置上; 
    2\>\>:以累加癿方法将『错诨癿数据』输出刡挃定癿档案戒装置上;  
pipe  管线命令
双向重导向 tee

## 正确信息导出  standard output       简称 stdout  \> \>\>  默认1\> 1\>\>  

ll \>desklist  
ll: 显示文件列表.
> 输出信息到 desklist文件
/\> 文件已存在 就清空/覆盖文件 再写入  \> 文件不存在 新建文件 写入
/\>\> 文件已存在 就加入数据到文件末尾   文件不存在就新建. 

## 错误信息导出:  standard error output 简称  stderr  2\>   2\>\>

cat \> xujian   新建文件
cat \> xujian \< /vimrc   用 vimrc 里面的内容 写入到新建的文件里面.


多次命令依次进行.
sync;sync;shutdown -h now  
 
选择性执行命令
『 && 』及『 || 』

cmd1 && cmd2 
 1. 若 cmd1 执行完毕且正确执行($?=0),则开始执行 cmd2。 
2. 若 cmd1 执行完毕且为错诨 ($?≠0),则 cmd2 丌执行。 

cmd1 || cmd2  
1. 若 cmd1 正确 ($?=0),则 cmd2 不执行。 
2. 若 cmd1 错误 ($?≠0),则 cmd2 执行

 回传值:若前一个命令执行的结果为正确,在 Linux 底下会回传一个 $? = 0 癿值』。 

可以实现: (1)判断一个目录是 否存在; (2)若存在才在该目录底下建立一个档案。 
 



cut 截取命令: 一段命令  取自己想要的就行.   单位是行  

 export  
declare -x HISTSIZE="1000"  
declare -x INPUTRC="/etc/inputrc" 
declare -x KDEDIR="/usr"  
declare -x LANG="zh\_TW.big5"  


 export | cut -c 12-   (去掉前面的12个字符.)
cut -c 12-20  (显示 第12-20个字符)

HISTSIZE="1000" 
INPUTRC="/etc/inputrc" 
KDEDIR="/usr" 
LANG="zh\_TW.big5" 



**grep**  根据关键词 分析整个文件的信息, 列出包含关键词的所有行.

xujian | grep ‘xx’
把 xujian 这个文件里面   包含 xx 的那行取出来.
xujian | grep -v ‘xx’
把 xujian 这个文件里面  不包含 xx 的那行取出来.

xujian | grep ‘xx’ |cut -d ' ' -f1
把 xujian 这个文件里面   包含 xx 的那行取出来. 然后利用 cut 仅仅显示第一栏.

grep - - color=auto ‘xx’ /xujian      高亮关键字.  


-n 显示行号
-i 不区分大小写


grep -n ‘vi’ macvim.md
从文件中 找出带 vi 的行. (区分大小写)
grep -in ‘vi’ macvim.md
从文件中 找出带 vi 的行.(不区分大小写)



  


主机管理:

查询登陆信息
追踪流量
监控主机状态 

自动处理. 

举例来说,如果我们想要重新启动系统注册表档, 
可以使用: 『/etc/init.d/syslogd restart』,
那个 syslogd 档案就是 script 啦!  

我们可以通过 shell script 去分析『当该封包尝试几次还是 联机失败之后,就予以抵挡该 IP』

 scripts 也可以想成『仅是帮我们把一大串的指令汇整在一个档案里面, 而直接执行该档案就可以执行 那一串又臭又长的指令段!』就是这么简单啦!  



 

#### Shell Manual :



#### Man
man + 命令 : 非常详细的解释这个命令. 可以用 `/+关键字` 进行结果查询
上下方向键  → 上下行滚动
F / 空格   → 下一页
B          → 上一页








•	Ctrl + c，结束命令
•	TAB键，自动补全命令（按一次自动补全，连续按两次，提示所有以输入开头字母的所有命令）
•	键盘上下键，输入临近的历史命令
•	history，查看所有的历史命令
•	Ctrl + r，进入历史命令的搜索功能模式
•	clear，清除屏幕里面的所有命令
•	hostname，查看当前登陆用户全名
•	pwd，显示当前目录路径（常用）
•	firefox&，最后后面的 & 符号，表示使用后台方式打开 firefox，然后显示该进程的 PID 值
•	jobs，查看后台运行的程序列表
•	ifconfig，查看IP等信息（常用）
•	locate 搜索关键字，快速搜索系统文件/文件夹（类似 Windows 上的 everything 索引式搜索）（常用）
◦	updatedb，配合上面的locate，给locate的索引更新（locate默认是一天更新一次索引）（常用）
•	su：切换到 root 用户，终端目录还是原来的地方（常用）
◦	su -：切换到 root 用户，其中 - 号另起一个终端并切换账号
◦	su 用户名，切换指定用户帐号登陆，终端目录还是原来地方。
◦	su - 用户名，切换到指定用户帐号登陆，其中 - 号另起一个终端并切换账号
•	exit，注销当前用户（常用）
•	sudo 某个命令，使用管理员权限使用命令（常用）
•	passwd，修改当前用户密码（常用）
•	date，查看系统时间（常用）
◦	date -s20080103，设置日期（常用）
◦	date -s18:24，设置时间，如果要同时更改 BIOS 时间，再执行 hwclock --systohc（常用）
•	cal，在终端中查看日历，肯定没有农历显示的
•	uptime，查看系统已经运行了多久，当前有几个用户等信息（常用）
•	echo "字符串内容"，输出"字符串内容"
•	cat 文件路名，显示文件内容（属于打印语句）
•	cat -n 文件名，显示文件，并每一行内容都编号
•	more 文件名，用分页的方式查看文件内容（按 space 翻下一页，按 Ctrl + B 返回上页）
•	less文件名，用分页的方式查看文件内容（带上下翻页）
◦	按 j 向下移动，按 k 向上移动
◦	按 / 后，输入要查找的字符串内容，可以对文件进行向下查询，如果存在多个结果可以按 n 调到下一个结果出
◦	按 ？ 后，输入要查找的字符串内容，可以对文件进行向上查询，如果存在多个结果可以按 n 调到下一个结果出
•	tail -200f 文件名，查看文件被更新的新内容尾200行，如果文件还有在新增可以动态查看到（一般用于查看日记文件）
•	shutdown
◦	shutdown -hnow，立即关机
◦	shutdown -h+10，10分钟后关机
◦	shutdown -h23:30，23:30关机
◦	shutdown -rnew，立即重启
•	poweroff，立即关机（常用）
•	reboot，立即重启（常用）
•	zip mytest.zip /opt/test/，把 /opt 目录下的 test/ 目录进行压缩，压缩成一个名叫 mytest 的 zip 文件
◦	unzip mytest.zip，对 mytest.zip 这个文件进行解压，解压到当前所在目录
◦	unzip mytest.zip -d /opt/setups/，对 mytest.zip 这个文件进行解压，解压到 /opt/setups/ 目录下
•	tar -cvf mytest.tar mytest/，对 mytest/ 目录进行归档处理（归档和压缩不一样）
•	tar -xvf mytest.tar，释放 mytest.tar 这个归档文件，释放到当前目录
◦	tar -xvf mytest.tar -C /opt/setups/，释放 mytest.tar 这个归档文件，释放到 /opt/setups/ 目录下
•	last，显示最近登录的帐户及时间
•	lastlog，显示系统所有用户各自在最近登录的记录，如果没有登录过的用户会显示 从未登陆过
•	du -sh /opt/setups/，显示 /opt/setups/ 目录所占硬盘空间大小（s 表示 –summarize 仅显示总计，即当前目录的大小。h 表示 –human-readable 以 KB，MB，GB 为单位，提高信息的可读性）
•	chmod 777 文件名，给指定文件增加最高权限。linux 的权限分为 rwx，这三个权限都可以转换成数值表示，r = 4，w = 2，x = 1，- = 0，所以总和是 7，也就是最大权限。第一个 7 是所属主（user）的权限，第二个 7 是所属组（group）的权限，最后一位 7 是非本群组用户（others）的权限。
•	ls，列出当前目录下的所有没有隐藏的文件 / 文件夹。
◦	ls -a，列出包括以．号开头的隐藏文件 / 文件夹（也就是所有文件）
◦	ls -R，显示出目录下以及其所有子目录的文件 / 文件夹（递归地方式，不显示隐藏的文件）
◦	ls -a -R，显示出目录下以及其所有子目录的文件 / 文件夹（递归地方式，显示隐藏的文件）
◦	ls -l，列出目录下所有文件的权限、所有者、文件大小、修改时间及名称（也就是显示详细信息，不显示隐藏文件）。显示出来的效果如下：
▪	-rwxr-xr-x. 1 root root 4096 3月 26 10:57，最前面的 - 表示这是一个普通文件
▪	lrwxrwxrwx. 1 root root 4096 3月 26 10:57，最前面的 l 表示这是一个链接文件，类似 Windows 的快捷方式
▪	drwxr-xr-x. 5 root root 4096 3月 26 10:57，最前面的 d 表示这是一个目录
◦	ls -ld 目录名，显示该目录的基本信息
◦	ls -t，依照文件最后修改时间的顺序列出文件名。
◦	ls -F，列出当前目录下的文件名及其类型。以 / 结尾表示为目录名，以 * 结尾表示为可执行文件，以 @结尾表示为符号连接
◦	ls -lg，同上，并显示出文件的所有者工作组名。
◦	ls -lh，查看文件夹类文件详细信息，文件大小，文件修改时间
◦	ls /opt | head -5，显示 opt 目录下前5条记录
◦	ls -l /opt |grep "^-"|wc -l，统计 opt 目录下文件的个数，不会递归统计
◦	ls -lR /opt |grep "^-"|wc -l，统计 opt 目录下文件的个数，会递归统计
◦	ls -l /opt |grep "^d"|wc -l，统计 opt 目录下目录的个数，不会递归统计
◦	ls -lR /opt |grep "^d"|wc -l，统计 opt 目录下目录的个数，会递归统计
◦	ls -lR /opt |grep "js"|wc -l，统计 opt 目录下 js 文件的个数，会递归统计
•	cd，目录切换
◦	cd ..，改变目录位置至当前目录的父目录(上级目录)。
◦	cd ，改变目录位置至用户登录时的工作目录。
◦	cd 回车，回到家目录
◦	cd -，上一个工作目录
◦	cd dir1/，改变目录位置至 dir1 目录下。
◦	cd user，改变目录位置至用户的工作目录。
◦	cd ../user，改变目录位置至相对路径user的目录下。
◦	cd /../..，改变目录位置至绝对路径的目录位置下。
•	cp 源文件 目标文件，复制文件
◦	cp -r 源文件夹 目标文件夹，复制文件夹
◦	cp -r -v 源文件夹 目标文件夹，复制文件夹(显示详细信息，一般用于文件夹很大，需要查看复制进度的时候)
•	tar cpf - . | tar xpf - -C /opt，复制当前所有文件到 /opt 目录下，一般如果文件夹文件多的情况下用这个更好，用 cp 比较容易出问题
•	mv 文件 目标文件夹，移动文件到目标文件夹
◦	mv 文件，不指定目录重命名后的名字，用来重命名文件
•	touch 文件名，创建一个空白文件/更新已有文件的时间(后者少用)
•	mkdir 文件夹名，创建文件夹
•	mkdir -p /opt/setups/nginx/conf/，创建一个名为 conf 文件夹，如果它的上级目录 nginx 没有也会跟着一起生成，如果有则跳过
•	rmdir 文件夹名，删除文件夹(只能删除文件夹里面是没有东西的文件夹)
•	rm 文件，删除文件
◦	rm -r 文件夹，删除文件夹
◦	rm -r -i 文件夹，在删除文件夹里的文件会提示(要的话,在提示后面输入yes)
◦	rm -r -f 文件夹，强制删除
◦	rm -r -f 文件夹1/ 文件夹2/ 文件夹3/删除多个
•	find，高级查找
◦	find . -name *lin*，其中 . 代表在当前目录找，-name 表示匹配文件名 / 文件夹名，*lin* 用通配符搜索含有lin的文件或是文件夹
◦	find . -iname *lin*，其中 . 代表在当前目录找，-iname 表示匹配文件名 / 文件夹名（忽略大小写差异），*lin* 用通配符搜索含有lin的文件或是文件夹
◦	find / -name *.conf，其中 / 代表根目录查找，*.conf代表搜索后缀会.conf的文件
◦	find /opt -name .oh-my-zsh，其中 /opt 代表目录名，.oh-my-zsh 代表搜索的是隐藏文件 / 文件夹名字为 oh-my-zsh 的
◦	find /opt -type f -iname .oh-my-zsh，其中 /opt 代表目录名，-type f 代表只找文件，.oh-my-zsh 代表搜索的是隐藏文件名字为 oh-my-zsh 的
◦	find /opt -type d -iname .oh-my-zsh，其中 /opt 代表目录名，-type d 代表只找目录，.oh-my-zsh 代表搜索的是隐藏文件夹名字为 oh-my-zsh 的
◦	find . -name "lin*" -execls -l{}\;，当前目录搜索lin开头的文件，然后用其搜索后的结果集，再执行ls -l的命令（这个命令可变，其他命令也可以），其中 -exec 和 {}\; 都是固定格式
•	df -h，查看磁盘大小和使用空间
•	du -sh /opt，查看 opt 这个文件夹大小 （h 的意思 human-readable 用人类可读性较好方式显示，系统会自动调节单位，显示合适大小的单位）
•	du -sh ./*，查看当前目录下所有文件夹大小 （h 的意思 human-readable 用人类可读性较好方式显示，系统会自动调节单位，显示合适大小的单位）
•	cat /etc/resolv.conf，查看 DNS 设置

￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ ￼ 









