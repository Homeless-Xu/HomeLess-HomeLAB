```
🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶🔶
🔶 参考
https://johnkeen.tech/freenas-11-iscsi-esxi-6-5-lab-setup/


🔶 WHY 
    esxi 也是可以当 iscsi 服务器的. 
    esxi 里面的硬盘 就可以共享出来了. 
    至少 这个必须是整个硬盘. 来创建 iscsi 存储. 

    freenas 的网卡配置了 9k 的大小.
    但是我们的 freenas 是安装在 esxi 里面的. 你得让 esxi 的网卡 也支持 9k 才行. 



🔶 1) 配 vswitch 交换机 
    esxi web >> Networking >> virtual switch 
        >> Choose one & EDIT Settings  
            >> mtu 9000


🔶 2) 配 iscsi VMkernel 专用网卡
    VMkernel NICs 
    >> Add VMkernel NIC. 
        select the switch,
        put the MTU to 9000 
        give a static IP



🔶 ESXi 启用&配置 iSCSI
    Storage > Adapters > Configure iSCSI > enable box. 

    ⦿ 绑定 iscsi 专用网卡
        Under Network port bindings add all of your connections. 

    ⦿ 绑定 动态 目标
        Also, add all your FreeNAS iSCSI IPs to Dynamic targets. 
        Click Save Configuration and when you go back in it should look like this (The part in blue will auto fill once you save and click on Configure iSCSI again).

        这是 服务端么!!!  不是nas 啊 .. 是 esxi 共享个 磁盘出来 ??


🔶 esxi 服务器 创建 iscis 服务端
    选择一个硬盘. 
    创建 存储.  s3710 拿来 iscsi ??


```
