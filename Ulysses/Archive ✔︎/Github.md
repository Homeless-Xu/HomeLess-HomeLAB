## Github

*Function:*

1. 制作网页简历 [Link § ][1]
	> 需要star 那个项目.  会有提示的.

2. Gist  代码管理   [https://gist.github.com ][2]



3. 托管环境配置.
	vim  / tmux 等 配置文件

4. 储存代码.... 
5. 当图床.

用github 的pages 来托管js 或者css 文件.












**用法:**


1. *fork*  other’s project
> > 拷贝别人的整个项目到本地电脑.


2. 修改代码.... 然后提交....
























###### 版本控制工具 最佳写作平台






- 版本控制软件: 

	每次文件修改,一旦提交(commit),再 sync 之后. 就完全不用担心数据丢失了.

- 文件状态: 
	- modified 已修改,但没有保存; 
	- committed 已提交,且安全保存在本地数据库中;
	- sync: 才是把本地的 同步到Git网站.

- 安装方法: 图形化客户端(更新慢) / shell 终端(更新最快)


# 桌面软件: Github desktop
  
新建仓库 → Finder 中打开仓库文件夹 → 添加/修改文件 
Commit(提交修改, 全保存在本地数据库)  → 同步到Git网站.

删除仓库: Github 网站 → 仓库 →  设置 → 删除 

编辑文件: Ulysses 编辑 → guihub 客户端 → 先提交 commiter 再 push....

克隆仓库(完整下载别人的仓库…): 先安装本地客户端 → 去网页 → 选项目 → 克隆到本地. 


# Shell 用法: 未测.

 新建文件夹 → cd 新文件夹  → git init 来建立新的仓库

分支: brand
获取: fetch
合并: merge

# 储存大文件:   直接放文件夹 同步就可以了

经典教程 
1. [http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000][3]

2. [http://backlogtool.com/git-guide/cn/][4]



http://git-scm.com/book/zh 这书 必看. 
 

安装好之后, 就可以使用 命令行的git工具了 还有个图形界面的 git项目管理工具.
 
初次运行git前 的 配置. 也就是配置git工作环境.
 
第一个要配置的 就是你个人用户 名称 和电子邮件. 每次git提交都会用这两条信息,说明谁提交了更新, 永久纳入历史更新.
 
设置默认文件编辑器, 一般用 vim
 
查看已有的配置信息 git config --list 命令.
 
 
http://zuyunfei.com/2013/04/10/setup-github-ssh-key/ ssh 链接github教程
 
 

新建项目 教程 网页登录 http://www.jianshu.com/p/df7ce9f3a5cb  
建好之后 会自动跳转到 新建项目的主页 主页的右下角 有个clone in desktop
就是克隆到 本地电脑的意思 会自动打开本地电脑的github软件 你选一个要存储的文件夹 就好了.
 
再就是 添加代码 再上传 git add git push 的事情了
 
 
学习 config 命令 git help config
 
新建好项目后 电脑 用户名下 就有个 github 文件夹了
里面就有 你 克隆 下来的全部项目.
 
如果你要给某个开源项目出力 先把该项目的 git仓库复制一份出来
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  

[1]:	http://resume.github.io
[2]:	https://gist.github.com
[3]:	http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000
[4]:	http://backlogtool.com/git-guide/cn/