book → setting → domain : xx.yy.help
aliyun → add new cname xx.yy.help www.gitbooks.io
wait some mimutes.
webbrowser: xx.yy.help  



已有 www.0214.help

二级域名 不需要额外的申请/付费. 


直接去 阿里云解析里面 设置下就好.

阿里云 控制台 → 云解析 → 域名解析 → 添加解析


比如: 自己创建了 Gitbook 帐号.
自己的Gitbook 首页是:
[https://www.gitbook.com/@xu-jian/dashboard][1]

想把 上面长长的难记的变成下面好记的:
book.0214.help 
这个是 

> 域名到IP 是 Aname 解析
> 域名到域名 是 cname 解析
> 域名到网址 是 url 转发




书籍配置域名:
gitbook 支持给每本书绑定域名.

这里继续以 test book 为例，将其绑定到 test.chengweiyang.cn，这样，用户就可以通过新的域名访问本书！



1. 先在 gitbook 上设置域名
 具体book → test
homeoage domain →test.0214.help 
content  domian → content.test.0214.help

2. aliyun
加两个 cname
cname test  www.gitbook.com
cname content.test  www.gitbook.com
> 必须是 www.gitbook.com 
测试: 浏览器: test.0214.help


















您只需要在主机记录（RR 值）
输入二级域名的对应字符即可实现对二级域名的解析设置。

假如您的域名是abc.com，
当您在主机记录填写“mail”，便可以针对二级域名mail.abc.com设置解析。


将域名解析指向一个 IP 地址，您需要选择记录类型为A记录，记录值输入服务器 IP 地址；
2）将域名解析指向另一个域名，您需要选择记录类型为 CNAME 记录，记录值输入域名（没有https://）；
3）将域名解析指向一个网站地址，你需要选择记录类型为 URL 转发，记录值输入网站地址。



[1]:	https://www.gitbook.com/@xu-jian/dashboard