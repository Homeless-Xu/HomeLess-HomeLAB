
```
🔵 How set trans mode ✅

🔶 trans mode ip
    trans mode no need ip.    but need managerip.
    so have to set a managerip.
    manager ip is for whole vdom!!!  one vdom only need one manager ip.


🔶 cmd 

    config system settings 
    set opmode transparent 
    set manageip 10.12.3.1 255.255.255.248
    end 
    
    ❗️ gateway not set in here.   manual set gateway use gui. ❗️ 


🔶 check 

    FGT (global) # get system status
    Virtual domains status: 2 in NAT mode, 2 in TP mode

```

