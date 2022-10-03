

Jekyll 使用了 \_config.yml 作为其配置文件，也就是说，在执行 Jekyll 编译命令时，Jekyll 会通过 \_config.yml 来加载相应的配置，并通过这些配置来生成相应的目录和文件。


例如我们使用的分页，jekyll-paginate 插件，会在项目的目录中生成 page{num} 目录，并在其中放置相应的 index.html 文件，这样一来，读者可以通过 woaitqs.cc/page2 访问到第二页的内容。





*图床技巧.*

七牛吧.
mac  有图床工具.  拖拽图片 通过七牛的插件. 可以一键上传图片. 上传完成后  点击弹出的通知 即可复制图片的外链.






*创建文件*
config.yml
`baseurl: /jekyll_demo`

目录结构变成：
　　/jekyll\_demo
　　　　|--　\_config.yml

_layouts目录，用于存放模板文件。_

进入该目录，创建一个default.html文件，作为Blog的默认模板。并在该文件中填入以下内容。

\<!DOCTYPE html\>
　　<html>
　　<head>
　　　　<meta http-equiv="content-type" content="text/html; charset=utf-8" />
　　　　<title>{{ page.title }}</title>
　　</head>
　　<body>

　　　　{{ content }}

　　</body>
　　</html>

Jekyll使用Liquid模板语言，{{ page.title }}表示文章标题，{{ content }}表示文章内容，更多模板变量请参考官方文档。


目录结构变成：
　　/jekyll\_demo  
　　　　|-- \_config.yml  
　　　　|--　\_layouts  
　　　　|　　　|--　default.html


创建文章
回到项目根目录，创建一个\_posts目录，用于存放blog文章。
　　$ mkdir \_posts

