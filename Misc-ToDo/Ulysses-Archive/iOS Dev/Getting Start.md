## Getting Start
varia 
object
method


游戏设计.

做项目 .需要  To-do List

列出你认为你需要做的东西. 即使你不会 也要列出来.

第一步 列出你需要做的事情. 至于怎么解决,能不能解决 现在不重要.

第一步 就是 做什么 . 这个是没人能帮你想的.

把一个项目 . 分解成很多小问题 越详细越好. 再一个一个解决.




1.  屏幕上放一个按钮. 标签 Hit me
2. 按下按钮的时候,  计算结果 并显示.
3. 屏幕放一条横线. 1-100.
4. 给出一个随机数字.
5. 放一个 重新开始的 按钮,
6. 完善界面.




第一步.显示一个按钮  按下按钮 弹出提示: hello world.

运行 xcode.

选择. 创建一个新的 xcode project.

让你选择.一个模板.
 → single view application.

模板 有很多你需要用到的文件 都帮你预先设置好的. 方便使用. 建议多使用 确实很方便的.


Product Name 项目名字. eye
Language: Swift
Device: iPhone

三个小框 都打勾.





选择一个位置 放你新建的项目的 文件夹.

然后直接运行 就能 在 iphone 上看到一个空白的程序了. 虽然什么内容都没有 但是 框架已出.  迈出了第一步
按下 停止按钮 就是退出 app. 其实 没必要停止  运行的时候 也能进行修改代码的.

项目 → main.storyboard   控制视图的?? 控制一个视图 到另一个视图.



添加按钮. 找到 button 然后拖入空白界面 运行就能看到按钮了 双击进行编辑按钮显示名称.



然后 要按钮在按下的时候能显示内容,

项目 → viewcontroller.swift 



横屏应用.

main.storyboard → view controller → 右边第四书签? → orientation → landscape

问题: 横屏或者竖屏  只能有一个位置是对的
解决方法:


只支持横屏的话  去项目 → general → deployment info →  portrait 和 upside down 去钩

滑动的横条 有现成的   拖进去就好

按钮么  加进去就行.

感叹号  这个是常用的按钮.    attributes inspector → type → info light   就好了


滑动条 最大最小值 能自己设定的.  还能设置默认起点.

下一步  按下按钮的时候 读取 滑动条的值.

view.swift 文件 下 加几行参数
然后 按住 ctrl 拖动滑动条 到 view controller  进行关联.
然后运行.  然后手机拖动按钮  电脑上 就会出现一个 debug 区域, 实时显示你拖动的值.

printf() 函数 很有用的. 在你添加功能之前. 用这个在电脑上debug 区域 输出.到底手机在干什么.

然后是 警告框 上显示 滑动值.

必须把  slider’s 的值 给 showAlert()

由于输出的 精度很高. 这又是个游戏 只能让玩家去猜整数  不然是不可能成功的.

有些变量 不是全局变量 要另外声明的.
@IBOutlet weak var slider: UISlider!

给与一个,随机值  用随机函数来实现.



计算分数.
越近得分越高. 用减法, 目标值与实际值
问题来了   结果会有正负值. 怎么处理.
用 if else  
或者用 绝对值 这个最好了.

分数= 100 - 差值.


显示 好几次的总分. 并显示上去.

 

然后是 那个提醒框.
玩家 玩的非常好 提示 perfect  
很好 you almost had it  
不好 not even close …

当完全正确的适合 给与额外的100分 作为奖励. 差值=1 的 奖励50

时间控制.
在你 分数还显示的时候 进度条是不能恢复到居中的. 只能提示框消失 才开始新一轮游戏.

添加  关于 界面.
文件 新建. iOS source cocoa touch class next
class: 取名 abo utview controller
subcl of: uiviewcontroller

主界面 拖入一个 新界面.
然后横屏.
然后加入 按钮 和 文本框.
输入文字
注意点  文本框属性  editable 不能打钩 不然玩家也能修改内容了.

美化  图片用 png 格式.

asssets 文件夹  一次性导入 所要的全部照片.

⌘= 文本框自动适应文字大小.
可以一次性多选 标签 统一来调整边框大小.





# 第二遍看
I love you have 

重点是 重复看书.



