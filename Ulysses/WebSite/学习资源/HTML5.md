## HTML5

Hyper Text Markup Language 
*是一种标记语言, 使用标记标签来描述网页*
浏览器默认:多空格和回车 当成一个空额
HTML告诉浏览器 元素是什么,而不管元素长成什么样子( CSS Do ).
> hyper 是链接的意思 不是超级的意思.
> 最初作用: 文字该怎么排版. 哪里放图片 哪里放文本....

*HTML 标准: *
一直更新的;表面由w3c 维护…其实是各大厂家决定的. 
> 每种浏览器添加新功能 都是需要修改升级 HTML 标准的 .
谷歌 → chrome
苹果 → safari
微软 → IE
开源 → Firefox

Web Develop Tooles:    Browser & texteditor.


`<wbr> </wbr>`  word break .  英文单词太长.到行尾可以自动分开成两行写. 这样文档会整齐很多. 


`<b> 加粗  <i> 斜体`
中文字体: 有些本身是不支持加粗的.
> 看上去加粗效果不明显
英文支持: 加粗效果明显.
> 具体看字体库.
- GB18030 → 只有 regular 
	说明这个字体 本身不支持加粗.(这个要实现加粗效果就没英文那个好了)

	- Arial → regular / italic / bolid / bolid italic  
		这个英文字体有:常规,斜体. 加粗,粗斜体.....

[html 在线编辑器:][1] 边写边预览.


标签不区分大小写.

分段用 p . 每段一个 p
p  h1-h6  br  
> 浏览器会自动在 标题前后添加空行
> 也会自动在 块级元素前后添加空行. (段落/标题/div....)


用标题来呈现文档结构是很重要的。
*使用标题要慎重.不要为了加粗而用标题*
> 搜索引擎使用标题为您的网页的结构和内容编制索引。

\<hr /\>  水平线.   分割内容(可以分割文章小节).

html 属性:  名称/值: → name=“value”
*属性值始终在引号内*


*deprecated 废弃属性 *
(不要使用如下的 用样式代替)
<center>                居中
<font>  <basefont>      字体
<s>     <strike>        删除线
<u>                     下划线
align   文本对齐
bgcolor 背景颜色
color   文本颜色



background-color:red
style=“font-family:arial;font-size:20px;text-align:center”



*文本 格式化*

b     加粗
big   大号
em    着重
i     斜体
small 小号
strong 加重语气
sub    下标
sup    上标
ins    插入字
del    删除字



cede  代码
kbd   键盘码
samp  代码样本
tt    打字机代码
var   变量
pre   预文本

abbr     缩写
acronym  首字母缩写
address  地址
bdo      文字方向
blockquote  长引用
q           短引用
cite        引用
dfn         定义项目.



*引用* 
- `quotation`   文字加””
- `blockquote` 长引用. 整段文字 缩进.

- `abbr` 对缩写进行标记.有助于给搜索引擎提供有用的信息.
	`<abbr title="World Health Organization">WHO</abbr>`

- `address`. 文档/文章的联系信息 作者.
	Written by Jon Doe.
	Visit us at:
	Example.com
	Box 564, Disneyland
	USA

*bdo* 反向文字排列.
`<bdo dir="rtl">This text will be written from right to left</bdo>`  → 
This line will be written from right to left



> 代码: 会自动使用等宽字体!!!!!
\<kbd\> \<samp\> \<code\> 
code 不保留多余的空格/空行,
有需要用 pre.

*var* 定义数学变量.

`<p><var>E = m c<sup>2</sup></var></p>`  → E = m c2

`<a href="/example/html/lastpage.HTML" style="text-decoration:none">这是一个链接！</a>` 
没有下划线的 链接.


外部样式表
`<link rel="stylesheet" type="text/css" href="mystyle.css">`

`span`  文字行内的 小块区域.



*Link*
可以是图片. 或者 其他HTML 元素.

`<a href="http://www.w3school.com.cn/" target="_blank">Visit W3School!</a>`
> target 新窗口 还是当前窗口.

