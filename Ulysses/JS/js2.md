
文档对象模型. DOM Document Object Model
定义 访问和处理 HTML 文档的标准方法.



DOM 把 Html 文档 呈现为 带有元素.属性和文本的树结构.


元素节点: html / body / p

文本节点: li 中的 js dom css 等文本.

属性节点: a 标签的连接地址...



`<a href="http://www.imooc.com">JavaScript DOM</a>`



网页 ID 是唯一的. 就像 身份证. 
只要有身份证号 就能找到对应的人.


网页中 都是通过 ID 先找到标签. 然后进行操作.


*获取元素ID*

body
\<p id=“con”\> JavaScript \</p\>
\<script type=“text/javascript”\>
var mychar=document.getElementById(“con”)
document.write(“结果:”+mychar.innerHTML);
/body


→ 实际显示:  结果: JavaScript.



*innerHTML 属性.* (区分大小写)
**获取** / **替换,赋值** HTML 元素的内容.


<h2 id="con">javascript</H2>
<p> JavaScript是一种基于对象、事件驱动的简单脚本语言，嵌入在HTML文档中，由浏览器负责解释和执行，在网页上产生动态的显示效果并实现与用户交互功能。</p>
<script type="text/javascript">
  var mychar=document.getElementById("con")           ;
  document.write("原标题:"+mychar.innerHTML+"<br>"); //输出原h2标签内容
  mychar.innerHTML="Hello world";
  document.write("修改后的标题:"+mychar.innerHTML); //输出修改后h2标签内容
</script>




改变 html 样式.

js 可以改变 HTML 元素的样式.
`object.style.property=new style;`
object获取的元素对象.
*property 基本属性列表:*

background  
height
width
color
font        字体
font family 字体系列  
font size   字体大小



*改变 P / h2 元素的样式:*


\<h2 id=“hcon”\> Clover \</h2\>
\<p id=“pcon”\> Hello Clover \</p\>

\<script type="text/javascript"\>
var h2-html=document.getElementById(“hcon”);  
h2-html.style.color=“red”;
h2-html.style.background=”#ccc”;
he-html.style.width=“300px”
\</script\>




**显示/隐藏属性:** display

`object.style.display = "none/block"`
none 此元素不会被显示.      (也就是隐藏)
block 此元素将显示为块级元素(也就是显示)



*控制类名: classname*

`object.className = classname`
可以 给文章 添加/修改 样式.
获取元素的 class 属性.



 p2.className="two";









\<!DOCTYPE HTML\>
\<html\>
\<head\>
\<meta http-equiv="txttent-Type" txttent="text/html; charset=utf-8" /\>
\<title\>javascript\</title\>
\<style type="text/css"\>
body{font-size:12px;}
# txt{
height:400px;
width:600px;
border:#333 solid 1px;
padding:5px;}
p{
line-height:18px;
text-indent:2em;}
\</style\>
\</head\>
\<body\>
  \<h2 id="con"\>JavaScript课程\</H2\>
  \<div id="txt"\> 
 \<h5\>JavaScript为网页添加动态效果并实现与用户交互的功能。\</h5\>
\<p\>1. JavaScript入门篇，让不懂JS的你，快速了解JS。\</p\>
\<p\>2. JavaScript进阶篇，让你掌握JS的基础语法、函数、数组、事件、内置对象、BOM浏览器、DOM操作。\</p\>
\<p\>3. 学完以上两门基础课后，在深入学习JavaScript的变量作用域、事件、对象、运动、cookie、正则表达式、ajax等课程。\</p\>
  \</div\>
  \<form\>
  \<!--当点击相应按钮，执行相应操作，为按钮添加相应事件--\>
\<input type="button" value="改变颜色" onclick="set.changeColor()"\>  
\<input type="button" value="改变宽高" onclick="set.changeSize()"\>
\<input type="button" value="隐藏内容" onclick="set.objHide()"\>
\<input type="button" value="显示内容" onclick="set.objShow()"\>
\<input type="button" value="取消设置" onclick="set.offSet()"\>
  \</form\>
  \<script type="text/javascript"\>
   var txt=document.getElementById("txt");
   var set={
changeColor:function(){
txt.style.color="red";
txt.style.backgroundColor="#ccc";
},
changeSize:function(){
txt.style.width="300px";
txt.style.height="300px";
},
objHide:function(){
txt.style.display="none";
},
objShow:function(){
txt.style.display="block";
},
offSet:function(){
var message=confirm("你确定要重置所有设置么？");
if(message==true){
txt.removeAttribute('style');
}
}
  }
  \</script\>
\</body\>
\</html\>



















 