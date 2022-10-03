###### Regular Expression

- 简写: Regex、Regexp / RE,源于 Unix中的工具软件（如sed和grep）.
- 作用: **描述/匹配 符合某个语法规则的字符串**

技巧:   ^ 要   /g 也要.
	sed -i 's/^#.ms-dns 192.168.1.1/ms-dns 8.8.8.8/g' /etc/ppp/options

> 不同系统,语法不一样.有些命令 debian 能用 mac 就不能用.

Mac :    BSD sed  
Ubuntu : GNU sed

###### 比如:
- 直接修改文件内的 xujian → xx
Debian
	sed -i 's/xujian/xx' xujian.md

Mac : 
> 备份文件参数 变成必选. 需要提供一个空字符串做为备份文件名。
	sed -i '' 's/xujian/xx' xujian.md


- 删除配置文件里的 # 号:
	sed ‘s#//.\*\#\#’ xx.md

在尾行添加1个空格

	sed ‘s/\[0-9]$/& /g’ file > flile.new.conf


##### 正则表达式:


	^ 行首定位符 --------------- ^my ------ 所有 my 开头的行
	$ 行尾定位符 --------------- my$ ------ 所有 my 结尾的行
	. 匹配换行符以外的单个字符  -- m..y ----- 含字母m+任意两个字符+y 的行
	* 匹配 0或多个前导字符  ----- my\* ----- 含字母m,后面跟0个或多个 y字母 的行.
	[] ----------------------- [Mm]y ---- 含 My 或者 my 的行.
	[^] ---------------------- [^Mm]y --- 含 y 但前面不是 M/m 的行.
	\< 词首定位  -------------- \<my ----- 含 my 开头的单词的行
	\> 词尾定位  -------------- \>my ----- 含 my 结尾的单词的行
	x\{m\} 重复字符 x       m 次  /0\{5\} 匹配包含5个0 的行
	x\{m,\} 重复字符 x 至少 m 次  /0\{5\} 匹配包含至少5个0 的行
	x\{m,n\} 重复字符 x m-n 次  /0\{5,10\} 匹配包含 5-10 个0 的行
	
	
	
	
	a\ 当前行下面 插入文本
	i\ 当前行上面 插入文本
	c\ 用符号后面的文本 替换当前行内容.
	d 删除行
	p 打印模板块的行
	n 读取下一行
	s 替换指定字符.
	r file 从文件中读取行
	w file 写 并追加模板块到文件末尾
	= 打印当前行号
	
	
	
	替换标记
	q 全局替换.
	p 打印行
	w 写入文件
 
 
 
 
###### sed stream editor

- 流编辑器,用程序的方式来编辑文本.sed基本上就是玩正则模式匹配.
\- 
- i 命令 来直接修改文件. 免去重新定向输出才能修改文件.

- 默认输出: 所有内容的

- -n 仅显示处理后的结果.

	显示 第3行                             | sed -n '3p' xujian.md
	显示 1-7行                             | sed -n '1,7p' xujian.md
	删除 空白行                             | sed '/^$/d' xujian.md
	删除 第2行                             | sed '2d' xujian.md
	删除 尾行                              | sed '$d' xujian.md
	删除 最后两行                           | sed 'N;$d' xujian.md
	删除 2-10行                            | sed '2,10d' xujian.md
	删除 2-尾行                            | sed '2,$d' xujian.md
	删除 含 name 行                        | sed 'name' xujian.md
	删除 My 开头 行                        | sed '/^My/d' xujian.md
	删除 含 name 行 到 含 phone 行 之间的行  | sed '/name,/phone/d' xujian.md
	删除 含 name 行 到 第10行   之间的行     | sed '/name,10d' xujian.md
	替换 IP 成 localhost                  | sed 's/^IP/localhost/' xujian.md
	添加 IP 后添加 localhost               | sed 's/^IP/&localhost/' xujian.md



如何使用sed删除倒数第一行和倒数的几行？

只做一遍扫描的话难免要用到循环，看看下面这个能不能用吧：

- 删除倒数两行：
	seq 10 1 |sed -n '1{N;};:a;N;P;D;t a'

- 删除倒数三行：
	seq 10 1 |sed -n '1{N;N;};:a;N;P;D;t a'

其他依次类推，增加N的数量就行。

- 删除倒数一行最简单：
	seq 10 1 |sed -n ':a;N;P;D;t a'

或者
	seq 10 1 | sed '$d'
	seq 10 1 | sed -n '$q;p'