`<a name="tips">基本的注意事项 - 有用的提示</a>` 
\`<a href="#tips">有用的提示</a>
\`

> 请始终将正斜杠添加到子文件夹
`href="http://www.w3school.com.cn/html"`
就会向服务器产生两次 HTTP 请求。这是因为服务器会添加正斜杠到这个地址，然后创建一个新的请求，就像这样：
`href="http://www.w3school.com.cn/html/"`


命名锚经常用于在大型文档开始位置上创建目录。
可以为每个章节赋予一个命名锚，然后把链接到这些锚的链接放到文档的上部。
如果您经常访问百度百科，您会发现其中几乎每个词条都采用这样的导航方式。

假如浏览器找不到已定义的命名锚，那么就会定位到文档的顶端。不会有错误发生。



邮件链接:

*使用 %20 来替换单词之间的空格，  
 这样浏览器就可以正确地显示文本了。*

`<a href="mailto:someone@microsoft.com?cc=someoneelse@microsoft.com&bcc=andsomeoneelse2@microsoft.com&subject=Summer%20Party&body=You%20are%20invited%20to%20a%20big%20summer%20party!">发送邮件！</a>`



*pic*

img 
src 源属性. source.
alt 替换文本属性(建议必须加上). 鼠标悬停显示的文本.


图像当链接
\`<a href="/example/html/lastpage.html">
\`\`<img border="0" src="/i/egbuttonnext.gif" />
\``</a>`




\<img src="/i/eg\_mouse.jpg" width="50" height="50"\>

\<br /\>

\<img src="/i/eg\_mouse.jpg" width="100" height="100"\>

\<br /\>

\<img src="/i/eg\_mouse.jpg" width="200" height="200"\>

\<p\>通过改变 img 标签的 "height" 和 "width" 属性的值，您可以放大或缩小图像。\</p\>




> gif 和 jpg 文件均可用作 HTML 背景。  
> 如果图像小于页面，图像会进行重复。



*table*
> tr 行 td 单元格 table data.

\<table border=“1”\>
tr th table head /tr 
tr
td xx /td 
td xx /td
/tr
tr
td &nbsp; /td
td xx /td
/tr


**List**

有序列表 ol
无序列表 ul
自定义表 dl
dt 定义项目
dd  定义的描述



ol
li coffee /li
li tea   /li
/ol



自定义表:


div / span 

块级元素 block level element
内敛元素 inline element

 

类:
 给元素定义css 样式.





布局:  报纸/杂志.

header 文档页眉.
nav 导航容器
section 节
article 文章
aside  侧栏
footer 页脚




*响应式web设计.   RWD … responsive web design*
对 平板和移动设备是必须的....

`<meta name="viewport" content="width=device-width, initial-scale=1">`

简单的使用现成的 css 框架.
Bootstrap 是最流行的开发响应式 web 的 HTML, CSS, 和 JS 框架。
Bootstrap 帮助您开发在任何尺寸都外观出众的站点：显示器、笔记本电脑、平板电脑或手机：

`<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">`

 

*html 框架* (网页中有网页.)
垂直框架 / 水平框架

框架:一个浏览器窗口 显示多个html页面.
每个小的html页面都是一个框架.  
每个框架独立于其他框架.

	<frameset cols="25%,50%,25%">
	  <frame src="/example/html/frame_a.html">
	  <frame src="/example/html/frame_b.html">
	  <frame src="/example/html/frame_c.html">
	</frameset>
	
	
	<frameset rows="25%,50%,25%">
	  <frame src="/example/html/frame_a.html">
	  <frame src="/example/html/frame_b.html">
	  <frame src="/example/html/frame_c.html">
	</frameset>


背景: Backgrounds 配合文字. 使得文字易读.


*脚本:*
js 最常用于 图片的操作.表单验证. 内容动态更新.

`noscript`
有些浏览器 会禁用脚本.
这时就会显示 noscript 元素里面的内容.
`<noscript>Your browser does not support JavaScript!</noscript>`

js 脚本:
<script type="text/javascript">
<!--
document.write("Hello World!")
//-->
</script>

VBScript:
<script type="text/vbscript">
<!--
document.write("Hello World!")
'-->
</script>


