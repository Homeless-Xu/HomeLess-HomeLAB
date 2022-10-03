#!/bin/bash

# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
# 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵  基础知识  🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️

# ⦿ 参考    https://github.com/52fhy/shell-book


# 🔸 编译语言 VS 脚本语言

    # ⦿ 编译语言: c++ java 
        # 	需要先把人类代码  转为机器代码. 这个就叫编译.
        # 	机器代码 是最适合计算机执行的. 所以执行效率很高.

        # 	但是也由于接近底层. 实现一个简单的功能往往也要大量的代码.

        # 	这个程序只要开发人员 把编译好的软件给我们
        # 	我们直接安装就可以了.
        # 	安装的过程是不用编译的

    # ⦿ 解释语言 (脚本语言): Perl / Python / Ruby / Shell
        # 	每次执行脚本的时候, 都需要编译. 
        # 	所以效率就有所下降.
        # 	好处是.. 能轻易实现很多功能.
        # 	计算机编译速度也很快. 这点牺牲是值得的..



# 🔸 Shell 简介
    # 	Shell 常用于 系统管理工作.
    # 	Shell 是和系统内核沟通的桥梁.
    # 	系统内核是需要保护的.不然很容易被黑.
    # 	❗️❗️Shell 的熟练程度 反应了对Linux的熟练程度.❗️❗️


    # ⦿ Shell 种类                  # /zsh/bash/ksh 有很多种, L默认 Bash
    # ⦿ Shell 好处                  # 移植性很高. 开发也容易.
    # ⦿ 脚本权限                    # 脚本必须要有可执行权限. 也就是x权限
    # ⦿ 执行脚本                    # sh 脚本名 或者 ./脚本名

    # ⦿ 查看所有系统Shell           # cat /etc/shells
    # ⦿ 查看系统默认Shell   	      # echo $SHELL
        
    # ⦿ Shell 使用方式:
        # 	交互式: 用户输入一条. 执行一条. 
        # 	批处理: 在一个文件里写很多条命令. 一次性处理.


    # ⦿ 切换shell
        # 直接输入 shell 名称就可如: zsh、bash、zsh
        # 然后用 exit 回到默认shell


    # ⦿ shell 参数 
        # - 破折号开头表示参数.
        # - 多个参数 只需最前面一个破折号
        # 	ls -l -t /tmp/sh  可以写成   ls -lt /tmp/sh


    # ⦿ 同时执行
        # - 两个命令 用;号隔开.先执行前面的.等前面的完成后 . 再执行后面的
        # - 两个命令 用&号隔开.同时执行两个命令!!!!
        # 	cd /tmp ; ll -d sh  
        # 	cd /tmp & ll -d sh  


    # ⦿ 查看某用户是否登录
        # who | grep root     
        # who | grep v





# 🔸 脚本调试

    # ⦿ 检测脚本语法错误(不执行)            # sh -n ./test.sh

    # ⦿ 边执行边输出源码            # sh -v ./test.sh
    # ⦿ 边执行边输出转换后的代码    # sh -x ./test.sh
        # 用 -x 跟踪脚本执行.
        # bash在运行前打印出了每一行命令。而且每行前面的+号表明了嵌套。
        # 这样的输出可以让你看到命令执行的顺序并可以让你知道整个脚本的行为。

    # ⦿ 调试增强模式.
        # 在一个很大的脚本中，你会看到很多很多的执行跟踪的输出，阅读起来非常费劲，
        # 你可以在每一行前加上文件的行号，这会非常有用。要做到这样，
        # 你只需要设置下面的环境变量：(下面代码直接终端里运行一次就可以)
        # export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '

        #  ➜  sh export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
        #  ➜  sh sh -x ./test.sh

    # ⦿ 另一种方法就是在 脚本里面添加 set-x  set+x .
    # 这样执行脚本的时候 不需要加 -x 参数. 也能进行调试.如:
        # #!/bin/bash
        # echo "Hello $USER,"
        # set -x
        # echo "Today is $(date %Y-%m-%d)"
        # set +x



# 🔸 环境路径
    # 脚本里面会用到很多命令.如  wget curl 等等.
    # 这些都是第三方命令. 不是系统自带的. 
    # 也就是说你可以把这些命令安装在电脑的任何位置.
    # 那么 bash 怎么知识 wget 安装在哪里呢. 
    # 这就是PATH 环境路径的作用

    # $PATH 查看当前系统环境路径.
        # /usr/local/sbin
        # /Users/v/.autojump/bin
        # ......

    # 可以看出由很多路径组成. 
    # 只要你的 wget 命令安装在这里任何一个路径下  bash 都可以找到.
    # 如果你的 wget 不是安装在 这里的任何一个路径下. 那么 bash 就找不到wget命令.
    # 也就会报错了.  这时候 我们可以 把 wget 的安装路径加到 环境路径里面就可以了

    # 怎么添加路径到$PATH中呢.
    # 那就看你现在用的 哪种shell了.
    # 如果是zsh. 那么就在 用户目录下 .zshrc 中配置...




# 🔸 外部文件 ✔︎ 
    # 用. 开头 表示引入文件

    # . lnmp.conf
    # . include/main.sh
    # . include/init.sh
    # . include/mysql.sh
    # . include/mariadb.sh
    # . include/php.sh
    # . include/nginx.sh
    # . include/apache.sh
    # . include/end.sh
    # . include/only.sh
    # . include/multiplephp.sh




# 🔸 输出 ✔︎
    # echo "+-----------------------------------------------------------------+"
    # echo "|               系统: CentOS7_x64                                 |"
    # echo "+-----------------------------------------------------------------+"
    # echo "|               Author: Xu.jian                                   |"
    # echo "+-----------------------------------------------------------------+"
    # echo "|               www.0214.live                                     |"
    # echo "+-----------------------------------------------------------------+"



# 🔸 彩色输出. ✔︎
    # echo显示带颜色，需要使用参数-e
    # echo -e "\033[字背景颜色;文字颜色m字符串\033[0m"

    # ⦿ 文字顏色：
        # 30 黑色
        # 31 紅色
        # 32 綠色
        # 33 黃色
        # 34 藍色
        # 35 紫色
        # 36 青綠
        # 37 白色

    # ⦿ 背景顏色：
        # 40 黑色
        # 41 紅色
        # 42 綠色
        # 43 黃色
        # 44 藍色
        # 45 紫色
        # 46 青綠
        # 47 白色

    # ⦿ 实例1
        # echo -e "\033[30m 黑色字 \033[0m"
        # echo -e "\033[31m 红色字 \033[0m"
        # echo -e "\033[32m 绿色字 \033[0m"
        # echo -e "\033[33m 黄色字 \033[0m"
        # echo -e "\033[34m 蓝色字 \033[0m"
        # echo -e "\033[35m 紫色字 \033[0m"
        # echo -e "\033[36m 天蓝字 \033[0m"
        # echo -e "\033[37m 白色字 \033[0m"

    # ⦿ 实例2
        # echo -e "\033[40;37m 黑底白字 \033[0m"
        # echo -e "\033[41;37m 红底白字 \033[0m"
        # echo -e "\033[42;37m 绿底白字 \033[0m"
        # echo -e "\033[43;37m 黄底白字 \033[0m"
        # echo -e "\033[44;37m 蓝底白字 \033[0m"
        # echo -e "\033[45;37m 紫底白字 \033[0m"
        # echo -e "\033[46;37m 天蓝底白字 \033[0m"
        # echo -e "\033[47;30m 白底黑字 \033[0m"


# 🔸 彩色输出2 
    # # #对7种颜色的加亮
    # for i in `seq 30 37`;do 
    # 	echo -e "\x1b\x5b0;$i;1m $i;1m"
    # done
    
    # # #7种颜色与7种背景的搭配
    # for j in `seq 40 47`;do
    # 	for i in `seq 30 37`;do 
    # 		echo -e "\x1b\x5b0;$i;"$j"m $i;"$j"m"
    # 	done
    # done


# 🔸 read  脚本输入 ✔︎
    # echo "What is your name?"
    # read NAME
    # echo "Hello, $NAME"




