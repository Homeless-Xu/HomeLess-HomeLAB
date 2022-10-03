## Shell-Script
## Shell、Shell Script 概念
- shell是一个应用程序，这个程序提供一个界面，用户通过这个界面访问操作系统内核的服务。
- shell脚本（shell script）:是一种用shell编写的脚本程序。一些命令的集合而已.
> 适合修改文件.
##### 软件要求: 文本编辑器(如: vi )  + 脚本解释器.
> Mac: 自带 sh bash zsh 等等多种 解释器.  
> Win: 自行安装脚本解释器.

##### 脚本解释器: 常用编程语言都支持脚本编程,如：Perl、Tcl、Python、PHP、Ruby。
- sh :---------- 标准 shell 解释器 路径→ /bin/sh
- bash :-------- sh 的升级版.  路径→ /bin/bash
- Perl:--------- 最老牌的脚本编程语言了.
- Python:------- 新linux发行版的预置解释器.


指令执行 顺序 从上玩下 从左到右.
多个空格 和 空行 会被自动忽略.



# 良好习惯:
脚本功能
版本资讯
作者联系方式
版权
历史记录
内部特殊指令 用  绝对路径来下达
环境参数设定.

脚本写说明.

结构.在{}里面 最好用 tab 键 后推.  这样代码才漂亮.
使用 vim 而不是 vi
vim 支持语法检测,能第一时间发现语法问题.


用 read  与用户进行互动(让用户可以选择输入内容) 或者选择文件安装路径.

按照日期 对文件进行备份.
可以将文件名 取成: 带日期的格式  


假设  脚本:用户自定义文件夹名字.   输出 带有日期的文件夹名字.







所有脚本 放在一个固定的文件夹.




	#!/bin/bash
	# Program:
	#       This program shows "Hello World!" in your screen.
	# History:
	# 2015/07/16    VBird   First release
	PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
	export PATH
	echo -e "Hello World! \a \n"
	exit 0






文本结构.

1. 第一行:指定 shell 版本

2. 环境参数设置 及 备注内容,联系方式,建立日期
主要环境参数设置:
务必设定, PATH 和 LANG
可以直接下达指令 而不必写 绝对路径.!!!!!

3. 脚本主体.

4. 执行结果通知(定义 回传值)
5. exit n(n 是数字)  可以自定义错误信息?
	 
	 
	 

	 
	 
	 
	 


## 脚本主要成分: 注释 命令  变量 结构控制语句
变量: 整数/英文串



# 实例:

	#! /bin/bash
	mkdir xx   #新建文件夹
	cd xx  # 进入文件夹
	rm xx #删除文件夹
	rm -r xx # 删除文件夹及其下所有目录.
	cd ..   # 回到上级文件夹.
	
	
	
	for i in 1 2 3  # 设置一个变量 i 让它分别取 1 2 3,也就是重复三次的意思.
	do
	    mkdir he
	    cd he
	    mkdir llo
	    cd..
	    rm -r he
	done




for i in \*
do
rm -r $i
done




管理主机:
查看登录档案
追踪流量
监控主机状态
硬件状态
软件更新查询.








## 脚本编写:
> 先学习简单的 sh/bash   有需求再学习高级的:Perl / python 脚本

文本编辑器 → 新建文件 → 扩展名 sh( 代表shell)  
> 扩展名不影响脚本执行 只是为了方便 见名知意  
>  shell 写的脚本 扩展名用 .sh  
>  php 写的脚本 扩展名用 .php 

行为单位.!!! 












#### 第一行:  
 一般都是这样的
 
	#!/bin/sh
	#!/usr/bin/php  
 
>   \#!: 约定标记,告诉系统 这个脚本需要用什么解释器来执行.
 
 
#### 第二行
脚本功能说明.

 
#### 脚本运行方法: (二选一)
- 作为可执行程序 (给文件 可执行权限)
	  
		chmod +x xu.sh
		./xu.sh
	> 运行二进制程序 一定要加 ./  意思是在当前目录找

- 直接运行指定解释器,不需在第一行加解释器.加了也没用.
	- sh test.sh
	- php test.php

#### 注释:
- "#"号开头的都是注释.不执行.
- 大段代码临时注释:
	- 一行一个加# 太麻烦了 
	- 可用花括号: { 代码 }  把代码变成一个函数.  达到和注释一样的效果.

