
```


🔶 ref .

mos:   https://www.youtube.com/watch?v=tWaPgziBnas
igbt:  https://www.youtube.com/watch?v=f0AHrjk6KEA

🔶 why 
rpi only contril 5v coil relay.  we need use rpi control 12v coil car relay.


🔶 function?
    use hand control  physical switch. 
    use mos  control  virtual  switch. / remote control. 


🔶 summy 

fet:  use current control currnt 
mos:  use votage  control current... 

fet:       cheap       ➜ for small  current
mos:       expensive   ➜ for normal current
igbt: most expensive   ➜ for big    current 


🔶 
    b
fet c
    e

    g  ➜ control 
mos d  power  in  + 
    s  power  out - 

        touch. g & d.    d & s turn on 
            no need keep touch. if disconnect g & d.   still keep on .
        touch. g & s.    d & s turn off. 

```



```


❗️ fet only for 1watt-(cheap),  mosfet for 1watt+ (expensive) ❗️
❗️ fet only for 1watt-(cheap),  mosfet for 1watt+ (expensive) ❗️
❗️ fet only for 1watt-(cheap),  mosfet for 1watt+ (expensive) ❗️


🔶 mosfet vs Transistor


🔶 Transistor ref ⭐️⭐️⭐️⭐️⭐️
    
    https://www.mcmajan.com/mcmajanwpr/blog/2012/12/04/arduino-connect-a-12v-relay-english-version/


🔶 Transistor
    why: rpi/uni only support 5v coil. not 12v coil
        use Transistor allow you use extra 12v to control car relay.


```


```
🔵 Transistor Choose
    depned on how many watt and current your relay use.
    my car relay: SONG CHUAN 896H-1CH-C1S   12vdc. 133mA  90omu = 1.6W 


🔵 normal Transistor table

    25pcs--A1015 PNP  60V 0.1A  0.4W   8MHZ
    25pcs--BC327 PNP  50V 0.8A  0.625W 100MHZ
    25pcs--BC337 NPN  50V 0.8A  0.625W 100MHZ
    25pcs--C1815 NPN  60V 0.15A 0.4W   8MHZ
    25pcs--S8050 NPN  40V 1.5A  1W     100MHZ  
    25pcs--S8550 PNP  40V 1.5A  1W     100MHZ
    25pcs--2N2222 NPN 60V 0.8A  0.5W   250MHZ   ➜ current ok.  watt no 
    25pcs--2N2907 NPN 60V 0.6A  0.4W   200MHZ
    25pcs--2N3904 NPN 60V 0.2A  0.625W 300MHZ
    25pcs--2N3906 PNP 40V 0.2A  0.5W   250MHZ
```