
```
🟢 map ✅

vm.eg3 >>>>>>> fgt.eg3 -------- rb4.lan            >> rb4.wan   ---- fgt.vdom.def  >> www
10.32.0.xx     Transtfer.Mode   10.32.0.2/24+dhcp     10.21.0.2 ---- 10.21.0.1/30+dhcp

                                10.53.0.3/29
                                ||||||||||||
                                10.53.0.5/29

10.54.0.xx     Transtfer.Mode   10.54.0.4/24+dhcp     10.41.0.2 ---- 10.41.0.1/30+dhcp
vm.eg5 >>>>>>> fgt.eg5 -------- hap.lan            >> hap.wan   ---- fgt.vdom.def   >> www




• dchp-rb4.wan:  dhcp from fgt.def.nic01
• dchp-hap.wan:  dhcp from fgt.def.nic08

• ebgp:          10.53.0.3 + 10.53.0.5 


🔶 vxlan 
vm.eg5 >> 10.53.0.5 >> 10.53.0.3 >> vm.eg3 

🔶 vlan 
eg3.vlan_a  rb4.lan >> fgt.def --+
                                 |
eg5.vlan_b  hap.lan >> fgt.def --+



🟢 vlan manage 


esxi inside vlan    eg3.vlan1 >> fgt.eg3 >> eg3.vlan2 
esxi esxi   vlan    eg3.vlan1 >> fgt.eg3 >> rb4. ebgp ---- hap.ebgp >> fgt.eg5 >> eg5.vlan2
esxi ohter  vlan    eg3.vlan1 >> fgt.eg3 >> fgt.def   >> other vlan 


 ```


 ```
🟢 ros. basic conf 

🔵 id 

rb4: 
/system identity set name=Ros.RB4
/tool romon set enabled=yes

hap:
/system identity set name=Ros.HAP
/tool romon set enabled=yes


🔵 nic name 

    • nic name  - rb4 
        /interface set ether1       name=RB4.01-FGT
        /interface set ether2       name=RB4.02-000
        /interface set ether3       name=RB4.03-EG3
        /interface set ether4       name=RB4.04-B35
        /interface set ether5       name=RB4.05-B35
        /interface set ether6       name=RB4.06-APX
        /interface set ether7       name=RB4.07-000
        /interface set ether8       name=RB4.08-000
        /interface set ether9       name=RB4.09-000
        /interface set ether10      name=RB4.10-MAC
        /interface set sfp-sfpplus1 name=RB4.00-CRS
    
    • nic name  - hap 
        /interface set ether1       name=HAP.01-FGT
        /interface set ether2       name=HAP.02-B53
        /interface set ether3       name=HAP.03-B53
        /interface set ether4       name=HAP.04-EG5
        /interface set ether5       name=HAP.05-RPI


🔵 bond & ip 

    • rb4
        /interface bonding add name=Bond-B35 slaves=RB4.04-B35,RB4.05-B35
        /ip address add address=10.35.0.3/29   interface=Bond-B35
        
    • hap 
        /interface bonding add name=Bond-B53 slaves=HAP.02-B53,HAP.03-B53
        /ip address add address=10.35.0.5/29   interface=Bond-B53


🔵 ip - else

    • ip - rb4 
        /ip address add address=10.21.0.2/30   interface=RB4.01-FGT
        /ip address add address=10.32.0.2/30   interface=RB4.03-EG3
        /ip address add address=10.20.6.2/24   interface=RB4.06-APX
        /ip address add address=10.20.10.2/24  interface=RB4.10-MAC
            
    • ip - hap 
        /ip address add address=10.41.0.4/29   interface=HAP.01-FGT
        /ip address add address=10.54.0.4/29   interface=HAP.04-EG5
        /ip address add address=10.40.5.4/24   interface=HAP.05-RPI



🔵 default route 

    • rb4 
    /ip dns set servers=1.1.1.1,8.8.8.8
    /ip route add dst-address=0.0.0.0/0 gateway=10.21.0.1                                 
    
    • hap
    /ip dns set servers=1.1.1.1,8.8.8.8
    /ip route add dst-address=0.0.0.0/0 gateway=10.41.0.1                                 


🔵 nat masquerade 

rb4 & hap 
    /ip firewall nat add chain=srcnat out-interface-list=all action=masquerade


🔵 dhcp - rb4 

```
