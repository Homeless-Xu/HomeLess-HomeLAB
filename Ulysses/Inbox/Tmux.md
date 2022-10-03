
终端 窗口管理软件。

[http://harttle.com/2015/11/06/tmux-startup.html][1]


安装：
osx
brew install tmux 




基本使用：
tmux new -s myname





全局搜索：

ctrlp

Plugin 'kien/ctrlp.vim'


C-j, C-k上下翻页，\<Enter\>打

有用的配置
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}







[1]:	http://harttle.com/2015/11/06/tmux-startup.html