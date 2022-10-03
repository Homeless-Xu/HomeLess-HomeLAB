## PHP The Right Way
[PHP The Right Way][1]


[PHP w3school 教程][2]




**PsySH

工具 可以看到实时返回值.结果.




建议用 PHP5.6+


5.4 之后的版本 内置 Web 服务器.
启动内置服务器:
zsh 进入 Web 根目录. 执行:
php -S localhost:8000


PHP 的 CLI 命令行脚本接口 很有用.
可以完成 自动化任务 如  测试 部署 应用管理.

可以直接调用自己的程序 而无需 web 图形界面.


让 php 运行指定文件:

`php 11.php`
可以运行任何文件. 不一定要 .php 的扩展名.


php -i
— info
调用 phpinfo() 函数,并显示结果.
如果 php 没正常运行. 用这个排错.

php -r
运行 单行的 php 代码.
无需加上 php 的起始结束标识符. (\<?php ?\>)

php 




\<?php
// 名为 test.php 的简单测试程序
echo getcwd(), "\n";
?\>

会得到 /Users/v/Sites




脚本:

#!/usr/bin/php
<?php

if ($argc != 2 || in_array($argv[1], array('--help', '-help', '-h', '-?'))) {
?>

This is a command line PHP script with one option.

  Usage:
  <?php echo $argv[0]; ?> <option>

  <option> can be some word you would like
  to print out. With the --help, -help, -h,
  or -? options, you can get this help.

<?php
} else {
    echo $argv[1];
}
?>

第一行: 说明这个文件 应该用 php 来执行.


合适的 调试器 是开发最有用的工具.可以帮助排错.
Xdebug  


安装 xdebug 可能很费事,

*MacGDBp*
 Mac上的 免费 单击调试器.






PEAR
常用的 依赖包管理器.



PHP 是庞大的语言.
任何层次的开发者 都能开发.


[基础知识:][3]




*时间日期


<?php

$raw = '22. 11. 1968';
$start = DateTime::createFromFormat('d. m. Y', $raw);

echo 'Start date: ' . $start->format('Y-m-d') . "\n";


?>

输出: Start date: 1968-11-22



PHP 使用 UTF-8 编码  不要使用 Unicode.

各方面都要 UTF
PHP  数据库  浏览器 等等



### 数据库
绝大多数程序 都要用数据库 长久保存数据.
推荐 mysql.

一定避免使用 mysql 扩展. 要用 mysqli 扩展 
或者 PDO 



数据库交互





Web 应用程序安全.

提高 web 安全 很有必要.



## 密码哈希
一般应用 都会加入 用户登录模块.
账号密码 会储存在数据库中.用来登录验证.

在存储密码前正确的哈希密码是非常重要的。哈希密码是单向不可逆的，该哈希值是一段固定长度的字符串且无法逆向推算出原始密码。这就代表你可以哈希另一串密码，来比较两者是否是同一个密码，但又无需知道原始的密码。如果你不将密码哈希，那么当未授权的第三者进入你的数据库时，所有用户的帐号资料将会一览无遗。有些用户可能（很不幸的）在别的网站也使用相同的密码。所以务必要重视数据安全的问题。





## 数据过滤:


永远不要信任外部输入。请在使用外部输入前进行过滤和验证。filter_var() 和 filter_input() 函数可以过滤文本并对格式进行校验（例如 email 地址）。
外部输入可以是任何东西：$_GET 和 $_POST 等表单输入数据，$_SERVER 超全局变量中的某些值，还有通过 fopen('php://input', 'r') 得到的 HTTP 请求体。记住，外部输入的定义并不局限于用户通过表单提交的数据。上传和下载的文档，session 值，cookie 数据，还有来自第三方 web 服务的数据，这些都是外服输入。
虽然外部输入可以被存储、组合并在以后继续使用，但它依旧是外部输入。每次你处理、输出、连结或在代码中包含时，请提醒自己检查数据是否已经安全地完成了过滤。
数据可以根据不同的目的进行不同的 过滤 。比如，当原始的外部输入被传入到了 HTML 页面的输出当中，它可以在你的站点上执行 HTML 和 JavaScript 脚本！这属于跨站脚本攻击（XSS），是一种很有杀伤力的攻击方式。一种避免 XSS 攻击的方法是在输出到页面前对所有用户生成的数据进行清理，使用 strip_tags() 函数来去除 HTML 标签或者使用 htmlentities() 或是 htmlspecialchars() 函数来对特殊字符分别进行转义从而得到各自的 HTML 实体。
另一个例子是传入能够在命令行中执行的选项。这是非常危险的（同时也是一个不好的做法），但是你可以使用自带的 escapeshellarg() 函数来过滤执行命令的参数。
最后的一个例子是接受外部输入来从文件系统中加载文件。这可以通过将文件名修改为文件路径来进行利用。你需要过滤掉"/", "../", null 字符或者其他文件路径的字符来确保不会去加载隐藏、私有或者敏感的文件。


数据清理
数据清理是指删除（或转义）外部输入中的非法和不安全的字符。
例如，你需要在将外部输入包含在 HTML 中或者插入到原始的 SQL 请求之前对它进行过滤。当你使用 PDO 中的限制参数功能时，它会自动为你完成过滤的工作。
有些时候你可能需要允许一些安全的 HTML 标签输入进来并被包含在输出的 HTML 页面中，但这实现起来并不容易。尽管有一些像 HTML Purifier 的白名单类库为了这个原因而出现，实际上更多的人通过使用其他更加严格的格式限制方式例如使用 Markdown 或 BBCode 来避免出现问题。





