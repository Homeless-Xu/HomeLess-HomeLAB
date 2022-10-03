
```
🔵 Basic Config

🔶 reset + Romon + name 

/system reset-configuration no-defaults=yes keep-user=yes
/tool romon set enabled=yes
/system identity set name=Ros.RB4


🔶 rename nic 

• get old name
/interface print


/interface set ether1       name=RB4.01-RB4.FGT
/interface set ether2       name=RB4.02-RB4.EG3
/interface set ether3       name=RB4.03-EG3.FGT
/interface set ether4       name=RB4.04-EG3.RB4
/interface set ether5       name=RB4.05-EG3.EG5
/interface set ether6       name=RB4.06-RB4.HAP
/interface set ether7       name=RB4.07-RB4.RPI
/interface set ether8       name=RB4.08-RB4.IDLE
/interface set ether9       name=RB4.09-RB4.MAC
/interface set ether10      name=RB4.10-RB4.MAP
/interface set sfp-sfpplus1 name=RB4.00-RB4.CRS



🔶 create vlan ????


/interface vlan add interface=RB4.01-RB4.FGT name=VLAN-WWW.EG3_2103 vlan-id=2103
/interface vlan add interface=RB4.01-RB4.FGT name=VLAN-WWW.EG5_2105 vlan-id=2105
/interface vlan add interface=RB4.01-RB4.FGT name=VLAN-WWW.HAP_2155 vlan-id=2155
/interface vlan add interface=RB4.01-RB4.FGT name=VLAN-WWW.CAM_2198 vlan-id=2198
/interface vlan add interface=RB4.01-RB4.FGT name=VLAN-WWW.SEC_2196 vlan-id=2196

/interface vlan add interface=RB4.00-RB4.CRS name=VLAN-CRS.CAM_1928 vlan-id=1928
/interface vlan add interface=RB4.00-RB4.CRS name=VLAN-CRS.SEC_1926 vlan-id=1926



🔶 ip address config

• nic ip 
/ip address add address=10.21.1.2/29   interface=RB4.01-RB4.FGT

/ip address add address=10.12.3.2/29   interface=RB4.03-EG3.FGT
/ip address add address=10.22.3.2/29   interface=RB4.02-RB4.EG3
/ip address add address=10.22.3.1/29   interface=RB4.04-EG3.RB4

/ip address add address=10.35.4.2/29   interface=RB4.05-EG3.EG5
/ip address add address=10.52.6.2/29   interface=RB4.06-RB4.HAP

/ip address add address=10.20.7.2/24   interface=RB4.07-RB4.RPI
/ip address add address=10.20.8.2/24   interface=RB4.08-RB4.IDLE
/ip address add address=10.20.9.2/24   interface=RB4.09-RB4.MAC
/ip address add address=10.20.10.2/24  interface=RB4.10-RB4.MAP




• vlan ip
/ip address add address=10.21.103.2/29 interface=VLAN-WWW.EG3_2103
/ip address add address=10.21.105.2/29 interface=VLAN-WWW.EG5_2105
/ip address add address=10.21.155.2/29 interface=VLAN-WWW.HAP_2155
/ip address add address=10.21.198.2/29 interface=VLAN-WWW.CAM_2198
/ip address add address=10.21.196.2/29 interface=VLAN-WWW.SEC_2196

/ip address add address=192.168.8.2/24 interface=VLAN-CRS.CAM_1928
/ip address add address=192.168.6.2/24 interface=VLAN-CRS.SEC_1926



🔶 rb4. default route 

/ip dns set servers=1.1.1.1
/ip route add dst-address=0.0.0.0/0 gateway=10.21.1.1                                 




🔵 vrf  ✅

🔶 vrf create
/ip vrf add name=VRF-RB4.EG3 interfaces=RB4.03-EG3.FGT,RB4.04-EG3.RB4,RB4.05-EG3.EG5

🔶 vrf route ✅
/ip route add dst-address=0.0.0.0/0 gateway=10.22.3.2@VRF-RB4.EG3 routing-table=VRF-RB4.EG3




🔵 VRF. Diff wan 

🔶 goal

rb4.def 0.0.0.0/0  ➜ rb4            10.21.1.1
rb4.eg3 0.0.0.0/0  ➜ vlan-www-eg3   10.21.103.1
rb4.eg5 0.0.0.0/0  ➜ vlan-www-eg5   10.21.105.1
rb4.hap 0.0.0.0/0  ➜ vlan-www-hap   10.21.155.1

crs.cam 0.0.0.0/0  ➜ vlan-www-cam   10.21.198.1
crs.sec 0.0.0.0/0  ➜ vlan-www-sec   10.21.196.1


🔶 route 

/ip route add dst-address=0.0.0.0/0 gateway=10.21.103.1@main pref-src=10.22.3.2
/ip route add dst-address=0.0.0.0/0 gateway=10.21.105.1@main pref-src=10.52.6.2
/ip route add dst-address=0.0.0.0/0 gateway=10.21.155.1@main pref-src=10.52.10.2

/ip route add dst-address=0.0.0.0/0 gateway=10.21.198.1@main pref-src=192.168.9.2
/ip route add dst-address=0.0.0.0/0 gateway=10.21.196.1@main pref-src=192.168.6.2


🔵 nat masquerade 
    /ip firewall nat add chain=srcnat out-interface-list=all action=masquerade




🔵 DHCP for mac 

/ip pool add name=dhcp_pool0 ranges=10.20.9.3-10.20.9.254
/ip dhcp-server add address-pool=dhcp_pool0 interface=RB4.09-RB4.MAC name=dhcp1
/ip dhcp-server network add address=10.20.9.0/24 gateway=10.20.9.2

