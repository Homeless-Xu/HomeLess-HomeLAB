## Github   

ssh 教程   http://beiyuu.com/github-pages/ .


终端 cd /.ssh   检查 是否有ssh key文件夹  有的话 就备份下然后删掉这个文件夹

ssh-keygen -t rsa -C "你在Github上的邮箱”           第一个回车是确认 安装路径的
第二个回车 是要你输入密码的    密码要输入2次的 ,

添加密钥到SSH
1
2
cd /.ssh
ssh-add id_rsa
需要刚才生成密钥时候输入的密码。
  

终端输入   more id_rsa.pub    结果就是ssh key       ssh-rsa 开头  邮箱结尾   全部内容复制到  网页github 设置 ssh key 里面.




 终端输入   ssh git@github.com    测试是否添加成功.

如果验证成功，会有下面的提示：
Hi username! You have successfully authenticated, but GitHub does not provi

如果 出现  ? 要你输入 yes or no  输入yes 就好了.




git 上传文件办法   本地git 客户端   打开你的项目  菜单栏目 有个  在finder 中打开的 这个就是本地的git 仓库  把你要上传的文件放这里  然后客户端上 同步一下就上传上去额