**html 头元素.**

title 
meta 网页描述/关键词/重定向网址.

base → 所有链接 规定默认的 目标.
link
style



字符实体: \< \> …. &nbsp;


统一资源定位器
URL  Uniform Resource Locator
`scheme://host.domain:port/path/filename`

• scheme - 定义因特网服务的类型。最常见的类型是 http
• host - 定义域主机（http 的默认主机是 www）
• domain - 定义因特网域名，比如 w3school.com.cn
• :port - 定义主机上的端口号（http 的默认端口号是 80）
• path - 定义服务器上的路径（如果省略，则文档必须位于网站的根目录中）。
• filename - 定义文档/资源的名称




*URL 字符编码*
url 网址 只能用 ascii 来通过因特网发送.
url 常常包含 ascii 之外的字符.
这些字符必须转换为有效的 ascii 格式.
使用 % + 两位十六进制数 来替换非ascii 字符.
url 不能包含空格.  用+来替换空格.




web server.


颜色 RGB.
颜色名字


文档类型.
web 有很多不同的文档.
只有了解文档类型 才能正确的显示文档.
这就是 \<!DOCTYPE\> 的用处。
 不是 HTML 标签。它为浏览器提供一项信息（声明），即 HTML 是用什么版本编写的。


快速参考:
<em>This text is emphasized</em>
<strong>This text is strong</strong>
<code>This is some computer code</code>

<a href="http://www.example.com/">This is a Link</a>
<a href="http://www.example.com/">\<img src="URL"
alt="Alternate Text"\></a>
<a href="mailto:webmaster@example.com">Send e-mail</a>A named anchor:
<a name="tips">Useful Tips Section</a>
<a href="#tips">Jump to the Useful Tips Section</a>


<dl>
<dt>First term</dt>
<dd>Definition</dd>
<dt>Next term</dt>
<dd>Definition</dd>
</dl>

<frameset cols="25%,75%">
  <frame src="page1.htm">
  <frame src="page2.htm">
</frameset>


<form action="http://www.example.com/test.asp" method="post/get">
<input type="text" name="lastname"
value="Nixon" size="30" maxlength="50">
<input type="password">
<input type="checkbox" checked="checked">
<input type="radio" checked="checked">
<input type="submit">
<input type="reset">
<input type="hidden">
<select>
<option>Apples
<option selected>Bananas
<option>Cherries
</select>
<textarea name="Comment" rows="60"
cols="20"></textarea>
</form>


&lt; is the same as \<
&gt; is the same as \>
&#169; is the same as ©




*XHTML*
xhtml: 以xml格式编写的 html
一种 必须正确标记 且格式良好的 标记语言.
所有元素 必须正确的嵌套.
元素必须正确关闭
必须小写.

为什么用 xhtml. 有些浏览器 可能在 移动电话/小型设备上运行. 这些设备往往缺乏解释糟糕语言(不标准的)的能力.这时候 就需要xhtml了.


*表单* 收集不同类型的 用户输入.

form .  定义html 表单.

*表单元素:* input. 
input 有很多属性.
text 定义常规文本输入.
radio 定义单选按钮
submit 定义提交按钮


*文本输入:* \<input type=“text”\>
单行输入框.


<form>
 First name:<br>
<input type="text" name="firstname">
<br>
 Last name:<br>
<input type="text" name="lastname">
</form>


注释：表单本身并不可见。还要注意文本字段的默认宽度是 20 个字符。

*单选按钮:* \<input type=“radio”\>

<form>
<input type="radio" name="sex" value="male" checked>Male
<br>
<input type="radio" name="sex" value="female">Female
</form>


**提交按钮** \<input type=“submit”\>
向  表单处理程序(form-handler) 提交表单的按钮.

表单处理程序: 包含 用来处理输入数据的脚本 的服务器页面.
表单处理程序 在表单的 action 属性中指定.


<form action="action_page.php">
First name:<br>
<input type="text" name="firstname" value="Mickey">
<br>
Last name:<br>
<input type="text" name="lastname" value="Mouse">
<br><br>
<input type="submit" value="Submit">
</form>





