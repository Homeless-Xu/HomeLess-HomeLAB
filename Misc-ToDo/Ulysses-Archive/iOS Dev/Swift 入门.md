## Swift 入门

变量
语法: var 变量名: 变量类型 值
var name: String = “swift”

常量
整个APP 这个值 不会改. 运行简单快速.
let x = 3.1415926


类型推到:
可以只写 变量值 不一定要写变量类型 它会自动推倒.


字符串:也就是文字.
带双引号的内容肯定是字符串.

字符:
for character in “Swift” { print(character) }  就会一行一个字母的打出来.
s
w
i
f
t

.

合并字符串  直接用 + 号.

let china = “中国”
let india = “印度”

let chinaindia = china + india   // 中国印度



复杂字符串

let a = 3, b = 5
需要屏幕实现 3 乘以 5 等于 15

let result = “\(a) 乘以 \(b)等于 \(a\*b)”

数组 
就是好几个 字符串 组成的组合,
let road = “/desktop/download”.pathroad
//desktop  download 
一次性 获得好几个值.

定义数组
数组是 类型化的集合   要么全是字符串 要么全是整形  不能混合.
var names = [“小红”,”小白”,”小敏”]()




循环

for var i = 1; i \<= 10; ++i {print(i)}



区间
 1..8 等于1234567.
for number in 1…8 {print(“\(number) 3等于 \(number\*3)”}
1…8 三个... 代表全闭区间就是 12345678 
结果
1 3 等于3
2 3 等于6
.
.
.
8 3 等于 24



字典:

定义字典

var dic = [”ant”:6, “snake”:0,”dog”:4][2]

for (animalName,legCount) in dic {
print(“一只\(animalName)\(legCount)条腿”)

}
输出
一只蚂蚁6条腿
一只小蛇0条腿
一只小狗4条腿

修改字典:
加一个蜘蛛进去
dic[“蜘蛛”]() = 222
修改蜘蛛 数据
dic[”蜘蛛”][4] = 8


取值
如果想查蝴蝶呢....

可能值? optionals 腿可以是0 但是不可能负数
 Int?  代表 要么就是整形 要么就是什么都没有 也就是 nil

if maybe == nil {print “没有章鱼的数据”}
else {
let legCount = maybe!
print(“一只章鱼\(legCount)条腿”)
}

简写:
查询一个可能值
if maybe {let legCount = maybe! 
print(“一只章鱼\(legCount)条腿”)
}

也等于
if let legCount = maybe {
print(“一只章鱼\(legCount)条腿”)
}


maybe 一定要是可能值的变量. 不能是寻常的变量.







改数组

var shoppingList = [”蛋”,”豆浆”][5]
显示第一个值
print(shoppingList[0][6])
加一个 啤酒进去
shoppingList += “啤酒”

加一个另外的数组进去
shoppingList += [”香蕉”,”苹果”,”橘子”][7]

修改第一个数据
shoppingList[0][8] = “两个蛋”

第三个到第五个 换成 黄瓜 葡萄
shoppingList 3…5 [”黄瓜”,”葡萄”][9]



改字典:




Switch legCount {
case 0:
print (“沙沙沙”)
case 1:
print (“跳跳跳”)
default:
print(“走走走”)

}

default 很重要 必须要写!  情况有很多种 万一你忘了一种 还没写 default 有可能系统崩溃.



switch 还能对 变量进行检查 
比如 能判断 你是 按了按钮 还是按下文本框 还是别的

switch sender {
case button:
print(“someone pressed the button”)

case usernameTextField:
print(“someone clicked the textlabel”)

default:
print(“something else”)

}






# 函数: Function

func sayhello () {
print(“ni hao”)
}

调用函数:
sayhello()
 


func sayhello(name: String) {
print (“\(name) 你好”)
}

sayhello(“xujian”)
结果: xujian 你好

默认参数

func sayhello(name: Sring = “路人甲”)
{ print(“\(name)” 你好!)
}

sayhello()



# 返回值: Returning Value

多返回值 

func refreshpage() -\> (Int, String) {
return (200, “Success”)
}

let (statusCode, message) = refreshpage
print(“Receive \(statusCode):\(message)”)


# 元组 Tuples
多个数据  合成一起 组成一个变量. 数据类型不一定要一样


# 闭包 Closures


# 类  Classes

class vehicle {
properties   属性
methods 方法

}








# 继承











# 初始化 class initialization

比如 默认自行车有两个轮子

class Bicycle: Vehicle {
int()


}



# 点语法 调用属性


let someVehicle = Vehicle()

print(someVehicle.description) 

[2]:	[]
[4]:	[]
[5]:	[]
[6]:	[0]
[7]:	[[%0A]
[8]:	[]
[9]:	[]