#### 变量:字符串/整形
大型脚本,某一命令/路径出现几百次, 突然要换路径....... 而且为了避免脚本臃肿 → 这就需要变量.


- 定义变量: your\_name="xujian"      
	> 等号两边不能有空格.
- 使用变量: $ + {变量名} 
> 例: echo ${your\_name}

d=`date +%H:%M:%S`
echo "Time is $d"


计算两个数之和:

	a=1
	b=2
	sum=$[$a+$b]
	echo "sum is $sum"
	#数学计算要用 [] 括号.  或者下面的 两个(())
	
	a=10 b=20
	echo $(($a+$b))
 
#### read 用户交互
> 从标准输入获得变量值,后面跟变量名.
	echo "please input a number:"
	read x
	echo "please input another number:"
	read y
	sum=[$a+$b]
	echo "the sum is: $sum"


上面代码也等于:
read -p "please input a number:" x
read -p "please input another number:" y
sum=$[$a+$b]
echo "the sum is: $sum"



#### 预设变量:

	sum=$[$1+$2]
	echo $sum
	输出:3
	# 本脚本身没有定义 $1 $2  
	脚本预设好的$1 就是1  $2 就是 2  $0 就是脚本文件名! 


”/etc/init.d/iptables restart “ 

- 前面 /etc/init.d/iptables 其实是一个 shell 脚本
- 后面 restart 脚本的预设变量.




#### sleep 睡眠指令:
固定多久之后执行脚本里面的 下一个命令.
sleep 20 s/m/h/d 







#### 转义字符
- " : 编程语言中有特殊意义,用作字符串的分界符
- \" : 才是表示 " 本身

#### 字符串:单引号 / 双引号
单引号内: 任何字符都原样输出. 里面的变量无效.  
双引号内: 可以有变量 也可以出现 转义字符.




# 例:
1. 进入到/tmp/目录；
2.  列出当前目录中所有的文件名；
3.  把所有当前的文件拷贝到/root/目录下；
4.  删除当前目录下所有的文件。

简单的4步,需要你敲4次命令，按4次回车。麻烦! 这还只是几个命令 要是几十个命令...

把所有的操作都记录到一个文档中，然后去调用文档中的命令，这样一步操作就可以完成。  
其实这个文档呢就是shell脚本了，只是这个shell脚本有它特殊的格式。

sehll 脚本能帮助我们很方便的管理服务器. 因为我们可以指定一个计划定时任务去运行某个脚本.

139邮箱:发邮件的同时还可以发一条邮件通知的短信给用户.  
利用这点，我们就可以在我们的linux服务器上部署监控的shell脚本，比如网卡流量有异常了或者服务器web服务器停止了就可以发一封邮件给管理员，同时发送给管理员一个报警短信这样可以让我们及时的知道服务器出问题了。


自定义脚本 建议都放到 /usr/local/sbin/ 目录下. 方便维护和管理 

脚本必须写注释!!  方便自己 方便他人.

默认 vim 编辑出来的文件是不带 执行权限的.
sh -x filename  查看脚本执行过程. 有利于调试.


#### date:  打印当前系统时间

	#!/bin/sh
	
	date
	# 默认格式 完整显示
	# 输出:2015年11月 9日 星期一 12时51分17秒 CST
	
	date "+%Y-%m-%d %w %H:%M:%S"
	# 自定义格式: +加号必须有 , y:15年 Y:2015年 ; w:星期 HMS 必须大小写 .  
 
 


输入名字, 输出 hello + 名字

	echo "what is your name"
	read persion
	echo "hello,$persion"











---- 
#### if / else

##### 不带 else:
 if + 判断语句; then + command + fi

	read -p "please input your score:" a
	if ((a<60))  
	then echo "you didn't pass"
	fi
	# if 后面必须 两个()


#### 带 else:
	if 判断语句;then
	    command
	else
	    command
	fi

#### 带 elif:
	if 判断语句一;then
	    command
	elif 判断语句二;then
	    command
	else
	    command
	fi

例:判断考试成绩: 小于60;60-80;大于80
 
	read -p "input your score:" a
	if ((a<60)); then 
	    echo "you failed the exam"
	elif ((a>60)) && ((a<80)); then
	    echo "Good you passed"
	else
	    echo "very Good"
	fi




#### 文件属性权限:

