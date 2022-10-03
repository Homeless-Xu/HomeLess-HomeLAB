
```
🟢 Radius Server Conf ➜ Mikrotik

🔵 Note
❗️ Ros user-manager menu is radius server. ros radius menu is radis clent ❗️
❗️ Ros user-manager menu is radius server. ros radius menu is radis clent ❗️
❗️ Ros user-manager menu is radius server. ros radius menu is radis clent ❗️


❗️need install user-manager in extra package first.❗️
❗️need install user-manager in extra package first.❗️
❗️need install user-manager in extra package first.❗️


🔵 add radius client ✅

- enable radius.server 
- add radius.client in ros, so fortigate can conn radius.server.

/user-manager set enable=yes 
/user-manager router add address=10.21.0.1 name=Radius-Client_FGT shared-secret=1111



🔵 create radius user & group ✔️

/user-manager user group add name=GP-RB4.Admin outer-auths=chap
/user-manager user add group=GP-RB4.Admin name=Miranda.R 


```


```
🟢 Radius Client Conf ➜ fortigate

https://docs.fortinet.com/document/fortigate/7.0.4/administration-guide/710485/restricting-radius-user-groups-to-match-selective-users-on-the-radius-server


🔵 fgt add radius server 

https://help.fortinet.com/fddos/4-7-0/fortiddos/Configuring_RADIUS_authentication.htm

config system authentication radius  
  set state {enable|disable}
  set primary-server <ip|domain>
  set primary-secret <string>
end

config system authentication radius  
  set state enable
  set primary-server 10.21.0.2
  set primary-secret 1111
end



🔵 fgt. user group .

    vdom.root >> user >> user group. >> new 
        name: GP-RB4.Admin
        type: firewall
        remote server: radius.rb4011
            groups: any
    
    fgt groupname. must keep same as  radius user`s group name in ros.
    


🔵 fgt. administer user add

    vdom.globa. >> system >> administrators >> new
        name: Miranda.R 
        Type: match a user on remote 
        admini profile: super admin
        remote user group: GP-RB4.Admin  !!!! 