action 属性: 提交表单时 执行的动作.
向服务器 提交表单的通常做做法是 使用提交按钮.
如果省略 action 属性，则 action 会被设置为当前页面。

Method 属性. 提交http 所使用的方法. Get/Post
`<form action="action_page.php" method="GET">`
`<form action="action_page.php" method="POST">`

*GET: * 默认. 
表单提交是 被动的(比如搜索引擎.)且没有敏感信息...
get 的表单数据在地址栏中是可见的.
适合少量的数据提交.(浏览器有容量限制)

*Post*
表单正在更新数据.包含敏感密码...
安全性高.因为.页面地址栏中 被提交的数据是不可见的.

*Name*
如果要被正确的提交. 每个字段必须设置一个 name 属性.

*fieldset* 组合表单数据.
legend 给fieldset元素定义标题.

<form action="action_page.php">
<fieldset>
<legend>Personal information:</legend>
First name:<br>
<input type="text" name="firstname" value="Mickey">
<br>
Last name:<br>
<input type="text" name="lastname" value="Mouse">
<br><br>
<input type="submit" value="Submit"></fieldset>
</form>



*select 下拉列表*  selected 设置默认项.

<select name=“cars”>
<option value=“volvo”> volvo  </option>
<option value=“audi”>   audi </option>
<option value=“bmw” selected > BMW </option>
</select>


*textarea* 多行输入 文本域.

<textarea name="message" rows="10" cols="30">
The cat was playing in the garden.
</textarea>



*\<button\>  可点击的按钮.*

\<button type=“button” onclick=“alert(‘hello Y’)”\> Ckick me \</button\>


表单元素.
datalist 给input 元素规定预定义选项列表.
用户输入数据时候.看到的预定义选项的下拉列表.
keygen  
output


<form action="action_page.php">
<input list="browsers">
<datalist id="browsers">
   <option value="Internet Explorer">
   <option value="Firefox">
   <option value="Chrome">
   <option value="Opera">
   <option value="Safari">
</datalist> 
</form>



input 输入类型:
text  文本
password  密码字段
submit   按钮
radio 单选按钮
checkbox 复选框


\<form\>
\<input type="radio" name="sex" value="male" checked\>Male
\<br\>
\<input type="radio" name="sex" value="female"\>Female
\</form\> 



\<form\>
\<input type="checkbox" name="vehicle" value="Bike"\>I have a bike
\<br\>
\<input type="checkbox" name="vehicle" value="Car"\>I have a car 
\</form\> 


 



number
\<input type=“number”\>
应该包含数字的 输入字段.

\<form\>
quantity(between 1 and 5 )
\<input type=“number” name=“quality” min=“1” mac=“5”\>
\</form\>




*输入限制:*
disabled ..  输入字段 被禁用.
max       最大值.
maxlength 最大字符数.
min       最小值
pattern   检查输入值的 正则式表达..
readonly  只读.
required  必须填写
size      宽度(字符).
step      合法数字间隔.
value     默认值.



\<form\>
  Quantity:
  \<input type="number" name="points" min="0" max="100" step="10" value="30"\>
\</form\>



*data* 包含日期的输入字段.

\<form\>
  Birthday:
  \<input type="date" name="bday"\>
\</form\>



\<form\>
  Enter a date before 1980-01-01:
  \<input type="date" name="bday" max="1979-12-31"\>\<br\>
  Enter a date after 2000-01-01:
  \<input type="date" name="bday" min="2000-01-02"\>\<br\>
\</form\>



*color*

\<form\>
  Select your favorite color:
  \<input type="color" name="favcolor"\>
\</form\>



*range* 
\<form\>
  \<input type="range" name="points" min="0" max="10"\>
\</form\>



*month* 包含年月
\<form\>
  Birthday (month and year):
  \<input type="month" name="bdaymonth"\>
\</form\>


week → 周.
time → 允许用户选择时间 无时区
datatime → 用户选择日期和时间. 有时区.

email . 更具浏览器支持. 提交时自动对电子邮件进行地址验证

