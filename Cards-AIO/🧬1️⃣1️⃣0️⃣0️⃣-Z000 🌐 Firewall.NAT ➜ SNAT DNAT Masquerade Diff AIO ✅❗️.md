```

🔵 result  ✅

network have two kind: 
    public  ip network: use in www
    private ip network: use in lan 
    


route forward     function ➜ connect lan +  lan 
NAT               function ➜ connect lan +  www 
DNAT              function ➜ connect www to lan 
SNAT              function ➜ connect lan to www  ( your route have fixed    public ip)
SNAT.masquerade   function ➜ connect lan to www  ( your route have no fixed public ip)


❗️ SNAT only need set between internet and lan ➜ only set nat at the device your internet cable in ❗️ 
❗️ SNAT only need set between internet and lan ➜ only set nat at the device your internet cable in ❗️ 
❗️ SNAT only need set between internet and lan ➜ only set nat at the device your internet cable in ❗️ 

if you have fixed public. set snat            on internet cable nic.
if you no   fixed public. set snat.masquerade on internet cable nic.


```