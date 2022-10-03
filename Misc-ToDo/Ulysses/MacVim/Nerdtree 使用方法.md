## Nerdtree 使用方法:** \> **需要 英文状态下使用.\*\*

*?*           帮助文档

**ma xx.txt** 新建 文件
**ma xx/**    新建  xx文件夹
**mm**        重命名文件 (修改文件名.不是直接输入新文件名)
**md**        删除文件!! 需要确认.

**R**          刷新选中目录 (更新文件之后 不会自动刷新的.) 
**shift + i**  隐藏文件开关.


- 方向键/hjkl  光标移动.
	> H J     目录最上/最下

	- 回车键 打开和收起目录.   或者直接vim中打开文件(覆盖当前窗口)

		*ctrl + w + w*   光标左右切换.  (文件/目录 切换用)
		 ctrl + w + h    光标到左侧的目录
		 ctrl + w + l    光标到右侧的文件
		 ctrl + w + r    目录列表左右切换   

		p 小写  上一级文件夹
		P 大写  用户目录/父目录

	**C** 大写 将选中的目录 / 文件的目录   设置为根目录 
	 也就是nerdtree 目录 只显示你选择的根目录.


	*F*   文件夹 or 文件夹+文件 




	 
	o :   目录下:单纯展开目录,相当于回车键
		  文件下:打开文件  光标定位到打开的文件中
	go:  目录下:窗口中新建水平小窗口  光标不定位过去 .
		  文件下:窗口中新建水平小窗口  光标不定位过去.
	 
	t   新tab   打开选中文件/选中的书签目录.    光标跳过去
	T   新tab   打开选中文件/选中的书签目录.    光标不跳过去
	 
	 
	i / gi   加水平窗口  打开文件/目录      光标 跳/不跳 
	s /gs       加垂直窗口  打开文件/目录  光标 跳/不跳 
	 
	 
	 
	* 显示nerdtree 文件系统菜单 esc退回.    node 节点的意思
		 
	\'' B 目录收藏书签??? 开关
	 
	 
	 
	 
	 
	 
	 
	:tabc  关闭当前tab
	:tabo  关闭其他tab
	 
	 
	cmd w  关闭当前tab
	cmd { } 前后tab
	 
	 
	 
	 
		!  执行当前文件 
		O 递归打开节点下 所有目录
		x合并父目录
		  X 递归 合并节点下所有目录
		   e   编辑当前dif?
		   D 删除当前书签   ???   
		   u 当前根节点的父目录 设为根目录  合拢原根节点
		  U                                                展开
		  r 递归刷新选中目录
		  cd 将cwd 设为选中目录
		   切换标签页:
		  :tabnew          指定文件新建tab




vim 启动的时候默认开启 NERDTree
`autocmd VimEnter * NERDTree`

> 不要自动开启的话 只要 注释掉这行就好. 用`”`




" 按下 F2 调出/隐藏 NERDTree
map  :silent! NERDTreeToggle

将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
`let NERDTreeWinPos="right"`

" 当打开 NERDTree 窗口时，自动显示 Bookmarks
`let NERDTreeShowBookmarks=1`








