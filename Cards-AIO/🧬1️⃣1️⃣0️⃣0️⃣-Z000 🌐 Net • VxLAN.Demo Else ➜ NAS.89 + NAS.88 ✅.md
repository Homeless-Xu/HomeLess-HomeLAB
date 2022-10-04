
🟢 nas.  vxlan - 89 config 
```

🔵 rb4 

🔶 create vlan 
    /interface vlan add interface=RB4.03-EG3 name=VLAN_1001-EG3 vlan-id=1001


🔶 create vxlan
    /interface vxlan add            name=VxLAN-STO_100131 port=4789 vni=100131
    /interface vxlan vteps add interface=VxLAN-STO_100131 port=4789 remote-ip=10.21.0.1
    

🔶 create vxlan bridge
    /interface bridge      add   name=Bridge-VxLAN_100131
    /interface bridge port add bridge=Bridge-VxLAN_100131 interface=VLAN_1001-EG3
    /interface bridge port add bridge=Bridge-VxLAN_100131 interface=VxLAN-STO_100131



🔵 fgt 

🔶 create VXLAN 💯

config system vxlan
edit "VxLAN_100131"
set interface "internal1"
set vni 100131
set remote-ip "10.21.0.2"
next 
end 


🔶 create bridge & bond nic 💯

config system switch-interface
edit "SW-VxLAN_1001"
set vdom root
set member "VxLAN_100131" "VLAN-STO_1001"
set intra-switch-policy implicit
next
end


    implicit ➜ allow nic under switch. to other nic. so no need config firewall



🔶 bridge ip - use gui 

edit SW-VxLAN_1001
set allowaccess ping https http 
set ip 10.1.1.1 255.255.255.0 
set dhcp 





```



