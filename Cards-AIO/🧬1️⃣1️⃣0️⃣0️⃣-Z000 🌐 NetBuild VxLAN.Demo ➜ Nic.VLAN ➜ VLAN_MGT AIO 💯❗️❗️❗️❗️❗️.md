
```

🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵  firewall vxlan-1219 config

🔵 create vlan
VLAN-MGT_1219

🔵 create vxlan_121931

config system vxlan
edit "VxLAN_121931"
set interface "internal1"
set vni 121931
set remote-ip "10.21.0.2"
next 
end 


🔵 create vxlan_121951

config system vxlan
edit "VxLAN_121951"
set interface "dmz"
set vni 121951
set remote-ip "10.41.0.4"
next 
end 



🔵 create bridge 

config system switch-interface
edit "SW-VxLAN_1219"
set vdom root
set member "VLAN-MGT_1219" "VxLAN_121931" "VxLAN_121951"
set intra-switch-policy implicit
next
end



🔵 bridge ip - manual 

set allowaccess ping https http 
set ip 10.219.219.1 255.255.255.0 
set dhcp 



🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 rb4 ✅
🔵 rb4 vxlan-1219 config

🔶 create vlan
    /interface vlan add interface=RB4.03-EG3 name=VLAN_1219-EG3 vlan-id=1219
    /ip address add address=10.219.219.2/24 interface=VLAN_1219-EG3 network=10.219.219.0
        set manage ip for rb4. use this ip manage rb4

🔶 create vxlan_121931
    /interface vxlan add            name=VxLAN_121931 port=4789 vni=121931
    /interface vxlan vteps add interface=VxLAN_121931 port=4789 remote-ip=10.21.0.1
    
    
🔶 create vxlan bridge
    /interface bridge      add   name=Bridge-VxLAN_121931
    /interface bridge port add bridge=Bridge-VxLAN_121931 interface=VLAN_1219-EG3
    /interface bridge port add bridge=Bridge-VxLAN_121931 interface=VxLAN_121931
    

🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 hap ✅
🔵 hap vxlan-1219 config

🔶 create vlan
    /interface vlan add interface=HAP.04-EG5 name=VLAN_1219-HAP vlan-id=1219
    /ip address add address=10.219.219.4/24 interface=VLAN_1219-HAP network=10.219.219.0
        set manage ip for hap. use this ip manage hap.


🔶 create vxlan_121951
    /interface vxlan add            name=VxLAN_121951 port=4789 vni=121951
    /interface vxlan vteps add interface=VxLAN_121951 port=4789 remote-ip=10.41.0.1
    
    
🔶 create vxlan bridge
    /interface bridge      add   name=Bridge-VxLAN_121951
    /interface bridge port add bridge=Bridge-VxLAN_121951 interface=VLAN_1219-HAP
    /interface bridge port add bridge=Bridge-VxLAN_121951 interface=VxLAN_121951
