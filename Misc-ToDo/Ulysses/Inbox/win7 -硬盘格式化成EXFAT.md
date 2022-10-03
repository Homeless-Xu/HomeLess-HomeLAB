## win7 -硬盘格式化成EXFAT
cmd
diskpart
list disk
select disk3
list partition
select partition1
format fs=exfat label=“new” unit=1024 quick
 
ok















