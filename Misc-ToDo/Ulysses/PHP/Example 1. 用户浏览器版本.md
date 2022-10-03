## Example 1. 用户浏览器版本


1. 检查访问者所用的浏览器.

需要 检查用户的 agent 字符串.
这个是 浏览器发送的 HTTP 请求的 一部分.
这个信息 被储存在一个 变量 `$_Server['http_user_agent']` (数组)中.
PHP 中 变量总是 `$` 开头的

要显示这个 变量 只需要

`echo $_SERVER['HTTP_USER_AGENT']`
> 必须大写

→ 

Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36