替换 所有My开头的 成 You  g 是全局的意思.
	sed 's/^My/You/g' xujian.md



取消默认输出模式 在1-20行中 找 My 结尾的单词 并换成 You      全局查找 并打印到屏幕
	sed -n '1,20s/My$/You/gp'

- 多重编辑命令. e 参数
多重编辑  选删除1-10行  再 把所有 My 替换成 Your
	sed -e '1,10d' -e 's/My/Your/g' xujian.md




###### r 命令
将一个文件中的内容 添加到 当前文件的 特定位置.

	sed '/My/r xx.md' xujian.md
xujian.md 文件中找到 My 行 
该行后 添加 xx.md 内容  (如果 找到很多行 My 则每行下面都加新文件内容)


将匹配行输出到文件.
	sed -n '/root/w xujian.md'


在 passwd 文件找 root 行 把 xx.md 文件加到 root 行后面.
	sed '/root/r xx.md' /etc/passwd 
	
	
	sed '/root/{n;d}' xujian.md  找到 root 行  删除root 行的下一行.
	sed '/root/{N;d}' xujian.md  找到 root 行  删除root 行及下一行.




###### \# sed 脚本编写:

新建 sed.sh 文件:
	s/root/xujian/p
	s/bash/csh/p

从文件读取命令
	sed -f sed.sh

直接运行脚本 
	./sed.sh/etc/passwd
	
	#!/bib/sed -f  
	s/root/yerik/p  
	s/bash/csh/p  


删除文件每行第一个字符

	sed -n 's/^.//gp' /etc/passwd
	sed -nr 's/(.)(.\*)/\2/p' /etc/passwd


删除文件每行的第二个字符。
	sed -nr 's/(.)(.)(.\*)/\1\3/p' /etc/passwd
  
删除文件每行的最后一个字符。
	sed -nr 's/.$//p' /etc/passwd
	sed -nr 's/(.\*)(.)/\1/p' /etc/passwd
  
4，删除文件每行的倒数第二个字符。
	sed -nr 's/(.\*)(.)(.)/\1\3/p' /etc/passwd
  
5，删除文件每行的第二个单词。
	sed -nr 's/(\[^a-Z]*)(\[a-Z]+)(\[^a-Z]+)(\[a-Z]+)(.*)/\1\2\3\5/p' /etc/passwd
  
6，删除文件每行的倒数第二个单词。
	sed -nr 's/(.*)(\[^a-Z]+)(\[a-Z]+)(\[^a-Z]+)(\[a-Z]+)(\[^a-Z]*)/\1\2\4\5\6/p' /etc/samba/smb.conf
  
7，删除文件每行的最后一个单词。
	sed -nr 's/(.*)(\[^a-Z]+)(\[a-Z]+)(\[^a-Z]*)/\1\2\4/p' /etc/samba/smb.conf
  
8，交换每行的第一个字符和第二个字符。
	sed -nr 's/(.)(.)(.\*)/\2\1\3/p' /etc/passwd
  
9，交换每行的第一个单词和第二个单词。
	sed -nr 's/(\[^a-Z]*)(\[a-Z]+)(\[^a-Z]+)(\[a-Z]+)(.*)/\1\4\3\2\5/p' /etc/samba/smb.conf
  
10，交换每行的第一个单词和最后一个单词。
	sed -nr 's/(\[^a-Z]*)(\[a-Z]+)(\[^a-Z]+)(\[a-Z]+)(.*)/\1\4\3\2\5/p' /etc/passwd
  
11，删除一个文件中所有的数字。
	sed 's/\[0-9]\*//g' /etc/passwd
  
12，删除每行开头的所有空格。
	sed -n 's/^\ *//p' /etc/samba/smb.conf
	sed -nr 's/( *)(.\*)/\2/p' testp
  
13，用制表符替换文件中出现的所有空格。
	sed -n 's/\ /\t/gp' pass
  
14，把所有大写字母用括号（）括起来。
	sed -nr 's/(\[A-Z])/(&)/gp' testp
	sed -n 's/\[A-Z]/(&)/gp' testp

15，打印每行3次。
	sed 'p;p' pass
  
16，隔行删除。
	sed -n '1\~2p' pass
  
17，把文件从第22行到第33行复制到第44行后面。
	sed '1,21h;22h;23,33H;44G' pass
  
18，把文件从第22行到第33行移动到第44行后面。
	sed '22{h;d};23,33{H;d};44G' pass
  
19，只显示每行的第一个单词。
	sed -nr 's/(\[^a-Z]*)(\[a-Z]+)(\[^a-Z]+)(.*)/\2/p' /etc/passwd
  