# 🔸显示当前日期和时间 ✔︎
    # echo `date +%Y-%m-%d-%H:%M:%S`
        # 2017-07-14-14:20:41



# 🔸 printf ✔︎
    # echo 可以输出. 但是 printf 更加强大 比如输出表格
    # %-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），
    # 任何字符都会被显示在10个字符宽的字符内，
    # 如果不足则自动以空格填充，超过也会将内容全部显示出来。
    # %-4.2f 指格式化为小数，其中.2指保留2位小数。

    # printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
    # printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234 
    # printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543 
    # printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876 

    # 姓名     性别   体重kg
    # 郭靖     男      66.12
    # 杨过     男      48.65
    # 郭芙     女      47.99




# 🔸 转义字符
    # shell默认是不转义上面的字符的。需要加-e选项。
    # echo -e "a \n"


    # 转义字符	含义
    # \\	反斜杠
    # \a	警报，响铃
    # \b	退格（删除键）
    # \f	换页(FF)，将当前位置移到下页开头
    # \n	换行
    # \r	回车
    # \t	水平制表符（tab键） 
    # \v	垂直制表符




# 🔸 命令替换
    # 命令替换是指Shell可以先执行命令，将输出结果暂时保存，在适当的地方输出。
    # 语法: `命令`
    # 注意是反引号，不是单引号，这个键位于 Esc 键下方。

        # DATE=`date`
        # echo "Date is $DATE"



# 🔸 变量

    # 任何语言都有变量.
    # 单引号里的所有符号都不具有特殊意义.
    # 双引号里的某些符号才会具有特殊意义.
        # name=syx；  
        # echo '$name'            # 输出 $name  
        # echo "$name"            # 输出 syx 

        # cur_dir=$(pwd)           # 定义变量 pwd 当前路径
        # echo '$cur_dir'          # 输出值 ➜ $cur_dir
        # echo "$cur_dir"          # 输出值 ➜ /Users/v/Desktop/vps/blog/script


        # echo "\"It is a test\""  # 转义字符  ➜ "It is a test"
        # echo "OK! \n"            # ➜  OK! \n
        # echo -e "OK! \n"         # -e 开启转义 ➜ OK! 加上换行符
        # echo '$name\"'           # 单引号 可以直接原样输出 ➜  $name\"
        # echo `date`              # 输出日期  ➜  Thu Jul 13 17:33:44 CST 2017
        #                          # 注意： 这里使用的是反引号 `, 而不是单引号 '




# 🔸 特殊变量
    #   普通变量  只能是 数字/字母/下划线组成. 
    #   特殊变量  普通变量之外的都是特殊变量.有特殊意义
        # 
        #   $0	当前脚本的文件名

        #   $?	上个命令的退出状态，或函数的返回值。
        #   $$	当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID。

        #   $n	传递给脚本或函数的参数，第一个参数是$1，第二个参数是$2。
        #   $#	传递给脚本或函数的参数个数。
        #   $*	传递给脚本或函数的所有参数。
        #   $@	传递给脚本或函数的所有参数。




# 🔸 $? 退出状态
    # $? 可以获取上一个命令的退出状态。所谓退出状态，就是上一个命令执行后的返回结果。

    # if [[ $? != 0 ]];then
    #   echo "error"
    #   exit 1;
    # fi

    # 退出状态是一个数字，一般情况下，大部分命令执行成功会返回 0，失败返回 1。




# ⦿ $* 和 $@ 的区别
    # $* 和 $@ 都表示传递给函数或脚本的所有参数，
        # 不被双引号(" ")包含时，都以"$1" "$2" … "$n" 的形式输出所有参数。
        # 但是当它们被双引号(" ")包含时，
            # "$*" 会将所有的参数作为一个整体，以"$1 $2 … $n"的形式输出所有参数；
            # "$@" 会将各个参数分开，以"$1" "$2" … "$n" 的形式输出所有参数。


                # $*=  a b c d
                # "$*"= a b c d
                # $@=  a b c d
                # "$@"= a b c d
                # print each param from $*
                # a
                # b
                # c
                # d
                # print each param from $@
                # a
                # b
                # c
                # d
                # print each param from "$*"
                # a b c d
                # print each param from "$@"
                # a
                # b
                # c
                # d









# 🔸 算术运算符列表

    # 运算符	说明	    举例
    # +	    加法	`expr $a + $b` 结果为 30。
    # -   	减法	`expr $a - $b` 结果为 10。
    # *	    乘法	`expr $a \* $b` 结果为  200。
    # /	    除法	`expr $b / $a` 结果为 2。
    # %	    取余	`expr $b % $a` 结果为 0。
    # =	    赋值	a=$b 将把变量 b 的值赋给 a。
    # ==	相等。用于比较两个数字，相同则返回 true。	[ $a == $b ] 返回 false。
    # !=	不相等。用于比较两个数字，不相同则返回 true。	[ $a != $b ] 返回 true。

# 🔸 关系运算符 ✔︎
    #  ❗️ 关系运算符只支持数字，不支持字符串 ❗️
    #  ❗️ 关系运算 返回值是 true / false     ❗️
    # 
    # -eq	相等      [ $a -eq $b ] 返回 false
    # -ne	不等	    [ $a -ne $b ] 返回 true
    # -gt	大于	    [ $a -gt $b ] 返回 false
    # -lt	小于	    [ $a -lt $b ] 返回 true
    # -ge	大于等于  [ $a -ge $b ] 返回 false
    # -le	小于等于  [ $a -le $b ] 返回 true

        # a=10
        # b=20
        # if [ $a == $b ]
        # then
        #    echo "a 等于 b"
        # elif [ $a -gt $b ]
        # then
        #    echo "a 大于 b"
        # elif [ $a -lt $b ]
        # then
        #    echo "a 小于 b"
        # else
        #    echo "没有符合的条件"
        # fi

# 🔸 布尔运算符
    # 运算符	说明
    # !	非运算，表达式为 true 则返回 false，否则返回 true。
    # -o	或运算(or)，有一个表达式为 true 则返回 true。
    # -a	与运算(and)，两个表达式都为 true 才返回 true。

        # if [ 3 -eq 3 -a 3 -lt 5 ]
        # then
        #     echo 'ok'
        # fi;

# 🔸 字符串运算符
    # 运算符	说明	举例
    # =	    检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
    # !=	检测两个字符串是否相等，不相等返回 true。	[ $a != $b ] 返回 true。
    # -z	检测字符串长度是否为0，为0返回 true。	[ -z $a ] 返回 false。
    # -n	检测字符串长度是否为0，不为0返回 true。	[ -z $a ] 返回 true。
    # str	检测字符串是否为空，不为空返回 true。	[ $a ] 返回 true。







# 🔸 编译安装
    # tar zxf $cur_dir.tar.gz -C /root    # 解压到 root 目录下.
    # ./configure  &> /dev/null           # 配置并且把返回的信息输入到/dev/null中
    # echo "正在安装请稍等......"
    # make
    # make install
    # echo "安装完成！"



# 🔸 数组
    # my_array=(A B "C" D)          # 定义数组
    # echo "${my_array[3]}"         # 读取数组某个元素 ➜ D
    # echo "${my_array[*]}"         # 读取数组所有元素 ➜ A B C D


# 🔸 新建文件夹.
    # cd ~
    # mkdir shell_tut
    # cd shell_tut



# 🔸 结果输出到文件
    # echo "It is a test" > myfile




# 🔸 用户输入
    #   执行脚本过程中输入.执行之前输入
    #   select 菜单
    #   标准输入输出.

    # 常用命令
    # sh脚本结合系统命令便有了强大的威力，
    # 在字符处理领域，有grep、awk、sed三剑客，
    # grep负责找出特定的行，
    # awk能将行拆分成多个字段，
    # sed则可以实现更新插入删除等写操作。


    # 脚本内获取参数的格式为：$n。
    # n 代表一个数字，1 为执行脚本的第一个参数，2 为执行脚本的第二个参数
    # ./install.sh 1 2 33
    # 这里就传入了3个参数. 
    # $1 可以获取第一个参数.
    # $2 可以获取第二个参数
    # $3 可以获取第三个参数