r: 是否有读权限 
w: 是否写权限
x: 是否可运行
b: 设备文件
f: 是否是普通文件(不是目录 也不是设备文件)
d: 是否存在,且 是否是目录.
s: 文件大小是否空 不空返回 true
e: 文件是否存在

	if [ -d /home ]; then echo ok; fi
	if [ -x ~/desktop/xx.sh ]; then echo runable" fi
---

	file="/var/www/tutorialspoint/unix/test.sh"
	if [ -r/w/x/f/d/s/e $file ]()
	echo “a”
	else
	    echo “b”
	fi

#### case 逻辑判断
常用于 编写系统服务的 启动脚本.
如: /etc/init.d/iptables 中就用到了.

	read -p "please input a number:" n
	a=$[$n%2]
	case $a in
	    1) echo "this number is odd (奇数)"
	    0) echo "this number is even (偶数)"
	esac



### 脚本循环 for / while

for 变量名 in 循环条件; do
command
done


for i in `seq 1 5`; do
echo $i
done

输出
1
2
3
4
5



a=10
while [ $a -ge 1 ]; do
echo "$a"
a=$[$a-1]
done

显示 10 9 8 7 6 5 4 3 2 1 




#### 函数:
 把一段代码 整理到一个单元中,并给单元起名. 用到这段代码 直接调用 单元名.

函数一定要写在最前面 函数是被调用的.不然会出错.

function 函数名(){
command
}





实例:
复制 /root/ 目录下所有内容(一级目录)到 /users/v/Desktop/目录下
	#!/bin/bash
	for f in ls /root/ ; do
	if [-d $f ]; then
	cp -r $f /usr/desktops
	fi
	done

批量建立 很多用户user\_00 01 02....100 都属于 users 组

	#!bin/bash
	groupadd users
	for i in seq 0 100;do
	useradd -g users user_0$i
	done




脚本:

vi sh01.sh 
> # !/bin/bash              1.  宣告这个档案内的语法使用 bash 的语法!
> PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/bin export PATH 
  echo -e "Hello World! \a \n"     程序主体
  exit 0                           表离开 script 并且回传一个 0 给系统,  



	1.  除了第一行的『 #! 』是用来宣告 shell 版本外,
其他的 # 都是『批注』用 途! 
第二行以下就是用来说明整个程序的基本数据。
一般来说, 建议你 一定要养成说明该 script 的:
1. 内容及功能; 
2. 版本信息; 
3. 作者+联系方式; 
 5. 历史记录 。





脚本练习:  输入 姓名  屏显出来

# !/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/bin export PATH 
read -p "Please input your first name: " firstname # 提示使用者输入
read -p "Please input your last name: " lastname # 提示使用者输入 
echo -e "\nYour full name is: $firstname $lastname" # 结果由屏幕输出 


  



#### source     读取内容并执行.

常用命令:

ps 查看进程列表

shell 执行命令方式:
交互式 interactive : 用户输入一条 执行一条
批处理: 把很多命令 写进一个脚本.然后让 shell 一次性执行完.

bash Linux 默认的 shell
sehll 只需要写一次. 通用性很强.
vi xx.sh
 

例子:  输入名字 输出欢迎文字.

echo “what is your name ?” 
read name
echo “welcome,$name”



变量:
= → 定义变量(等号和变量中间不能有空格); $ → 使用变量

变量: 首字母必须 a-Z    不能有空格. 不用标点符号

只读变量: readonly 值不能被改变

删除变量:unset
unset xujian\_xx    (不能删除只读变量.)

变量类型:
局部变量: 当前 shell 有效
环境变量:所有程序都能访问环境变量  有些程序要环境变量来保证其 正常运行.


特殊变量:
$0  当前脚本文件名
echo “file name: $0”  




退出状态: $? 
大部分命令 执行成功返回0 失败返回1


替换:
脚本 表达式 里面的特殊字符 shell会进行替换  
双引号里面的变量是一种
转义字符 也是一种.



例: 回车键
a=10
echo -e  “a is $a \n”
 输出 a is 10

echo “a is $a \n”
输出 a is 10 \n


\\ 反斜杠
\a 警报
\b 删除键
\f 翻页
\n 换行
\r 回车
\t 制表符(Tab 键)
  

-n 禁止插入换行符.


变量替换

${var}变量本来的值

