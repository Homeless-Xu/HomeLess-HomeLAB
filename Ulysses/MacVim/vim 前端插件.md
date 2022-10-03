


不同文件类型的缩进
html 标签 匹配
注释添加移除

代码风格检查







*自定义 Tab 缩进*
vim 可以给每种文件 设置不同的缩进 和 tab 行为.
默认就支持的! 不需要额外的插件


`:set filetype`
查看当前文件类型.



比如 html:
> 如果是 JavaScript 文件  
> 对应建立 JavaScript.vim 文件写入相应的就行了

1. `cd ~`  
	go home directory
	2. `cd .vim`   
		正常应该 有这个文件夹的 不需要自己创建
	3. `mkdir after`   `cd after`
		.vim 目录下建立 after 文件夹  并进入
	4. `mkdir ftplugin`  `cd ftplugin`
		建立 ftplugin 文件夹 并进入
	5. `vi html.vim`
		`set ts=4
		``set sw=4
		``set expandtab autoindent
		`
		新建文件 . 并写入三行内容.

		1. ts 设置 Tab  大小.
			2. SW 设置 缩进 大小.
			3. expandtab  把所有 tab展开为空格
			4. autoindent 换行时 保持当前的缩进





*emment 自动补全插件*

安装方法:
Vundle 只需加上下面行 然后更新就行了.
1. ./vimrc 加入下面行
	`Plugin 'mattn/emmet-vim'`
	2. go vim and run 
		`BundleInstall`

		[emment Github 官网][1]
		[中文说明书][2]
		[][3]


	 *Usage Manual*
	vi index.html

	进入 插入模式

	输入 **html:5**
	按 **Ctrl+y** 再按**,**
	就 出现下面一大串了.
	<!DOCTYPE HTML>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <title></title>
	</head>
	<body>
	    _
	</body>
	</html>



默认是 所有文件类型 都支持这些扩展的
也可以 只在 html css 类型下生效:
只要在 .vimrc 文件加入:
`let g:useremmetinstallglobal = 0
``autocmd FileType html,css EmmetInstall
`

*换触发键*
默认是  ⌃+Y +,  可以改成 ⌃+Z +,
`let g:user_emmet_leader_key='<C-Z>'`

, 好是要的.




*自定义短语:*

具体看官网教程


常用 快捷键
⌃y／   注释。  
取消注释？？






更新图片大小（只适合本地图片）
光标移到 img 标签
⌃ y i


移除标签对
c＋y k




















*CSS 语法高亮：*

Plugin 'hail2u/vim-css3-syntax'  


*自动补全 后大括号*

delimitmate
Plugin 'Raimondi/delimitMate’


*YouCompleteMe*







Java 语法高亮
Plugin 'pangloss/vim-javascript'




js 自动补全 增强
`Plugin 'marijnh/tern_for_vim'`




良好的 编程习惯：
Plugin 'scrooloose/syntastic'


代码风格检查：

npm install -g jshint

































html css js 自动补全.




[1]:	https://github.com/mattn/emmet-vim
[2]:	https://www.zfanw.com/blog/zencoding-vim-tutorial-chinese.html
[3]:	[]