# 🔸 test 命令
    #    检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

    # 🔸 数值测试.
        # num1=100
        # num2=100
        # if test $[num1] -eq $[num2]
        # then
        #     echo '两个数相等！'
        # else
        #     echo '两个数不相等！'
        # fi


    # 🔸 字符串测试
        # num1="ru1noob"
        # num2="runoob"
        # if test $num1 = $num2
        # then
        #     echo '两个字符串相等!'
        # else
        #     echo '两个字符串不相等!'
        # fi



    # 🔸 文件测试
        #  -e 文件名	如果文件存在则为真
        #  -r 文件名	如果文件存在且可读则为真
        #  -w 文件名	如果文件存在且可写则为真
        #  -x 文件名	如果文件存在且可执行则为真
        #  -s 文件名	如果文件存在且至少有一个字符则为真
        #  -d 文件名	如果文件存在且为目录则为真
        #  -f 文件名	如果文件存在且为普通文件则为真
        #  -c 文件名	如果文件存在且为字符型特殊文件则为真
        #  -b 文件名	如果文件存在且为块特殊文件则为真

            # cd /bin
            # if test -e ./bash
            # then
            #     echo '文件已存在!'
            # else
            #     echo '文件不存在!'
            # fi






# 🔸 函数

    # demoFun(){
    #     echo "这是我的第一个 shell 函数!"
    # }
    # echo "-----函数开始执行-----"
    # demoFun
    # echo "-----函数执行完毕-----"





# 🔸 输入输出 重定向

    # 命令	说明
    # command > file	将输出重定向到 file。
    # command < file	将输入重定向到 file。
    # command >> file	将输出以追加的方式重定向到 file。
    # n > file	        将文件描述符为 n 的文件重定向到 file。
    # n >> file	        将文件描述符为 n 的文件以追加的方式重定向到 file。
    # n >& m	        将输出文件 m 和 n 合并。
    # n <& m	        将输入文件 m 和 n 合并。
    # << tag	        将开始标记 tag 和结束标记 tag 之间的内容作为输入。




# 🔸 输出结果
    # /dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；
    # 如果尝试从该文件读取内容，那么什么也读不到。
    # 但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到"禁止输出"的效果。

    # 0 是标准输入    （STDIN）
    # 1 是标准输出    （STDOUT）
    # 2 是标准错误输出（STDERR）

        # 如果希望屏蔽 stdout 和 stderr，可以这样写：
        # $ command > /dev/null 2>&1





# 🔸 条件判断: if

    # if ... fi 语句
    # if ... else ... fi 语句
    # if ... elif ... else ... fi 语句

    # 语法
        # if [ expression ]
        # then
        #    Statement(s) to be executed if expression is true
        # fi
        # 注意：expression 和方括号([ ])之间必须有空格，否则会有语法错误。



# 🔸 分支控制：case语句
    # 语法: case ... esac

    # 需要注意的是： 
    # 取值后面必须为关键字 in，
    # 每一模式必须以右括号结束。取值可以为变量或常数。
    # 匹配发现取值符合某一模式后，其间所有命令开始执行直至 ;;。
    # ;; 与其他语言中的 break 类似，意思是跳到整个 case 语句的最后。

    # 取值将检测匹配的每一个模式。
    # 一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。
    # 如果无一匹配模式，使用星号 * 捕获该值，再执行后面的命令。


        # grade="B"

        # case $grade in 
        # 	"A") echo "Very Good!";;
        # 	"B") echo "Good!";;
        # 	"C") echo "Come On!";;
        # 	*) 
        # 		echo "You Must Try!"
        # 		echo "Sorry!";;
        # esac




# 🔸 for循环

# 语法
    # for 变量 in 列表
    # do
    #     command1
    #     command2
    #     ...
    #     commandN
    # done


# 实例
    # for value in 1 2 3 4 5
    # do 
    # 	echo "The value is $value"
    # done

    # 输出：
        # The value is 1
        # The value is 2
        # The value is 3
        # The value is 4
        # The value is 5


# 遍历当前目录下所有文件：
    # for FILE in *
    # do
    #    echo $FILE
    # done



# 遍历文件内容： city.txt
    # citys=`cat city.txt`
    # for city in $citys
    #    echo $city
    # done




# 🔸 while
# 只要while后面的条件满足，就一直执行do里面的代码块。

# 语法
# while command
# do
#    Statement(s) to be executed if command is true
# done


# 命令执行完毕，控制返回循环顶部，从头开始直至测试条件为假。

# 示例：

# #!/bin/bash

# c=0;
# while [ $c -lt 3 ]
# do
# 	echo "Value c is $c"
# 	c=`expr $c + 1`
# done
# 输出：

# Value c is 0
# Value c is 1
# Value c is 2
# 这里由于shell本身不支持算数运算，所以使用expr命令进行自增。



# 🔸 until循环

    # until 循环执行一系列命令直至条件为 true 时停止。
    # until 循环与 while 循环在处理方式上刚好相反。
    # 一般while循环优于until循环，
    # 但在某些时候，也只是极少数情况下，until 循环更加有用。
    # 将上面while循环的例子改改，就能达到一样的效果：

    # c=0;
    # until [ $c -eq 3 ]
    # do
    # 	echo "Value c is $c"
    # 	c=`expr $c + 1`
    # done


# 🔸 跳出循环

# 在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，
# 像大多数编程语言一样，Shell也使用 break 和 continue 来跳出循环。

# ⦿ break
    # break命令允许跳出所有循环（终止执行后面的所有循环）。


    # i=0
    # while [ $i -lt 5 ]
    # do
    # 	i=`expr $i + 1`

    # 	if [ $i == 3 ]
    # 		then
    # 			break
    # 	fi
    # 	echo -e $i
    # done

    # 运行结果：

    # 1
    # 2


# ⦿ continue
    # continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。

    # i=0
    # while [ $i -lt 5 ]
    # do
    # 	i=`expr $i + 1`

    # 	if [ $i == 3 ]
    # 		then
    # 			continue
    # 	fi
    # 	echo -e $i
        
    # done

    # 运行结果：

    # 1
    # 2
    # 4
    # 5









# 🔸 函数

    # 函数可以让我们将一个复杂功能划分成若干模块，让程序结构更加清晰，代码重复利用率更高。
    # 像其他编程语言一样，Shell 也支持函数。Shell 函数必须先定义后使用。

    # 函数定义

    # Shell 函数的定义格式如下：

    # function function_name () {
    #     list of commands
    #     [ return value ]
    # }
    # 其中function关键字是可选的。

    # #!/bin/bash

    # hello(){
    # 	echo 'hello';
    # }

    # hello
    # 运行结果：

    # hello


# 调用函数只需要给出函数名，不需要加括号。
# 函数返回值，可以显式增加return语句；如果不加，会将最后一条命令运行结果作为返回值。

# Shell 函数返回值只能是整数，一般用来表示函数执行成功与否，0表示成功，其他值表示失败。
# 如果 return 其他数据，比如一个字符串，往往会得到错误提示：numeric argument required。

# 注意，$10 不能获取第十个参数，获取第十个参数需要${10}。当n>=10时，需要使用${n}来获取参数。











# Shell输入输出重定向

# Unix 命令默认从标准输入设备(stdin)获取输入，将结果输出到标准输出设备(stdout)显示。一般情况下，标准输入设备就是键盘，标准输出设备就是终端，即显示器。 输出重定向

# 命令的输出不仅可以是显示器，还可以很容易的转移向到文件，这被称为输出重定向。

# 命令输出重定向的语法为：

# command > file
# 这样，输出到显示器的内容就可以被重定向到文件。

# 例如，下面的命令在显示器上不会看到任何输出：

# who > users
# 打开 users 文件，可以看到下面的内容：

# cat users

# oko         tty01   Sep 12 07:30
# ai          tty15   Sep 12 13:32
# ruth        tty21   Sep 12 10:10
# pat         tty24   Sep 12 13:07
# steve       tty25   Sep 12 13:03
# 输出重定向会覆盖文件内容，请看下面的例子：

