

## iTerm2

开发必备.最强大终端.


在 Keys -\> Hotkey 中设置 command + option + i 在 Profiles -\> Default -\> Check silence bell

快速显示和隐藏 iTerm




⌘  数字 切换标签
⌘  方向键 切换标签

⌘  回车键 全屏
⌘  f 查找

⌘ d 垂直分屏幕 
⌘ shift d 水平分屏 
⌘ []() 分屏切换 
⌘ t 新建标签
⌘ w 关闭标签

⌘ ; 自动补全历史命令

⌘ shift h 剪切板历史




## 终端显示彩色目录列表

我们要在用户目录下()创建一个名为.bashprofile的文件，如果这个文件已经存在，我们直接编辑这个文件就可以了。
在文件中加入下面两行配置。 
export CLICOLOR=1 
export LSCOLORS=gxfxaxdxcxegedabagacad 
保存文件，重新运行“终端”，我们发现目录的颜色由蓝色变成了青色。 
 
 
 
那么应该怎样来配置成我喜欢的颜色呢？下面我们就来详细说一些这些配置。 
 
/.bashprofile是bash shell中当前登录用户的配置文件。bash是“终端”中默认的shell。 
 
alias ls=“ls -G”是给“ls -G”起了一个别名，当执行ls时，就相当于执行了ls -G。 
 
CLICOLOR是用来设置是否进行颜色的显示。CLI是Command Line Interface的缩写。 
 
LSCOLORS是用来设置当CLICOLOR被启用后，各种文件类型的颜色。LSCOLORS的值中每两个字母为一组，分别设置某个文件类型的文字颜色和背景颜色。LSCOLORS中一共11组颜色设置，按照先后顺序，分别对以下的文件类型进行设置： 
directory 
symbolic link 
socket 
pipe 
executable 
block special 
character special 
executable with setuid bit set 
executable with setgid bit set 
directory writable to others, with sticky bit 
directory writable to others, without sticky bit 
LSCOLORS中，字母代表的颜色如下： 
 
a 黑色 
b 红色 
c 绿色 
d 棕色 
e 蓝色 
f 洋红色 
g 青色 
h 浅灰色 
A 黑色粗体 
B 红色粗体 
C 绿色粗体 
D 棕色粗体 
E 蓝色粗体 
F 洋红色粗体 
G 青色粗体 
H 浅灰色粗体 
x 系统默认颜色 
所以，如果我们想把目录显示成红色，就可以把LSCOLORS设置为bxfxaxdxcxegedabagacad就可以了
 





















