## CSS 

## CSS 选择器
元素选择器 / 类型选择器   type selector
 
如果 设置 HTML 样式 :  选择器 通常是 某个 html元素,比如 p h1 em  a   
 
 
选择器 分组: 多个选择器 用一个属性
P,h2 color:red
 
声明分组:一个选择器 多个属性      ; 很重要

￼  = ￼



如果 忘了 ; 号 :
h1   
  font: 28px Verdana;  
  color: blue background: red;  
  
 
 background 对 color 来说不是一个合法值，而且由于只能为 color 指定一个关键字，
所以浏览器 会完全忽略这个 color 声明（包括 background: black 部分）。
这样 h1 标题只会显示为蓝色，而没有红色背景，不过更有可能根本得不到蓝色的 h1。
这些标题只会显示为默认颜色（通常是黑色），而且根本没有背景色。
font: 28px Verdana 声明仍能正常发挥作用，因为它确实正确地以一个分号结尾。
 
 
 
 
 
 
 通配符选择器  \*.important   color:red
这个选择器 于 任何元素匹配 .   →  文档下 所有元素都是红色!
 
 
Class 可以有多个 值:
￼


ID 选择器    多个 # 号.
id选择器 不引用class 属性的值, 要用id 属性里面的值.
 
￼


类选择器 还是 id选择器          值: 都是区分大小写的 . 
 id 选择器 只能使用一次!!!
id选择器  不能结合使用,因为id属性不允许有空格.
 
比如 网页中 有个最重要的东西(段落 短语 标题) 只会有一个:
# mostImportant color:red; background:yellow; 
下面就能用了 .
\<h1 id=“mostImportant”\>This is important!\</h1\>
 
简单属性选择:   不需要值的话 可以:
 


---- -
## CSS 图片
\<img src=“xxx.jpg” alt=“图片坏掉时候替代显示的文本”\>



---- -

## CSS 表格
表格能极大改善外观
 
属性后面 ; 不能随便加的.
 
表格内边距 padding
Td  padding:15px 
 
单元格间距   \<style\>下面: table.one  border-spacing: 10px 10px          ……
如果 值里面  只有一个值   那么这个值 就是水平和垂直的间距
                         如果有两个   第一个水平值 第二个垂直值
￼


表格文本对齐
Text-align:       水平对齐            左   右     居中  
Vertical-align: 垂直对齐         顶部 底部 居中
 
表格边框  border           tr行     td单元格   
th 表格标题 . (默认标题内容是居中的)    标题其实和表格是分开的 标题默认在表格上方,可以改到下方
caption  
    
  caption-side:bottom;  
  
 
 
Width 表格宽度
Height 表格高度
￼

表格具有双线条边框。这是由于 table、th 以及 td 元素都有独立的边框。
 
 
\<html\>
\<head\>
\<style type=“text/css”\>
table,td,th
  {
  border:1px solid black( 颜色可改! );      要显示边框 必须上 solid属性.
  }
 
table
  {
  width:100%;
  }
 
th
  {
  height:50px;
  }
\</style\>
\</head\>
 
\<body\>
\<table\>
\<tr\>
\<th\>Firstname\</th\>
\<th\>Lastname\</th\>
\</tr\>
\<tr\>
\<td\>Bill\</td\>
\<td\>Gates\</td\>
\</tr\>
\<tr\>
\<td\>Steven\</td\>
\<td\>Jobs\</td\>
\</tr\>
\</table\>
\</body\>
\</html\>
 
 
 
 
折叠边框      border-collapse         双边框→单边框
注释：如果没有规定 !DOCTYPE，border-collapse 属性可能会引起意想不到的错误。
 
table  
    
  border-collapse:collapse;  
  
table,th, td  
    
  border: 1px solid black;  
  
 
 
 
 
表格布局: table-layout: automatic  /   fixed  
 
自动布局 比较慢 因为要先访问表格里面 所有数据才能布局. 
固定布局 速度快.
总宽度100%    单元格分配都是20% 40% 40%       
￼

￼

\<html\>
\<head\>
\<style type=“text/css”\>
# customers
  {
  font-family:“Trebuchet MS”, Arial, Helvetica, sans-serif;
  width:100%;
  border-collapse:collapse;
  }
 
# customers td, #customers th
  {
  font-size:1em;
  border:1px solid #98bf21;
  padding:3px 7px 2px 7px;
  }
 
# customers th
  {
  font-size:1.1em;
  text-align:left;
  padding-top:5px;
  padding-bottom:4px;
  background-color:#A7C942;
  color:#ffffff;
  }
 
