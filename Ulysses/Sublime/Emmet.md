*emment css sinppets*

大幅度提升前端开发效率的工具.

*代码片段:*  	*先要定义! 然后才能使用*
如: 
1. 先设置 
	2. 输入;x 
		3. 自动输出★     
			 
*Emmet*
不用定义. 已经预先设置好了. 
*非常适合 HTML / XHTML / CSS *
> 因为这个几乎是给 html 专用的,所以能预设很多 html 的快捷输入.

[官网用法详细介绍][1]


*这个插件 根据文件类型来的*
.html 和 .css 的缩写是不通用的.







*example:*
 
he   ⇥   → \<head\>\</head\>
li   ⇥   → \<li\>\</li\>
meta ⇥   → \<meta charset”utf-8”\>



**瞬间建立一个 html5 页面**
`!` or `HTML:5`

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>input here</title>
</head>
<body>
	input second
</body>
</html>



**添加 类**

p.text   → `<p class=“text“></p>`






---- -
在 css 文件中:

w100 →  width: 100px;







前身是 zen coding.



语法参考:
*\>*
1. nav\>ul\>li + tab
直接变成 
<nav>
    <ul>
        <li></li>
    </ul>
</nav>



*+*
div+p+bq
<div></div>
<p></p>
<blockquote></blockquote>



`*`
`ul>li*5`
<ul>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
</ul>




`#header`
\<div id="header"\>\</div\>


`.title`
\<div class="title"\>\</div\>


`p.class1.class2.class3`
\<p class="class1 class2 class3"\>\</p\>



























[1]:	http://docs.emmet.io/cheat-sheet/