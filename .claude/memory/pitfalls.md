# 🦚 Pitfalls / 坑 ➜ fixed bugs, never step twice

```
format (one entry ≤ 6 lines):

## [scope] short title
    problem:  what broke
    cause:    root cause
    fix:      final fix
    seen: 1   ➜ same pitfall again = seen+1, NO new entry
```


## [net.vxlan] ros + fgt vxlan port mismatch
    problem:  mikrotik ↔ fortigate vxlan not talk
    cause:    default port diff ➜ ros.8472, fgt.4789
    fix:      change ros vxlan & vtep port to 4789
    seen: 1


## [rpi.nic] startech dual-usb nic no balance-rr
    problem:  rpi nic bond balance-rr not work
    cause:    startech dual-usb nic not support balance-rr
    fix:      use 802.3ad bond instead
    seen: 1


## [rv.power] bmv-712 battery monitor not accurate
    problem:  capacity reading crazy, setting crazy
    cause:    device design, not config error
    fix:      tell capacity by voltage table, skip bmv-712
    seen: 1
