## PHP

*PHP 是脚本.*可以 嵌入到 HTML 中 适合 web 开发.
*特点:* 支持各种数据库!!!

*PHP 代码运行在服务器上.结果以纯文本返回浏览器(客户端).
> 所以客户端无法得知服务上的代码是如何运作的。


例子:

<html>
    <head>
        <title>Example</title>
    </head>
    <body>

        <?php
        echo "Hi, I'm a PHP script!";
        ?>

    </body>
</html>




如果电脑已经安装 并 运行了 PHP
所有 .php 都会用 php运行.

如果 把 .php 文件放到 web 目录中.

服务器将自动用 php
解析. php 文件.





[PHP Newbie Tutorial][1]


[书本 PHP The Right Way][2]

1. 编辑器:  Sublime.

2. HTML + CSS 2周左右. 有个印象就行.

3. [看视频][3]:

4. 版本控制 GIT
5. 框架
6. 服务器相关知识.


学 PHP 之前  要对
HTML CSS JavaScript 有基本了解.



PHP Hypertext Preprocessor
开源免费脚本语言. 



*PHP 文件:*
可以包含 文本. HTML.CSS 以及 PHP 代码.



*功能:

•	生成动态页面内容
•	创建、打开、读取、写入、删除以及关闭服务器上的文件
•	接收表单数据
•	发送并取回 cookies
•	添加、删除、修改数据库中的数据
•	限制用户访问网站中的某些页面
•	对数据进行加密

通过 PHP，您可以不受限于只输出 HTML。您还能够输出图像、PDF 文件、甚至 Flash 影片。您也可以输出任何文本，比如 XHTML 和 XML。


*为什么使用 PHP？
运行于各种平台（Win,Unix, Mac 等）
兼容所有服务器（Apache, IIS 等等）
支持多种数据库
是免费的。请从官方 PHP 资源下载：www.php.net
易于学习，并可高效地运行在服务器端



准备:
电脑上 安装 WEB 服务器   PHP 和 Mysql





## 基础语法:

PHP 脚本可以放在任何位置.



PHP 脚本以 
<?php 开头
// 此处是代码
?> 结尾

语句 用;结尾.

注释:

`// 单行注释
``#  单行注释
``/
``    多行注释
``/
`

大小写不敏感.

变量是对大小写敏感的.
扩展名: .php




1. 输出 Hello World

<?php 
echo "hello world"
?>




变量:
<?php
$x=5;
$y=6;
$z=$x+$y;
echo $z;
?>




PHP 变量规则：
•	变量以 $ 符号开头，其后是变量的名称
•	变量名称必须以字母或下划线开头
•	变量名称不能以数字开头
•	变量名称只能包含字母数字字符和下划线（A-z、0-9 以及 _）
•	变量名称对大小写敏感（$y 与 $Y 是两个不同的变量）
注释：PHP 变量名称对大小写敏感！



在上面的例子中，请注意我们不必告知 PHP 变量的数据类型。
PHP 根据它的值，自动把变量转换为正确的数据类型。


PHP 有三种不同的变量作用域：
•	local（局部）
•	global（全局）
•	static（静态）

函数之外声明的变量拥有 Global 作用域，只能在函数以外进行访问。
函数内部声明的变量拥有 LOCAL 作用域，只能在函数内部进行访问。



<?php 
$x=5; // 全局作用域

function myTest() {
  $y=10; // 局部作用域
  echo "\<p\>测试函数内部的变量：\</p\>";
  echo "变量 x 是：$x";
  echo "\<br\>";
  echo "变量 y 是：$x";
} 

myTest();

echo "\<p\>测试函数之外的变量：\</p\>";
echo "变量 x 是：$x";
echo "\<br\>";
echo "变量 y 是：$x";


?\>

两个变量 $x 和$y  以及一个函数 mytest()
$x  全局变量
$y  局部变量



您可以在不同的函数中创建名称相同的局部变量，因为局部变量只能被在其中创建它的函数识别。




global 关键词用于访问函数内的全局变量。
要做到这一点，请在（函数内部）变量前面使用 global 关键词：
实例
<?php
$x=5;
$y=10;

function myTest() {
  global $x,$y;
  $y=$x+$y;
}

