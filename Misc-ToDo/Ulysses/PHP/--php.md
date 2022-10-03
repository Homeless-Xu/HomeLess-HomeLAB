<?php
if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== FALSE) {
    echo '正在使用 Internet Explorer。<br />';
}
?>

该脚本的输出可能是：
正在使用 Internet Explorer。\<br /\>



strpos() 函数 (php 内置)
功能: 在一个字符串中搜索 另外一个字符串.

我们要在 `$_SERVER['HTTP_USER_AGENT']`变量中寻找 `MSIE`。
如果没有，则返回 FALSE。
如果该函数没有返回 FALSE，则 if 会将条件判断为 TRUE 并运行其花括号 {} 内的代码；否则，则不运行这些代码。



