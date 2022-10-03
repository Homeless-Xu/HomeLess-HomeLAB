Mac 提供的脚本言语. 简单易读.

*如何按键:*
在Mac系统中有个叫“System Events”的App，
AppleScript可以让它做按键或者点击鼠标的动作。
key down是按下某个按键不放，
key up是松开某个按键，
keystroke是点按一下某个按键。


自动按键例子
tell application "System Events"
repeat 50 times	
	keystroke return
end repeat
end tell





Tell 语句:

tell application "Finder"
display dialog "hello"
end tell

浏览器 就会弹出框. 显示 hello.

告诉 某个程序. 去干什么事情.








*字典:*
任何开发者 都需要保证自己的程序.对applescript有很好的支持.
也就是.开发者 必须有简单的说明.tell us 怎么通过applescript 与 他的程序进行通信.

open → open directort → double click one (mail) → details




重复显示 hello there 两次: km 运行applescript.
repeat 2 times
display dialog "Hello there!"
end repeat



tell application "TextEdit"
activate
end tell
//运行某个app


tell application "System Events"
tell process "TextEdit"
set frontmost to true
end tell
将文本编辑器设置为前台App，这样我们的键盘鼠标消息才可以发到“文本编辑器”的进程上去。




key down shift
keystroke "e"
delay 1
key up shift
keystroke "e"
keystroke return
end tell


key down是按下某个按键不放，
key up是松开某个按键，
keystroke是点按一下某个按键。

输入 e 
按回车




tell application "System Events"
tell process "xxx"
set frontmost to true
end tell
click at {100,200}
end tell
点击鼠标.



































































