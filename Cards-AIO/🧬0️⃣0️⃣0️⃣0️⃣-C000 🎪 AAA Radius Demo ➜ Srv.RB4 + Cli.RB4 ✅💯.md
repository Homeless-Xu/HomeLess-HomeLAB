
```

🟢 goal 

radius.srv is in rb4
radius.user is in rb4 too.
need use radius use to login. rb4011.

🔵 rb4. server config ➜ user mansger 

🔶 peer 
user manager.  add local device! 
/user-manager router add address=127.0.0.1 name=RB4.Local

🔶 radius user group 
    if no use default group.
    make sure your custom group use all auth. in case debug..

🔵 rb4. client config ➜ radius

🔶 enable radius client
    radisu >> incoming >> accept 

🔶 add peer 
    radisu >>  add server 
        address: 127.0.0.1      ➜ server is in local too. 


🔵 rb4. enable radius user login 
system >> users >> AAA >> enable use radius 



```
