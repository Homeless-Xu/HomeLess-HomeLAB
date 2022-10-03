

！！！


静态页面  动态页面

纯静态 ：
写博客  20篇文章 就是20个 html也面。。
结构很简单。


如果要改 什么就麻烦了 css还好有外部文件
其他的。。。。。 就要每个都改了






文本 存数据库！！！！





数据库 文本。






静态 动态 区别：

静态网页： 纯客户端运行



动态网页：
use asp php jsp 。net 等等 我网络编程语言写
运行在服务器端端代码。

动态网页可以交互。
留言板什么的  静态是无法完成的。




网站 数据库。





数据库作用：



用 js 连接数据库。
 \<script type="text/javascript" language="javascript" charset="gb2312"\> \<!-- function getCountFromDB() { //以当前页面文件为基础，找到文件所在的绝对路径。 var filePath = location.href.substring(0, location.href.indexOf("index.html")); var path = filePath + "MyData.mdb"; //去掉字符串中最前面的"files://"这8个字符。 path = path.substring(8); var updateCnt = 0; //生成查询和更新用的sql语句。 var sqlSelCnt = "SELECT * FROM [user]()"; //建立连接，并生成相关字符串。 var con = new ActiveXObject("ADODB.Connection"); con.Provider = "Microsoft.Jet.OLEDB.4...*










比如\<p 姓名：张三\</p\>；
这个张三在数据库中的表USER，NAME列，知道ID为101，怎么用PHP 调用，求代码
是html文件


$connect = @mysql_connect($ip:$port,$username,$password);
$select = @mysql_select_db($database,$connect);
$result = @mysql_query("select from user where id=101");
把$result 打印出来就是你要结果 

其实调用php程序后，文件名就不能为html格式了，将文件名改为php文件名，
\<html\>
\<?php
写入代码
?\>
\</html\>






blog 数据库 
博客内容  在大数据类型中


文章的图片 通常保存在存储中 用地址放在文章中




大段文字：
一般 用 text 和 blob 数据类型。



给你一个专业建议:
id用正整数;
标题:用varchar
日期用date
时间用datetime
作者用char
回复用varchar
文章内容用text或blob



TEXT和BLOB数据类型可以用来保存255 到65535个字符，TEXT
不区分大小写，而BLOB对字符的大小写敏感



实在确定不了长短但又是大篇幅的文章的话， 我通常用text

























