
```
🔵 HAP.Conf.cmd 

/system reset-configuration no-defaults=yes keep-user=yes
/tool romon set enabled=yes
/system identity set name=Ros.HAP


/interface set ether1       name=HAP.01-HAP.RB4
/interface set ether2       name=HAP.02-HAP.EG5
/interface set ether3       name=HAP.03-EG5.HAP
/interface set ether4       name=HAP.04-EG5.EG3
/interface set ether5       name=HAP.05-EG5.FGT


/ip address add address=10.52.6.5/29 interface=HAP.01-HAP.RB4
/ip address add address=10.55.5.5/29 interface=HAP.02-HAP.EG5
/ip address add address=10.55.5.4/29 interface=HAP.03-EG5.HAP
/ip address add address=10.35.4.5/29 interface=HAP.04-EG5.EG3
/ip address add address=10.15.5.5/29 interface=HAP.05-EG5.FGT


🔶 rb4. default route 

/ip dns set servers=1.1.1.1
/ip route add dst-address=0.0.0.0/0 gateway=10.52.6.2                                 


🔶 vrf create
/ip vrf add name=VRF-HAP.EG5 interfaces=HAP.03-EG5.HAP,HAP.04-EG5.EG3,HAP.05-EG5.FGT

🔶 vrf route 
/ip route add dst-address=0.0.0.0/0 gateway=10.55.5.5@VRF-HAP.EG5 routing-table=VRF-HAP.EG5

🔶 NAT 
/ip firewall nat add chain=srcnat out-interface-list=all action=masquerade

```
