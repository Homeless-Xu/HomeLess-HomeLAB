## Xcode 简介&教程&插件
# 简介
Xcode 是集成开发工具 (IDE) 开发 iOS 和 OS X 最快捷的方式.
APP 的 用户界面设计,编码 测试 调试 都能在 Xcode 里完成.
支持 C C++ Objective-C Java AppleScript Python Ruby Cocoa 等等

SDK 软件开发工具包 software development Kit
API 应用编程接口    Application Programming interface 
  操作系统 留给应用程序的一个 调用接口 
  应用程序 通过调用操作系统给它的 API 接口 使得操作系统去执行某个动作.
DLL 动态链接库 Dynamic Link Library 

 playground : 测试代码的地方!! 相当于草稿纸




# 模板
Xcode 优秀的 IDE 必定有很多模板可用. 就像 PPT 一样.

Master-Detail Application 
列表类型的模板. 类似 todo list

Page-Based Application
电子书阅读器模板. 可实现左右翻页,包括翻页动画.可以实现电子书 App

Single View Application
空白项目,使用的最多.

Tabbed Application
底部带导航栏.不同导航图标不同的页面. 类似微信







# xcode 必备技能,

快捷键 

常用代码片段 {} 下面的内容就是   自定义代码片段,
比如 if 片段.  格式都是差不多的  能一次性 就输入进去

 
# 快捷键:

⌘+N 新建文件.
⌘+⇧+N 新建项目.
⌘+O 打开
⌘+S 保存

⌘+R 运行

⌘+B 编译不运行





# 插件

- . 插件.模板.颜色配置管理软件. Alcatraz  官网  [http://alcatraz.io/][1]
	安装方法: 
	打开终端 复制代码运行.安装完成 重启 xcode
	curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh

	使用方法:
	打开 xcode 顶部菜单栏 → windows → package manage 
	搜索名称 点击install.

- 全能搜索专家 文件/文件夹/代码 CodePilot  快捷方式:cmd+shift+x 
- . 自动补全 
	FuzzyAutocomplete.

- . 高亮编辑行 backlight

- . 颜色显示插件 ColorSenseRainbow   显示颜色并直接改变颜色?

-  规范注释生成器  VVDocumenter

- XVim 插件

- 代码对齐插件  XAlign

- xcodecolors  给 xcode 控制台 添加颜色.

- 代码片段同步 github. ACCodeSnippetRepository

安装好后 xcode 的菜单栏目 多一个 Plug-ins 选项.
首先 configure 配置参数.
远程仓库地址:
先 git 上建立一个仓库  仓库地址复制下来 填写进去. 然后文件夹新




- 高亮 git 当前修改和上次提交的不同之处 gitdiff

- 自动补全图片名字. KSimageNamed
- 使用[UIImage imageNamed:@"xxx"]()时，该插件会扫描整个workspace中的图片文件。




- xcode dash 插件 OMQuickHelp

	1.  BBUDebuggerTuckAway-自动隐藏控制台

	2.  ClangFormat-格式化代码

	8.  Peckham-自动补全功能补充


	10. VVDocumenter-规范注释生成器  
		HOStringSense-大段文本利器

	12. XcodeBoost-辅助小功能插件

	13. XToDo-Xcode注释辅助插件






[1]:	http://alcatraz.io/
