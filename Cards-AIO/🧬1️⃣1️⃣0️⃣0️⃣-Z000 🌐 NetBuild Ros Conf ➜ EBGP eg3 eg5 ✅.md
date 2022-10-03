
```
🟢 ebgp - eg3 & eg5  ✅

🔶 goal 
     mac under rb4.eg3  <<>>  rpi under hap.eg5 
            10.20.10.2  <<>>  10.40.5.4
     
🔶 EBGP 

    RB4: peer + share route
    /routing bgp connection add name=EBGP-E35 router-id=3.3.3.3 as=65433 remote.as=65455 local.address=10.35.0.3 remote.address=10.35.0.5 local.role=ebgp
    /routing bgp connection set EBGP-E35 output.redistribute=connected 
    
    HAP: peer + share route
    /routing bgp connection add name=EBGP-E53 router-id=5.5.5.5 as=65455 remote.as=65433 local.address=10.35.0.5 remote.address=10.35.0.3 local.role=ebgp
    /routing bgp connection set EBGP-E53 output.redistribute=connected 

```

