
powerline


Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}






外加：
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8



然后在系统字体库中导入powerline font，如果是Mac的话可以使用Font Book来导入。 然后需要设置terminal（iTerm）的non-ASCII字体为PowerlineSymboles：


