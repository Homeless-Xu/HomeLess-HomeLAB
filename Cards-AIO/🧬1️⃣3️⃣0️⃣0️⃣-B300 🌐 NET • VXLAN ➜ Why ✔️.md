```
🔵 Reason_1:  Connect two datacenter 

one company have two datacenter.

one server. need  backup on another datacenter.
so we need connect two datacenter.

you can use vpn to connnect two datacenter.
but vpn need config a lot.

best way is setup vpn first.then use vxlan in vpn.
so two datacenter can just like two pc in local.






🔵 Reason_2: LAN IP number ✔️

IPv4 /  IPv6 is for WAN ip
vlan / vxlan is for LAN ip

every device need lan ip.


small  company: little device ➜ vlan no 
medium company: lot    device ➜ vlan yes
big    company: ...    device ➜ vlan plus ➜ vxlan 


vxlan is main for cloud provider like aws.
every vps they sold need a ip.
vlan is not enougn for them.
hvae to use vxlan 