# customers tr.alt td
  {
  color:#000000;
  background-color:#EAF2D3;
  }
\</style\>
\</head\>
 
\<body\>
\<table id=“customers”\>
\<tr\>
\<th\>Company\</th\>
\<th\>Contact\</th\>
\<th\>Country\</th\>
\</tr\>
 
\<tr\>
\<td\>Apple\</td\>
\<td\>Steven Jobs\</td\>
\<td\>USA\</td\>
\</tr\>
 
\<tr class=“alt”\>
\<td\>Baidu\</td\>
\<td\>Li YanHong\</td\>
\<td\>China\</td\>
\</tr\>
 
\<tr\>
\<td\>Google\</td\>
\<td\>Larry Page\</td\>
\<td\>USA\</td\>
\</tr\>
 
\<tr class=“alt”\>
\<td\>Lenovo\</td\>
\<td\>Liu Chuanzhi\</td\>
\<td\>China\</td\>
\</tr\>
 
\<tr\>
\<td\>Microsoft\</td\>
\<td\>Bill Gates\</td\>
\<td\>USA\</td\>
\</tr\>
 
\<tr class=“alt”\>
\<td\>Nokia\</td\>
\<td\>Stephen Elop\</td\>
\<td\>Finland\</td\>
\</tr\>
 
 
\</table\>
\</body\>
\</html\>













---- --
## CSS 列表
菜单, 等等 都可以用列表做.
 
 
简写属性: list-style    用于把所有用于列表的属性设置于一个声明中。 
 
Li list-style: url(xxx.gif) square inside
 
 
列表标志类型 :  list-style-type:
Disc 实心圆黑点
Circle  空心圆点
Square 实心正方形
Decimal  1234
Decimal-leading-zero   01 02 03 04
Lower-roman    I ii iii 
Upper-roman    I II III 
Lower-alpha  a b c
Upper-alpha A B C 
Cjk-ideographic  一 二 三 
 
 
 
无序列表:   圆点
有序列表: 字母 / 数字 /  等等 
 
            Ul list-style-type: square   方块列表.
 
列表标志图片:  lisy-style-image
 
Ul li list-style-image:url(xxx.gif)
 
列表标志位置,  inside / outside
 
 
 
 
例子   内外位置列表   内就是正常位置靠右移  外就是正常位置靠左移.

￼

\<style type=“text/css”\>
ul.inside 
{
list-style-position: inside
}
 
ul.outside 
{
list-style-position: outside
}
\</style\>
\</head\>
 
\<body\>
\<p\>该列表的 list-style-position 的值是 “inside”：\</p\>
\<ul class=“inside”\>
\<li\>Earl Grey Tea - 一种黑颜色的茶\</li\>
\<li\>Jasmine Tea - 一种神奇的“全功能”茶\</li\>
\<li\>Honeybush Tea - 一种令人愉快的果味茶\</li\>
\</ul\>
 
\<p\>该列表的 list-style-position 的值是 “outside”：\</p\>
\<ul class=“outside”\>
\<li\>Earl Grey Tea - 一种黑颜色的茶\</li\>
\<li\>Jasmine Tea - 一种神奇的“全功能”茶\</li\>
\<li\>Honeybush Tea - 一种令人愉快的果味茶\</li\>
\</ul\>
\</body\>
 



































---- --



## CSS 链接
链接样式 属性 : 颜色 字体 背景 等等 
 
链接状态:
 
普通 未访问          a:link        color:blue
已访问                    a:visited  color:pink
鼠标在链接上      a:hover    color:green
链接被点击时      a:active   color:yellow
 
注:
当为链接的不同状态设置样式时，
请按照以下次序规则：
a:hover 必须位于 a:link 和 a:visited 之后
a:active 必须位于 a:hover 之后
 
 
去链接下划线:             a:link text-decoration:none;
 
链接背景色:                 a:link background-color:#B2FF99;
 
 
 
例子:
 
\<!DOCTYPE html\>
\<html\>
\<head\>
\<style\>
a.one:link color:#ff0000;
a.one:visited color:#0000ff;
a.one:hover color:#ffcc00;
 
a.two:link color:#ff0000;
a.two:visited color:#0000ff;
a.two:hover font-size:150%;
 
a.three:link color:#ff0000;
a.three:visited color:#0000ff;
a.three:hover background:#66ff66;
 
a.four:link color:#ff0000;
a.four:visited color:#0000ff;
a.four:hover font-family:’微软雅黑’;
 
a.five:link color:#ff0000;text-decoration:none;
a.five:visited color:#0000ff;text-decoration:none;
a.five:hover text-decoration:underline;
\</style\>
\</head\>
 
