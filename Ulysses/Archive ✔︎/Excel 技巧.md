## Excel 技巧

| A | B | C |
|:---:|:---:|:---:|
| 1 | 60 |
| 2 | 70 |
| 3 | 80 |
| 4 | 90 |
| 5 | 10 |
| 6 | 100 |


	IF(A3>1,1,0)
  
> 当 A3 单元格 的值大于1 就返回1 否则返回0

	IF(B1>75,IF(AND(B1>90),"优秀","良好"),"差")

> 如果  B1 大于 75 则继续执行第二个函数  判断 B1 是不是大于90. 
> B1≤75 差 ; 75\<B1\<90 良好; B1\>90 优秀 



#### LOOKUP  
功能: 一个表格 每人一行 每人都有 姓名 性别 手机 身份证 爱好
你知道某人的名字 要查他 身份证 .

查询一行或一列 并 查找另一行或列中的相同位置的值.

VLOOKUP   按行 查找 表/区域 中的内容
OFFICE 官网教程[https://support.office.com/zh-cn/article/VLOOKUP-函数-0bbc8083-26fe-4963-8ab8-93a18ad188a1?ui=zh-CN&rs=zh-CN&ad=CN][1]



HLOOKUP

功能:在表格首列查找指定的数据,  并返回查找出来的结果.

	语法: vlookup(lookup_value,table_array,col_index_num,range_lookup_)

语法解释:
	lookup_value : 要查找的值,可以是数值文本或者引用
必须位于表格的最左列

	Table_array : 用于查找数据的区域  上面的查找值 必须位于这个区域的最左列.  可以是单元格区域 或者区域名称.
	
	
	Row_index_num : table_array 中 待返回的匹配值的 行号.
	Col_index_num : table_array 中 待返回的匹配值的 列号.
	
	
	
	
	range_lookup : 逻辑值 , 函数返回结果 是精确匹配 还是近似匹配.
	True / 省略 :  近似匹配
	False : 精确匹配_ 



需在去做查找数据的数据表,需返回某列值的列号,逻辑值 True或者 False)
 


查找替换:

	要把 * 号 替换成 ×
	由于 * 是特殊的通配符    要在前面加 才能正常替换



删除多个 特定行:
查找 关键字
查找全部 
查找 框里面会列出所有的 关键字行   全选 ctrl a  
去表格上的高亮行 右键 删除 整行. 




合并单元格  =con???(A1,B1,C1)    合并数据.


对比数据: 可以查找重复项  实现对比.











[1]:	https://support.office.com/zh-cn/article/VLOOKUP-%E5%87%BD%E6%95%B0-0bbc8083-26fe-4963-8ab8-93a18ad188a1?ui=zh-CN&rs=zh-CN&ad=CN