20，打印每行的第一个单词和第三个单词。
	sed -nr 's/(\[^a-Z]*)(\[a-Z]+)(\[^a-Z]+)(\[a-Z]+)(\[^a-Z]+)(\[a-Z]+)(.*)/\2--\4/p' /etc/passwd
  
21，将格式为    mm/yy/dd    的日期格式换成   mm；yy；dd
	date +%m/%Y/%d |sed -n 's#/#;#gp'
  
22, 逆向输出
	cat a.txt
	ABC
	DEF
	XYZ
	输出样式变成
	XYZ
	DEF
	ABC



- w 将所选行 写入文件
	  



## grep:
Global Regular Expression Print  文本搜索工具.  



例如：Handel、Händel和Haendel这三个字符串，  
都可以由“H(a|ä|ae)ndel”这个模式来描述。  
|竖直分隔符代表选择。例如: “gray|grey”可以匹配grey或gray。

### 数量限定符:
	+ ? * （不加数量限定则代表:仅出现一次）


|     符号  |    解释                                      |       备注          |
|:--------:|:-------------------------------------------- |:------------------:|
| +        | 代表前面的字符 至少出现一次。                       | 1次、或多次          |
| ?        | 代表前面的字符 最多出现一次。                     | 0次、或1次          |
| \*        | 代表前面的字符 可有可无可多次。                   | 0次、或1次、或多次    |
| goo+gle  | 匹配google、gooogle、goooogle等;               |                    |
| colou?r  | 匹配color或者colour;                           |                    |
| 0\*42     | 匹配42、042、0042、00042等。                    |                    |





### 匹配:
圆括号 限定操作符的范围     和优先度。

	gr(a|e)y  ============== gray / grey
	(grand)?father ========= father / grandfather


#### 贪婪模式: 尽可能少的匹配所搜索的字符串
#### 非贪婪模式: 尽可能多的匹配所搜索的字符串
对于字符串“oooo”，“o+?”将匹配单个“o”，而“o+”将匹配所有“o”。



	\  接特殊字符
	\n → 换行符.
	\\ → \
	\( → (



^ 匹配字符串的开始位置
$ 匹配字符串的结束位置
?  当紧跟在其他限制符 后面的话:开启 非贪婪模式

| | |
|:----------------------------------|:------------------------------------ |
| (?=)  正向肯定预查                   | (?!)  正向否定预查                    |  
| windows(?=95\|98\|2000\|xp)        | windows(?!95\|98\|2000\|xp)         |
| 能匹配 windows2000 里面的 windows    | 不能匹配 windows2000 里面的 windows   |
| 不能匹配 windows3  里面的 windows    | 能匹配 windows33  里面的 windows      |
|                                    |                                     |
| (?\<=)  反向肯定预查                  | (?\<!)  反向否定预查                  |  
| (?\<=95\|98\|NT\|2000)Windows       | (?\<=95|98|NT|2000)Windows          |
| 能匹配 2000windows 里面的 windows    | 不能匹配 2000windows 里面的 windows   |
| 不能匹配 3windows  里面的 windows    | 能匹配 33windows  里面的 windows      |




| 优先权 |             符号             |
|:-----:|:---------------------------:|
| 最高   |    \                          |
| 高    |  ( )、(?: )、(?= )、[ ]      |
| 中    |  \*、+、?、{n}、{n,}、{m,n}    |
| 低    |  ^、$、中介字符               |
| 最低     |  |                          |







正则表达式:  使用单个字符串来描述、匹配一系列符合某个句法规则的字符串。  

文本编辑器里:，通常被用来检索、替换那些符合某个模式的文本。



许多程序设计语言都支持利用正则表达式进行字符串操作。  
例如，在Perl中就内建了一个功能强大的正则表达式引擎。



\*\* 功能 : \*\*  一个命令直接改文件内容: 不用 vi 查找 编辑 修改 保存退出.







## Perl


Perl兼容正则表达式，Perl Compatible Regular Expressions

编程语言.
最重要功能: 内部集成了 正则式表达功能 一级第三方代码库 CPAN




文件读取:  钻石符号: \<\>

$^I  


|  | 表达形式  | |  
|:----:|:----------:|:---:|
| 匹配：| m/<regexp>;/ （还可以简写为 /<regexp>;/ ，略去 m）
| 替换：| s/<pattern>;/<replacement>;/
| 转化：| tr/<pattern>;/<replacemnt>;/