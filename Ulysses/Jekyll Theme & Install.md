


*Jekyll 安装 分两种情况:*
- 空白文件夹 下建立 jekyll → 看jekyll 官网的快速指南.
- 非空文件夹 下建立 jekyll → 有内容的(比如别人的主题文件). 需要使用  `jekyll new . --force`


*3-jekyll 主题使用详细教程(Mac OS)*    [三栏经典主题连接!!!!!!][1]

1. clone 主题 到本地桌面. 文件夹名称: theme
2. 打开终端: `sudo gem install jekyll`  (可选:只需装一次 这个是全局的...) 
3. cd 进入 theme 文件夹.  `jekyll new . --force`
3. `bundle install`
5. `bundle exec jekyll serve`
6. 打开浏览器 http://localhost:4000  有内容就对了.
	 这个主题比较特别. 浏览器宽度足够才会自动展开左边的 栏目.


[1]:	https://github.com/P233/3-Jekyll