myTest();
echo $y; // 输出 15
?>





PHP static 关键词
通常，当函数完成/执行后，会删除所有变量。不过，有时我需要不删除某个局部变量。实现这一点需要更进一步的工作。
要完成这一点，请在您首次声明变量时使用 static 关键词：
实例
\<?php

function myTest() {
  static $x=0;
  echo $x;
  $x++;
}

myTest();
myTest();
myTest();

?\>





*PHP 输出  echo & print

echo 输出一个以上的字符串
Print 只能输出一个字符串, 并始终返回1


echo 和 print 有无括号均可使用


*数据类型:*
字符串、整数、浮点数、逻辑、数组、对象、NULL。

字符串 引号内的任何文本, 单引号和双引号无所谓.

*整数: 
整数是没有小数的数字。
整数规则：
•	整数必须有至少一个数字（0-9）
•	整数不能包含逗号或空格
•	整数不能有小数点
•	整数正负均可
•	可以用三种格式规定整数：十进制、十六进制（前缀是 0x）或八进制（前缀是 0）



*浮点数

浮点数是有小数点或指数形式的数字。


`var_dump()` 会返回变量的数据类型和值：


*逻辑:
逻辑是 true 或 false。
逻辑常用于条件测试




*数组:
数组在一个变量中存储多个值。

<?php 
$cars=array("Volvo","BMW","SAAB");
var_dump($cars);
?>




strlen() 函数
strlen() 函数返回字符串的长度，以字符计。
下例返回字符串 "Hello world!" 的长度：
\<?php
echo strlen("Hello world!");
?\>

输出12 




PHP strpos() 函数
strpos() 函数用于检索字符串内指定的字符或文本。
如果找到匹配，则会返回首个匹配的字符位置。如果未找到匹配，则将返回 FALSE。
下例检索字符串 "Hello world!" 中的文本 "world"：
实例
\<?php
echo strpos("Hello world!","world");
?\>
运行实例
以上代码的输出是：6。字符串中首字符的位置是 0 而不是 1

常量类似变量，但是常量一旦被定义就无法更改或撤销定义。




设置 PHP 常量
如需设置常量，请使用 define() 函数 - 它使用三个参数：
1	首个参数定义常量的名称
2	第二个参数定义常量的值
3	可选的第三个参数规定常量名是否对大小写敏感。默认是 false。
下例创建了一个对大小写敏感的常量，值为 "Welcome to W3School.com.cn!"：
实例
\<?php
define("GREETING", "Welcome to W3School.com.cn!");
echo GREETING;
?\>


下例创建了一个对大小写不敏感的常量，值为 "Welcome to W3School.com.cn!"：
实例
\<?php
define("GREETING", "Welcome to W3School.com.cn!", true);
echo greeting;
?\>




*运算符
`+ - * / %(余数)`

= 赋值运算

这意味着右侧赋值表达式会为左侧运算数设置值。

`x += y  → x = x + y`
`x *= y  → x = x * y`
`x /= y  → x = x / y`



++$x
前递增
$x 加一递增，然后返回 $x

$x++
后递增
返回 $x，然后 $x 加一递增



--$x
前递减
$x 减一递减，然后返回 $x


$x--
后递减
返回 $x，然后 $x 减一递减


==
等于


===
全等（完全相同)   类型也相同.

!=
不等于


\<\>
不等于



!==
不全等（完全不同）



and
与


or
或


xor
异或


&&
与



||
或


!
非




数组运算


+
联合

==
相等


===
全等


!=
不相等

\<\>
不相等

!==
不全等





下例将输出 "Have a good day!"，如果当前时间 (HOUR) 小于 20，否则输出 "Have a good night!"：
实例
\<?php
$t=date("H");

if ($t\<"20") {
  echo "Have a good day!";
} else {
  echo "Have a good night!";
}
?\>


*while 循环
反复运行一段代码.




## 学 php

多些
小巧框架练手.



https://github.com/Xu-Jian

























































[1]:	https://gist.github.com/h2ero/6592369
[2]:	http://laravel-china.github.io/php-the-right-way/
[3]:	http://www.php100.com/html/shipinjiaocheng/old/%20