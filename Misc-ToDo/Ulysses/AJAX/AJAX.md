
*不重新加载整个页面的情况下, 更新部分网页的数据.*
> 不使用 AJAX 如果需要更新内容，必需重载整个网页面。


[W3School course][1]

AJAX = Asynchronous JavaScript and XML   异步的 JavaScript and XML





1. 

\<body\>

\<div id="myDiv"\>\<h3\>Let AJAX change this text\</h3\>\</div\>
\<button type="button" onclick="loadXMLDoc()"\>Change Content\</button\>

\</body\>


2. 在页面的 head 部分添加一个 \<script\> 标签。该标签中包含了这个 loadXMLDoc() 函数：


\<head\>
\<script type="text/javascript"\>
function loadXMLDoc()
{
.... AJAX script goes here ...
}
\</script\>
\</head\>




*XMLHttpRequest* 
用于在后台与服务器交换数据。
是 AJAX 的基础。


*创建  XMLHttpRequest:*
`variable=new XMLHttpRequest();`
`variable=new ActiveXObject("Microsoft.XMLHTTP”);`
> 这个给ie5 & ie6 用的


为了应对所有的现代浏览器，

`var xmlhttp;
``if (window.XMLHttpRequest)
``  {// code for IE7+, Firefox, Chrome, Opera, Safari
``  xmlhttp=new XMLHttpRequest();
``  }
``else
``  {// code for IE6, IE5
``  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
``  }
`



*向服务器发送请求:*

`xmlhttp.open("GET","ajax_test.asp",true);`


*open()* & *send()* 


*open (method url async)*

- method: 请求的类型 GET / POST
	- url:    文件在服务器上的位置
		- async: 
			true 异步  
			false 同步

	*send (string)*
	把请求发送给服务器.
	string 仅用于 post 请求.


	> get or post 建议全部 Post  
	> get 更快 更简单.大部分情况下都能用.  
	>   
	> 下面情况 用 post  
	>   
	>     向服务器发送大量数据 (post 没有数据量限制.)  
	>     发送包含未知字符的用户输入时post 更稳当可靠.






任何文件.  txt / xml / asp / php 


*异步:*


对于 web 开发人员来说，发送异步请求是一个巨大的进步。
很多在服务器执行的任务都相当费时。
AJAX 出现之前，这可能会引起应用程序挂起或停止。



*通过 AJAX，JavaScript 无需等待服务器的响应，*
而是：

•	在等待服务器响应时执行其他脚本
•	当响应就绪后对响应进行处理






*获取服务器响应:*
XMLHttpRequest 对象:
*responseText* 获得字符串形式的响应数据
*responseXML*  获得 xml 形式的 响应数据


`document.getElementById("myDiv").innerHTML=xmlhttp.responseText;`




*onreadystatechange *  
每当 readyState 属性改变时，就会调用该函数。

*readyState*
存有 XMLHttpRequest 的状态。从 0 到 4 发生变化。

0: 请求未初始化
1: 服务器连接已建立
2: 请求已接收
3: 请求处理中
4: 请求已完成，且响应已就绪


*status* 
200: "OK"
404: 未找到页面




在 onreadystatechange 事件中，
我们规定当服务器响应已做好被处理的准备时所执行的任务。
当 readyState 等于 4 且状态为 200 时，表示响应已就绪：


xmlhttp.onreadystatechange=function()
  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		}
  }



注释：
onreadystatechange 事件被触发 5 次（0 - 4），
对应着 readyState 的每个变化。




*callback*
一种以参数形式传递给另一个函数的函数。






*AJAX ASP/PHP 实例*
取名软件

一个输入框 (可以输入 a-z)
输入 a 就会出 a 的推荐名字
输入 b 就会出 b 的推荐名字



function showHint(str)
{
var xmlhttp;

if (str.length==0)
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }

xmlhttp.onreadystatechange=function()
  {
 if (xmlhttp.readyState==4 && xmlhttp.status==200)
{
document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
}
   }

xmlhttp.open("GET","gethint.asp?q="+str,true);

