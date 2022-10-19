```
🔵 NAT.Masquerade Summary 💯💯💯💯💯

nat connect private ip and publc ip.
private lan to private lan            no need nat
private lan to piblic  lan(internet)  do need nat

all route under internet need set nat, not only the router direct to internet .

🔶 nat demo 
router1 --- router 2 --- router3 -- internet 

1. enable nat.masquerade  at router3.wan.nic 
2. enable nat.masquerade  at router2.wan.nic 
3. enable nat.masquerade  at router1.wan.nic 

```