\<body\>
\<p\>请把鼠标指针移动到下面的链接上，看看它们的样式变化。\</p\>
 
\<p\>\<b\>\<a class=“one” href=“/index.html” target=“\_blank”\>这个链接改变颜色\</a\>\</b\>\</p\>
\<p\>\<b\>\<a class=“two” href=“/index.html” target=“\_blank”\>这个链接改变字体尺寸\</a\>\</b\>\</p\>
\<p\>\<b\>\<a class=“three” href=“/index.html” target=“\_blank”\>这个链接改变背景色\</a\>\</b\>\</p\>
\<p\>\<b\>\<a class=“four” href=“/index.html” target=“\_blank”\>这个链接改变字体\</a\>\</b\>\</p\>
\<p\>\<b\>\<a class=“five” href=“/index.html” target=“\_blank”\>这个链接改变文本的装饰\</a\>\</b\>\</p\>
\</body\>
 
\</html\>
 
￼



￼


 
\<!DOCTYPE html\>
\<html\>
\<head\>
\<style\>
a:link,a:visited
{
display:block;
font-weight:bold;
font-size:14px;
font-family:Verdana, Arial, Helvetica, sans-serif;
color:#FFFFFF;
background-color:#98bf21;
width:120px;
text-align:center;
padding:4px;
text-decoration:none;
}
 
a:hover,a:active
{
background-color:#7A991A;
}
\</style\>
\</head\>
 
\<body\>
\<a href=“/index.html” target=“\_blank”\>W3School\</a\>
\</body\>
\</html\>
 
 
 
 







---- -



## CSS 字体
字体,大小,加粗,风格(斜体),变形(小型大写字母)
 
Font-size 字体大小.
 
管理web 文本大小很重要.
\<h1\> - \<h6\> 来标记标题
\<p\> 来标记段落.
默认段落的大小是 16px = 1 em
 
 
Ie 浏览器 , 最好用em 代替px,
1em 等于当前元素的字体尺寸,
默认段落字体是16px   这时1em=16px
当父元素(一般是body元素) 字体设为20px时, 这时 1em=20px 
 
所有浏览器通用的办法:
body 元素（父元素）以百分比设置默认的 font-size 值：
body font-size:100%;  
h1 font-size:3.75em;  也就是 60 px  
h2 font-size:2.5em;                    40px  
p font-size:0.875em;                  14px
 
绝对值: 
文本指定大小,
不允许浏览器改变文本大小
在确定输出的物理尺寸时候 很有用.
相对值:
相对周围元素 来设置大小
允许浏览器改变文本大小.
 
 
Font-style   字体风格
 
Normal 正常文本
Italic  斜体文本
Oblique 倾斜显示
 一般 italic 和 oblique 没有显示上的区别.
 
Font-variant  字体变形.  可以有 小型的大写字母.
 
P font-variant: small-caps;
 
Font-weight  字体加粗
 
Bolder 比继承的粗细 加粗一个级别
Lighter 降低粗细级别
100 900  字体有9级别的粗度.  
100最细 
400正常默认.
700 = bold .
900最粗.
 
Font-family 字体系列
 
有通用字体系列:     选择一个系列款式!     但不选择具体字体.
指定字体系列:                                                   选择一个具体的字体.
 
一般方法: 结合指定字体和通用字体系列,
h1 font-family: Georgia, serif;
如果读者没有安装 Georgia，但安装了 Times 字体（serif 字体系列中的一种字体），用户代理就可能对 h1 元素使用 Times。尽管 Times 与 Georgia 并不完全匹配，但至少足够接近。
因此，我们建议在所有 font-family 规则中都提供一个通用字体系列。这样就提供了一条后路，在用户代理无法提供与规则匹配的特定字体时，就可以选择一个候选字体。
如果您对字体非常熟悉，也可以为给定的元素指定一系列类似的字体。要做到这一点，需要把这些字体按照优先顺序排列，然后用逗号进行连接：
p {font-family: Times, TimesNR, ‘New Century Schoolbook’,
Georgia, ‘New York’, serif;}
根据这个列表，用户代理会按所列的顺序查找这些字体。如果列出的所有字体都不可用，就会简单地选择一种可用的 serif 字体。
 
 
字体成比例:  
字体中的字符根据自身的不同大小而有不同的宽度.
比如小写 i 和小写 m 的宽度就不同。
 
上下短线:   
是指每个字符笔划末端都有短线装饰。
比如大写 I 顶部和底部就有短线，大写 A 两条腿底部也有短线。
 