\<form\>
  E-mail:
  \<input type="email" name="email"\>
\</form\>


输入类型：search
\<input type="search"\> 用于搜索字段（搜索字段的表现类似常规文本字段）。
实例
\<form\>
  Search Google:
  \<input type="search" name="googlesearch"\>
\</form\>



输入类型：tel
\<input type="tel"\> 用于应该包含电话号码的输入字段。
目前只有 Safari 8 支持 tel 类型。
\<form\>
  Telephone:
  \<input type="tel" name="usrtel"\>
\</form\>



输入类型：url
\<input type="url"\> 用于应该包含 URL 地址的输入字段。
根据浏览器支持，在提交时能够自动验证 url 字段。
某些智能手机识别 url 类型，并向键盘添加 ".com" 以匹配 url 输入。
实例


\<form\>
  Add your homepage:
  \<input type="url" name="homepage"\>
\</form\>




*value 属性*  输入字段的初始值：
实例
\<form action=""\>
 First name:\<br\>
\<input type="text" name="firstname" value="John"\>
\<br\>
 Last name:\<br\>
\<input type="text" name="lastname"\>
\</form\> 










readonly 属性
readonly 属性规定输入字段为只读（不能修改）：
实例
\<form action=""\>
 First name:\<br\>
\<input type="text" name="firstname" value="John" readonly\>
\<br\>
 Last name:\<br\>
\<input type="tex


readonly 属性不需要值。它等同于 readonly="readonly"。




disabled 属性:  输入字段是禁用的。
被禁用的元素是不可用和不可点击的。
被禁用的元素不会被提交。
实例
\<form action=""\>
 First name:\<br\>
\<input type="text" name="firstname" value="John" disabled\>
\<br\>
 Last name:\<br\>
\<input type="text" name="lastname"\>
\</form\> 




maxlength 属性
maxlength 属性规定输入字段允许的最大长度：
实例
\<form action=""\>
 First name:\<br\>
\<input type="text" name="firstname" maxlength="10"\>
\<br\>
 Last name:\<br\>
\<input type="text" name="lastname"\>
\</form\> 




form 属性
form 属性规定 \<input\> 元素所属的一个或多个表单。
提示：如需引用一个以上的表单，请使用空格分隔的表单 id 列表。
Opera Safari Chrome Firefox Internet Explorer
实例
输入字段位于 HTML 表单之外（但仍属表单）：
\<form action="action\_page.php" id="form1"\>
   First name: \<input type="text" name="fname"\>\<br\>
   \<input type="submit" value="Submit"\>
\</form\>

 Last name: \<input type="text" name="lname" form="form1"\>





height 和 width 属性
height 和 width 属性规定 \<input\> 元素的高度和宽度。
height 和 width 属性仅用于 \<input type="image"\>。
注释：请始终规定图像的尺寸。如果浏览器不清楚图像尺寸，则页面会在图像加载时闪烁。
Opera Safari Chrome Firefox Internet Explorer
实例
把图像定义为提交按钮，并设置 height 和 width 属性：
\<input type="image" src="img\_submit.gif" alt="Submit" width="48" height="48"\>




list 属性
list 属性引用的 \<datalist\> 元素中包含了 \<input\> 元素的预定义选项。
Opera Safari Chrome Firefox Internet Explorer
实例
使用 \<datalist\> 设置预定义值的 \<input\> 元素：
\<input list="browsers"\>

\<datalist id="browsers"\>
   \<option value="Internet Explorer"\>
   \<option value="Firefox"\>
   \<option value="Chrome"\>
   \<option value="Opera"\>
   \<option value="Safari"\>
\</datalist\> 





multiple 属性
multiple 属性是布尔属性。
如果设置，则规定允许用户在 \<input\> 元素中输入一个以上的值。
multiple 属性适用于以下输入类型：email 和 file。
Opera Safari Chrome Firefox Internet Explorer
实例
接受多个值的文件上传字段：
Select images: \<input type="file" name="img" multiple\>





