
```

🟢 ros.bgp.demo 

🔶 rb4011 config 
    winbox >> routing >> bgp >> connection >> add 
    EBGP-RB4.HAP
        AS:             65422               ➜ set local AS  
        Remote Address: 10.25.10.5          ➜ HAP`s IP. 
        Remote AS:      65455               ➜ set remote AS
        Local Rols:     ebgp 

🔶 hapac2 config 
    winbox >> routing >> bgp >> connection >> add 
    EBGP-HAP.RB4
        AS:             65455               ➜ set local AS  
        Remote Address: 10.25.10.2         ➜ RB4`s IP. 
        Remote AS:      65422              ➜ set remote AS
        Local Rols:     ebgp 


🔶 test .
  bgp >> sessions >> if have session. config ok. 


```