常见的 5种 通用字体系列,
Serif                  衬线字体     成比例显示，有上下短线。
可读性非常好.(仅限于小字体上)
所以它应用的最多的地方也正是出版物或者印刷品的正文内容等以大段文字作为表现形式的作品上。
 
Sans-sarif        无衬线字体 成比例显示, 无上下短线
字体种类比  serif   多多了.
由于没有上下短线, 所以 字体比较圆滑,线条粗细均匀, 
较适合 艺术字,标题 等;  
不适合大面积文字,因为没有上下短线,字母辨认会有点困难,
字体小的时候 可读性不高,任意视觉疲劳. 强烈建议 大字体下使用.
 
 
 
Monospace    等宽字体 
每个字符的宽度都必须完全相同，所以小写的 i 和小写的 m 有相同的宽度。
 
Cursive  相当于印刷学中的手写体。  偏僻.
Fantasy  相当于印刷学中的装饰体。  偏僻.
 
其他字体:
以下几种  mac 和pc上都常用,
◦ Arial Black
◦ Arial Narrow
◦ Impact
要特别注意Arial Black和Impact字体，它们只有一种形式，没有斜体。因此，在使用这些字体时，一定要将font-weight属性和font-style属性设置为normal。否则，如果将文本设置为粗体或斜体，浏览器就会绞尽脑汁去猜测这些文字应该是什么样子。
    
 
 









































---- 




## CSS 文本
http://www.w3school.com.cn/css/css\_text.asp                                                         
 
 
Text-indent: +-5em    段落首行缩进文本,
 可以是正负值. 百分比.    用负值的话推荐搭配相应的内边距(padding-left: 5em)
 
Text-align:    内部内容水平对齐.
Left / right  / center   /  \<center\>  / justify
Center 文本内容居中
\<center\>  文本和元素都居中.
Justify:
文本行的左右两端都在边界上,通过调整单词和字母的间隔,使得各行的长度恰好相等.
打印的时候 很常见.
 
 
Word-spacing 字间隔   默认0  正值 增加间距   负值 减少间距.
 
Letter-spacing  字母间距,    类似 word-spacing
 
Text-transform   字符转换
Uppercase  文本全部大写 
 lowercase   文本全部小写
capitalize      单词 首字母 大写.
 
H1 text-transform: capitalize 
 
 
Text-decoration  文字装饰.
None           无装饰      超链接不想要下划线可以用这个!.
Underline   下划线
Overline   上划线
Line-through 中间线
Blink   文本闪烁.
 
 
White-space  空白符.
Normal  默认: 多个空白符→一个空格    ;    回车键 也是一个空格.

￼

Direction:ltr  /  rtl   文本方向
正常是左右上下 阅读的,
古文则是 右左 阅读的.







































---


## CSS 层叠样式表

Cascading Style Sheets
 
样式 通常 保存在外部 .css 文件中.  
编辑外部.css文件 能控制所有页面的 布局和外观.
 
外部样式表:  需要应用于很多页面 .
 
头文件 加入\<link\>标签        链接到外部css文件.
 
\<head\>  
\<link rel=“stylesheet” type=“text/css” href=“mystyle.css” /\>  
\</head\>
 
 
内部样式表: 当个文档  需要的特殊样式.   
 
头文件中 加入  \<style\> 标签  
 
\<head\>  
\<style type=“text/css”\>  
  hr color: sienna;  
  p margin-left: 20px;  
  body background-image: url(“images/back40.gif”);  
\</style\>  
\</head\>
 
内联样式:
 
多重样式:
 
如果 一个网页中 ,
外部样式表对a 有 3个属性设置  颜色 红   大小20  位置 居中       
内部样式表对a 有2个属性设置                    大小30  位置 靠左
那么 实际情况是  颜色红 大小30 位置左
先用外部样式表,遇到相同的属性设置  由于内置样式表优先级高,相同的属性被修改, 不同的属性被保留.
 
 
样式优先级: 4最高  1 最低.
 
1 浏览器缺省设置
2 外部样式表
3 内部样式表（位于 \<head\> 标签内部）
4 内联样式（在 HTML 元素内部）
 
 
CSS 语法          选择器   若干个声明(属性:值)    声明之间用 ; 号           
     selector declaration1; declaration2; ... declarationN    
    建议 每行一个声明 增加 可读性.
 
 
 
属性: property
样式属性 style attribute 
 
列子
          h1 color:red; font-size:14px;  
将 h1 元素内的  文字颜色 设置红色  文字大小 设置14像素
 
 
 多个选择器 可以用相同的声明  选择器之间用 , 隔开   