# echo line 1 > users

# cat users
# line 1
# 如果不希望文件内容被覆盖，可以使用 >> 追加到文件末尾，例如：

# echo line 2 >> users

# cat users
# line 1
# line 2
# 输入重定向

# 和输出重定向一样，Unix 命令也可以从文件获取输入，语法为：

# command < file
# 这样，本来需要从键盘获取输入的命令会转移到文件读取内容。

# 注意：输出重定向是大于号(>)，输入重定向是小于号(<)。

# 例如，计算 users 文件中的行数，可以使用下面的命令：

# wc -l users
# 2 users
# 也可以将输入重定向到 users 文件：

# wc -l < users
# 2
# 注意：上面两个例子的结果不同：第一个例子，会输出文件名；第二个不会，因为它仅仅知道从标准输入读取内容。

# 重定向深入讲解

# 一般情况下，每个 Unix/Linux 命令运行时都会打开三个文件：

# 标准输入文件(stdin)：stdin的文件描述符为0，Unix程序默认从stdin读取数据。
# 标准输出文件(stdout)：stdout 的文件描述符为1，Unix程序默认向stdout输出数据。
# 标准错误文件(stderr)：stderr的文件描述符为2，Unix程序会向stderr流中写入错误信息。
# 默认情况下，command > file 将 stdout 重定向到 file，command < file 将stdin 重定向到 file。

# 如果希望 stderr 重定向到 file，可以这样写：

# command 2 > file
# 如果希望 stderr 追加到 file 文件末尾，可以这样写：

# command 2 >> file
# 2 表示标准错误文件(stderr)。

# 如果希望将 stdout 和 stderr 合并后重定向到 file，可以这样写：

# command > file 2>&1
# 如果希望对 stdin 和 stdout 都重定向，可以这样写：

# command < file1 >file2
# command 命令将 stdin 重定向到 file1，将 stdout 重定向到 file2。

# 全部可用的重定向命令列表：

# 命令	说明
# command > file	将输出重定向到 file。
# command < file	将输入重定向到 file。
# command >> file	将输出以追加的方式重定向到 file。
# n > file	将文件描述符为 n 的文件重定向到 file。
# n >> file	将文件描述符为 n 的文件以追加的方式重定向到 file。
# n >& m	将输出文件 m 和 n 合并。
# n <& m	将输入文件 m 和 n 合并。
# << tag	将开始标记 tag 和结束标记 tag 之间的内容作为输入。
# Here Document

# Here Document 目前没有统一的翻译，这里暂译为嵌入文档。Here Document 是 Shell 中的一种特殊的重定向方式，它的基本的形式如下：

# command << delimiter
#     document
# delimiter
# 它的作用是将两个 delimiter 之间的内容(document) 作为输入传递给 command。

# 注意： 结尾的delimiter 一定要顶格写，前面不能有任何字符，后面也不能有任何字符，包括空格和 tab 缩进。

# 开始的delimiter前后的空格会被忽略掉。

# 下面的例子，通过 wc -l 命令计算 document 的行数：

# wc -l << EOF
#     This is a simple lookup program
#     for good (and bad) restaurants
#     in Cape Town.
# EOF
# 输出： 3

# 也可以 将 Here Document 用在脚本中，例如：

# #!/bin/bash
# cat << EOF
# This is a simple lookup program
# for good (and bad) restaurants
# in Cape Town.
# EOF
# 运行结果：

# This is a simple lookup program
# for good (and bad) restaurants
# in Cape Town.
# /dev/null 文件

# 如果希望执行某个命令，但又不希望在屏幕上显示输出结果，那么可以将输出重定向到 /dev/null：

# command > /dev/null
# /dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到。但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到禁止输出的效果。

# 如果希望屏蔽 stdout 和 stderr，可以这样写：

# command > /dev/null 2>&1
# 这样不会在屏幕打印任何信息。

# Shell文件包含

# 像其他语言一样，Shell 也可以包含外部脚本，将外部脚本的内容合并到当前脚本。

# Shell 中包含脚本可以使用 . filename 或 source filename 。

# 两种方式的效果相同，简单起见，一般使用点号(.)，但是注意点号(.)和文件名中间有一空格。

# 示例： 被包含文件：sub.sh

# name="yjc"
# 主文件：test.sh

# . ./sub.sh
# echo $name
# 运行结果：

# yjc





# 🔸 EOF 命令 ✔︎
# cat>filename 
# 创建文件，并把标准输入输出到filename文件中，只能以ctrl+d作为输入结束：

# cat>filename<<EOF   或者 cat << EOF > test.sh
# 创建文件.然后输入内容. 可以按ctrl+D结束. 也可以输入 EOF 结束!!

    # cat > test.sh << EOF
    # you Shell script writes here.
    # 12
    # 24
    # EOF

        # 这个命令会在当前文件夹. 新建一个 test.sh文件
        # 然后写入3行内容.




# 🔸 tee 命令 ✔︎
# 下面命令会新建个 i.yaml 文件 而且写入很多行内容.
    # tee i.yaml <<EOF
    # apiVersion: v1
    # kind: Secret
    # metadata:
    #   name: imagePullSecrets
    #   namespace: default
    # data:
    #   .dockerconfigjson: $REGISTRY_TOKEN
    # type: kubernetes.io/dockerconfigjson
    # EOF








# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️


# 🔸 环境路径: 先定义 再用 export 设置环境变量.
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


# yum update -y         # 更新yum -y 是默认选择yes的意思.
# mkdir -p /home/www    # 新建目录.

# config_path=`find ~ -name "mybatis.xml" 2>/dev/null | tail -n 1`
    # 在 ~ 目录下查找文件.   如果存在会返回文件路径.

# if [ "$config_path" == "" ];then
#   config_path=`sudo find / -name "mybatis.xml" 2>/dev/null | tail -n 1`
# fi
    # 如果~目录下找不到. 那么就去/目录查找. 需要 sudo权限.


# echo "127.0.0.1 www.codesmagic.com" | sudo tee -a /etc/hosts
    # tee 重定向文件到 文件 和屏幕!!!
    # 这里的意思是 先显示到屏幕. 然后保存 到文件.






# 🔸 编译安装

    # cd /usr/src/openssl-${OPENSSL_VERSION}
    # ./config shared zlib-dynamic
    # make && make install

    #     mv /usr/bin/openssl /usr/bin/openssl.old || true
    # mv /usr/include/openssl /usr/include/openssl.old || true

    #     ln -s /usr/local/ssl/bin/openssl  /usr/bin/openssl
    # ln -s /usr/local/ssl/include/openssl  /usr/include/openssl



# 🔸 安装依赖
    # function _installdep(){
    #     echo -e "\033[32minstall build dependencies...\033[0m"
    #     yum install gcc glibc glibc-devel make pcre \
    #         pcre-devel zlib zlib-devel kernel-devel \
    #         curl gnupg libxslt libxslt-devel gd-devel \
    #         geoip-devel perl-devel perl-ExtUtils-Embed \
    #         lua lua-devel patch -y
    # }




# 🔸 下载文件
    # function _downloadfiles(){
    #     echo -e "\033[32mdownload module dependencies...\033[0m"
    #     curl -fSL http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz -o nginx.tar.gz
    #     curl -fSL https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz -o openssl-${OPENSSL_VERSION}.tar.gz
    #         # 下载源代码
    #     tar -zxC /usr/src -f nginx.tar.gz
    #     tar -zxC /usr/src -f openssl-${OPENSSL_VERSION}.tar.gz
    #         # 解压到 ...文件夹   
    #     rm -f nginx.tar.gz
    #     rm -f openssl-${OPENSSL_VERSION}.tar.gz
    #         # 删除安装包
    # }



# 🔸 检测 root用户 ✔︎
    # root的id 是0 .   如果不是0 就说明不是root.

        # if [ $(id -u) != "0" ]; then
        #     echo "Error: 脚本需要root权限"
        # fi



