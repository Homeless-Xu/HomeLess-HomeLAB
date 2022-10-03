```


    Pod (volume) 
        >> PVC                      ➜  docker user config  
            >> PV                   ➜  storage manager config
                >> RealStorage      ➜  ceph cluster


    PV:   Persistent Volume          ➜  like physical disk 
    PVC:  Persistent Volume Claim    ➜  choose which disk/pv  .  and decide the size of disk.

    PV:   Provide  Storage           ➜  config pv   is  it admin`s     job
    PVC:  Use      Storage           ➜  config pvc  is  docker user`s  job 


    PV can cofing on all type of storage.
      pv is just like a hard disk to user. 
        user just need config pvc (how to use disk. need how big & etc...)
        user konw nothing about your real storage. 
            user shoud not know this for security. and no need to know this.