配置文件
当你在为你的应用程序创建配置文件时，最好的选择时参照以下的做法：
•	推荐你将你的配置信息存储在无法被直接读取和上传的位置上。
•	如果你一定要存储配置文件在根目录下，那么请使用 .php 的扩展名来进行命名。这将可以确保即使脚本被直接访问到，它也不会被以明文的形式输出出来。
•	配置文件中的信息需要被针对性的保护起来，对其进行加密或者设置访问权限。





错误报告
错误日志对于发现程序中的错误是非常有帮助的，但是有些时候它也会将应用程序的结构暴露给外部。为了有效的保护你的应用程序不受到由此而引发的问题。你需要将在你的服务器上使用开发和生产（线上）两套不同的配置。




开发环境
为了在开发环境中显示所有可能的错误，将你的 php.ini 进行如下配置：
display_errors = On
display_startup_errors = On
error_reporting = -1
log_errors = On
将值设为 -1 将会显示出所有的错误，甚至包括在未来的 PHP 版本中新增加的类型和参数。 和 PHP 5.4 起开始使用的 E_ALL 是相同的。- php.net
E_STRICT 类型的错误是在 5.3.0 中被引入的，并没有被包含在 E_ALL 中。然而从 5.4.0 开始，它被包含在了 E_ALL 中。这意味着什么？这表示如果你想要在 5.3 中显示所有的错误信息，你需要使用 -1 或者 E_ALL | E_STRICT。
不同 PHP 版本下开启全部错误显示
•	\< 5.3 -1 或 E_ALL
•	  5.3 -1 或 E_ALL | E_STRICT
•	\> 5.3 -1 或 E_ALL




生产环境
为了在生产环境中隐藏错误显示，将你的 php.ini 进行如下配置：
display_errors = Off
display_startup_errors = Off
error_reporting = E_ALL
log_errors = On
当在生产环境中使用这个配置时，错误信息依旧会被照常存储在 web 服务器的错误日志中，唯一不同的是将不再显示给用户。更多关于设置的信息，请参考 PHP 手册：





Apache 和 PHP
PHP 和 Apache 有很长的合作历史。Apache 有很强的可配置性和大量的 扩展模块 。是共享主机中常见的Web服务器，完美支持各种 PHP 框架和开源应用(如 WordPress )。可惜的是，默认情况下，Apache 会比 nginx 消耗更多的资源，而且并发处理能力不强。
Apache 有多种方式运行 PHP，最常见的方式就是使用 mode_php5 的 prefork MPM 方式。但是它对内存的利用效率并不高，如果你不想深入服务器管理方面学习，那么这种简单的方式可能是你最好的选择。需要注意的事如果你使用 mod_php5，就必须使用 prefork MPM。
如果你追求高性能和高稳定性，可以为 Apache 选择与 nginx 类似的的 FPM 系统 worker MPM 或者 event MPM，它们分别使用 mod_fastcgi 和 mod_fcgid。这种方式可以更高效的利用内存，运行速度也更快，但是配置也相对复杂一些。





## 自动化工具

构建工具可以认为是一系列的脚本来完成应用部署的通用任务



## 虚拟化技术
在开发和线上阶段使用不同的系统运行环境的话, 经常会遇到各种各样的 BUG, 


Docker 为各种应用程序提供了 Linux 容器.

你可以安装 Docker 镜像, 如 MySQL 和 PostgreSQL 等, 并且不会污染到你的本地机器,




例子: 在 Docker 里面运行 PHP 应用
在你成功 安装 Docker 后, 你只需要一步就可以安装 Apache + PHP.
下面的命令, 会下载一个功能齐全的 Apache 和 最新版本的 PHP, 并会设置 WEB 目录 /path/to/your/php/files 运行在 http://localhost:8080:
docker run -d --name my-php-webserver -p 8080:80 -v /path/to/your/php/files:/var/www/html/ php:apache
在使用 docker run 命令以后, 如果你想停止, 或者再次开启容器的话, 只需要执行以下命令:
docker stop my-php-webserver
docker start my-php-webserver






## 缓存:


PHP 本身来说是非常快的，但是但你当发起远程连接、加载文件等操作时也会遇到瓶颈。 幸运的是，有各种各样的工具可以用来加速你应用程序某些耗时的部分，或者说减少某些耗时任务所需要运行的次数。


框架
许多的 PHP 开发者都使用框架，而不是重新造轮子来构建 Web 应用。框架抽象了许多底层常用的逻辑，并提供了有益又简便的方法來完成常见的任务。
你并不一定要在每个项目中都使用框架。有时候原生的 PHP 才是正确的选择，但如果你需要一个框架，那么有如下三种主要类型：
•	微型框架
•	全栈框架
•	组件框架
微型框架基本上是一个封装的路由，用来转发 HTTP 请求至一个闭包，控制器，或方法等等，尽可能地加快开发的速度，有时还会使用一些类库来帮助开发，例如一个基本的数据库封装等等。他們用来构建 HTTP 的服务卓有成效。
许多的框架会在微型框架上加入相当多的功能，我们则称之为全栈框架。这些框架通常会提供 ORMs ，身份认证扩展包等等。
组件框架是多个独立的类库所结合起来的。不同的组件框架可以一起使用在微型或是全栈框架上























[1]:	http://laravel-china.github.io/php-the-right-way/
[2]:	http://www.w3school.com.cn/php/php_looping.asp
[3]:	http://laravel-china.github.io/php-the-right-way/pages/The-Basics.html