# 🔸 系统判断: 

    # ⦿ 平台判断: Mac or Linux ✔︎

        # platform='unknown'
        # unamestr=`uname`
        # if [[ "$unamestr" == 'Linux' ]]; then
        #    platform='linux'
        # elif [[ "$unamestr" == 'Darwin' ]]; then
        #    platform='Mac OS'
        # elif [[ "$unamestr" == 'FreeBSD' ]]; then
        #    platform='freebsd'
        # fi

        # echo "$platform"



    # ⦿ 判断 Linux 具体版本
        # cat /etc/redhat-release  ➜ CentOS Linux release 7.3.1611 (Core)
        # 这种方法只适合Redhat系的Linux：

        # cat /etc/redhat-release | awk '{print $1}' ➜  CentOS


    # ⦿ 查看内核
        # uname -r                              ➜ 3.10.0-514.26.2.el7.x86_64
        # cat /proc/version | awk '{print $3 }' ➜ 3.10.0-514.26.2.el7.x86_64




# 🔸 IP 地址判断 ✔︎

    # CheckIPAddr()
    # {
    #    echo $1 | grep "^[0-9]\{1,3\}\.\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}$" > /dev/null
    #    #IP地址需由三个.分隔且均是数字
    
    #    if [ $? -ne 0 ];then
    #        return 1
    #    fi
    #     # $?	上个命令的退出状态，或函数的返回值。
    #     # -ne   不等于
    #     # 这里的意思是 输入的IP地址是否 符合 grep 语法.
    #     # IP 符合 grep 自然有结果 也就是结果不等于0.  不符合自然就没结果


    #    ipaddr=$1
    #    a=`echo $ipaddr | awk -F. '{print $1}'`
    #    b=`echo $ipaddr | awk -F. '{print $2}'`
    #    c=`echo $ipaddr | awk -F. '{print $3}'`
    #    d=`echo $ipaddr | awk -F. '{print $4}'`
    #     # 上面只是初步判断. 现在要进一步判断.
    #     # 每个IP段的范围是 0-255 
    #     # 用 awk 把一整个IP. 用.当作分隔符.分成4部分.
    #     # 然后每个部分 进行范围判断 
    #     # 要同时满足 小于 lt 255 且大于 gt 0

    #    for num in $a $b $c $d
    #    do
    #        if [ $num -gt 255 -o $num -lt 0 ];then
    #            return 1
    #        fi
    #    done
    #    return 0
    # }

    # if [ $# -ne 1 ];then         # 如果 传入脚本的参数个数 不等于 1 
    #     echo "Usage :$0 ipaddr." # 就输出提示本脚本使用方法: 脚本名 + ip地址
    #     exit
    # else
    #     CheckIPAddr $1             # 运行 ip 检测函数
    #     ans=$?                     # 把ip检测函数的值. 赋给 ans 
    #     if [ $ans -eq 0 ];then     # 如果值 等于0 说明ip合法
    #         echo "legal ip address."
    #     else                       # 如果值 不等于0 说明ip非法
    #         echo "unlegal ip address." 
    #     fi

    # fi





# 🔸 外网IP地址查询 ✔︎
    # 对于我们电脑上的ip，通常用`ifconfig`命令，一般显示的内网IP,
    # 如果是linux服务器则显示有外网IP
    # 但是对于个人电脑，可以通过http://www.ip138.com/查自己的外网IP

        # wget http://members.3322.org/dyndns/getip;
        # cat getip;
        # rm -f getip




# 🔸 只打印HTTP头部信息，无须远程下载文件 ✔︎

    # curl --head https://www.0214.live
        # HTTP/1.1 302 FOUND
        # Server: nginx
        # Date: Fri, 14 Jul 2017 06:17:28 GMT
        # Content-Type: text/html; charset=utf-8
        # Connection: keep-alive
        # Vary: Cookie
        # Location: https://www.0214.live/en/




# 🔸显示分组途经的网关 ✔︎
    # traceroute www.baidu.com



# 🔸 检测当前shell ✔︎
# 适用Linux 不适合Mac
    # shellName=`ps | grep $$ | awk '{print $4}'`   # $$ 当前进程的意思.
    # echo $shellName
    # if [ "$shellName" == "zsh" ]; then
    #   echo "正在使用 ZSH"
    # fi










# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️



# # 匹配电子邮件的地址
# cat index.html | egrep -o "[A-Za-z0-9._]+@[A-Za-z0-9.]+\.[a-zA-Z]{2,4}" > ans.txt

# #匹配http URL
# cat index.html | egrep -o "http://[A-Za-z0-9.]+\.[a-zA-Z]{2,3}" > ans.txt 



# #纯文本形式下载网页
# lynx -dump www.baidu.com > plain.txt



# #使用POST提交数据
# curl -d "param2=nickwolfe&param2=12345" http://www.linuxidc.com/login.cgi



# #列出系统中的开放端口以及运行在端口上的服务
# lsof -i 

# #nc命令建立socket连接

# #设置监听　nc -l 5555
# #连接到套接字 nc 192.0.0.1 5555

# #快速文件传输
# #接收端　nc -l 5555 > destination_filename
# #发送端　nc 192.0.0.1 5555 < source_filename

# #找出指定目录最大的n个文件
# du -ak target_dir | sort -nrk 1 | head -n 4
# # du中a为递归,k为kb；sort中n为数字,r为降序,k指定列

# #向终端中的所有登陆用户发送广播信息
# cat message.txt | wall



# #打印所有的.txt和.pdf文件
# find . \( -name "*.txt" -o -name "*.pdf" \) -print

# # -exec command {} \;是连用的，所有符合的都会放置在{}中，去执行command 

# #将文件分割成多个大小为10kb的文件
# split -b 10k data.file 

# #打印两个文件的交集
# comm A.txt B.txt -3 | sed 's/^\t//'

# #sed移除空白行
# sed '/^$/d' file

# #注意对于crontab来说，很好用的方法是先编辑task.cron文件（自定义）,然后
# #使用crontab task.cron写入即可.注意使用重定向，因为默认是mail发送的哈











# #查看哪个IP地址连接的最多
# netstat -an | grep ESTABLISHED | awk '{print $5}'|awk -F: '{print $1}' | sort | uniq -c

# #awk不排序删除重复行
# awk '!x[$0]++' filename 
# #x只是一个数据参数的名字，是一个map，做指定的逻辑判断，如果逻辑判断成立，则执行指定的命令；不成立，直接跳过这一行

# #查看最常使用的10个unix命令
# awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -rn | head -n 10
# #sort中的-r是降序,_-n是按照数值排序(默认比较字符,10<2)

# #逆序查看文件
# cat 1.txt | awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }'

# #查看第3到6行
# awk 'NR >=3 && NR <=6' filename 

# #crontab文件的一些示例
# 30 21 * * * /usr/local/etc/rc.d/lighttpd restart #每晚9.30重启apache
# 45 4 1,10,22 * * /usr/local/etc/rc.d/lighttpd restart #每月的1,10,22日的4:45重启apache
# 10 1 * * 6,0  /usr/local/etc/rc.d/lighttpd restart  #每周六、日的1:10重启apache
# 0,30 18-23 * * *  /usr/local/etc/rc.d/lighttpd restart #表示在每天18.00至23.00之间每隔30分钟重启apache
# * 23-7/1 * * *  /usr/local/etc/rc.d/lighttpd restart #晚上11点到早上7点之间，每隔一小时重启apache

# #删除某路径下N天前的特定文件
# find /usr/local/backups -mtime +10 -name "*.*" -exec rm -rf {} \;










# # 删除大小为0 的文件..

# for filename in `ls`
# do 
#         a=$(ls -l $filename | awk '{print $5}')
#         if ((a==0));then
#             rm $filename
#         fi
# done









# # 查找文件..
# echo "Enter a file name :"
# read a
# if [ -e /home/tach/$a ];then
#     echo "the file is exist!"
# else
#     echo "the file is not exist!"
# fi





















# #连接mysql
# #        -h主机地址                                                             -u用户名 -p密码

# #下面的语句，是登陆到数据库后，使用某个数据库，然后根据条件查询表
# MYSQL=`which mysql`

