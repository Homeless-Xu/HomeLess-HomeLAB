
学习工具:  [PsySH][1] 

写php代码并运行 可以清楚的看到每次的返回值.

[Github 官网][2]

## install 

*use composer 安装 (推荐)
> 用composer 会自动帮你安装依赖项目!

1. `composer global require psy/psysh`

	安装完毕后，PsySH已经安装到/Users/{用户名}/.composer/vendor/psy/psysh目录下
	此时，你可以直接运行：
	`/Users/{用户名}/.composer/vendor/psy/psysh/bin/psysh`



	11. 为了使用方便，建议将它加入到环境变量：
		> or use keymaseator.
		`echo 'export PATH="/Users/{用户名}/.composer/vendor/psy/psysh/bin:$PATH"' >> ~/.bashrc`

		`source ~/.bashrc`





## use

输入: `$hello = ‘Hello’;`
输出: `“Hello”`













[1]:	http://psysh.org
[2]:	https://github.com/bobthecow/psysh