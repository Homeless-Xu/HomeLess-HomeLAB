```

🔵 HA_Docker configuration.yaml path 

 ha docker can not edit file in ha dashboard. 
 have to ssh to server.  find mount folder. edit configuration.yaml 

"Type": "bind",
"Source": "/usr/share/hassio/homeassistant",
"Destination": "/config",


usually  "/usr/share/hassio/homeassistant",
or just search file:configuration.yaml   in server. 


```