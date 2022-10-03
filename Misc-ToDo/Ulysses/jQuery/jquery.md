
*只是一个JS库(文件). 不需要安装,head 里引用就可以了.*
jquery本质还是 js 代码.
只是对 js 语言 进行包装处理. 
用 jquery 的时候 也可以混合 js 原生代码一起使用.


jquery 是一个类数组对象.
DOM 对象就是一个单独的 DOM 元素.





- 可以[官网下载][1]    
	然后\<head\> 中引用:`<script src="jquery.js"></script>`

-  Google/Microsoft … CDN. 用链接
	`<script src="http://ajax.googleapis.com/ajax/libs/jquery/2/jquery.min.js"> </script>`










> 您是否很疑惑为什么我们没有在 \<script\> 标签中使用 type="text/javascript" ？
> 在 HTML5 中，不必那样做了。JavaScript 是 HTML5 以及所有现代浏览器中的默认脚本语言！











js 库.     兼容各种浏览器. 丰富的 ui…



**样式 / dom / 事件 / 动画**





*环境搭建*

两个版本: 
开发版: 便于代码修改 & 调试 平时开发用.
> 未压缩 是可读的代码.

压缩版: 体积跟小. 效率更快. 正式线上发布用.
> 被精简和压缩了.

> 还有个 map file . 开发者可以用的到.普通用户不必要.





**jquery / dom 区别**
例子:`<p id=”imooc”></p>`
给这个文本节点 增加一段文字: welcome clover.
并 让文字变成红色.

普通处理:
`var p=document.getElementById(“imooc”);`
`p.innerHTML = ‘welcome clover’;`
`p.style.color = ‘red’;`
用 dom 犯法获取的 dom 元素 就是 dom 对象.

jquery 处理:
`var $p = $(‘#imooc’);`
`$p.html(‘welcome clover’).css(‘color’,’red’);`





*jQuery 转 DOM*
*DOM 转 jQuery*



id 选择器. `#` 定义之后只能使用一次.
页面的任何操作都需要节点的支撑.
如何快递高效找到指定的节点 也是重点.


jQuery 提供了一系列的节点,

`$(“#id”)`  id 选择器.

<body>   
	 <div id="aaron">
    	<p>id="aaron"</p>
    	<p>选中</p>
    </div>
    <div id="imooc">
        <p>id="imooc"</p>
        <p>jQuery选中</p>
    </div>
    <div id="imooc">
        <p>id="imooc"</p>
        <p>jQuery未选中</p>
    </div>

    <script type="text/javascript">
       //通过原生方法处理
        var div = document.getElementById('aaron');
        div.style.border = "3px solid blue";
    </script>

    <script type="text/javascript">
    	//通过jQuery直接传入id
    	//id的唯一，只选择到了第一个匹配的id为imooc的div节点
        $("#imooc").css("border", "3px solid red");
    </script>

</body>




*类选择器*    `$(“.class”)`
效率稍低. 但是 可以多选.



*元素选择器:*   `$("element")`

`  $("p").css("border", "3px solid red");`
使得  所有的 p 都变这个参数.

*全选择器* `*`
CSS 常用的
`* {padding: 0; margin: 0;}`


*层选择器:*
子元素   `$(‘div>p’)` 只影响一代.
后代元素 `$(‘div p’)`  所有后代,全部有效.
一般兄弟元素 `$(“.pre + div”)`
包含相邻兄弟选择的内容  
匹配 pre 后面 所有 兄弟元素,具有相同的父元素.

相邻兄弟元素 `$(“.pre ~ div”)`
选择 所有紧接 pre 后面的 div



**基本筛选器**

很多时候 不能直接通过基本选择器与层级选择器找到我们想要的元素.这时候 jQuery就提供了 一系列筛选器帮助我们.
筛选器 不是 css 规范. 是jQuery自己开发出来的.


用法 与 css 的伪元素雷士.

选择器 用`: ` 开头.


$(“:first”)   匹配第一个元素.
$(“:last”)  匹配最后一个元素
$(“:header”) 匹配所有标题元素(h1.h2....)
$(“:even”)    所有偶数元素. 从0开始
$(“:odd”)  所有奇数元素, 从零开始


eq()   gt()  even odd 筛选前面表达式匹配出来的结果.

gt 段落筛选. gt(1) 实际是2开始.




**内容选择器**

基本筛选器 针对的是 DOM 节点.
如果要通过内容来过滤... 也可以的.


$(“:contains(text)”)  选择所有包含指定文本的元素.
$(“:parent”)  选择所有包含子元素或者文本的父级别元素.
$(“:empty”) 选择所有没有子元素的元素
$(“:has(selector)”) 选择袁术中至少包含指定选择器匹配的一种元素.




