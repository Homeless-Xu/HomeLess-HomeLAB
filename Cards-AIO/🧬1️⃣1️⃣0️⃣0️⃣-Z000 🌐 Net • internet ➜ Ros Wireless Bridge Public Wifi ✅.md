
```
🔵 Ros. Bridge public wifi how 

🔶 goal
    public wifi too weak. boost it signal.
    
    ros.device must have wireless nic to bridge wifi.
    most ros device have wifi.2g + wifi.5g   ➜ one connect public, one connect your pc
    some ros device have wifi    + ethernet  ➜ one connect public, one connect your pc



🔶 how 
          
    public >> ros.wifi.2g     >> ros.wifi.5g        >> pc
    public >> ros.wifi        >> ros.eth            >> pc
    public >> ros.wifi.physic >> ros.wifi.virtual   >> pc 


🔶 ros. ap bridge tip 

use quick setup ➜ no  connect to wifi without password 
use winbox/cmd  ➜ can connect to wifi without password  ➜ mode choose station pseudobridge 


1. reset ros
2. set wifi nic to station pseudobridge mode ❗️ 
3. scan wifi, choose publli wifi. connect
4. create bridge.  put wifi+eth to bridge
5. set dhcp client on bridge.
6. pc connect eth.nic   & test 

```