
```

🔵 goal 
	radisu server: ros.
	radius client: kali linux.

	use radius user to login kali ssh .

🔵 how - simple

    ros  create user:xr              & config radius client   
    kali install radius-client tool  & config radius server 
    kali create user:xr              ➜ must creata a same username to kali first. just nama,no need password
    kali test   user:xr
    


🔵 how - detail 

🔶 radis  server 

🔶 kali instal client tool 
	apt-get update
	sudo apt-get install libpam-radius-auth freeradius-utils -y


🔶 kali add radius server / add one line 

    sudo vi /etc/pam_radius_auth.conf 
    
    # server[:port]             shared_secret   timeout (s)  source_ip            vrf
    10.21.0.2                1111                5


🔶 kali create user

    sudo adduser USERNAME --disabled-password --quiet --gecos ""
    sudo adduser xr --disabled-password --quiet --gecos ""


🔶 kali test user

    radtest USERNAME   CLIENTPASSWORD SERVER            0   USERPASSWORD
    radtest user-name  user-password  radius-server-ip  0   radius-server-secret 
    radtest xr         1              10.21.0.2         0   1111



```
