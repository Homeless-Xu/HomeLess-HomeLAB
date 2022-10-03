
```

🔵 map 

    client:mbp      router:rb4        router:fgt       client:mac
    rb4.lan         rb4.wan           fgt.wan          fgt.lan
    rb4.03-eg3      rb4.01-fgt        internal1        HAP             ➜ nic name 
    10.31.0.98      10.21.0.2         10.21.0.1        10.31.0.99      ➜ no vlan nic

🔵 goal
    use vxlan connect physical nic  10.31.0.98/99 

🔵 step 

    create vxlan 
    create brigde
    use    bridge bond vxlan nic & physical nic 
    set    bridge ip & dhcp 


🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 fgt vxlan conf 


🔵  create VXLAN 💯

config system vxlan
edit "VxLAN_121931"
set interface "internal1"
set vni 121931
set remote-ip "10.21.0.2"
next 
end 


🔵 create bridge & bond nic 💯

config system switch-interface
edit "SW-VxLAN_121931"
set vdom root
set member "VxLAN_121931" "HAP"
set intra-switch-policy implicit
next
end


    implicit ➜ allow nic under switch. to other nic. so no need config firewall



🔵 bridge ip - use gui 

edit SW-VxLAN_121931
set allowaccess ping https http 
set ip 10.31.0.1 255.255.255.0 
set dhcp 


🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 mikrotik vxlan config 


🔵 rb4 vxlan config 

🔶 create vxlan_121931
    /interface vxlan add            name=VxLAN-MGT_121931 port=4789 vni=121931
    /interface vxlan vteps add interface=VxLAN-MGT_121931 port=4789 remote-ip=10.21.0.1
    
        ❗️ fortigate vxlan use port 4789, not mikrotik default port 8472 ❗️ 
    

🔶 create vxlan bridge
    /interface bridge      add   name=Bridge-VxLAN_121931
    /interface bridge port add bridge=Bridge-VxLAN_121931 interface=RB4.03-EG3
    /interface bridge port add bridge=Bridge-VxLAN_121931 interface=VxLAN-MGT_121931
    


🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 test 

conn pc to ros  port.03 
can ping 10.31.0.1
and get dhcp from fortigate 


no test on ros. test on client pc 


```

