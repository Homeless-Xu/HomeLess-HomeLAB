```

🔵 visit - nginx

    🔶 check port 

        lens >> network >> services >> ..
        kubectl get svc --namespace default -w name
        kubectl get svc --namespace default -w nginx-k3s


    🔶 config firewall 

        ufw allow from 10.111.111.0/24 


    🔶 visit nginx

        http://172.16.1.33:32674


