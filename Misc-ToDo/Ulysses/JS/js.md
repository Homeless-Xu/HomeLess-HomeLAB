网页开发 / node.js

what is js.
能够通过连接环境对象而实现可控制编译.

js 包含一系列对象的 标准库. 
比如 数组. 日期 数学 流程控制. 以及语句.


**客户端的 JS
通过控制 浏览器 以及其文档对象模型(DOM)的对象来扩展语言核心
如:响应用户事件.比如 鼠标点击.表单提交 和 页面导航.

**服务端的 JS
提供应用不同调用间的信息连续性, 或者 在服务器上执行文件操作.




JS 标准化组织 是 ECMA. 版本规范.

**入门:
只需要个 浏览器.



浏览器控制台: (console 下面有一行 直接输入命令就行.)
当前页面的信息. & 执行 js 代码的命令行




**Basics**

js 很多借鉴 java. 但是 也受  awk perl python 的影响.

**JS 是大小写敏感的**

js 中 语句: 被称为 statements.  用分号分割.



*Comments
// 单行注释
`/*  */` 多行注释.
> 不能嵌套注释. 比如注释里面还有注释… 就会报错.


Declarations 声明 (三种)
- var 
	- let
	- const


Variables 变量: 给值命名.

*Declaring variables   声明变量. 三种

1. var x = 42 同时声明 局部和全局变量.
2. let x = 42    声明  语句块代码段的局部变量.
3. x = 42 直接赋值 声明一个全局变量
	> 这个会导致 js 编译产生严格警告. 避免使用这种


对变量求值:

用 var / let 声明的 未赋初值的变量. 
值会被设定为 undefined. 
> 即使没定义值. 本身也是一个值.

undefined 在布尔类型 中 会被当成 false.
undefined 在数值类环境中 会被转为 NaN: not a number.
对一个 空变量求值. 空值 null 在数值环境中被当成0来对待.



**访问一个 未初始化的变量会导致 编译出错.**


变量域: variable scope

在所有函数 之外声明的变量 叫全局变量. 可以被当前文档的其他代码访问.

在函数内部声明的变量 叫局部变量.只能在该函数内部访问.



变量声明提升 variable hoisting

可以引用 稍后声明的 变量. 不一定要先声明.
然而提升后的变量返回值(不管有没有定义过)都是undefined.



由于存在变量声明提升，一个函数中所有的var语句应尽可能地放在接近函数顶部的地方。这大大地提升了程序代码的清晰度。

全局变量 Global variables



**常量 Constants**
可以创建只读(read-only)的常量.
常量 不可以通过赋值 改变其值.
也不可以在脚本运行时 重新声明.
必须被初始化为某个值.


**数据类型.
Boolean  布尔值 true / false.
null:
undefined 变量未定义时的属性.
Number   表示数字
String 表示字符串
Symbol (新加的) 它的实例是唯一 且不可改变的.

Object 对象.



**数据类型转换**
js 是一种 动态类型语言: 声明变量时 可以不指定数据类型.
类型在脚本执行时候 自动转换.

var answer = 42;
answer = “Thanks for your kiss”
这样是可以的, 不会报错.




加法运算: js 把数字值 转换为 字符串.
x = “your age is” + 19 // →  your age is 19
y = 19 + “is your age” // →  19 is your age 
其他运算: js 不把数字变成字符.
“37” - 7 // → 30
“37” + 7 // → “377”

**表示数字的字符串 变成 对应数字方法:
- parseint()    返回整数. 丢失小数部分.
	> 调用 parseInt 时最好总是带上进制(radix) 参数，这个参数用于指定使用哪一种数制。
- parseFloat() 
-  单目加法运算.
	“1.1” + “1.1” = “1.11.1”
	(+”1.1”) + (+”1.1”) = 2.2 


**字面值: Literals
字面值 是常量. 不是变量.

**数组字面值** Array literals
3个元素生成数组coffees，它的长度是3
`var coffees = ["French Roast","Colombian","kona"];`
`var a=[3];                                        `
`console.log(a.length); // 1`
`console.log(a[0])      // 3`


数组 字面值中多余的 逗号.
声明时: 不必列举出 所有元素. 同一行中连写两个逗号
数组会产生一个没有被指定的元素. 其初始值是 undefined.

`var fish = ["Lion", , "Angel"];`
`fish[0] → Lion`
`fish[1] → undefined`
`fish[2] → Angel`






布尔 字面值: boolean literals

**整数** intergers
十进制   前面不带0
八进制   前缀 0/00  后面的只能是 0-7.
十六进制 前缀0x 后面可以是 0-9 a-f/A-F.