required 属性
required 属性是布尔属性。
如果设置，则规定在提交表单之前必须填写输入字段。
required 属性适用于以下输入类型：text、search、url、tel、email、password、date pickers、number、checkbox、radio、and file.
Opera Safari Chrome Firefox Internet Explorer
实例
必填的输入字段：
Username: \<input type="text" name="usrname" required\>





step 属性
step 属性规定 \<input\> 元素的合法数字间隔。
示例：如果 step="3"，则合法数字应该是 -3、0、3、6、等等。
提示：step 属性可与 max 以及 min 属性一同使用，来创建合法值的范围。
step 属性适用于以下输入类型：number、range、date、datetime、datetime-local、month、time 以及 week。
Opera Safari Chrome Firefox Internet Explorer
示例
拥有具体的合法数字间隔的输入字段：
\<input type="number" name="points" step="3"\>





HTML 5



\<BDI\> 文本方向.
dialog 对话框/窗口
mark 强调/重要内容
meter
progress 任务进度
time 时间/日期
wbr 可能的折行
output 计算结果




audio 音频
video 视频
track 音视频的轨道
source 音视频来源


html5 建议属性值 加引号.  

必须属性 图片的  alt .当图片无法显示的时候 非常重要.

等号两边空格是可选的 . 不要空格更好.

避免长行代码 (不超过80字符)



减少不必要的缩进....  body 下面的 可以顶行写.不必要缩进.

title 是必要的. 尽量选有意义的标题.



`<link rel="stylesheet" href="styles.css">`
> type 属性 不是必须的



短规则 一行写. 长规则 分行写.

在逗号或分号之后添加空格，是所有书写类型的通用规则。



加载外部 js
`<script src="myscript.js">`



*尽量使用小写*
大多数 web 服务器（Apache、Unix）对文件名的大小写敏感：
其他 web 服务器（微软，IIS）对大小写不敏感：


lobdon.jpg 和 London.jpg 是不一样的 




文件扩展名
HTML 文件名应该使用扩展名 .html（而不是 .htm）。
CSS 文件应该使用扩展名 .css。
JavaScript 文件应该使用扩展名 .js。






*canvas*
用js 在网页上绘制图形.
canvas本身没有绘图能力.所有绘制必须在js里面完成.
画布 是一个 矩形区域. 可以控制每一个像素.

<canvas id="myCanvas" width="200" height="100"></canvas>

<script type="text/javascript">
var c=document.getElementById("myCanvas");
js 使用 id 来寻找 canvas
var cxt=c.getContext("2d");
创建对象
cxt.fillStyle="#FF0000";
cxt.fillRect(0,0,150,75);
</script>


getContext("2d") 对象是内建的 HTML5 对象，拥有多种绘制路径、矩形、圆形、字符以及添加图像的方法。


下面的两行代码绘制一个红色的矩形：
cxt.fillStyle="#FF0000";
cxt.fillRect(0,0,150,75); 


上面的 fillRect 方法拥有参数 (0,0,150,75)。
意思是：在画布上绘制 150x75 的矩形，从左上角开始 (0,0)。


通过规定尺寸、颜色和位置，来绘制一个圆：

\<script type="text/javascript"\>

var c=document.getElementById("myCanvas");
var cxt=c.getContext("2d");
cxt.fillStyle="#FF0000";
cxt.beginPath();
cxt.arc(70,18,15,0,Math.PI\*2,true);
cxt.closePath();
cxt.fill();

\</script\>


\<canvas id="myCanvas" width="200" height="100" style="border:1px solid #c3c3c3;"\>
Your browser does not support the canvas element.
\</canvas\>




实例 - 渐变
使用您指定的颜色来绘制渐变背景：

\<script type="text/javascript"\>

var c=document.getElementById("myCanvas");
var cxt=c.getContext("2d");
var grd=cxt.createLinearGradient(0,0,175,50);
grd.addColorStop(0,"#FF0000");
grd.addColorStop(1,"#00FF00");
cxt.fillStyle=grd;
cxt.fillRect(0,0,175,50);

\</script\>

canvas 元素：
\<canvas id="myCanvas" width="200" height="100" style="border:1px solid #c3c3c3;"\>
Your browser does not support the canvas element.
\</canvas\>





