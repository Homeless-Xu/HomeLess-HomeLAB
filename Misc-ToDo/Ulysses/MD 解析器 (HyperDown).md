
*.MD 最终目的: 解析成HTML. 用于网页浏览.*
> 用md 只是因为可以专注写作.
> (不用管html 那么多标签.)

*MD 兼容html语法.可在md文件中直接使用html标签.*

网页要直接显.md文件(带格式的) 就需要解析器.
*解析器推荐: [HyperDown][1]*




## HyperDown 使用:
有两个版本 php版本 / js版本. 效果完全一样.


和常规解析类库没任何区别:
$parser = new HyperDown\Parser;
$html = $parser->makeHtml($text); 


*hyperdown.js 示范:*
浏览器中使用:
<script src="yourpath/hyperdown/Parser.js"></script>
<script>
var parser = new HyperDown,
    html = parser.makeHtml(markdownText);   
</script>


单元测试:

npm test












静态网站: 一般都会用到 front-matter.



示例文件 example.md
1.	---
2.	title: Just hack'n
3.	description: Nothing to see here
4.	---
5.	
6.	This is some text about some stuff that happened sometime ago


解析代码
1.	var fs = require('fs')
2.	  , fm = require('front-matter')
3.	
4.	fs.readFile('./example.md', 'utf8', function(err, data){
5.	  if (err) throw err
6.	
7.	  var content = fm(data)
8.	
9.	  console.log(content)
10.	})



解析结果
1.	{
2.	    attributes: {
3.	        title: 'Just hack\'n',
4.	        description: 'Nothing to see here'
5.	    },
6.	    body: '\nThis is some text about some stuff that happened sometime ago',
7.	    frontmatter: 'title: Just hack\'n\ndescription: Nothing to see here'
8.	}
















实现: URL → 访问.md → 输出Html 格式.
要进过 解析. 还能支持高亮.





.md file in server.
by visit url show web-font page.

要经过解析的:
要么在支持 markdown 在网站上写文章.
要么用框架解析:
推荐: HyperDown (Github)

- 前端: remarkable.
	- 后端: Marded (node.js)
		php: michelf.
		markdown.js


还有 html to markdown 在工具:
作用是:把别人的网页内容抓取下来(只抓内容 不抓样式.然后放自己网页….  相当于rss. and 去广告…)



markdown  不能保持 元数据..为了能保持元数据. 几乎所有静态网站生成器都使用 front matter 格式.来保持文章.


相比markdown解析器来说，fornt-matter解析器要简单很多。
front matter虽然格式看起来不太统一，却是对markdown强有力的补充






*front matter 文件* (node.js开发)
   两部分:  头部和正文部分.
- 头部: 使用  yaml / toml / json 三种格式.
- 正文部分: 就是 .md内容.











*元数据.*
描述数据的数据.data that describes other data .

最大在好处是.它使信息的描述和分类可以实现格式化，从而为机器处理创造了可能。


比如: 人 
：年龄（三十岁上下）、身高（个子高挑）、相貌（身材匀称，黑黑的眉毛，红红的脸蛋）、性格（活跃，吵吵嚷嚷，不停地哼着小俄罗斯的抒情歌曲，高声大笑）。



照片: EXIF 信息

Image Description 图像描述、来源. 指生成图像的工具
Artist 作者 有些相机可以输入使用者的名字
Make 生产者 指产品生产厂家
Model 型号 指设备型号
Orientation方向 有的相机支持，有的不支持
XResolution/YResolution X/Y方向分辨率 本栏目已有专门条目解释此问题。
ResolutionUnit分辨率单位 一般为PPI
….



电影:
Cast and Crew（演职人员）、Company Credits（相关公司）、Basic Data（基本情况）、Plot & Quotes（情节和引语）、Fun Stuff（趣味信息）、Links to Other Sites（外部链接）、Box Office and Business（票房和商业开发）、Technical Info（技术信息）、Literature（书面内容）、Other Data（其他信息）。
//


[1]:	https://github.com/SegmentFault/HyperDown