xmlhttp.send();

}




源代码解释：

如果输入框为空 (str.length==0)，
则该函数清空 txtHint 占位符的内容，并退出函数。


如果输入框不为空，showHint() 函数执行以下任务：
•	创建 XMLHttpRequest 对象
•	当服务器响应就绪时执行函数
•	把请求发送到服务器上的文件
•	请注意我们向 URL 添加了一个参数 q （带有输入框的内容）







*ajax 服务器页面.*
用 js  写的 服务器上就是 xxx.asp 文件
用 php 写的 服务器上就是 xxx.php 文件
用什么语言写都可以.功效是一样的..


*gethint.asp* 
源代码会检查一个名字数组，
然后向浏览器返回相应的名字：


<%
response.expires=-1
dim a(30)
'用名字来填充数组
a(1)="Anna"
a(2)="Brittany"
a(3)="Cinderella"
a(4)="Diana"
a(5)="Eva"
a(6)="Fiona"
a(7)="Gunda"
a(8)="Hege"
a(9)="Inga"
a(10)="Johanna"
a(11)="Kitty"
a(12)="Linda"
a(13)="Nina"
a(14)="Ophelia"
a(15)="Petunia"
a(16)="Amanda"
a(17)="Raquel"
a(18)="Cindy"
a(19)="Doris"
a(20)="Eve"
a(21)="Evita"
a(22)="Sunniva"
a(23)="Tove"
a(24)="Unni"
a(25)="Violet"
a(26)="Liza"
a(27)="Elizabeth"
a(28)="Ellen"
a(29)="Wenche"
a(30)="Vicky"

'获得来自 URL 的 q 参数
q=ucase(request.querystring("q"))

'如果 q 大于 0，则查找数组中的所有提示
if len(q)>0 then
  hint=""
  for i=1 to 30
    if q=ucase(mid(a(i),1,len(q))) then
      if hint="" then
        hint=a(i)
      else
        hint=hint & " , " & a(i)
      end if
    end if
  next
end if

'如果未找到提示，则输出 "no suggestion"
'否则输出正确的值
if hint="" then
  response.write("no suggestion")
else
  response.write(hint)
end if
%>



*gethint.php*


<?php
// 用名字来填充数组
$a[]="Anna";
$a[]="Brittany";
$a[]="Cinderella";
$a[]="Diana";
$a[]="Eva";
$a[]="Fiona";
$a[]="Gunda";
$a[]="Hege";
$a[]="Inga";
$a[]="Johanna";
$a[]="Kitty";
$a[]="Linda";
$a[]="Nina";
$a[]="Ophelia";
$a[]="Petunia";
$a[]="Amanda";
$a[]="Raquel";
$a[]="Cindy";
$a[]="Doris";
$a[]="Eve";
$a[]="Evita";
$a[]="Sunniva";
$a[]="Tove";
$a[]="Unni";
$a[]="Violet";
$a[]="Liza";
$a[]="Elizabeth";
$a[]="Ellen";
$a[]="Wenche";
$a[]="Vicky";

//获得来自 URL 的 q 参数
$q=$_GET["q"];

//如果 q 大于 0，则查找数组中的所有提示
if (strlen($q) > 0)
  {
  $hint="";
  for($i=0; $i<count($a); $i++)
    {
    if (strtolower($q)==strtolower(substr($a[$i],0,strlen($q))))
      {
      if ($hint=="")
        {
        $hint=$a[$i];
        }
      else
        {
        $hint=$hint." , ".$a[$i];
        }
      }
    }
  }

// 如果未找到提示，则把输出设置为 "no suggestion"
// 否则设置为正确的值
if ($hint == "")
  {
  $response="no suggestion";
  }
else
  {
  $response=$hint;
  }

//输出响应
echo $response;
?>







*AJAX 数据库实例*

AJAX 可用来与数据库进行动态通信。

如有个选择框. 
选个名字 就会出来一大堆信息(存在数据库中的表格)


















































[1]:	http://www.w3school.com.cn/ajax/index.asp