#  $MYSQL -hmysqlhost --default-character-set=utf8   -P3306 -uname -ppwd  <<EOF  
# use db_conform;
# select    concat_ws('#',ifNull(id,''),ifNULL(title,''),ifNULL(replace(replace(replace(content ,'\n','' ), '\r' , '' ),'#','' ) ,''),ifNULL(doc_no,'')) from $1 limit $2 , $3   ;
# EOF



# #echo $query









# #登陆mysql，负责查询某个表数据总量
# MYSQL=`which mysql`
# count=`$MYSQL -hmysqlhost --default-character-set=utf8   -P3306 -uname -ppwd  <<EOF  
# use $1;
# select    count(1)  from $2  ;
# EOF` 
# #得到某一个表的总数量
# count=`echo "$count" | sed '1d' `
# #定义一个每页读取的最大数量
# pageSize=10000
# #计算总共的分页数
# totalPage=0;
# #判断总数量，求模是否等于0，等于0，就是相除多少页
# temp=` echo "$count%$pageSize" | bc `
# if [ 0 -eq $temp ] ;then
# totalPage=`echo  "$count/$pageSize" | bc`
# else
# #否则，就是相除后+1，作为总的分页数
# totalPage=`echo  "$count/$pageSize+1" | bc`
# fi
# echo "总数量：$count 每页读取数量：$pageSize  分页数量：$totalPage"
# #把总页数减一，方便分页处理，因为后面咱的下标从0开始
# totalPage=`echo "$totalPage-1" | bc `
# #echo "处理后：$totalPage"
# #for循环遍历总页数
# for page in `seq 0 $totalPage`
# do
# #计算每页的偏移量
# offset=`echo "$page*$pageSize" | bc `
# echo "当前处理到第$page页,分页信息： limit $offset $pageSize  "
# ###第一个参数表名
# ###第二个参数偏移量
# ###第三个参数每页读取数据
# #调用f.sh获取数据
# sh f.sh $1 $offset $pageSize 
# done
# #sed -i 's/<[^>]*>//g;/^$/d'  tables/$1
# #sed -i 's/[a-zA-Z\.():;><-]//g' tables/$1


















# #第一个参数表名
# #第二个参数是start
# #第三个参数是offset
# #分页读取数据后，删除第一行表头，并写入一个文件中，文件名与表名一样
# sh port.sh $1 $2 $3  | sed '1d' >> tables/$1

# #删除无用的html字符
# #sed -i 's/<[^>]*>//g;/^$/d'  tables/$1   
# #删除无用的一些特殊符号
# #sed -i 's/[a-zA-Z\.():;><-]//g' tables/$1 








# # 控制等待输入的时间 -t Second
# if read -t 5 -p "Please input your name:" name;
# then
#     echo "$name,welcome!";
# else
#     echo "sorry";
# fi;
# exit 0

# # 控制输入字符长度 -nNumber Number表示控制字符的长度,超过则read命令立即接受输入并将其传给变量。无需按回车键。
# read -n1 -p "Do you agree with me [Y/N]?" ans
# case $ans in
# Y|y)
#     echo "Great!";;
# N|n)
#     echo "Oh No!";;
# *)
#     echo "Please choice Y or N";;
# esac;

# # 读取文件,通过cat file 配合管道处理,如 cat file | while read line
# count=1
# if read -p "choice your file:" yourfile;then
#     cat $yourfile|while read line
#     do
#         echo "Line $count:$line"
#         let count++
#     done
#     exit 0
# else
#     echo "None"
#     exit 0
# fi;
# exit 0
# # 繁琐版本
# echo "your name:"
# read name
# echo "name:$name"

# # 精简版 -p 提示
# read -p "your name:" name
# echo "name:$name"

# #如果不指定变量则放在环境变量REPLY中
# read -p "you name:"
# echo "name:$REPLY"

# #密码 read -s (输入不显示在监视器上,实则改变背景色)
# read -s -p "your pwd:"










# active=0
# while [ $active == 0 ]
# do
#    printf "Enter your new pwd:\n"
#    stty -echo
#    read pass < /dev/tty 
#    printf "Enter again:\n"
#    read pass2 < /dev/tty 
#    stty echo
#    if [ $pass == $pass2 ]
#    then
#         active=1
#         echo "输出成功！"
#         exit 1
#     else
#         echo "两次密码不一致，请重新输入"
#     fi
# done

















# mkdir -p ~/.trash    #创建一个目录作为回收站，这里使用的是用户家目录下的.trash目录 
# alias rm=trash       #命令别名 rm改变为trash，通过将rm命令别名值trash来实现把rm改造成删除文件至回收站 
# alias r=trash  
# alias rl='ls ~/.trash'  #rl 命令显示回收站中的文件 
# alias ur=undelfile      #ur命令找回回收站中的文件 
# undelfile()             #这个函数的作用是找回回收站下的文件 
# {  
#   mv -i ~/.trash/\$@ ./  
# }  
# trash()                 #这个函数是将指定的文件移动到指定的目录下，通过将rm命令别名值trash来实现把rm改造成删除文件至回收站 
# {  
#   mv $@ ~/.trash/  
# }  
# cleartrash()            #这个函数的作用是清空回收站目录下的所有文件 
# {  
#     read -p "clear sure?[n]" confirm   
#     [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf ~/.trash/*   
# }  












# echo "初始化中....."
# git pull origin master;
# git add -A;
# read -p "输入日志,按Enter键跳过 :" log
# if  [ ! -n "$log" ] ;then
#     git ci -m "自动生成";
# else git ci -m "${log}";
# fi;
# git push origin master;
# echo "远程推送完成"















# #列出最常用的10条历史命令
# printf "%-32s %-10s\n" 命令 次数
# cat ~/.bash_history | awk '{ list [$1] ++; } \
#     END {
#     for (i in list)
#     {
#     printf ("%-30s %-10s\n", i, list [i]); }
# }' | sort -nrk 2 | head









# less << EOF
# +--------------------------------------------------------------------------+
# |                      === Bash 快捷键大全速查表 ===                          |
# |-------------------------http://www.blog.beginman.cn----------------------|
# +-------------------------------By:BeginMan--------------------------------+

# >>>>>(1)编辑命令
# ---------------------------------------
# Ctrl + a ：移到命令行首
# Ctrl + e ：移到命令行尾
# Ctrl + f ：按字符前移（右向）
# Ctrl + b ：按字符后移（左向）
# Alt + f ：按单词前移（右向）
# Alt + b ：按单词后移（左向）
# Ctrl + xx：在命令行首和光标之间移动
# Ctrl + u ：从光标处删除至命令行首
# Ctrl + k ：从光标处删除至命令行尾
# Ctrl + w ：从光标处删除至字首
# Alt + d ：从光标处删除至字尾
# Ctrl + d ：删除光标处的字符
# Ctrl + h ：删除光标前的字符
# Ctrl + y ：粘贴至光标后
# Alt + c ：从光标处更改为首字母大写的单词
# Alt + u ：从光标处更改为全部大写的单词
# Alt + l ：从光标处更改为全部小写的单词
# Ctrl + t ：交换光标处和之前的字符
# Alt + t ：交换光标处和之前的单词
# Alt + Backspace：与 Ctrl + w 相同类似，分隔符有些差别 [感谢 rezilla 指正]
# ---------------------------------------

# >>>(2)重新执行命令
# ---------------------------------------
# Ctrl + r：逆向搜索命令历史
# Ctrl + g：从历史搜索模式退出
# Ctrl + p：历史中的上一条命令
# Ctrl + n：历史中的下一条命令
# Alt + .：使用上一条命令的最后一个参数
# ---------------------------------------


# >>>(3)控制命令
# ---------------------------------------
# Ctrl + l：清屏
# Ctrl + o：执行当前命令，并选择上一条命令
# Ctrl + s：阻止屏幕输出
# Ctrl + q：允许屏幕输出
# Ctrl + c：终止命令
# Ctrl + z：挂起命令
# ---------------------------------------


