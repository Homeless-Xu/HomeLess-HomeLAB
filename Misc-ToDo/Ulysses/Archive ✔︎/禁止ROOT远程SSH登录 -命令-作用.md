## 禁止ROOT远程SSH登录  
|命令|作用|
|:---:|:---:|
| vi /etc/ssh/sshd\_config |编辑配置文件|  
| PermitRootLogin yes | 去掉注释; yes 改成 no |  
| systemctl restart sshd.service | 重启sshd服务 (sudo 执行) |
   