比如:  h1,h2,h3,h4,h5,h6 color: green;   所有标题元素都是绿色的


































## CSS 标签

Text-alignment   文字排列
 
Font-size             文字大小
 
Background-color    元素背景色
Padding:20px  背景色 框 增大!!     

￼

Background-image     背景图片.
 
 
Background-position: 图像位置
关键字 :
          Center / left /right / top / bottom
          可以出现两个 水平和垂直各一个.
          用一个关键字的话  默认是居中的.
可以使用 100px  5cm
甚至          百分比.
           background-position:66% 33%;
 
Background-repeat    背景重复.
 
Repeat -y    垂直方向重复
Repeat -x     水平方向重复
No-repaet   不重复.
 
 background-reapat: repeat -y;  
 
 
   background-attachment    背景关联,固定背景图片.
如果文档比较长,  文档滚动适合 背景也会滚,  文档滚动过多  会超过图片边缘导致图片消失.
background-attachment:fixed  
默认值是 scroll  也就是 图片随着文档滚动.
 
 
 
Span.highlight bancground-color:yellow
文本黄色高亮.   
用法:     \<span class=“highlight”\>  文本   \</span\>    
 
 
多背景层叠: 注意点 ,p h3  不是随便能取名的 !  好像只有p h1-6 有效.
\<style type=“text/css”\>
body background-image:url(/i/eg\_bg\_04.gif);
 p.cflower background-image: url(/i/eg\_bg\_03.gif); padding: 20px;
 h3.radio background-image: url(/i/eg\_bg\_07.gif);  padding: 20px;
\</style\>
 
\<body\>
 
\<p class=“cflower”\>我是一个有花纹背景的段落。
 
\<h3 href=“#” class=“radio”\>我是一个有放射性背景的链接。\</h3\>  
 
\</p\>
 
\</body\>
￼






























---- 



## CSS 定位
Div h1 p    块级元素,  这些元素显示为一块内容.
 
 
相对定位 : relative       相对于元素的    初始位置    .进行一个移动
￼

绝对定位 :  absolute
￼

固定定位: fixed         距离上下左右 固定距离

￼


css 定位机制
普通流
浮动
绝对定位
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
百分比 / 像素值  设定图片的上下左右 边距.     Position   top/bottom/left/right  
￼

 
溢出内容   overflow        启用滚动条显示溢出内容.

￼



设置元素形状: 剪切元素.  clip

￼


垂直对齐方式   vertical-align
￼

元素 堆叠 顺序    z-index

￼

 
Css 浮动    http://www.w3school.com.cn/css/css\_positioning\_floating.asp 






























































































---- -

CSS 轮廓

Outline  轮廓 ,是元素周围的一条线, 突出元素的作用 
 
Outline 声明设置所有轮廓属性
Outline-color    颜色
Outline-style    样式
Outline-widyh  宽度
 
 

\<style type=“text/css”\>
p.one
{
border:red solid thin;
outline-style:solid;
outline-width:thin;
}
p.two
{
border:red solid thin;
outline-style:dotted;
outline-width:3px;
}
\</style\>
\</head\>
\<body\>
 
\<p class=“one”\>This is some text in a paragraph.\</p\>
\<p class=“two”\>This is some text in a paragraph.\</p\>
 
￼




\<style type=“text/css”\>
p
{
border: red solid thin;
}
p.dotted outline-style: dotted
p.dashed outline-style: dashed
p.solid outline-style: solid
p.double outline-style: double
p.groove outline-style: groove
p.ridge outline-style: ridge
p.inset outline-style: inset
p.outset outline-style: outset
\</style\>
\</head\>
\<body\>
 
\<p class=“dotted”\>A dotted outline\</p\>
\<p class=“dashed”\>A dashed outline\</p\>
\<p class=“solid”\>A solid outline\</p\>
\<p class=“double”\>A double outline\</p\>
\<p class=“groove”\>A groove outline\</p\>
\<p class=“ridge”\>A ridge outline\</p\>
\<p class=“inset”\>An inset outline\</p\>
\<p class=“outset”\>An outset outline\</p\>
 












## 表格 技巧

\<table\> 表格    \<tr\> 行     \<td\>列    
 
属性:  标签后面加空格 选择一个属性.
 
\<table\> :  
表格边框厚度    border
表格边框颜色 bordercolor
 
一行三列: 
  \<table\>
      
     \<tr\>   \<td\>  \</td\>  \<td\>  \</td\>       \<td\>  \</td\>         \</tr\>
 
  \</table\>











































