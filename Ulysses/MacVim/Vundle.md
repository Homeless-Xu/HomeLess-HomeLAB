
## Vundle
> 插件管理. 能自动更新插件,任意备份.   [官方Git 主页][1]

*install :*  

1. **install git (Required!!!!)**
	`brew install git`

	2. install Vundle  
		`sudo git clone https://github.com/gmarik/Vundle.vim.git /.vim/bundle/Vundle.vim`

	3. 打开/新建 `~/.vimrc`
		> Mac 默认是没有的,新建个 .vimrc 文件就行. 

	4. 复制别人的 vundle 配置代码 (最简单的方法.)到新建的配置文件.



		`set nocompatible                " be iMproved`
		`filetype off                    " required!`
		`set rtp+=~/.vim/bundle/vundle/`
		`call vundle#rc()`
		\`\`
		`" let Vundle manage Vundle`
		`Bundle 'gmarik/vundle'`

		`"my Bundle here:`
		`"`
		`" original repos on github`
		`Bundle 'kien/ctrlp.vim'`
		`Bundle 'sukima/xmledit'`
		`Bundle 'sjl/gundo.vim'`
		`Bundle 'jiangmiao/auto-pairs'`
		`Bundle 'klen/python-mode'`
		`Bundle 'Valloric/ListToggle'`
		`Bundle 'SirVer/ultisnips'`
		`Bundle 'Valloric/YouCompleteMe'`
		`Bundle 'scrooloose/syntastic'`
		`Bundle 't9md/vim-quickhl'`
		`" Bundle 'Lokaltog/vim-powerline'`
		`Bundle 'scrooloose/nerdcommenter'`
		`"..................................`
		`" vim-scripts repos`
		`Bundle 'YankRing.vim'`
		`Bundle 'vcscommand.vim'`
		`Bundle 'ShowPairs'`
		`Bundle 'SudoEdit.vim'`
		`Bundle 'EasyGrep'`
		`Bundle 'VOoM'`
		`Bundle 'VimIM'`
		`"..................................`
		`" non github repos`
		`" Bundle 'git://git.wincent.com/command-t.git'`
		`"......................................`
		`filetype plugin indent on`


		参考图:  ![]()



	**5. 重启 Macvim**
	> 每修改一次 .vimrc 都要重启macvim.


6. 打开 macvim





## Vundle 命令
|  操作   |  区分大小写  |  备注   |
|插件安装:|BundleInstall |配置文件加入插件代码 → vim运行命令 |
|插件删除:|BundleClean   |配置文件删除插件代码  → vim运行命令|
|插件更新 |BundleUpdate  |
|列出插件 |BundleList    |
|查找插件 |BundleSearch  |




## Conf macvim





## VIM 配置文件:
- vimrc 
- gvimrc
- exrc


vimrc: 最主要配置文件:
全局版本 global   → `/usr/share/vim/vimrc`
用户版本 personal → `~/.vimrc`
> Mac 默认是没有用户版本的.自己建一个!!!







## Vundle 插件形式:

 1. 官方移植的Vim Script,只需写脚本的名字，      Bu©ndle 'neocomplcache'
 2. Github 插件， 以作者/项目的形式    Bundle 'gmarik/vundle'  
	Git具体插件信息里面一般会有两行网址链接.一行是github.com 开始的  
	那行的最后 就是作者/和项目名了

 3. 指定一个完整的git repos地址        Bundle 'git://git.wincent.com/command-t.git'




bundle分为三类：

1.  在Github vim-scripts 用户下的repos,只需要写出repos名称
2.  在Github其他用户下的repos, 需要写出”用户名/repos名”
3.  不在Github上的插件，需要写出git全路径



[1]:	%20%20%20https://github.com/gmarik/Vundle.vim

