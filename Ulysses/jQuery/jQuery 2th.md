js 库. 简化 js 编程.  easy to learn,
是一个js文件 . 
可以下载到本地. 也可以直接网上引用连接.

无需安装. 下载好. 引用进去就行.




包含:
html 元素选取
html 元素操作
css 操作
html 事件函数
js 特效和动画
html DOM 遍历和修改
ajax

`$(this).hide()`
隐藏当前 html元素

`$("test").hide()`
隐藏 id 是 test 的元素.

`$("p").hide()`
隐藏 所有 p 元素.

`$(".test").hide()`
隐藏所有 class=test 的元素.


*基本语法: $(selector).action()*
$        → 定义 jQuery
selector → 查询/查找 html元素.
action   → 执行对元素的操作




*文档就绪函数:* jQuery 代码尽量写在这里©
> 为了防止文档没完全就运行 jQuery代码 (可能会操作失败)
> 试图隐藏一个不存在的元素.
> 获得未完成加载的图像的大小



\`$(document).ready(function(){
\`\`
\`\`--- jQuery functions go here ----
\`\`
\`\`});
\`


**选择器:**
准确的选取 你希望应用效果的元素


*元素选择器*
`$(this)`  当前 html 元素
`$("p")`  选择 p 元素
`$("p.intro")`  class=info 的 p 元素
`$("p#demo")`   id=demo 的 p 元素
`$("ul li:first")` 每个 ul 的 第一个 li.
`$("div#intro .head")` id=intro 的 div 中的所有 class=head 的元素


*属性选择器*
`$("[href]")`         所有带有href属性的元素.
`$("[href='#']")`     所有带有href 值等于#的元素
`$("[href!='#']")`    所有href值不等于 # 的元素
`$("[href$='.jpg']")` 带有href值以.jpg 结尾的元素

*CSS 选择器*
> 改变 HTML 元素的 css 属性.
`$("p").css("background-color","red");`



*jQuery 事件*
事件处理 是核心函数
当 html 中 发生某些事件时调用的方法.
一般在 head 里面.


<script type="text/javascript">
    $(document).ready(function(){
      $("button").click(function(){
        $("p").hide();
      });
    });
</script>

当按钮点击时候 会调用一个函数
隐藏所有 p 元素



单独文件中的函数?
如果网站包含很多页面.而且你希望你的jQuery函数易于维护. 那么把 jQuery 函数 放到独立的 js 文件中.通过 src 属性来引用文件.

\<head\>
\<script type="text/javascript" src="jquery.js"\>\</script\>
\<script type="text/javascript" src="my\_jquery\_functions.js"\>\</script\>
\</head\>


名称冲突;
jQuery 使用$ 来定义 jQuery
也有别的 函数 也使用$ 来定义自己.
用 noConflict 来解决这个..

`var jq=jQuery.noConflict()`
帮助您使用自己的名称 来代替$ 符号.


*隐藏/显示.*
切换/滑动/淡入淡出/动画....

jQuery hide()

`$("#hide").click(  function() { $("p").hide();}  );`


可选参数 
speed:     显示隐藏速度.
callback: 显示/隐藏 完成后执行函数的名称.

*show/hide 集成一键.*
显示隐藏的 . 隐藏显示的. 只要一个按钮.
`$("button").click( function(){ $("p").toggle(1000); } );`



*淡入 淡出. *
fadein()
fadeout()
fadetoggle()
fadeto()
`$(selector).fadeIn(speed,callback);`
speed → slow / fast / xxms 


fadein     → 淡入已隐藏的元素.
fadeout    → 淡出已显示的元素.
fadetoggle → 淡入淡出 切换.
fadeto     → 给不透明度.(0-1)
`$(selector).fadeTo(speed,opacity,callback);`

$("button").click(function(){
  $("#div1").fadeTo("slow",0.15);
  $("#div2").fadeTo("slow",0.4);
  $("#div3").fadeTo("slow",0.7);
});





*滑动效果.*

显示/隐藏的时候  上下滑动.

slidedown()
slideup()
slidetoggle()




*动画* animate()

默认 hrml 元素 都有一个静态位置. 无法移动.
如需对位置进行操作.
先把元素的 css posotion 属性设置为: 
relative/fixed/absolutte.

动画过程中可以使用多个属性.


*callback 函数*

callback 函数 在当前动画100%完成之后执行.


由于  js 指令 是 逐一执行的.
动画之后的语句 可能会产生错误/页面冲突. (因为动画还没完成.)   为了避免这种情况 可以使用 callback 函数.




**chaining**  连接动作.


一般都是一次写一条 jQuery 语句,一条接着一条.

链接(chaining) 技术. 允许我们在相同的元素上运行多条jQuery 命令. 这样浏览器就不用多次查找相同的元素.



下面的例子把 css(), slideUp(), and slideDown() 链接在一起。"p1" 元素首先会变为红色，然后向上滑动，然后向下滑动：
`$("#p1").css("color","red").slideUp(2000).slideDown(2000);`



*获得内容.和属性.*
DOM 操作.
jQuery 最重要的能力就是 操作 DOM的能力.
document object model 文档对象模型.

*获得内容*
text()    设置或返回所选元素的文本内容
html()   设置或返回所选元素的内容（包括 HTML 标记）
val()    设置或返回表单字段的值

`$("#btn1").click(function(){ alert("Text:"+ $("test").text());});`





*获取属性:   attr();*
比如 显示一个超链接的 详细网址






*添加元素:*
append()   被选元素结尾
prepend()  被选元素开头
after()        被选元素 之后
before()     被选元素之前

`$("p").append ("some appended text.");`


*删除元素:*

remove 删除被选元素.
empty   删除被选元素的 子元素,

`$("#div1").remove()`


*CSS *
addClass
removeClass
toggleClass  对被选元素进行 添加/删除 的切换操作.
css()


$("button").click(function(){
  $("h1,h2,p").addClass("blue");
  $("div").addClass("important");
});





*size*
handle  yuansu  和浏览器窗口的尺寸.
wifth()    不包括 内外边距/边框
heigh()
innerWidth()   包括内边距,
innerHeight() 
outerWidth()
outerHeight()




设定指定 div 的宽度和高度.
$("button").click(function(){
  $("#div1").width(500).height(500);
});






*遍历*  最常用的是  树遍历  tree-travelsal
移动的意思.
可以从当前元素开始.轻松的在 家族树 中轻松的移动
向上 祖先
向下 子孙
水平 同胞.


祖先 
parent()
parents
parentsuntil

比如:
div → ul → li → span
$("span").parent().css({"color":"red","border":"2px solid 
会使得 li  变成新的 css

后代:

children()
find()

同胞:
siblings
next
nextall
nextuntil
prev
prevall
prevuntil

*过滤: first  last  eq*
在一组元素中.选择一个特定的元素.

fliter / not 匹配/不匹配某些元素.

div xia de first p
`$("div p").first()`
`$("div p").eq(1)`  (0-.,,) this is 2th

`$("p").fliter(".intro")`  带有 intro 这个类名的匹配出来.



**ajax**
与服务器交换数据. 
在不刷新真个页面的情况下对部分网页进行更新,

谷歌地图/通讯视频/优酷视频 …都是用这个的.


jQuery ajax
http get / http post 
从远程服务器上请求文本/ html/xml/json…
把这些数据直接载入到网页.

常规的 ajax 不容易写.
不同的浏览器  对 ajax 的实现不一样.
必须编写额外的代码 对浏览器进行测试.
jQuery 给我们解决了这个难题. 

*jQuery Ajax*

load(). 从服务器 加载数据. 把数据放入被选的元素.
`$("selector").load(URL,data,callback);`
url 必选.

把 test.txt 载入 到 div1中
`$("#div1").load("test.txt");`

`$("#div1").load("test.txt #p1");`
把 "test.txt" 文件中 id="p1" 的元素的内容，加载到指定的div1 中


callback:
responseTxt  调用成功后的结果内容.
statusTxt      调用状态.
xhr              xmlhttprequest 对象

load() 完成后显示提示框.
load 成功 → 外部内容加载成功.
load 失败 → 错误信息.

$("button").click(function(){
  $("#div1").load("demo_test.txt",function(responseTxt,statusTxt,xhr){
    if(statusTxt=="success")
      alert("外部内容加载成功！");
    if(statusTxt=="error")
      alert("Error: "+xhr.status+": "+xhr.statusText);
  });
});



*jQuery Get/Post*
从服务器上请求数据.
`$.get(url,callback)`  url must.

$("button").click(function(){
  $.get("demo_test.asp",function(data,status){
    alert("Data: " + data + "\nStatus: " + status);
  });
});



get 从服务器下载数据.
post 上传数据到服务器.

`$.post(URL,data,callback);`

$("button").click(function(){
  $.post("demo_test_post.asp",
  {
    name:"Donald Duck",
    city:"Duckburg"
  },
  function(data,status){
    alert("Data: " + data + "\nStatus: " + status);
  });
});











