${var:-word}如果变量 var 为空或已被删除(unset)，那么返回 word，但不改变 var 的值。

${var:=word}如果变量 var 为空或已被删除(unset)，那么返回 word，并将 var 的值设置为 word。

${var:?message}如果变量 var 为空或已被删除(unset)，那么将消息 message 送到标准错误输出，可以用来检测变量 var 是否可以被正常赋值。若此替换出现在Shell脚本中，那么脚本将停止运行。

${var:+word}如果变量 var 被定义，那么返回 word，但不改变 var 的值。


原生 bash 不支持 简单数学运算 
用过 expr 来算

== 等于   比较数字 相同返回 true 不相同返回 false  例: $a == $b  
!= 不等于 比较数字 不相同返回 true 相同返回 false

关系运算:
-eq 检测两个数是否相等，相等返回 true
-ne 检测两个数是否相等，不相等返回 true
-gt 检测左边的数是否大于右边的，如果是，则返回 true。
-lt 检测左边的数是否小于右边的，如果是，则返回 true。
-ge 检测左边的数是否大等于右边的，如果是，则返回 true。
-le 检测左边的数是否小于等于右边的，如果是，则返回 true。

! 非运算 -o 或运算,   -a 与运算


[ $a -lt 20 -o $b -gt 100 ]() 只要一个对的 就返回 true。

[ $a -lt 20 -a $b -gt 100 ]() 两个同时对的 返回 true



=  检测两个字符串是否相等，相等返回 true
!= 检测两个字符串是否相等，不相等返回 true。
-z 检测字符串长度是否为0，为0返回 true 
-n 检测字符串长度是否为0，不为0返回 true。
str 检测字符串是否为空，不为空返回 true。



获取字符串长度
string=“abcd”
echo ${string} #输出4

提取字符串
string=“xujian@126.com”
echo “${string:1:5}”  # 输出xujia

定义数组
array\_name=(xujian xx 0219)  或者 
array\_name[0]()=xujian
array\_name[1]()=xx
array\_name[2]()=0219

读取数组
echo “1: ${array\_name[0][7]}”
星号 读取数组中所有元素
echo “1: ${array\_name[\*][8]}”


echo  shell 内部指令. 屏幕上输出指定字符串.


换行输出 
echo “ok\n”
echo “it is a test”
输出:
ok
it is a test

不换行输出
echo “ok\c”
echo “it is a test”
输出:
okit is a test.


显示当前日期  echo `date` 

printf echo 增强版 


if else 语句:
通过判断真假 来决定执行哪个分支
if    …then … fi
if … else … fi
if … elif …else …fi
 
if [ $a == $b ]()
then
fi


case   esac  多分支选择结构.
匹配一个值 如果匹配成功 就执行相匹配的目录

比如 总有4种模式 1234  让你选择一种. 然后执行相应的模式.


for 循环

顺序输出 当前列表的数字

for loop in 1 2 3 4  5
do
echo “output: $loop”
done
结果:
output:1
output:2
output:3
output:4
output:5

显示主目录下 以.bash 开头的文件:
for FILE in $HOME/.bash
do
echo $FILE
done

结果:
/root/.bash\_history
/root/.bash\_logout
/root/.bash\_profile
/root/.bashrc

函数: 将复杂功能 分成几个模块. 清晰程序结构.   先定义后使用.


命令的输出不仅可以是显示器 还可以很容易的转向文件. 这个就是 输出重定向.  
命令 \> file 
追加: 命令 \>\> file

输入重定向
命令 可以从文件获取输入.
本来需要键盘输入的 可以通过文件读取命令.


每个命令运行时候  都会打开三个文件.
标准输入文件:stdin  读取数据
标准输出文件:stdout 输出数据
标准错误文件:stderr 储存错误信息

默认情况下，command \> file 将 stdout 重定向到 file，command \< file 将stdin 重定

如果希望 stderr 重定向到 file，可以这样写：
1   $command 2 \> file
如果希望 stderr 追加到 file 文件末尾，可以这样写：
1   $command 2 \>\> file
2 表示标准错误文件(stderr)。

如果希望将 stdout 和 stderr 合并后重定向到 file，可以这样写：
复制纯文本新窗口

1   $command \> file 2\>&1
或
复制纯文本新窗口

1   $command \>\> file 2\>&1
如果希望对 stdin 和 stdout 都重定向，可以这样写：
复制纯文本新窗口

