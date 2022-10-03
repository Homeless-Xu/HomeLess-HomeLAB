```
    wan traffic:   inside cluster <> outside cluster 
    lan traffic:   inside cluster <> inside  cluster 


    wan - level 4  loadbalance:  ➜   protocal +  port  to find pod  ➜ 1. LoadBalance
    wan - Level 7  loacbalance:  ➜   domain   +  url   to fins pod  ➜ 2. Ingress 
    lan -                        ➜   podname           to find pod  ➜ 3. ClusterIP 
    Docker                       ➜   Host                           ➜ 4. NodePort   


        loadbalance you can choose any you like:  nginx/traefik/HA 






