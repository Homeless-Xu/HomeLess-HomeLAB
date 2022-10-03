ping 192.168.0.6 -t \>\>C:\Users\xx261\desktop\11.txt



Edit


抓包 packet  
帧 frame



echo off


netsh -c “i i” delete neighbors 


netsh -c “i i” add neighbors 12 192.168.0.5 98-90-96-a2-2b-f4 


netsh -c “i i” add neighbors 12 192.168.0.6 9c-b6-54-6c-72-22 


netsh -c “i i” add neighbors 12 192.168.0.247 ec-b1-d7-f3-a8-94  


单网卡。 


删除 用 
arp -d   这个删不干净   别用，


netsh i i show in    看idx


netsh -c “i i” delete neighbors 


arp -a   所有缓存表。


arp -d  删除指定 ip


arp -d *  删除所有 缓存


echo off    // 关闭命令回显

