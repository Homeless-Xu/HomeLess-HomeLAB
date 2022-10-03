```

helm list                                      ➜ list all helm app ( default namespace )
helm list --all-namespaces                     ➜ list all helm app ( all-namespaces    )

helm pull xxx                                  ➜ download - run
helm install xxx                               ➜ download + run + default namespace 
helm install xxx --namespace xxx               ➜ download + run + xxx     namespace  

helm install xxx --values values.yaml          ➜ download + run          +  custom values
helm upgrade xxx --values values.yaml          ➜ update     app version  +  custom values
helm rollback xxx                              ➜ rollback   app version 

helm get values   xxx                          ➜ check custom value 
helm inspect values  xxx                       ➜ check default value

helm create app-nginx
helm package app-nginx
helm lint app-nginx                            ➜ check config error
helm delete app-nginx




  kubectl describe svc SERVICE-NAME
  kubectl describe svc traefik-imac
