
```

🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 RPI. USB SSD ✅💯

🔶 why 
  sd too too slow,  
  usb sata/nvme ssd is easy small fast! 


🔶 how 💯

rpi can     boot from both usb and tf-card.
rpi default boot order: tf-card >> usb 
            it should can boot from usb. if no tf-card.
            but it not work. never know why. 

so have to set boot order: from usb   first! 

install any OS to tf card.
use tf card boot rpi.
then config boot order inside OS.
after config. the boot order setting is on rpi board. not on os!!! 
after config. the boot order setting is on rpi board. not on os!!! 
after config. the boot order setting is on rpi board. not on os!!! 

then use image tool to write os to usb. and  it workd. 

  tf-card os:  only help you enter rpi. change the config. ➜ after this this os is useless.
  usb     os: 



🔵 Detail 

1. isntall  image tool 
  https://www.raspberrypi.com/software/


2. download kali image arm os for pi  & unzip file get .img file  
https://www.kali.org/get-kali/#kali-arm



3. 
use image tool weite os to tf card. 
boot from tf card 

  ❗️ in advance conig  enable ssh. and user password.



🔶 check current config  

  rpi-eeprom-config or vcgencmd bootloader_config.


BOOT_ORDER=0xf41
  4  means usb. 
  1  means tf-card. 
  41 means try usb first. then try tf-card. 



🔵 update bios 

  sudo apt update
  sudo apt full-upgrade


  check  bios version:   sudo rpi-eeprom-update
  update bios version:   sudo rpi-eeprom-update -d -a


🔶 install raspi-config

    sudo apt-get update
    sudo apt-get install raspi-config


🔶 use  raspi-config change bios 

sudo raspi-config
    >> 6 Advanced Options、 
      >> A6 Boot Order、
          choose usb.  enter    ➜ it show usb is default 
    


🔵 make usb-disk 

now bios config is usb device first. 
you plug any usb os . it will boot from usb.


use image tool. make new os. to usb.
then done 


```