# >>>(4)Bang (!) 命令
# ---------------------------------------
# !!：执行上一条命令
# !blah：执行最近的以 blah 开头的命令，如 !ls
# !blah:p：仅打印输出，而不执行
# !$：上一条命令的最后一个参数，与 Alt + . 相同
# !$:p：打印输出 !$ 的内容
# !*：上一条命令的所有参数
# !*:p：打印输出 !* 的内容
# ^blah：删除上一条命令中的 blah
# ^blah^foo：将上一条命令中的 blah 替换为 foo
# ^blah^foo^：将上一条命令中所有的 blah 都替换为 foo
# ---------------------------------------
# EOF









# #*************************************************************************
# #desc:磁盘监控脚本
# #author:beginman
# #每两小时执行一次
# #0 */2 * * * /bin/sh /home/team/shells/disk_mintor.sh  
# #*************************************************************************

# diskinfo="/tmp/diskinfo.txt"

# for d in `df -P | grep /dev | awk '{print $5}'| sed 's/%//g'`
# do
# 	if [ $d -gt 90 ];then
# 		df -h>>$diskinfo;
# 		#sendmail
# 		mutt -s "disk warining!" "1373763906@qq.com" <${diskinfo} -a ${diskinfo}
# 		exit 0;
# 	fi
# done








# #*************************************************************************
# #desc:	平均负载监控，如果负载一直大于或接近逻辑CPU的个数(这里如果平均负载在90%以上)则说明CPU很繁忙，负载很高
# #		服务器性能低下，这个时候要通过vmstat查看并考虑优化或增大服务器性能
# #author:beginman
# #*************************************************************************
# physical_cpu=`cat /proc/cpuinfo | grep "physical id"|sort|wc -l`
# load_average_15min=`uptime | awk "{print $12}"`
# let "value=load_average_15min/physical_cpu"
# if [ $(echo "$value>=0.9"|bc) = 1 ]; then
# 	echo "CPU负载超过90%."
# 	mutt -s "CPU负载报警" 1373763906@qq.com `uptime`
# fi














# #in bash, you create array like this

# arr=(one two three)

# #to call the elements

# echo ${arr[0]}
# echo ${arr[2]}

# # or shell

# array=( "A" "B" "ElementC" "ElementE" )
# for element in ${array[@]}
# do
#         echo $element
#     done

#     echo ""
#     echo "Nbr of elements:" ${#array[@]}

#     echo ""
#     echo ${array[@]}





















# for I in A B C D
# do
#     echo "$I:"
#     for J in `seq 10`
#     do
#         if [ $J -eq 5 ]; then
#             continue        #结束本次并进入下次执行，这里不会打印5
#             #continue 2     #跳出循环
#         fi
#         echo -n "$J"
#     done
#     echo
# done
# echo










# #return n 指定值退出，如果没有n则返回状态是函数体中执行的最后一个命令的退出状态
# function func(){
#     return 1
# }

# #调用函数
# func
# #查看之前函数的返回值
# echo $?








# 🔸 脚本作用

# 	• 系统判断、网络判断
# 	• 依赖安装、软件安装
# 	• 正则匹配、配置修改



# 🔸 代码目标
# 	实现需求
# 	提高代码质量 和 可维护性

# 	如果你的脚本只有 几行. 比如就输出个文字. 
# 	那么是没有必要进行单元测试的.也用不到 git/svn 这样的版本控制.

# 	如果你的脚本在100行之内. 也没啥必要用单元测试.

# 	但是你的脚本有100+行... 就有必要了.





# 🔸 单元测试
# 	单元+测试 

# 	单元: 
# 		相对独立的模块. 完成自己的任务. 然后和别的单元进行交互. 
# 		最终完成整个程序的开发.

# 	测试: 
# 		判断测试对象对某个特定的输入有没有预期的输出.


# 	单元测试就是这么一个概念，一种努力保证构成程序的每个模块的正确性，从而保证整个程序的正确性的方法论。	








# 🔸 脚本测试


# 功能分离. 每个函数保持功能单一


# 代码走读: 代码逻辑

# 语法检测.

# 运行跟踪
#    命令格式： sh -vx ***.sh






# 🔸 实例详解!!!





# #!/bin/sh
# cd ~
# mkdir shell_tut
# cd shell_tut

# for ((i=0; i<10; i++)); do
# 	touch test_$i.txt
# done


















# 脚本

# 简介
# shell脚本难移植（BSD/GUN ）难debug
# 至少mac和linux之间 sed就不通用

# ‼️简单问题用shell脚本, 复杂问题用 ruby/python/perl ‼️
# ‼️脚本第一行:#!/bin/bash 必须这个！别自找麻烦‼️
# ‼️脚本第二行:set -x 输出每行执行的详细情况(变量)‼️
# ‼️脚本第三行:set -e 脚本出错,自动结束脚本‼️
# ‼️神器 shellcheck 来 debug, 提示各种语法问题.‼️




# 变量展开: 
# 在 shell 脚本中，偶尔可以看到这样的做法：
# echo $xxx | awk/sed/grep/cut... 。
# 看起来大张形势的样子，其实不过是想修改一个变量的值。
# bash内建的变量展开机制已经足以满足你各种需求！


# 获取命令行输入
# $1可以获取命令行输入的第一个参数，
# $2可以获取命令行输入的第2个参数，
# $3可以获取命令行输入的第......

# $0获取的脚本的名字
# $@获取所有的参数
# $#获取参数的数目。
# 记住@和#这两个符号，
# @前者表示全部参数，#表示参数的数目。





# 变量
# ❗️变量中如有空白符 或者特殊字符 如*, 必须加双引号❗️

# 变量大小写转换
# HI=HellO

# echo "$HI"   # HellO
# echo ${HI^}  # HellO
# echo ${HI^^} # HELLO
# echo ${HI,}  # hellO
# echo ${HI,,} # hello
# echo ${HI~}  # hellO
# echo ${HI~~} # hELLo
# 	^大写，,小写， ~大小写切换
# 	重复一次只修改首字母，重复两次则应用于所有字母。
# 	混着无效！只能用一种

# 移除匹配字符串
# %xx  从后往前，开始匹配，移除匹配的内容
# %%xx 跟上面的差不多，不过这是贪婪匹配
# #xx  从前往后，开始匹配，移除匹配的内容
# ##xx 跟上面的差不多，不过这是贪婪匹配

# FILENAME=/home/spacewander/param.sh
# echo ${FILENAME%/*} # /home/spacewander
# echo ${FILENAME%%/*} #
# echo ${FILENAME#*/} # home/spacewander/param.sh
# echo ${FILENAME##*/} # param.sh


# 查找替换
# /MATCH/VALUE 替换第一个匹配的内容。
# //MATCH/VALUE 替换匹配的内容

# echo ${FILENAME/home/office} # /office/spacewander/param.sh
# echo ${FILENAME//s/S} # /home/Spacewander/param.Sh




# 获取变量（字符串）长度：${#FILENAME}


# 截取变量
# TEXT=这个程序充满了BUG!

# echo ${TEXT:0:8}   → 这个程序充满了B // 截取前8字符.
# echo ${TEXT:4}     → 充满了BUG!
# echo ${TEXT:(-4)}  → BUG!





# 一次性建多个目录
# mkdir -p /home/user/{test,test1,test2}


# 获取HTTP完整头信息：
# curl -I http://www.example.com
# 获取Http 状态码
# curl -sL -w "%{http_code}\\n" www.example.com -o /dev/null



# 快速备份一个文件：
# cp some_file_name{,.bkp}

# 创建空文件或清空一个现有文件：
# \> test.txt

# 获取test.txt文件中第50-60行内容：
# < test.txt sed -n '50,60p'




# 扫描网络寻找开放的8081端口：
# nmap -p 8081 172.20.0.0/16




# 后台执行.
# 比如扫描局域网开发端口. 花费时间很久.

# 1. 先开始扫描.
# 2. 然后按 ctrl z 暂停到后台.
# 3. 然后输入 jobs 看后台任务. 
# 4. 发现任务是 暂停的 没有在运行
# 5. 然后输入 bg 
# 6. 再jobs 就看到后台运行了.


# 用”=”打印出横线:
# printf '%100s\n' | tr ' ' =

