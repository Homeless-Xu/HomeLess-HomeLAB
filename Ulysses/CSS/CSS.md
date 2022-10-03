
层叠样式表.

*HTML 表达结构*
*CSS  表达样式*
> 没有css 就归浏览器管. 浏览器有个默认的样式的!

*样式的 内容和结构是分开的.*
就像女人换衣服. 
衣服不一样 网页能完全不一样.不一样到你根本看不出来是一个网页…






网页 存储: 
vi 编辑这个文件.



head
→ style 


如果删了 css 
很好看的网页 就全部乱了  但是 内容还是都在的.

*怎么加入css*
1. 外部创建css文件. 链接到html页面
2. \<head\>里 添加 style 规则
3. 标记里面 加 style=“”

基本样式:
规定什么东西  值.
`<p style=“background-color:yellow;”>`
> 透明: transparent

头部:


**样式继承**








*样式背景*


纯色. 图像. 

\<body style=“background-color:gray”\>
全部背景 变灰的.  颜色可变.
\<body style=“background-image:url(xx.jpg)”\>




**颜色:**
RGB 颜色   三原色. ffoooo 
十六进制 r 两位 g 两位 b 两位.
rgb(255,255,255)

\*rgba(255,255,255,0.5)
a → 透明度  取值范围:0-1   可以有小数点.
0.5 就是 半透明.



背景重复方式:

不重复. 重复. 上下左右.... 






背景 跟着文字 滚动.
默认是滚动的.  可以固定.
`background-attachment:scroll/fixed   `






## 段落
\<p style=“color:red”\>

\<p style=“text-indent: 2em;line-height:1.5”\>

*首行缩进:* text-indent
当前字体的倍数.
也可以用    百分比. px 像素点
 可以是负值!


悬挂缩进
正常负值缩进的话  第一行 前面几个字 可能会被吞掉.
这样就只能 首行正常. 其他行 全部缩进2个 就达到一样的效果了.


*行间距*line-height


*对齐* text-align
英文需要对齐.中文几乎不需要.


center left right 
justify 两端对齐.

*单词间距*
`word-spacing:22px`

\*字符间距
`letter-spacing:22px`


*大小写*
text-transform:capitalize /uppercase / lowercase
首字母大写 全部大写 全部小写


*画线:*
text-decoration:underline / overline /line-through / 
下划线 上划线 删除线.


*空白字符的处理.*
white-space:normal / pre 
normal: 正常(多空格变成一个) 
pre:  有多少就多少
no-wrap. 不自动换行.浏览器缩放的时候
pre-line



*文字方向*
 阿拉伯文是 从右边开始写的.和中文不一样.






## 字体

大小 加粗 斜体 变形 阴影 

*font-family:*serif / sans-serif / monospace (等宽的)
cursive / fantasy øøøø
这是五个 系列 也就是 大类! !  并不是具体的字体.


没有你指定的字体的话 会用浏览器默认的字体 换掉你想要的字体.
字体可以指定多种. 一种没有选另外一种



*倾斜*

font-style:italic; 
font-variant:small-caps;  小的大写.
font-weight:400  粗细.
font-size:2em 两倍大小.







*文字效果*

以前需要ps 做的字体 .现在可以用css 实现了 方便很多.

text-shadow:3px 5px 5px rgba(1,255,255,0.5)
x y range color

\<h1 style=“text-shadow:0px -1px 0px #0000,
0px 1px 3px #606060; color:#606060;
outline-color:red;
outline-style:dotted / dashed / double ;

”\> insert \</h1\>




*列表样式*

无序: 
disc 实心
circle 空心
square 方的

 位置:
inside / outside




*表格样式:*
边线. 边框的距离.





*框模型*




*CSS 定位:*

**div**


div 之间可以放很多段落.

bod → div → p → span 可以定位

页面布局. 
侧边条 
下面 页脚.(网站备案信息)
头:....
左边栏:
 中间 正文.

以前都是div 做的

后来用 html5 了...


元素浮动.


**定位机制:**

*普通*
relative *浮动*         上到下
*绝对定位*


\< p style=“position:relative left -20px; bottom 20px” 


绝对定位:  原来位置


浮动定位:

float:left/rigjt/none




*选择器:*


元素选择器.


head → style → 可以指定元素的样式


\<style\>

  p,th,td {border:1px solid blue}
> 分组 很多元素都是一种样式的话 可以放一起.
  p {background-color:red }
如果有两个p 都有样式 .可以两种样式都生效.

`*.important { color:red }`
叫这个类的 都是红色的
然后body 下面用这个
\<p class=“important”\>
这个段落 就变成红色了.



\</style\>

这个就是全局控制
所有的 th 都是这个样式.



`.` 开头 表示类
`#`开头 表示 id




















































