1   $command \< file1 \>file2
command 命令将 stdin 重定向到 file1，将 stdout 重定向到 file2。 


如果希望 stderr 重定向到 file，可以这样写：
$command 2 \> file
如果希望 stderr 追加到 file 文件末尾，可以这样写：
$command 2 \>\> file
2 表示标准错误文件(stderr)。

如果希望将 stdout 和 stderr 合并后重定向到 file，可以这样写：
复制纯文本新窗口

$command \> file 2\>&1
或
复制纯文本新窗口

$command \>\> file 2\>&1
如果希望对 stdin 和 stdout 都重定向，可以这样写：
复制纯文本新窗口

$command \< file1 \>file2
command 命令将 stdin 重定向到 file1，将 stdout 重定向到 file2。 
n \>& m 将输出文件 m 和 n 合并。
n \<& m 将输入文件 m 和 n 合并。
\<\< tag    将开始标记 tag 和结束标记 tag 之间的内容作为输入。


/dev/null 文件
如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 /dev/null：
1   $ command \> /dev/null
/dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到。但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到”禁止输出“的效果。

如果希望屏蔽 stdout 和 stderr，可以这样写：
复制纯文本新窗口

1   $ command \> /dev/null 2\>&1




外部脚本:

像其他语言一样，Shell 也可以包含外部脚本，将外部脚本的内容合并到当前脚本。

Shell 中包含脚本可以使用：
1   . filename
或
1   source filename
两种方式的效果相同，简单起见，一般使用点号(.)，但是注意点号(.)和文件名中间有一空格。

例如，创建两个脚本，一个是被调用脚本 subscript.sh，内容如下：
1   url="http://see.xidian.edu.cn/cpp/view/2738.html"
一个是主文件 main.sh，内容如下：
1   #!/bin/bash
2   . ./subscript.sh
3   echo $url
执行脚本：
$chomd +x main.sh
./main.sh
http://see.xidian.edu.cn/cpp/view/2738.html
$
注意：被包含脚本不需要有执行权限。




例子:
 
	#!/bin/sh       指定脚本解释器.
	cd ~           切换到用户 Home 目录
	mkdir xx  新建文件夹.
	cd xx切换到新建文件夹,
	for ((i=0; i<10; i++)); do      循环条件 一共循环十次.
	touch test_$i.txt       创建 test_1....10 10个文件.
	done       结束循环
 








### 一键安装的脚本涉及操作：

脚本 就是一系列命令的组合过程.

一种特殊的 描述性语言:  安装一定格式编写的 可执行文件  也叫  宏/批处理文件.

常用于 网页.
也容易被利用 如果在浏览网页时 点了含破坏计算机命令的脚本 容易受到攻击.

脚本语言比较多.
执行 只和 解释器 有关.




1、移动文件到指定目录（mv oldname newname）
2、创建目录（mkdir dirname）
3、修改权限（chmod 755 filename）
4、删除文件（rm -f filename）
以上几个基本命令都知道如何操作。


写在脚本里的 都是按照顺序执行的. 执行完 第一条 才会第二条.


例子:

	#! /bin/bash
	
	apt-get update 
	
	apt-get install pptpd
	
	sed -i 'N;$d' /etc/pptpd.conf  
	
	echo -e "localip 192.168.217.1\nremoteip 192.168.217.234-238,192.168.217.245" >> /etc/pptpd.conf
	
	
	echo xujian pptpd 0219 \* >> /etc/ppp/chap-secrets
	
	sed -i -e 's/^#.ms-dns 192.168.1.1/ms-dns 8.8.8.8/g' -i -e 's/^#.ms-dns 192.168.1.2/ms-dns 8.8.4.4/g' /etc/ppp/options
	
	sed -i 's/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
	
	sysctl -p 
	/etc/init.d/pptpd restart 
	apt-get install iptables
	
	
	iptables -t nat -A POSTROUTING -s 192.168.217.0/24 -o eth0 -j MASQUERADE
	
	iptables-save > /etc/iptables.pptp
	
	cd /etc/network/if-up.d/ 
	touch iptables
	
	echo -e "#\!/bin/sh" -e "\niptables-restore \< /etc/iptables.pptp" >> iptables ;  
	
	chmod +x /etc/network/if-up.d/iptables


spawn





set timeout 30  设置超时时间.  单位秒.






























