

```

🔵 Multihop Desc 

by default two bgp route is connected direct.
if other route between two bgp route. need enable multihop.

not only enable this. need much more.
so if possible no use this 



🔶 Demo 
    ❗️  if  eg3 >> rb4 << eg5 , eg3 eg5 not direct connected. must enable multihop ❗️
    ❗️  if  eg3 >> rb4 << eg5 , eg3 eg5 not direct connected. must enable multihop ❗️
    ❗️  if  eg3 >> rb4 << eg5 , eg3 eg5 not direct connected. must enable multihop ❗️
    /routing bgp connection set EBGP-EG3.EG5 multihop=yes  
    /routing bgp connection set EBGP-EG5.EG3 multihop=yes 

```