**可见性 筛选选择器.**

元素 有显示状态和隐藏状态.

$(“:visible”)  所有显示的元素
$(“:hidden”)   所有隐藏的元素.



*隐藏元素方法:*
css display: none
type=“hidden” 表单元素
宽度高度 设置为0
一个祖先元素是隐藏的.该元素不会显示.
CSS visibility 值是 hidden
CSS opacity 的值是0


**属性筛选器**
基于属性 定位一个元素.

`$(":[attribute|='value']")`
给定字符串.或者以这个字符串为前缀的元素.



*子元素选择器:*
`$(":first-child")`   所有父元素的 第一个子元素
`$(":last-child")`  所有父元素的 最后一个子元素
`$(":only-child")`  只有一个子元素的父元素.就
`$(":nth-child")`    所有父元素的第 n 个子元素.
`$(":nth-last-child")` 倒数第几个...


:first 只匹配一个单独的元素.
:first-child 可以匹配多个 (每个父元素的 第一个子元素.)



**表单元素选择器…**
提交/传递数据.  表单元素是非常重要的.
jQuery 专门加入了表单选择器.方便的获取到某个类型的表单.

`$(":input")`   选择所有 input / textarea / select / button 元素

`$(":text")`  所有文本框
`$(":password")` 密码框
`$(":radio")`  单选按钮
`$(":checkbox")` mult-choose button
`$(":submit")`   提交按钮
`$(":image")`  图像域
`$(":reset")`  重置按钮
`$(":file")`   文件域




**表单对象属性选择器**

`$(":enabled")`   可用的表单元素
`$(":disabled")` 不可用的表单元素
`$(":checked")`  被选中的  input 元素
`$(":selected")` 被选中的 option 元素..


*特殊选择器* this




**.alert()  .removeAttr()**

每个元素都有一个或多个特性.
img 下  src 就是特性. 标记图片地址.


DOM 中 操作特性的方法主要有3个.
getAttribute
setAttribute
removeAttribute

jQuery中 
只要  attr() / removeAttr() 就可以了.
还兼容性好.


attr()  来获取和设置元素属性.
attribute. 的缩写.

attr()
1. attr(传入属性名):  获取属性值
2. attr(属性名,属性值) 设置属性的值
3. attr(属性名,函数值) 设置属性的函数值.
4. attr(attributes) 给指定的元素 设置多个属性值.

removeAttr()  删除.
.removeAttr( attributeName ) : 为匹配的元素集合中的每个元素中移除一个属性（attribute）


优点：
attr、removeAttr都是jQuery为了属性操作封装的，直接在一个 jQuery 对象上调用该方法，很容易对属性进行操作，也不需要去特意的理解浏览器的属性名不同的问题



*html()  / .text()*
读取 / 修改 元素的 结构是很常见的.

.html() 方法:



*.val()*
处理表单元素的值: input / select / textarea …
.val() 无参数:  匹配元素中第一个元素的当前值.
.val(value) 设置匹配的元素集合中的每个元素.
.val(function) 返回设置值的函数.

通过. val() 来处理 select 元素.
当没有选择项被选中. 返回 null.
.val() 多用来设置表单的字段值...



**增加样式 .addClass()**

动态改变类名(class) 可以让元素呈现不同的效果.

多个 class 用空格分割.


example  : p 下增加一个 newclass 样式.

\<p class=“orgclass”\>
$(“p”).addClass(“newclass”)


→p 的实际样式 变成: orgclass 和 newclass 的集合.


定义好 .left  / newclass
然后  $('.left div').addClass('newClass')
就给 left 下面的 div 就多了一个属性.

 
*删除样式 .removeClass()*





**切换样式: .toggleClass()**

隔行换色效果. 也就是 动态添加删除 class.
第一次执行 addclass
第二次执行 removeclass … 循环.




**操作样式: .css()**

动态修改 style 的属性 只要用 css() 就可以了.


获取:
.css(propertyName)  获取第一个元素 样式的计算值.
.css(propertyNames) 传递一组数组 返回对象结果.

设置: 
.css(propertyName, value)  设置 css
.css (propertyname,functon) 传入一个回调函数.返回取到对应的值 进行处理.


**元素的数据存储**
html5
允许在普通元素标签里面 嵌入 datta 属性.
实现简单的 数据存储.
数量不受限制.
能受到 js 动态修改. 也支持 css 进行样式设置.


不支持 html5 的浏览器: 如何数据存储.
jQuery 提供了. data() 的方法.







=========
jQuery 是一个 js 库.
极大的简化了 js 编程. 很容易学习.


































[1]:	http://jquery.com/download/