实例 - 图像
把一幅图像放置到画布上：

JavaScript 代码：
\<script type="text/javascript"\>

var c=document.getElementById("myCanvas");
var cxt=c.getContext("2d");
var img=new Image()
img.src="flower.png"
cxt.drawImage(img,0,0);

\</script\>
canvas 元素：
\<canvas id="myCanvas" width="200" height="100" style="border:1px solid #c3c3c3;"\>
Your browser does not support the canvas element.
\</canvas\>



*svg* 可伸缩矢量图形  Scalable Vector Graphics

SVG 的优势
与其他图像格式相比（比如 JPEG 和 GIF），使用 SVG 的优势在于：
SVG 图像可通过文本编辑器来创建和修改
SVG 图像可被搜索、索引、脚本化或压缩
SVG 是可伸缩的
SVG 图像可在任何的分辨率下被高质量地打印
SVG 可在图像质量不下降的情况下被放大



<svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="190">
  \<polygon points="100,10 40,180 190,60 10,60 160,180"
  style="fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;" /\>
</svg>



canvas / svg 都允许在浏览器中创建图形.本质是不一样的.

Canvas
• 依赖分辨率
• 不支持事件处理器
• 弱的文本渲染能力
• 能够以 .png 或 .jpg 格式保存结果图像
• 最适合图像密集型的游戏，其中的许多对象会被频繁重绘
SVG
• 不依赖分辨率
• 支持事件处理器
• 最适合带有大型渲染区域的应用程序（比如谷歌地图）
• 复杂度高会减慢渲染速度（任何过度使用 DOM 的应用都不快）
• 不适合游戏应用





*媒体:*  音效 音视频 动画

.swf .wmv .mp3 .mp4  MP4 比较普及. youtube 都是mp4.


avi .avi → audio video interleave .微软开发的. windows电脑都支持. 非windows 就不一定来了.

.wmv windows media. 也是微软的

MPEG .mpg/.mpeg moving pictures expert group 跨平台.

quicktime .mov  苹果公司.
realvideo .rm . 允许低宽带下的视频流. 质量不怎么好


flash .flv .swf 需要额外组件(这组件会预装到 ie/firefox ..)
Mpeg-4 .mp4  针对网络的新格式. youtube.就是
youtube 接受多种格式上传. 但是 他会自动帮你转成mp4.



MIDI .mid 不含声音. 一种针对电子音乐设备的格式.
极其小巧.23k 就能播放5分钟…


wave .wav IBM/微软 开发. 最受欢迎的 无压缩的音频格式.
(音乐 / 演讲 尽量使用这个.)


*object 元素.*  支持html 插件.

辅助应用程序. helper application .
可以由浏览器启动的程序. 也称为插件.

用插件播放音视频. …的优势: 允许用户控制部分/全部 播放设置.




视频播放最好方式:
quicktime → wave

\<object width="420" height="360"
classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B"
codebase="http://www.apple.com/qtactivex/qtplugin.cab"\>
\<param name="src" value="bird.wav" /\>
\<param name="controller" value="true" /\>
\</object\>


quicktme → mp4
\<object width="420" height="360"
classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B"
codebase="http://www.apple.com/qtactivex/qtplugin.cab"\>
\<param name="src" value="movie.mp4" /\>
\<param name="controller" value="true" /\>
\</object\>



flash → swf

\<object width="400" height="40"
classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
codebase="http://fpdownload.macromedia.com/
pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"\>
\<param name="SRC" value="bookmark.swf"\>
\<embed src="bookmark.swf" width="400" height="40"\>\</embed\>
\</object\>


Windows Media Player →  WMV 

\<object width="100%" height="100%"
type="video/x-ms-asf" url="3d.wmv" data="3d.wmv"
classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6"\>
\<param name="url" value="3d.wmv"\>
\<param name="filename" value="3d.wmv"\>
\<param name="autostart" value="1"\>
\<param name="uiMode" value="full" /\>
\<param name="autosize" value="1"\>
\<param name="playcount" value="1"\>
\<embed type="application/x-mplayer2" src="3d.wmv" width="100%"
 height="100%" autostart="true" showcontrols="true" 
