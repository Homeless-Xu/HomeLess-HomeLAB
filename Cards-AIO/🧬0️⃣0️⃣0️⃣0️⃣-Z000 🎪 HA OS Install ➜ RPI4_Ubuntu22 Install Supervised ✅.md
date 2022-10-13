
```
🟢 how

    1. install os-agent   - must 
    2. install Supervised - must 
        Supervised use os-agent to control Home Assistant 
    

🔵 os-agent install  ✔️

    🔶 Install dependencies
    
        sudo apt update
        sudo apt install ca-certificates curl gnupg lsb-release
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt update
        sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
    
    🔶 os-agent install 
    
        • check latest version 
          https://github.com/home-assistant/os-agent/releases
        
        • check cpu 
          RPI.U22 ~ uname -a 
          Linux RPI 5.15.0-1015-raspi #17-Ubuntu SMP PREEMPT Mon Sep 12 13:14:51 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
        
        • download & install & reboot  
          wget https://github.com/home-assistant/os-agent/releases/download/1.4.1/os-agent_1.4.1_linux_aarch64.deb
          sudo dpkg -i os-agent_1.4.1_linux_aarch64.deb
          sudo systemctl reboot

🔵 Supervised install

    https://github.com/home-assistant/supervised-installer

    ⚠️  install hos need some time after reboot
            docker ps        ➜  check status 
            journalctl -f    ➜   debug


🔵 visit 
    ip:8123
```