**浮点数**floating-point literals.
小数点 
指数e/E 开头


**对象字面值 (object literals)**




RegExp 字面值 
正则式表达文字的一个例子.
`var re = /ab+c/;`


**字符串字面值 string Literals**
双引号 / 单引号 包围.
“foo” ‘bar’ 

字符串 特殊字符
\0 空字节
\b 退格
\f 换页
\n 换行
\t 制表符 Tab
\v 垂直制表符
\’ 单引号
\” 双引号
\\ 反斜杠


比如 路径:

`var home = "c:\\temp";`




**Unicode 编码**
通用字符编码标准. 全球级别的.

unicode 转义 `\u + 四位十六进制数`
`\u00A9` 表示 版权符号





语句块 block statement

**语句块给语句分组. 使得结构清晰明了** 用 {}

通常用于 流程控制 如: if for while.

while (x \< 10) 
{ x++; } // 这行就是 语句块.




**条件表达式**
> 条件表达式 最好不要使用 “=“ 来判断条件是否相等.会产生 非预期结果.** 也就是 不要使用 if ((x=y)) { ……;}

下面这些值 会被计算出 false.

false
undefined
null
0
NaN
空字符串.
**其他 所有值 都会被计算成 true.**


不要混淆 原始的 布尔值 true/false 与 布尔对象的值true/false .

var b = new Boolean(false);
if (b) // this condition evaluates to true
if (b == true) // this condition evaluates to false




**switch 语句**
匹配 表达式中的 某个. 匹配成功 就执行相关语句.

`switch (expression){  `
`  case label1;        `
`    statements1       `
`    [break;]          `
`  case label2;        `
`    statements2       `
`    [break;]          `
`  case label3;        `
`    statements3       `
`    [break;]          `
`}                     `




**循环语句 Loop Statement**
for / do while / while label.





**for statement**




**do…while**
do 
statement
while (condition);


statement 会在 条件判断之前执行一次.
也就是 do while 肯定会执行一次命令.


while (condition)
statement



**避免死循环**
确保循环里面的条件最终会变成 false.
不然这这循环会一直运行. 别的命令就执行不下去了.
while (true) {
alert(“Hello,world”);
}

标签语句: label statement
同一程序,在另外一处找到它的标识.
可以用一个标签 来识别一个循环. 并 break/continue 语句来睡眠一个程序是否要中断



**中断语句  break statement**
终止循环,开关 活着 标签语句连接.
break;  /  break label;


使用 没带标签语句的break 时:
循环语句内 立刻终止.并转移到后面的语句
使用 带有标签语句的 break 时:
终止特定的标签语句.





**连续语句: continue statement**
重新开始 while … 等等的语句. 或者标签语句.

continue / continue label;




异常处理语句 Exception handling statements
throw 语句 抛出一个异常. 并用 try catch 捕获处理.



异常类型: Exception Types.
js 可以抛出任意对象.
但是 不是 所有对象都能产生相同的结果.



**抛出语句: throw statement**








**XHR 加载图片**
Promise / 和 XHR 的区别:


promise: 异步计算.
一个 promise 代表一个还未完成, 但是预期将来会完成的操作.




**循环和迭代.**


循环: 计算机游戏 x 方向走n步, y 方向走m步.
n/m 步 是 一步一步 循环出来的.


循环有很多种,本质都一样. 重复某个动作.
某种循环 在某些时候 用起来会更加简答.


**for:** 一直重复执行.直到循环条件 false.
(有可能一次都不执行)

**do… while:** 一直重复命令 直到条件不满足.
(所以 至少会执行一次)

**while**
只要条件的求值 为真(true) 就一直执行.





**函数**
js 基本构建之一.要使用函数,必须先定义.

- 函数名称:()前面部分
	- 函数列表:()里面 用,区分
	- 函数功能:{}里面的内容.


例:

`function square(number){`
`return number * number`
`}`
`
`等于
var square = function(number) {
return Number*Number
}

var x = square(4); // x 得到 16


函数表达式: function expression



**函数调用** call function.
定义的函数 不会自动执行. 要调用才会运行.




**闭包** closures
js 最强大的特性之一.
*内部函数*
可以访问 定义在外部函数中的所有变量和函数,以及外部函数能访问的所有变量和函数.
*外部函数*
不能访问 定义在内部函数中的变量和函数.
这给内部函数的变量 提供了一定的安全性能.

当 内部函数生存周期大于外部函数时.
内部函数可以访问外部函数的作用域.定义在外部函数的变量和函数的生存周期会大于外部函数本身.. 
当内部函数以某种方式被任何一个外部函数作用域访问时,一个闭包就产生了.



