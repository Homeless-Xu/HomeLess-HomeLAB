#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


# root 用户检测
if [ $(id -u) != "0" ]; then
    echo "Error: 脚本需要root权限"
fi




echo " 多功能脚本                  "
echo " 适用: openVZ CentOS7_x64    "
echo " SSH 端口更改                "
echo " -- Xu.jian -- 2017-07-14-22 "





# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
# 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 SSH 端口更改 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️

# vi /etc/ssh/sshd_config 添加 Port 2222 就可以修改端口成2222了
# 注意点. 这里只要追加就可以了.  
# 如果配置文件中有多个Port 参数.只认最后一个参数.
# 然后要重启 ssh 生效

read -r -p "Would you like to change the ssh port? [Y/N] " response
# -p 后面跟提示信息，即在输入前打印提示信息。
# -r 屏蔽\，如果没有该选项，则\作为一个转义字符，有的话 \就是个正常的字符了。

if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then    
   read -p "What would you like to change the port to? (Chose between 1024-65535) " sshportconfig
   if (( ("$sshportconfig" > 1024) && ("$sshportconfig" < 65535) )); then
    echo "Port $sshportconfig" >> /etc/ssh/sshd_config
    echo "--------------------------------------------------------------------"
    echo ""
    echo ""
    echo "SSH port has been changed to: $sshportconfig."
    echo ""
    echo ""
    echo "--------------------------------------------------------------------"
    systemctl restart sshd.service
   else
    echo "Port chosen is incorrect."
    exit 1
   fi
else 
   sshPort=$(grep "Port" /etc/ssh/sshd_config) | head -n 1
   echo "--------------------------------------------------------------------"
   echo ""
   echo ""
   echo "SSH is still: $sshPort"
   echo ""
   echo ""
   echo "---------------------------------------------------------------------"
   exit 1
fi
exit 0












# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
# 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 修改root密码 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
# ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️------⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️

# 语法 用脚本修改用户密码
# echo "USERNAME:NEWPASSWORD" | chpasswd
# Linux 下是不能查看密码的. 要测试密码是否修改改成.
# ssh root@35.194.128.92 输入修改后的密码

read -r -p "是否要修改 Root 密码? [Y/N] " password_response
if [[ $password_response =~ ^([yY][eE][sS]|[yY])$ ]]
   read -p "请输入 Root 密码:" rootPassword
then    
echo "root:$rootPassword" | chpasswd
echo "密码修改成功"
fi







