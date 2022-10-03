
Favicon.ico
最初是由微软和其他一系列厂商共同制定标准。
微软建议使用16×16、32×32 和 48×48。是的，没错，
*一个ICO格式文件可以包含多个图片!! 也建议包涵多个图片*

标签页面  16x16 够了.
桌面图标  这个就很糊了..

随着HTML5的推行，Favicon.ico 快淘汰了.
> 尽管所有的桌面浏览器都在支持Favicon.ico文件，但终究是过时的。建议使用 png.



*移动平台 格式:*
apple-toucho-icon  支持 sizes 属性. 来对应不同的设备.


你需要 png  也需要 apple touch icon 还要 windows 8 磁铁..
最主要的是  you need a  *browserconfig.xml* file



*png 尺寸*
96 96 chrome tv
196 196 andriod chrome
老版本的 opera 快速拨号界面 → 160 160 
chrome 网上商店 → 128 128
> 选尺寸的时候  要考虑到底支持哪些平台.


*apple touch icon 尺寸*

iphone classic  ios6 → 57x57    ios7 60x60 
iphone retina   ios6 → 114x114  ios7 120x120
ipad   classic  ios6 → 72x72    ios7 76x76
ipad   retina   ios6 → 144x144  ios7 152x152

> 全球前5000 网站 能完全用对 apple touch icon 的不到4%.


<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png"> 
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png"> 
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png"> 
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png"> 
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png"> 
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png"> 
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png"> 
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">


比起 png 图片. apple touch icon 更加流行.
andriod chrome 等设备 也倾向于使用 这个歌. 因此声明下回比较好.方便其他兼容的设备能访问这些图标.



工具:
要生产一个多平台的 Favicon 是复杂而艰难的!! 工作量很大!!!

**你需要 RealFaviconGenerator**  [http://realfavicongenerator.net/][1]
可以帮你：*生成各种图标* & *还能生成代码!!! *
不同的平台使用截然不同的界面，所以需要为不同的平台生成不同的图标。






浏览器收藏夹
地址栏.
标签标题前面的 个性化图标.


1. 做好 favicon.ico 图标.
	> png 不直接改名 .ico


2. 上传到网站根目录.
3. 并命名为 xxx.icon 
\<head\>
  \<title\> xx \<title\>


大小一般是  16x16的 256色图标


网页由于存在缓存，一时间图标不更新，需清除缓存。在浏览器程序中打开“工具”-“Internet选项”清除网页缓存，网页关闭再重开，多来几次，就可发现标签图标是你想要的了。


[1]:	http://realfavicongenerator.net/