进入该目录，创建第一篇文章。文章就是普通的文本文件，文件名假定为2012-08-25-hello-world.html。(注意，文件名必须为"年-月-日-文章标题.后缀名"的格式。如果网页代码采用html格式，后缀名为html；如果采用markdown格式，后缀名为md。）


在该文件中，填入以下内容：（注意，行首不能有空格）
　　---
　　layout: default
　　title: 你好，世界
　　---
　　\<h2\>{{ page.title }}\</h2\>
　　\<p\>我的第一篇文章\</p\>
　　\<p\>{{ page.date | date\_to\_string }}\</p\>


每篇文章的头部，必须有一个yaml文件头，用来设置一些元数据。它用三根短划线"---"，标记开始和结束，里面每一行设置一种元数据。"layout:default"，表示该文章的模板使用\_layouts目录下的default.html文件；"title: 你好，世界"，表示该文章的标题是"你好，世界"，如果不设置这个值，默认使用嵌入文件名的标题，即"hello world"。
在yaml文件头后面，就是文章的正式内容，里面可以使用模板变量。{{ page.title }}就是文件头中设置的"你好，世界"，{{ page.date }}则是嵌入文件名的日期（也可以在文件头重新定义date变量），"| date\_to\_string"表示将page.date变量转化成人类可读的格式。


/jekyll\_demo
　　　　|--　\_config.yml
　　　　|--　\_layouts
　　　　|　　　|--　default.html 
　　　　|--　\_posts
　　　　|　　　|--　2012-08-25-hello-world.html



第五步，创建首页。

有了文章以后，还需要有一个首页。
回到根目录，创建一个index.html文件，填入以下内容。


---
　　layout: default
　　title: 我的Blog
　　---
　　<h2>{{ page.title }}</h2>
　　<p>最新文章</p>
　　<ul>
　　　　{% for post in site.posts %}
　　　　　　<li>{{ post.date | date\_to\_string }} <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></li>
　　　　{% endfor %}
　　</ul>


它的Yaml文件头表示，首页使用default模板，标题为"我的Blog"。然后，首页使用了{% for post in site.posts %}，表示对所有帖子进行一个遍历。这里要注意的是，Liquid模板语言规定，输出内容使用两层大括号，单纯的命令使用一层大括号。至于{{site.baseurl}}就是\_config.yml中设置的baseurl变量。\_



目录结构变成：
　　/jekyll\_demo  
　　　　|-- \_config.yml  
　　　　|--　\_layouts  
　　　　|　　　|--　default.html  
　　　　|-- \_posts  
　　　　|　　　|--　2012-08-25-hello-world.html  
　　　　|--　index.html


第六步，发布内容。
现在，这个简单的Blog就可以发布了。先把所有内容加入本地git库。
　　$ git add .
　　$ git commit -m "first post"
然后，前往github的网站，在网站上创建一个名为jekyll\_demo的库。接着，再将本地内容推送到github上你刚创建的库。注意，下面命令中的username，要替换成你的username。
　　$ git remote add origin https://github.com/username/jekyll\_demo.git
　　$ git push origin gh-pages
上传成功之后，等10分钟左右，访问http://username.github.com/jekyll\_demo/就可以看到Blog已经生成了（将username换成你的用户名）。


第七步，绑定域名。
如果你不想用http://username.github.com/jekyll\_demo/这个域名，可以换成自己的域名。
具体方法是在repo的根目录下面，新建一个名为CNAME的文本文件，里面写入你要绑定的域名，比如example.com或者xxx.example.com。
如果绑定的是顶级域名，则DNS要新建一条A记录，指向204.232.175.78。如果绑定的是二级域名，则DNS要新建一条CNAME记录，指向username.github.com（请将username换成你的用户名）。此外，别忘了将\_config.yml文件中的baseurl改成根目录"/"。
至此，最简单的Blog就算搭建完成了。进一步的完善，请参考Jekyll创始人的示例库，以及其他用Jekyll搭建的blog。












*目录结构简介:*

index.html 首页
about.md
CNAME     github上做域名绑定的
config.yml jekyll配置文件
feed.xml
gemfile
gemfile.lock
favicon.ico 网站小图标.





Posts Folder  存放博客.
Image Folder 
js Folder
Site  Folder
CSS Folder   存放CSS
layouts Folder  存放模板

includes Folder 固定的 html 代码段.
在模板中可以用 liquid 标签引入.
常用来在各个模板中复用如 导航条、标签栏、侧边栏 之类的在每个页面上都一样不变的内容




*最主要的就是 config.yml*
> 如果没有太多的额外需求，只需要设定两个参数就行了，一个是编码的字符集，一个是项目的路径.
baseurl: /





*流程*
读取下面内容到内存
\_posts及文件夹下的所有文章，将其参数和文章内容组织保存在内存中，所有的文章的内容、参数都在site.posts对象（其他文件夹下的文章不会放入site.posts中）
	_layouts文件夹下的所有模板
	_includes文件夹下的所有需要被引入的内容
	
	
	然后根据每一篇需要编译的文章选择的其参数定义的模板来创建一个模板，并将当前文章的内容、参数等进行扩展后放在page对象、content对象中，然后进行模板的编译，生成html文件，并按照一定规则放在_site文件夹下。也就是说在创建一篇文章时，其实所有文章的内容都已经被读取出来了，这也为文章相互之间的关联提供了可能_








*头信息 *
> 只要文件中有 YAML 头信息，它们就会从源格式转化成 HTML 页面，从而成为 你的静态网站的一部分。
> 这两行的三虚线之间,可以设置一些预定义的变量
---
layout: post
title:  "Welcome to Jekyll!"
date:   2014-01-27 21:57:11
categories: jekyll update
encoding: utf-8
---

定义了文章的参数.
`Title` 文章的标题. 
不管文件名是什么.文章标题都按照这个为准.
`date` 文章日期.

`categories` 文章所属目录.

`layout` 文章使用的模板名称.也就是layout 中模板的文件名 (去掉.html)
`tags` 文章的标签.


最简单的文章:
---
layout: mylayout
title: hello-jekyll
---

Hello jekyll!


将这个写完的文章保存为 “年-月-日-标题.markdown”的名字形式

这里就保存成2014-01-27-hello.markdown

*文章的文件名不要使用中文，否则会出现bug*
实际显示的名称可以md 下面的 title 定义.




*主页:*

---
layout: mylayout
title: Hello Jekyll!
---
<ul class="posts">
{% for post in site.posts %}
  <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>









*创建模板*


模板的有这么两句
{{ page.title }}
{{ content }}，
分别是文章标题 和 文章内容的 占位符.


自定义模板:
\<!DOCTYPE html\>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>test</title>
	</head>
	<body>
	      {{ page.title }}
	      {{ page.date }}
	      {{ content }}
	</body>
</html>

第一行是标题，然后是博文时间（在文件名中定义），然后是博文内容 这样一个简单的模板就创建好了

















\---- - 添加文章


md文件 改下名字(时间+文件名.md) 放在 psot 文件夹下.
刷新网页 就出来了...


*一篇文章 就是一个文件*
所有文件 都要放到 posts文件夹内
对文件名也有特殊的要求.

使用 markdown 写之前
(要先设置头信息.(两行三虚线之间)
头信息 可以设置 全局变量的值.
jekyll 会根据变量的值 来生成页面.


layout使用指定的模版文件，不加扩展名。模版文件放在\_layouts目录下。
title文章的标题。
date发布文章的时间。
categories将文章设置成不同的属性。系统在生成页面时会根据多个属性值来生成文章地址。以上设置会生http://.../jekyll/update/...格式的文章链接。
tags标签，一篇文章可以设置多个标签，使用空格分割。
基本上一篇文章只要用到以上一些信息就可以了，



*图片等等*
Jekyll是支持图片和其它资源文件的，但本人在此强烈建议所有的文件资源全都通过外链的方式解决，毕竟GitHub主要还是用来管理源代码不适合存放资源文件。如果只是需要简单的图床的话直接使用weibo的私人相册的功能即可就是管理起来不太方便。当然其实最好还是使用像某牛云存储之类的云存储服务，访问量不大的话免费账户基本能满足要求了，管理资源文件也很方便（感觉有点做广告的嫌疑-_-!）。本blog的所有图片就部署在上面，资源的访问速度也很快。_




*加入评论功能*
ekyll虽然生成的是静态页面，但是我们不通过写代码和数据库支持也能为期加入评论功能。Disqus就是一款社会化的评论系统，我们只要将Disqus生成的一段代码加入到Jekyll模版文件内即能实现网站的评论功能。




*3.加入Google Analytics*

最后我们再来为我们的网站加上Google Analytics用来统计网站访问情况。登录Google Analytics后创建一个新的站点后，会生成一个唯一的站点内嵌代码，我们将这段代码拷贝下来后复制到\_layouts文件夹下default.html文件内的\</body\>标签之上即可。








*任何不以下划线开头的文件和目录都会被复制到生成的网站。*

建一个名为\_layouts的目录。注意这个下划线，任何以下划线开头的文件和目录都不会成为网站的一部分。如果它们的名字Jekyll能够识别的话（比如\_config.yml或者\_layouts），它们的内容会被用于生成网站，但是它们的文件不会出现在网站目录下。记住这一点：任何不以下划线开头的文件和目录都会被复制到生成的网站（默认为\_site子目录）。



我们可以用两种Liquid标记语言：
输出标记（output markup）
标签标记 (tag markup)。
输出标记会输出文本（如果被引用的变量存在），而标签标记不会。
输出标记是用双花括号分隔，
而标签标记是用花括号-百分号对分隔。




*CSS 文件*
在你的项目根目录下创建一个CSS目录，然后把下面的代码写进styles.css文件：


新建页面  index.html

---
layout: default
---
<section role="banner">
  <img src="/img/banner.jpg" />
</section>

<section class="content">
  <p>
  Welcome to John Doe Photography! Please, check out my <a href="/portfolio/">Portfolio</a> to see my work.
  </p>
</section>

有yaml 头 的任何文件.
都会被 jekyll 处理后才放进 site目录.
如果没有 yaml头.会被直接放进 site 目录.

上面那个头告诉.jekyll 要用什么模板.




** • source: 如果源文件目录不是运行Jekyll的目录，你就要用source选项来设置源文件目录。**











## 基本用法:


$ jekyll build
# =\> 当前文件夹中的内容将会生成到 ./\_site 文件夹中。


$ jekyll build --destination \<destination\>
# =\> 当前文件夹中的内容将会生成到目标文件夹\<destination\>中。

$ jekyll build --source \<source\> --destination \<destination\>
# =\> 指定源文件夹\<source\>中的内容将会生成到目标文件夹\<destination\>中。

$ jekyll build --watch
# =\> 当前文件夹中的内容将会生成到 ./\_site 文件夹中，
# 查看改变，并且自动再生成。






\_config.yml 管理包含全局配置和变量定义在内的配置文件 并且这些变量定义在执行时会被读取. 所有 \_config.yml 中的改动 在自动构建过程中，都不会被加载直到下一次执行开始。




*Destination 文件夹会在站点建立时被清理*
<destination> 的内容默认在站点建立时会被自动清理。不是你创建的文件和文件夹会被删除。你想在 <destination> 保留的文件和文件夹应在 \<keep\_files\> 里指定。
不要把<destination> 设置到重要的路径上，而应该把它作为一个暂存区域,从那里复制文件到您的web服务器。





Jekyll 同时也集成了一个开发用的服务器，可以让你使用浏览器在本地进行预览。

$ jekyll serve
# =\> 一个开发服务器将会运行在 http://localhost:4000/
# Auto-regeneration（自动再生成文件）: 开启。使用 `--no-watch` 来关闭。

$ jekyll serve --detach
# =\> 功能和`jekyll serve`命令相同，但是会脱离终端在后台运行。
# 如果你想关闭服务器，可以使用`kill -9 1234`命令，"1234" 是进程号（PID）。
# 如果你找不到进程号，那么就用`ps aux | grep jekyll`命令来查看，然后关闭服务器。[更多][1].




如果你希望把 jekyll 安装到当前目录，你可以运行 jekyll new . 来代替。
如果当前目录非空，你还需要增添 --force 参数，所以命令应为 jekyll new . --force。








*目录结构:*
*jekyll 核心 是 文本转换引擎.*
概念: 用你最喜欢的方式来写文章.
可以是  markdown / textile / html 
然后jekyll帮你套入 一个/多个 布局中.
你可以设置 url 路径.
文本显示样式..... 
最终生成的静态页面  就是你的成品了.

基本目录结构:

.
├── \_config.yml
├── \_drafts
|   ├── begin-with-the-crazy-ideas.textile
|   └── on-simplicity-in-technology.markdown
├── \_includes
|   ├── footer.html
|   └── header.html
├── \_layouts
|   ├── default.html
|   └── post.html
├── \_posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.textile
|   └── 2009-04-26-barcamp-boston-4-roundup.textile
├── \_site
├── .jekyll-metadata
└── index.html



config.yml
保存配置数据.

drafts
未发布的文章 也就是草稿

includes
方便重复使用?
可以用这个标签 {% include file.ext %} 来把文件 _includes/file.ext 包含进来。_


layout
文章的模板.
布局可以在 YAML 头信息中根据不同文章进行选择。 这将在下一个部分进行介绍。标签  {{ content }} 可以将content插入页面中。


posts
你的文章. 文件格式很重要.
必须要符合:YEAR-MONTH-DAY-title.MARKUP。 永久链接 可以在文章中自己定制，但是数据和标记语言都是根据文件名来确定的


data
格式化好的网站数据应放在这里。jekyll 的引擎会自动加载在该目录下所有的 yaml 文件（后缀是 .yml, .yaml, .json 或者 .csv ）。这些文件可以经由 ｀site.data｀ 访问。如果有一个 members.yml 文件在该目录下，你就可以通过 site.data.members 获取该文件的内容。



site
一旦 Jekyll 完成转换，就会将生成的页面放在这里（默认）。最好将这个目录放进你的 .gitignore 文件中。


jekyll-metadata
该文件帮助 Jekyll 跟踪哪些文件从上次建立站点开始到现在没有被修改，哪些文件需要在下一次站点建立时重新生成。该文件不会被包含在生成的站点中。将它加入到你的 .gitignore 文件可能是一个好注意。


index.html and other HTML, Markdown, Textile files

如果这些文件中包含 YAML 头信息 部分，Jekyll 就会自动将它们进行转换。当然，其他的如 .html, .markdown, .md, 或者 .textile 等在你的站点根目录下或者不是以上提到的目录中的文件也会被转换。



Other Files/Folders
其他一些未被提及的目录和文件如  css 还有 images 文件夹，  favicon.ico 等文件都将被完全拷贝到生成的 site 中。




配置:
你可以很轻松的设计你的网站.因为有强大灵活的配置功能

既可以配置在网站根目录下的  config.yml 文件，
也可以作为命令行的标记来配置。


全局配置:




*头信息*

任何只要包含 YAML 头信息的文件在 Jekyll 中都能被当做一个特殊的文件来处理。头信息必须在文件的开始部分，并且需要按照 YAML 的格式写在两行三虚线之间。下面是一个基本的例子：

---
layout: post
title: Blogging Like a Hacker
---





创建文章的文件:

发表一篇新文章，你所需要做的就是在 
posts 文件夹中创建一个新的文件。文件名的命名非常重要。Jekyll 要求一篇文章的文件名遵循下面的格式：\_ 
年-月-日-标题.MARKUP


年是 4 位数字，月和日都是 2 位数字。MARKUP扩展名代表了这篇文章是用什么格式写的。下面是一些合法的文件名的例子

2011-12-31-new-years-eve-is-awesome.md
2012-09-12-how-to-write-a-blog.textile




内容格式:
所有博客文章顶部必须有一段 YAML 头信息(YAML front- matter)。在它下面，就可以选择你喜欢的格式来写文章。 





*图片/其他资源.*
常用做法:
目录下 创建一个文件夹. 
assets 或者 downloads，将图片文件，下载文件或者其它的资源放到这个文件夹下。然后在任何一篇文章中，它们都可以用站点的根目录来进行引用。这和你站点的域名/二级域名和目录的设置相关，下面有一些例子（Markdown 格式）来演示怎样利用 site.url 变量来解决这个问题。


… 从下面的截图可以看到：
![有帮助的截图]()({{ site.url }}/assets/screenshot.jpg)


… 你可以直接 [下载 PDF]()({{ site.url }}/assets/mydoc.pdf).








*文章目录*
所有文章都在一个目录中是没问题的.
但是如果你不将文章列表列出来博客文章是不会被人看到。在另一个页面上创建文章的列表（或者使用模版）是很简单的。感谢 Liquid 模版语言和它的标记，下面是如何创建文章列表的简单例子：


\<ul\>
  {% for post in site.posts %}
\<li\>
  \<a href="{{ post.url }}"\>{{ post.title }}\</a\>
\</li\>
  {% endfor %}
\</ul\>

当然，你可以完全控制怎样（在哪里）显示你的文章，如何管理你的站点。如果你想了解更多你需要读一下 Jekyll 的模版是怎样工作的这篇文章。



*文章摘要*

Jekyll 会自动取每篇文章从开头到第一次出现 excerpt\_separator 的地方作为文章的摘要，并将此内容保存到变量 post.excerpt 中。拿上面生成文章列表的例子，你可能想在每个标题下给出文章内容的提示，你可以在每篇文章的第一段加上如下的代码：\_

\<ul\>
  {% for post in site.posts %}
\<li\>
  \<a href="{{ post.url }}"\>{{ post.title }}\</a\>
  \<p\>{{ post.excerpt }}\</p\>
\</li\>
  {% endfor %}
\</ul\>


由于 Jekyll 会提取第一段的内容，你没有必要将摘要包裹在 p 标签中，它已经为你做了这项工作。如果你希望移除它们可以使用如下的代码：

{{ post.excerpt | remove: '\<p\>' | remove: '\</p\>' }}


如果你不喜欢自动生成摘要，你可以在文章的 YAML 头信息中增加 excerpt 来覆盖它。另外，你也可以选择在文章中自定义一个 excerpt\_separator:

---
excerpt\_separator: \<!--more--\>
---

Excerpt
\<!--more--\>
Out-of-excerpt


你也可以在 \_config.yml 中全局声明 excerpt\_separator。
完全禁止掉可以将 excerpt\_separator 设置成 ""。



*高亮代码片段*
自带语法高亮.
可以选择 Pygments / Rouge 之一.

{% highlight ruby %}
def show
  @widget = Widget(params[:id])
  respond\_to do |format|
format.html # show.html.erb
format.json { render json: @widget }
  end
end
{% endhighlight %}

就能看到彩色的语法高亮了.



*显示行数:*
你可以在代码片段中增加关键字 linenos 来显示行数。这样完整的高亮开始标记将会是: {% highlight ruby linenos %}。




下面就可以开始第一篇文章啦.



草稿 没有日期的文章.
要使用草稿.你需要 在网站根目录 创建一个`_drafts`的文件夹.
并创建第一份草稿 a-draft-post.md

为了预览你拥有草稿的网站，运行带有 --drafts 配置选项的 jekyll serve 或者 jekyll build。此两种方法皆会将该草稿的修改时间赋值给草稿文章，作为其发布日期，所以你将看到当前编辑的草稿文章作为最新文章被生成。





*创建页面. *


网站根目录下的 index.html 就是jekyll主页.

站点上任何 HTML 文件，包括主页，都可以使用 layout 和 include 中的内容作为公用的内容，如页面的 header 和 footer. 将合适的部分抽出放到布局中。


*其他页面的位置*
将 HTML 文件或者 Markdown 放在哪里取决于你想让它们如何工作。


• 将为页面准备的命名好的 HTML 文件或者 Markdown 文件放在站点的根目录下。
• 在站点的根目录下为每一个页面创建一个文件夹，并把 index.html 文件或者 index.md 放在每个文件夹里。





*命名html文件.*
增加新页面最简单方法:
给html文件起一个合适的名字 并放到根目录下.

主页 homepage
关于页 about
联系页 contact




*静态文件*
不包含任何 yaml 头信息. 如 图片/pdf 这些不必渲染的内容.



*常用变量*




*集合*



*数据文件*


资源 支持sass
Sass / Scss






*永久链接*
你可以通过 Configuration 或 YAML 头信息 为每篇文章设置永久链接。你可以随心所欲地选择内建链接格式，或者自定义链接格式。默认配置为 date。



永久链接的模板用以冒号为前缀的关键词标记动态内容，比如 date 代表 /:categories/:year/:month/:day/:title.html。







*分页功能*

分页功能只支持 HTML 文件
Jekyll 的分页功能不支持 Jekyll site 中的 Markdown 或 Textile 文件。分页功能从名为 index.html 的 HTML 文件中被调用时，才能工作。分页功能是可选的，可能通过 paginate\_path 配置的值，驻留和生成在子目录中。




开启分页功能很简单，只需要在 \_config.yml 里边加一行，指明每页该展示多少项目：

paginate: 5






*插件*
Github pages 是由 jekyll 提供技术支持的.
考虑到安全因素，所有的 Pages 通过 --safe 选项禁用了插件功能，因此如果你的网站部署在 Github Pages ，那么你的插件不会工作。

不过仍然有办法发布到 GitHub Pages，你只需在本地做一些转换，并把生成好的文件上传到 Github 替代 Jekyll 就可以了。



*安装插件*
在网站根下目录建立 _plugins 文件夹，插件放在这里即可。 Jekyll 运行之前，会加载此目录下所有以 *.rb 结尾的文件。*_




*转换器*
如果想使用一个新的标记语言，可以用你自己的转换器实现，Markdown 和 Textile 就是这样实现的。



*主题*
。Jekyll 主题打包了布局文件、包含文件及样式表。同时您也可以使用自己站点的内容去覆盖它们的默认内容。





安装主题Permalink

若要安装一套主题，请先将该主题添加到您站点的 Gemfile 中：

 gem 'my-awesome-jekyll-theme'
保存并应用 Gemfile 中相关的文件变化。
执行命令行 bundle install 来安装主题。
最后, 向您站点的 \_config.yml 中加入下列代码来启用主题：

 theme: my-awesome-jekyll-theme






**Github Pages**
Github Pages 是面向用户、组织和项目开放的公共静态页面搭建托管服 务，站点可以被免费托管在 Github 上，你可以选择使用 Github Pages 默 认提供的域名 github.io 或者自定义域名来发布站点。Github Pages 支持 自动利用 Jekyll 生成站点，也同样支持纯 HTML 文档，将你的 Jekyll 站 点托管在 Github Pages 上是一个不错的选择。



使用 Jekyll 
只要遵循 jekyll 的目录结构就好了.
因为 github pages 就是用jekyll 搭建的.



1. 创建 .gitignore 文件.
	内容是 `_site/`

 This file tells Git to ignore the _site directory that Jekyll automatically generates each time you commit. Because this directory and all the files inside are written each time you commit, you do not want this directory under version control._



2. create `_config.yml` file

	name: Hank Quinlan, Horrible Cop
	markdown: kramdown


that tells Jekyll some basics about your project. In this example, we're telling Jekyll the name of our site and what version of Markdown we'd like to use:




3.  create `_layouts` folder
inside it create `default.html` file


This is our main layout that will contain repeated elements like our \<head\> and\<footer\>. Now we won't have to repeat that markup on every single page we create, making maintenance of our site much easier. So let's move those elements from index.html into default.html to get something that looks like this in the end:



\<!DOCTYPE html\>
	<html>
	    <head>
	        <title>{{ page.title }}</title>
	        <!-- link to main stylesheet -->
	        <link rel="stylesheet" type="text/css" href="/css/main.css">
	    </head>
	    <body>
	        <nav>
	            <ul>
	                <li><a href="/">Home</a></li>
	                <li><a href="/about">About</a></li>
	                <li><a href="/cv">CV</a></li>
	                <li><a href="/blog">Blog</a></li>
	            </ul>
	        </nav>
	        <div class="container">
	
	        {{ content }}
	
	        </div><!-- /.container -->
	        <footer>
	            <ul>
	                <li><a href="mailto:hankquinlanhub@gmail.com">email</a></li>
	                <li><a href="https://github.com/hankquinlan">github.com/hankquinlan</a></li>
	            </ul>
	        </footer>
	    </body>
	</html>

Take note of the {{ page.title }} and {{ content }} tags in there. They're what Jekyll calls liquid tags, and these are used to inject content into the final web page. More on this in a bit.



3. Now update your index.html to use your default layout.
  Replace the entire contents of that file with this:


---
layout: default
title: Hank Quinlan, Horrible Cop
---
<div class="blurb">
<h1>Hi there, I'm Hank Quinlan!</h1>
<p>I'm best known as the horrible cop from <em>A Touch of Evil</em> Don't trust me. <a href="/about">Read more about my life...</a></p>
</div><!-- /.blurb -->







Create a blog directory and create a file named index.html inside it. To list each post, we'll use a foreach loop to create an unordered list of our blog posts:





Github 风格 Markdown 并不适用于较长的文章
注意 Github 风格 Markdown 是为方便评论和报告bug而创造的，并不适用于一个网站或blog。




*部署方法*
静态网站 不需要什么数据库.部署很方便.
只要文件上传上去就可以了.

















\@: jekyll 配置文件

config.yml

*配置文件中，不允许有Tab，否则配置文件不能生效。*

**全局配置**

site source       source: DIR
网站源文件根目录

Site Destination    destination: DIR
生成网站的目录地址

Safe    safe: BOOL
是否使用自定义插件

Exclude     exclude: [DIR, FILE, ...]()
排除目录或者文件

Include    include: [DIR, FILE, ...]()
包含的目录或者文件



Time Zone   timezone: TIMEZONE
设置时区





**编译的命令选项**

Regeneration     -w, --watch
文件被修改时，启动自动生成

Configuration   --config FILE
指定一个配置文件，可以覆盖 `_config.yml`


Drafts      --drafts
处理和渲染草稿文章


Future    future: BOOL--future
发布未来的文章

LSI    lsi: BOOL   --lsi
发布相关的文章

Limit Posts    limit\_posts: NUM   --limit\_posts NUM
限制文章发布的数量




*服务器 命令选项*
Local Server Port     port: PORT  --port PORT
本地服务器启动的端口号

Local Server Hostname  host: HOSTNAME  --host HOSTNAME
服务器名称

Base URL  baseurl: URL  --baseurl URL
基础链接





只要把 文章放到 post目录.然后 jekyll build.
就会被复制到 site里面. 会按照日期给你分类文章.


明白了目录结构之后，我们在通过 git 提交博客到服务器的时候，就可以通过.gitignore来过滤掉\_site目录，而在服务器端再执行命令生成。\_





*常用变量*
通过这些变量，可以输出文章的标题、内容、链接等等。


*全局变量*

site
通过 \_config.xml 来设置整个站点的信息和全局配置。
page
设置页面信息和自定义的变量。
content
展示文章或者页面的内容。
paginator
当配置文件中设置了 paginator 的时候，这里可以读取分页的信息。




*站点变量*
site.time   当你运行jekyll时候的时间。
site.pages  当前的页面列表。
site.posts  倒序列出所有的文章。
site.related\_posts  相关的文章。
默认配置下最多 10 篇相关文章。
site.categories.CATEGORY    某一个分类的文章列表。
site.tags.TAG   某一个标签的文章列表。
site.[CONFIGURATION\_DATA]() 配置文件中的信息。



*页面变量*

page.content
页面渲染出来的内容。
page.title
页面标题。
page.excerpt
文章摘要。
page.url
页面链接地址。
page.date
页面或者文章的时间。
page.id
页面或者文章的唯一标识。
page.categories
页面或者文章的分类。
page.tags
页面或者文章的标签。
page.path
页面的路径。
page.CUSTOM
页面的自定义内容。






*分页*
paginator.per\_page  每个分页的文章数量
paginator.posts 分页里的文章对象
paginator.total\_posts   文章的总数
paginator.total\_pages   分页的页数
paginator.page  当前第几页
paginator.previous\_page 前一页的页码
paginator.previous\_page\_path    前一页的地址
paginator.next\_page 下一页的页码
paginator.next\_page\_path    下一页的地址




*函数技巧*


循环输出 3 篇文章
{% for post in site.posts limit:3 %}
{% endfor %}


循环输出最近 3 篇
{% for post in site.posts offset:3 limit:3 %}
{% endfor %}

日期
{{ page.date | date:"%B %b, %Y" }}

分页输出
{% for post in paginator.posts %}
  {{ content }}
{% endfor %}


文章页面显示前一篇文章和后一篇文章
{% if page.previous %}
  //url:    page.previous.url
  //title:  page.previous.title | truncatewords:5
{% endif %}
{% if page.next %}
  //url:    page.next.url
  //title:  page.next.url | truncatewords:5
{% endif %}







*主题:* [原文链接][6]


jekyii 主题设计很简单.
首页 归档 关于 链接页面.



主题配置 需要修改 config.yml

可自定义内容:
站点信息: 例如站点标题、描述、关键字等 SEO 相关，默认 URL 链接和 RSS 链接。
菜单: 想要自定义菜单，排序？都可以。
作者信息: 包括邮箱，简介，详细介绍等。
社交: 因为每一个社交图标，都是 Font-Awesome 字体，所以需要先了解下每个图标的名字。
友情链接: 可以定义很多项，最后在 Links 页面出现。
谷歌分析: 只要输入您的 UA 就可以。
评论: 两种评论系统可以选择，disqus 和 duoshuo。





*主题使用方法:*

> 就是一个现成的 blog. 只要把 文件放到post下面就可以.


1. 主题文件 clone 到本地
2. 使用rake post title="title name"自动添加文章到 \_posts 文件夹。

3. 修改 _config.yml，里面有很多可以配置的选项_
4. 运行 jekyll serve，浏览器打开 http://localhost:4000 便可以看到新的主题。





*baseurl*
是 config.yml 下的一个选项.
网站的根路径.
baseurl: URL
--baseurl URL








*报错:*
ERROR `/' not found.`


原因: 用了 baseurl.
baseurl is used by WEBrick as the root URL. So to get your site, you have to navigate tohttp://localhost:4000/project-name/.




解决方法
浏览器输入 [http://localhost:4000/cards-jekyll-template/][7]

也就是带上你的项目名字.






\@: Rouge 语法高亮

*Rouge 是纯ruby 实现的代码高亮库.*


1. gem 安装 rouge.  `gem install rouge`
	> 附带的 rougify 工具可以用来生成多种高亮主题的CSS文件

2. `rougify help style`
	底下会出现 available themes:
3. 选一个 monokai.sublime
4. 导出css文件
	`rougify style monokai.sublime > syntax.css`

5. 把css 放到网页目录??


使用 Backtick 风格的代码块，确实比生硬地引入 Liquid 标签要优雅多了。


*使用*
- config.yml
添加 highlighter: rouge 
(好像这行不写也可以.因为只支持一种…)

- 修改 syntax.css
设置 黑色背景,白色字体.


3.在post里的文章中,将highlight中的语言需改为ruby


html head 标签加载rouge.css
`<link href="/syntax.css" rel="stylesheet" type="text/css" media="all" />`


当需要在博客中插入 代码片段时:


• 使用 {\% highlight \%} 和 {\% endhighlight \%} 的 Liquid tag 包围要高亮的代码。highlight 后面跟上语法名即可。如果想显示行号，加上 linenos 。例如：

或者使用  来包围代码。例如：
\~ruby def what? 42 end \~\~\~
效果如下：


或者使用 \`\`` 来包围代码。例如：`







*加载css*













\@: Github Pages (Jekyll)

申请个  github 帐号. 创建github pages

本地搭建 jekyll 环境.

创建/进入 一个本地的博客书写目录
`mkdir -p /Blog && cd /Blog`


`jekyll new .`
jekyll 会自动生成博客的基础文件 和 目录.
并且包含一篇现成的博文介绍jekyll




shell\> cd \~/Blog
shell\> jekyll serve
创建完本地博客目录后，可以启动jekyll的管理进程（作用相当于apache），然后就可以通过浏览器看到效果啦！

用浏览器访问
http://127.0.0.1:4000/
就能看到博客框架啦.





*简单个性化配置* 博客名，个人信息等
个性化配置主要在\_config.yml中进行\_
title: <title>
email: <email>
description: \> # <description>
twitter\_username: \<twitter\_username\>
github\_username:  \<github\_username\>
kramdown:
  input: GFM




A.完全自己定制博客
B.找一份框架，修改后使用
C.从GitHub上fork别人的博客代码，在其中添加自己的文章



由A至C，你搭建网站的时间呈雪崩一样递减。以耗时最少的选项C作路线说明： 搜一些 github 的博客，在其项目页， 点击右上角的Fork，就到你的Github 页面，删除posts 里的博文，然后准备博文。









在post-list页面（也即index页面)增加excerpt（即文章简介功能）。将Blog根目录下的index.html中site.pages这一行下增加一行 {{ post.excerpt }}




• kramdown的语法，以及对Markdown的渲染和最基础的Markdown之间有一定差别，建议查阅kramdown官方文档






\@: Liquid 模板引擎 (最好的)

Liquid是一模板引擎语言，从电子商务系统Shopify提取而来。Ruby库渲染的安全模板，不影响服务器上的安全性。





模板引擎 是web应用中 用来生成动态html的工具.
web 应用框架的一部分.


负责将 数据模型 与html 模板结合.
生成最终的html.


jekyll 用的就是 shipify liquid .
用 {{}} 来输出变量.
{%%} 来标记块.

{% if user %}
  Hello {{ user.name }}!
{% endif %}

{% for product in collection.products %}
  {{ product.title }}
{% endfor %}


EJS 也是模板引擎.

布局和片段
布局（layout）和片段（partial）这是模块化开发的基础。
片段（partial）使得一个页面模板可以引入其他的模板，这对于一些通用组件的复用是很有效的。 比如列表页底部的分页器、边栏的公告等信息、站点公用的导航栏等。
布局（layout）是指一个页面模板可以继承一个布局框架模板。比如，在布局框架中可以写好\<head\>部分、导航栏，以及底栏。 其他页面模板通过继承该布局框架来填充其中的内容部分。




*数据格式化*
模板引擎的作用在于将数据注入到模板中，于是到处都需要将数据模型中的值转换为用户可见的字符串。


如: data 过滤器
{{ article.date | date: '%Y-%m-%d' }}   <!-- 2016-06-21 -->

































































































































[1]:	http://unixhelp.ed.ac.uk/shell/jobz5.html
[6]:	http://www.zhanxin.info/jekyll/2013-08-11-jekyll-theme-kunka.html
[7]:	http://localhost:4000/cards-jekyll-template/

