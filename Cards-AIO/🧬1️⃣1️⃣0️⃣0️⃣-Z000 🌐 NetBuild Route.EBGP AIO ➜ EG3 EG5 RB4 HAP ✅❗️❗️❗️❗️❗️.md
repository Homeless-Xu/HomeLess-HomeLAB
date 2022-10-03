```
🔶 goal & how 
    rb4 & hap & eg3 & eg5 all connected.

    - use ebgp connect  eg3+eg5
    - use ebgp connect  rb4+eg3 
    - use ebgp connect  hap+eg5
    



🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
🟢 EBGP: rb4.eg3 + hap.eg5 💯

• Goal 
   10.12.3.1  10.12.3.2        10.35.4.2/29  ------- 10.35.4.5/29       10.15.5.5          10.15.5.1
   fgt.eg3     vrf.rb4.eg3.lan   vrf.rb4.eg3.wan     vrf.hap.eg5.wan      vrf.hap.eg5.lan    fgt.eg5



• EBGP Peer ➜ EG3 EG5  💯

RB4: 
/routing bgp connection add name=EBGP-EG3.EG5 router-id=3.3.3.3 as=65433 remote.as=65455 local.address=10.35.4.2 remote.address=10.35.4.5 local.role=ebgp routing-table=VRF-RB4.EG3 vrf=VRF-RB4.EG3

HAP: 
/routing bgp connection add name=EBGP-EG5.EG3 router-id=5.5.5.5 as=65455 remote.as=65433 local.address=10.35.4.5 remote.address=10.35.4.2 local.role=ebgp routing-table=VRF-HAP.EG5 vrf=VRF-HAP.EG5



• share route:  Connected
RB4: 
/routing bgp connection set EBGP-EG3.EG5 output.redistribute=connected 

HAP: 
/routing bgp connection set EBGP-EG5.EG3 output.redistribute=connected  

• Test ✔️

    FGT (VDOM-EG5) # execute traceroute 10.12.3.1


🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
🟢 EBGP: 


🔶 ip 

    10.12.3.1  >> 10.12.3.2  rb4.eg3.lan >> 10.22.3.1 rb4.eg3.wan  >> 10.22.3.2 rb4.lan 
    10.15.5.4  >> 10.15.5.5  hap.eg5.lan >> 10.55.5.4 hap.eg5.wan  >> 10.55.5.5 rb4.lan


🔶 rb4 + eg3  ✅
/routing bgp connection add name=EBGP-RB4.EG3 router-id=2.2.2.2 as=65422 remote.as=65433 local.address=10.22.3.2 remote.address=10.22.3.1 local.role=ebgp
/routing bgp connection add name=EBGP-EG3.RB4 router-id=3.3.3.3 as=65433 remote.as=65422 local.address=10.22.3.1 remote.address=10.22.3.2 local.role=ebgp routing-table=VRF-RB4.EG3 vrf=VRF-RB4.EG3

/routing bgp connection set EBGP-EG3.RB4 output.redistribute=connected   


🔶 hap + eg5 ✅
/routing bgp connection add name=EBGP-HAP.EG5 router-id=2.2.2.5 as=65422 remote.as=65455 local.address=10.55.5.5 remote.address=10.55.5.4 local.role=ebgp
/routing bgp connection add name=EBGP-EG5.HAP router-id=5.5.5.5 as=65455 remote.as=65422 local.address=10.55.5.4 remote.address=10.55.5.5 local.role=ebgp routing-table=VRF-HAP.EG5 vrf=VRF-HAP.EG5

/routing bgp connection set EBGP-EG5.HAP output.redistribute=connected   






🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵
🔶 test ✔️
    ❗️ never test on ros. test on client pc ❗️ ⚠️⚠️⚠️⚠️⚠️
    ❗️ never test on ros. test on client pc ❗️ ⚠️⚠️⚠️⚠️⚠️
    ❗️ never test on ros. test on client pc ❗️ ⚠️⚠️⚠️⚠️⚠️ 
    ❗️ never test on ros. test on client pc ❗️ ⚠️⚠️⚠️⚠️⚠️
    ❗️ never test on ros. test on client pc ❗️ ⚠️⚠️⚠️⚠️⚠️




🔶 ditect connected 
    eg3 ping eg5 ✔️
    eg5 ping eg3 ✔️
    rb4 ping eg3 ✔️ 
    hap ping eg5 ✔️ 
        

🔶 no ditect connected
    rb4 ping eg5  ✔️ use. EBGP-EG3.EG5 ➜ rb4 > eg3 > eg5 
    hap ping eg3  ✔️ use. EBGP-EG5.EG3 ➜ hap > eg5 > eg3 




🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 backup - export 💯 works
🔶 conf backup - hap
/routing bgp connection
add as=65455 disabled=no local.address=10.35.4.5 .role=ebgp name=EBGP-EG5.EG3 output.redistribute=connected \
    remote.address=10.35.4.2/32 .as=65433 router-id=5.5.5.5 routing-table=VRF-HAP.EG5 vrf=VRF-HAP.EG5
add as=65422 disabled=no local.address=10.55.5.5 .role=ebgp name=EBGP-HAP.EG5 remote.address=10.55.5.4/32 .as=65455 \
    router-id=2.2.2.5 routing-table=main vrf=main
add as=65455 disabled=no local.address=10.55.5.4 .role=ebgp name=EBGP-EG5.HAP output.redistribute=connected \
    remote.address=10.55.5.5/32 .as=65422 router-id=5.5.5.5 routing-table=VRF-HAP.EG5 vrf=VRF-HAP.EG5


🔶 conf backup - rb4
/routing bgp connection
add as=65433 disabled=no local.address=10.35.4.2 .role=ebgp name=EBGP-EG3.EG5 output.redistribute=connected \
    remote.address=10.35.4.5/32 .as=65455 router-id=3.3.3.3 routing-table=VRF-RB4.EG3 vrf=VRF-RB4.EG3
add as=65422 disabled=no local.address=10.22.3.2 .role=ebgp name=EBGP-RB4.EG3 remote.address=10.22.3.1/32 .as=65433 \
    router-id=2.2.2.2 routing-table=main vrf=main
add as=65433 disabled=no local.address=10.22.3.1 .role=ebgp name=EBGP-EG3.RB4 output.redistribute=connected \
    remote.address=10.22.3.2 .as=65422 router-id=3.3.3.3 routing-table=VRF-RB4.EG3 vrf=VRF-RB4.EG3


```

