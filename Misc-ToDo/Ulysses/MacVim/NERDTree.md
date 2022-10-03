


## NERDTree
 
*功能:* 方便目录操作.  
        列出当前路径的目录树，一般IDE都是有的。
方便浏览项目的总体的目录结构
方便创建删除重命名文件或文件名。

**MacVim 自动开启 NERDTree**
 .vimrc 添加(首行亲测有效):  
`autocmd VimEnter * NERDTree` 
 
**F3 快速调出和隐藏 NERDTree**
.vimrc 添加:  
`nmap <F3> :NERDTreeToggle <CR>`
 