# ShellCheck 
# shell 提示/bug 非常有用
# 安装: brew install shellcheck


# 脚本种类: bash, python, ruby, c,lisp 等等.等等

# 	运行shell脚本 → sh xxx.sh            或者   xxx.sh
# 	运行Apple脚本 → osascript xxx.scpt
# 	运行php脚本   →  php xxx.php
# 	运行perl脚本   ./xxx.pl

# 	脚本权限: chmod +x xxx.sh


# Cron 定时任务
# Mac两种方式实现定时任务:
# - Mac   常用的 launchctl 最小间隔时间单位是秒! (❗️推荐❗️)
# - Linux 常用的 crontab   最小间隔时间单位是分!

# Crontab 方法: 
# 	crontab [-u username] [-l|-e|-r]
# 		-u ：帮其他使用者建立/移除 crontab 工作排程；需root权限.
# 		-e ：编辑 crontab 的工作內容
# 		-l ：查看 crontab 的工作內容
# 		-r ：移除所有的 crontab 的工作內容.

# 你可以手动输入来执行任务.
# 也可以把命令先写到某个文件,再调用那个文件来执行任务.


# 一: 用script editor 写一个 eat.scpt 苹果脚本
# 运行这脚本就会弹框让你去吃饭

# 二: 给eat.scpt 执行权限.

# 三: 把eat.scpt 加到自动执行任务里.
# crontab -e
# 1 * * * * osascript /Users/v/Desktop/AppleScript/eat.scpt
# // 这个命令会没一分钟就执行一次.
# 系统自动建立新cron，提示如下：crontab: installing new crontab。设置非常简单。

# 四: 报错:
# crontab: "/usr/bin/vi" exited with status 1
# 	这个报错用下面的命令修复 意思就是vi出错了. 那就用 nano来编辑文件就可以了.
# 	export EDITOR=nano

# 五: 重复第三步
# sh-3.2$ crontab -e
# crontab: installing new crontab
# 	出现这个 就说明 任务正在运行了 
# 	用crontab -l 就有显示了.
# ➜  ~ crontab -l
# 1 * * * * osascript /Users/v/Desktop/AppleScript/eat.scpt

# $  LaunchAgents  sudo launchctl list | grep cron
# 	98285	0	com.vix.cron 
# 		有pid 说明这个服务启用. 为什么不运行脚本就不知道了...

# 等半天怎么不执行呢.... 不继续了. 还是用 推荐的 plist吧.

# Crontab 实例:
#  * * * * * 命令
#  五个*号:   分、 时、 日、   月、 周
#  数字范围 0-59  0-23  1-31  1-12  0-7
 
# *号代表任何时间都接受的意思，任意。
# 	 *号之间用空格分开，
# 	如果是一段范围，用-号连接；
# 	如果是隔开几个时间，用,号表示。
 
# 命令必须是编写计划任务的用户有权限执行的，并且最后用绝对路径。

# * * * * * myCommand                  每1分钟执行一次myCommand
# 3,15 * * * * myCommand               每小时的第3和第15分钟执行
# 3,15 8-11 * * * myCommand            在上午8点到11点的第3和第15分钟执行
# 3,15 8-11 */2  *  * myCommand        每隔两天的上午8点到11点的第3和第15分钟执行
# 3,15 8-11 * * 1 myCommand            每周一上午8点到11点的第3和第15分钟执行
# 30 21 * * * /etc/init.d/smb restart  每晚的21:30重启smb

# Plist 方法:
# xxx.plist 就是一个 xml格式文件.系统默认是用xcode打开的.
# 你用任何文本编辑器也可以的.

# plist脚本存放路径为/Library/LaunchDaemons或用户目录/Library/LaunchAgents，
# 	后一个路径的脚本当用户登陆系统后才会被执行，
# 	前一个只要系统启动了，哪怕用户不登陆系统也会被执行。

# 自己编写的plist 一般放:~/Library/LaunchAgents

# 1. cd /Users/v/Library/LaunchAgents
# 2. touch com.v.cron.eat.plist 来建立一个 com.v.cron.eat.plist

# 	➜  LaunchAgents ls
# 	com.coppertino.VoxHelper.plist            com.spotify.webhelper.plist
# 	com.google.keystone.agent.plist           net.philosophicalzombie.eggtimer.plist
# 	com.qiuyuzhou.shadowsocksX-NG.http.plist  org.virtualbox.vboxwebsrv.plist
# 	com.qiuyuzhou.shadowsocksX-NG.local.plist
# 	// 这些就是 系统偏好设置 → “用户与群组” 下面的你自己添加的开机启动项.


# ★ com.v.cron.eat.plist 具体内容 ★

# <?xml version="1.0" encoding="UTF-8"?>
# <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
# <plist version="1.0">
#   <dict>

# 	<!-- plist名称，要全局唯一 -->
#     <key>Label</key>
#     <string>com.v.cron.eat</string>

# 	<!-- 命令， 第一行是命令 osascript 就是支持苹果脚本的意思，第二行是参数,也就是脚本路径-->
#     <key>ProgramArguments</key>
#     <array>
#         <string>osascript</string>
#         <string>/Users/v/Desktop/AppleScript/eat.scpt</string>
#     </array>

# 	<!-- 运行时间方式:   -->
# 		<!-- 可以是间隔多少运行:StartInterval -->
# 		<!-- 也可以是指定具体时间:StartCalendarInterval -->
# 		<!-- 下面就是每隔 5 秒 执行一次脚本. -->
#     <key>StartInterval</key>
#       <integer>5</integer>

#     <!-- 标准输入文件 -->
#     <key>StandardInPath</key>
#     <string>/Users/v/Desktop/log/eat.log</string>

# 	<!-- 标准输出文件 -->
#     <key>StandardOutPath</key>
#     <string>/Users/v/Desktop/log/eat.log</string>

# 	<!-- 标准错误输出文件 -->
#     <key>StandardErrorPath</key>
#     <string>/Users/v/Desktop/log/eat.log</string>
#   </dict>
# </plist>


# ★ 控制 Plist ★
# 	Plist 写好后. 还需要用下面命令 加载/卸载Plist
# 	launchctl load   com.aigo.launchctl.plist
# 	launchctl unload com.aigo.launchctl.plist
# 	launchctl start  com.aigo.launchctl.plist
# 	launchctl stop   com.aigo.launchctl.plist
# 	launchctl list

# 	要开启任务，必须先 load命令加载这个plist
# 	要停止任务, 必须用 unload .而不是 stop
# 	如果任务呗修改了，那么必须先unload，然后重新load
# 	start可以测试任务，这个是立即执行，不管时间到了没有
# 	❗️执行start和unload前，任务必须先load过!!!❗️
# 	stop可以停止任务
# 	ProgramArguments内不能直接写命令，只能通过shell脚本来执行


# 脚本编写:
# 会乱码. 需要.

# #!/bin/bash

# LANG=en_US.UTF-8
# export LANG

# svn status | xargs echo 
# echo "out: 输出正确的中文"







# 脚本运行Sudo

# sudo 是需要输入密码的. 执行脚本的时候 显然是要自动化的.

# 方法1: 使用管道
# 	echo password | sudo -S apt-get update

# 方法2: 使用重定向
# 	sudo -S apt-get update << EOF 
# 	你的密码
# 	EOF

# 在shell脚本中，通常将EOF与 << 结合使用，
# 	表示后续的输入作为子命令或子Shell的输入，直到遇到EOF为止，再返回到主Shell,
# 	即将‘你的密码’当做命令的输入

#  ‼️ 加上-S参数sudo才会从标准输入中读取密码，不加-S参数以上命令将起不到作用









'' !/bin/sh
'' //指定脚本解释器，这里是用/bin/sh做解释器
'' cd 
'' //切换到当前用户的home目录
'' mkdir shelltut 
'' //创建文件夹
'' cd shell_tut
'' //切换到新建文件夹
'' 
'' for ((i=0; i<10; i++)); do
'' touch test_$i.txt
'' // 创建 test_1、test_2 ... test_10 文件
'' done 
'' // 结束循环




