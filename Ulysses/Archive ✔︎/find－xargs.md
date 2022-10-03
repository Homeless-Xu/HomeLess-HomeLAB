## find－xargs

在使用 find命令的-exec选项处理匹配到的文件时， find命令将所有匹配到的文件一起传递给exec执行。但有些系统对能够传递给exec的命令长度有限制，这样在find命令运行几分钟之后，就会出现溢出错误。错误信息通常是“参数列太长”或“参数列溢出”。这就是xargs命令的用处所在，特别是与find命令一起使用。  
find命令把匹配到的文件传递给xargs命令，而xargs命令每次只获取一部分文件而不是全部，不像-exec选项那样。这样它可以先处理最先获取的一部分文件，然后是下一批，并如此继续下去。  
在有些系统中，使用-exec选项会为处理每一个匹配到的文件而发起一个相应的进程，并非将匹配到的文件全部作为参数一次执行；这样在有些情况下就会出现进程过多，系统性能下降的问题，因而效率不高； 而使用xargs命令则只有一个进程。另外，在使用xargs命令时，究竟是一次获取所有的参数，还是分批取得参数，以及每一次获取参数的数目都会根据该命令的选项及系统内核中相应的可调参数来确定。
使用实例：
实例1： 查找系统中的每一个普通文件，然后使用xargs命令来测试它们分别属于哪类文件 
命令：
find . -type f -print | xargs file
 
在整个系统中查找内存信息转储文件(core dump) ，然后把结果保存到/tmp/core.log 文件中
命令：
 find / -name “core” -print | xargs echo “” \>/tmp/core.log
 
在当前目录下查找所有用户具有读、写和执行权限的文件，并收回相应的写权限
命令：
find . -perm -7 -print | xargs chmod o-w
用grep命令在所有的普通文件中搜索hostname这个词
命令：
find . -type f -print | xargs grep “hostname”
 
用grep命令在当前目录下的所有普通文件中搜索hostnames这个词
命令：
find . -name \* -type f -print | xargs grep “hostnames”
 
使用xargs执行mv 
命令：
find . -name “\*.log” | xargs -i mv {} test4
 
find后执行xargs提示xargs: argument line too long解决方法：
命令：
find . -type f -atime +0 -print0 | xargs -0 -l1 -t rm -f
 
xargs的-p参数的使用 
命令：
find . -name “\*.log” | xargs -p -i mv {} ..
输出：
 
 
 
 
 
 
 
 
 
 
 


















