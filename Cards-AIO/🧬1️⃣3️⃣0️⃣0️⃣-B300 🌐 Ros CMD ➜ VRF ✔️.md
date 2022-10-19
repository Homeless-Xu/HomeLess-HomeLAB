
```
🟢 VRF to VRF ✅ 💯

🔵 vrf.lan  to vrf.wan 💯  ➜ for www
/ip route add dst-address=10.21.5.1/32 gateway=10.21.5.1@VRF-EG5 routing-table=VRF-EG3  ➜ so eg3 can ping 5.1
/ip route add dst-address=10.21.3.1/32 gateway=10.21.3.1@VRF-EG3 routing-table=VRF-EG5  ➜ so eg5 can ping 3.1

/ip route add dst-address=0.0.0.0/0 gateway=10.21.1.1@main routing-table=VRF-EG3        ➜ so eg3 can ping www
/ip route add dst-address=0.0.0.0/0 gateway=10.21.1.1@main routing-table=VRF-EG5        ➜ so eg5 can ping www 

❗️ route only from  vrfx.lan to vrfy.wan.    not vrf.x.lan to vrf.y.lan ❗️ 
❗️ route only from  vrfx.lan to vrfy.wan.    not vrf.x.lan to vrf.y.lan ❗️ 
❗️ route only from  vrfx.lan to vrfy.wan.    not vrf.x.lan to vrf.y.lan ❗️ 


🔵 vrf.lan to vrf.lan 💯  ➜ for bgp inside rb4.
ip firewall mangle add chain=prerouting action=mark-routing new-routing-mark=VRF-EG3 src-address=10.21.5.0/30 dst-address=10.21.3.2/32  ➜ allow 5.1 ping 3.2 ✅
ip firewall mangle add chain=prerouting action=mark-routing new-routing-mark=VRF-EG5 src-address=10.21.3.0/30 dst-address=10.21.5.2/32  ➜ allow 3.1 ping 5.2 ✅

ip firewall mangle add chain=prerouting action=mark-routing new-routing-mark=main src-address=10.21.3.0/30 dst-address=10.21.1.2/32  ➜ allow eg3 ping 1.2
ip firewall mangle add chain=prerouting action=mark-routing new-routing-mark=main src-address=10.21.5.0/30 dst-address=10.21.1.2/32  ➜ allow eg5 ping 1.2

❗️ mangle only from  vrfx.lan to vrfy.lan    not vrf.x.lan to vrf.y.wan  & no test on route, must test on client pc❗️ 
❗️ mangle only from  vrfx.lan to vrfy.lan    not vrf.x.lan to vrf.y.wan  & no test on route, must test on client pc❗️ 
❗️ mangle only from  vrfx.lan to vrfy.lan    not vrf.x.lan to vrf.y.wan  & no test on route, must test on client pc❗️ 


```
