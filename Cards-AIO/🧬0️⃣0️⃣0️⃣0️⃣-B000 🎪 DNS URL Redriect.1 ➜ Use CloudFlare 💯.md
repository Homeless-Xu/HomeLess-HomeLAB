


```

🔶 goal 
  blog.0214.icu  redirect to https://github.com/Homeless-Xu
     - redirect not allow two /. like: https://github.com/Homeless-Xu/HomeLess-HomeLAB

🔶 config dns proxy config 
  add type A record for root: ➜   @    to 192.0.2.1  and must enable proxy.
      root domain proxy - must 
  add type A record for blog: ➜   blog to 192.0.2.1  and must enable proxy.
      redirect head.    - must 
      
🔶 rule 
  CloudFlare ➜ rules ➜ page rules ➜ create page rule 
    url:           *blog.0214.icu/* 
    setting:       forwarding url 
    status mode:   301 
    dest url:      https://github.com/Homeless-Xu 


```