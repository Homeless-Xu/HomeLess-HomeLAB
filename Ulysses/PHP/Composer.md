## Composer

PHP 的一个依赖管理工具。
它允许你申明项目所依赖的代码库，它会在你的项目中为你安装他们。


*安装 Composer:*

局部安装 和 全局安装:


全局安装
你可以将此文件放在任何地方。如果你把它放在系统的 PATH 目录中，你就能在全局访问它。 在类Unix系统中，你甚至可以在使用时不加 php 前缀。
你可以执行这些命令让 composer 在你的系统中进行全局调用：
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
注意： 如果上诉命令因为权限执行失败， 请使用 sudo 再次尝试运行 mv 那行命令。
现在只需要运行 composer 命令就可以使用 Composer 而不需要输入 php composer.phar。


**全局安装 (OSX homebrew)
Composer 是 homebrew-php 项目的一部分。
1. brew update
	2. brew tap josegonzalez/homebrew-php
	3. brew tap homebrew/versions
	4. brew install php55-intl
	 5. brew install josegonzalez/php/composer


































