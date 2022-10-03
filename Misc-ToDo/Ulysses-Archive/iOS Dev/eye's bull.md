## eye's bull

实现功能.

1. 应用横屏(仅仅支持横屏)



2. 拖入各种控件(图标) 按钮 文本框 滑动条 感叹号图标. 什么的

3. 定义 会变的 按钮&文本框. 相当于取名.
@IBOutlet weak var radan: UILabel!
@IBOutlet weak var slider: UISlider!
@IBAction func hitme() {    }








4. 关联 按钮以及文本框. 就是 视图里的 按钮 要 对应代码里面的名字.
就是按钮 每个按钮 都对应一个按钮名字. 文本框也是. 分配名字.

5. 按钮 Ctrl 直接拖到 view controller
6. 文本框 → 检查器6 referencing outlets → 拖动 到 viewcontroller
	refference 引用的意思.

	  
7. about 页面设置.
 新建 cocoa touch class
class: 输入 文件名. ;下一步 → 下一步

然后  Main.storyboard 资源区 拖入一个 view controller

改横屏. 添加 文本框 控件.  text view.
注意: text view → 检查器4 → Behavior → editable 取消选择.这样玩家就不能编辑文字了.

按键关联新界面. ctrl 拖动 选 model




产生一个随机数?


8.  按下 hitme  弹出提示框