var pet = function(name) {// 外部函数定义了变量 name.
var getName=function() {
// 内部函数可访问外部的 name
return name;
}

//返回这个内部函数.从而将期暴露在外部函数作用域,
return getName;

},
myPet = pet(“Vivie”)

myPet();    //返回结果 vivle 








*arguments 对象*
函数的司机参数 会被保存在一个 类似数组的 arguements 对象中. 函数内 你可以用如下方式 找出传入的引数:
`arguements[i]`
i 是引数的序号. 0 开始..
第一个参数 是  
`arguments[0]`… 参数数量由 arguements.length 表示.




函数参数 Function parameter.
默认参数: default parameters
剩余参数: rest parameters


*箭头函数* arrow function.


*预定义函数 predefined function*
内建的函数.
eval() 
uneval()
isFinite()  判断传入的值 是否是有限的数值.
isNaN() 判断函数值 是否是 NaN





*表达式/运算符*

赋值运算
比较运算
算数运算
按位运算
逻辑运算
字符串运算
条件运算
逗号运算
一元运算
关系运算


js 有  
*二元运算 binary*
需要两个操作数 operand,分别在运算符前后.
操作数1   运算符  操作数2
operand1 operator operand2
`as: 3+4 / x*y`

*一元运算 unary*
一个运算符. 前后都可以.
operator operand;
operand operator;
`as: x++ / ++x`


*三元运算 ternary (一个:条件运算符)






**赋值运算**  assignment operators.
x = y
x += y → x=x+y
`x *=y → x=x*y`


`==`  等于. 两边操作数相等时 返回 true.
`!=`  不等
`===` 全等 . 两边操作数相等 且 类型相同.

`%` 求余. 13%5 → 3
`++` 自增
x++ 将操作数的值  然后在+1.
++x 返回+1后的值.


**位运算符号**
a & b
a | b
a ^ b
`~a` 反转被操作数的位.
a \<\< b  将 a 的二进制串 向左移b 位.右边移入0.
a \>\> b 把 a 的二进制表示 向右移动 b 位.丢弃被移出的所有位.




表达式: expressions


基本表达式 primary expressions.




数字:
js 里 数字都是 双精度浮点类型的.
double-precision 64-bit binary format.
一个数字 只能在 
负的  2 的53次-1
正的 2的53次 -1    之间.


十进制数字 decimal numbers.

十进制 可以0 开头. 
但是 如果后面接的数字小于8.那么该数字会被当成8进制处理.



**数字对象:**

`Number.MAX_VALUE`  最大值
`Number.MIN_VALUE` 最小值
Number.NaN 非数字
`Number.NEGATIVE_INFINITY` 负无穷. 益出时返回.
`Number.NEGATIVE_INFINITY` 正无穷. 溢出时返回.

`Number.MIN_SAFE_INTEGER` js 最小安全整数.
`Number.MAX_SAFE_INTEGER` js 最大安全整数.





字符串. String   表示 文本型的数据.
可以用 单引号/双引号...

16 进制转义: 
`\xA9` → "©"
Unicode 转义: u 后面至少四个字符.
`\u00A9` → "©"



















var the changeable name .
name: 
letter  start.
letter number $ `_` 
no js keyword



变量  先申明再赋值. 可以重复赋值
var mychar;
mychar=“javascript”
mychar=“hello”


JS 区分大小写.
变量 虽然可以不申明 直接用 但是 不规范.


## if else

if  条件
条件成立   执行 
条件不成立 执行 else 后面的


如: 年龄判断 是否成年,

\<script type="text/javascript"\>
var myage=18;
if(myage\>=18)
{document.write(“you are chen nian”);}
else
{document.write(“you are too young”);}

\</script\>




## 函数:  在 js 里面.
完成 某个特定功能的 一组 语句.

没有函数  需要很多行代码.
有了函数. 后面直接调用这个函数就可以了.
不用重复输入大量代码.


function add2()
{
var sum= 3+2;
alert (sum);
}

函数定义好 是不会自动运行的 . 需要调用.





打开新窗口:  window.open

open()  查找一个已经存在的  或者 新建一个窗口.

`window.open([url],[窗口名称],[参数])`

url 可选.

窗口名称: 
`_top` 网页上部 显示目标网页
`left` 网页左边
`width/height` 窗口宽度
`menubar` : yes/no 有没有 菜单
`toolbar`  有没有 工具栏
`scrollbars` 有没有 滚动条
`status` 有没有 状态栏.
 
`_blank` 新窗口显示网页
`_selft`当前窗口显示.

相同 name 的窗口只能建一个.



















































