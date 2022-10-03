```
    local    emptyDir   ➜                          ➜ pod del, data del 
    local    hostPath   ➜  mount local  volume.    ➜ pod del, data keep.

    nas      nfs        ➜  mount remote volume     ➜ pod del, data keep.     ➜ host down, data keep.
    nas      iscsi      ➜  mount remote volume     ➜ pod del, data keep.     ➜ host down, data keep.
    nas      rbd        ➜  mount remote volume     ➜ pod del, data keep.     ➜ host down, data keep.
    .... 


    k8s support a lot storage type.
      but ! every type of storage need different config!  not easy for use & config
        so  bset choose is use pv: persisentvolume