pluginspage="http://www.microsoft.com/Windows/MediaPlayer/"\>\</embed\>
\</object\>










音频: 播放不容易.
要在所有浏览器 所有平台 包括 ipad iphone 都能播放.


插件有很多用途:
播放音乐. 显示地图. 验证银行帐号. 控制输入.

用object / embed 把插件 添加到 html页面

`<embed height="100" width="100" src="song.mp3" />`
`<object height="100" width="100" data="song.mp3"></object>`





<audio controls="controls">
  <source src="song.mp3" type="audio/mp3" />
  <source src="song.ogg" type="audio/ogg" />
Your browser does not support this audio format.
</audio>


上面的例子使用了一个 mp3 文件，这样它在 Internet Explorer、Chrome 以及 Safari 中是有效的。
为了使这段音频在 Firefox 和 Opera 中同样有效，添加了一个 ogg 类型的文件。如果失败，会显示错误消息。




<audio controls="controls" height="100" width="100">
  <source src="song.mp3" type="audio/mp3" />
  <source src="song.ogg" type="audio/ogg" />
<embed height="100" width="100" src="song.mp3" />
</audio>

上面的例子使用了两个不同的音频格式。HTML5 \<audio\> 元素会尝试以 mp3 或 ogg 来播放音频。如果失败，代码将回退尝试 \<embed\> 元素。





添加音频 最简单的方法: 用雅虎播放器

\<a href="song.mp3"\>Play Sound\</a\>

\<script type="text/javascript" src="http://mediaplayer.yahoo.com/js"\>
\</script\>



视频播放:  必须把视频转换成很多格式!!!

\<video width="320" height="240" controls="controls"\>
  \<source src="movie.mp4" type="video/mp4" /\>
  \<source src="movie.ogg" type="video/ogg" /\>
  \<source src="movie.webm" type="video/webm" /\>
  \<object data="movie.mp4" width="320" height="240"\>
\<embed src="movie.swf" width="320" height="240" /\>
  \</object\>
\</video\>


不然的话.就 把视频传到 优酷...
\<embed src="http://player.youku.com/player.php/sid/XMzI2NTc4NTMy/v.swf" 
width="480" height="400" 
type="application/x-shockwave-flash"\>
\</embed\>





*地理定位: Geolocation*
请使用 getCurrentPosition() 方法来获得用户的位置。


\<script\>
var x=document.getElementById("demo");
function getLocation()
  {
  if (navigator.geolocation)
{
navigator.geolocation.getCurrentPosition(showPosition);
}
  else{x.innerHTML="Geolocation is not supported by this browser.";}
  }
function showPosition(position)
  {
  x.innerHTML="Latitude: " + position.coords.latitude +
  "\<br /\>Longitude: " + position.coords.longitude;
  }
\</script\>

检测是否支持地理定位
如果支持，则运行 getCurrentPosition() 方法。如果不支持，则向用户显示一段消息。
如果getCurrentPosition()运行成功，则向参数showPosition中规定的函数返回一个coordinates对象
showPosition() 函数获得并显示经度和纬度
上面的例子是一个非常基础的地理定位脚本，不含错误处理。


处理错误和拒绝
getCurrentPosition() 方法的第二个参数用于处理错误。它规定当获取用户位置失败时运行的函数：
实例
function showError(error)
  {
  switch(error.code)
{
case error.PERMISSION\_DENIED:
  x.innerHTML="User denied the request for Geolocation."
  break;
case error.POSITION\_UNAVAILABLE:
  x.innerHTML="Location information is unavailable."
  break;
case error.TIMEOUT:
  x.innerHTML="The request to get user location timed out."
  break;
case error.UNKNOWN\_ERROR:
  x.innerHTML="An unknown error occurred."
  break;
}
  }


错误代码：
• Permission denied - 用户不允许地理定位
• Position unavailable - 无法获取当前位置
• Timeout - 操作超时





















































[1]:	http://www.w3school.com.cn/tiy/t.asp?f=html_headers