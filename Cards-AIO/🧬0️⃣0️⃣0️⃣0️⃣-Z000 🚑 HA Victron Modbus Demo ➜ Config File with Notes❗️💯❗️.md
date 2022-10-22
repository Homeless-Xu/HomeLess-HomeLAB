```

# Loads default set of integrations. Do not remove.
default_config:

# Text to speech
tts:
  - platform: google_translate

automation: !include automations.yaml
script: !include scripts.yaml
scene: !include scenes.yaml


# conn victron and homeassist
modbus:
  - name: CerboGX             # set any name
    type: tcp
    host: 192.168.3.101          # use your IP address of your CCGX
    port: 502


# begian add sensors
    sensors:  


# 🔵 demo info
# Cerbo GX    unti-id 100    ➜ system
# inverter    unit-id 227    ➜ vebus
# mppt1:      unit-id 223    ➜ solar charger
# mppt2:      unit-id 224    ➜ solar charger
# mppt3:      unit-id 226    ➜ solar charger


# 🔶 power - info
      - name: '⚡️🔆' # mppt charge status: 775 bluk / abs /float 
        unit_of_measurement: "3B,4A,5F" 
        slave: 223
        address: 775

      - name: '⚡️🔆-Head'
        unit_of_measurement: "W" 
        scale: 0.1     # show 3000w, real 300w so must need this.
        slave: 224     # device/unit-id ➜ one hardware one unit-id 
        address: 789   # function    id ➜ one fucntion one func-id. one hardware many func.

      - name: '⚡️🔆-Back'
        unit_of_measurement: "W"  
        scale: 0.1  
        slave: 226
        address: 789

      - name: '⚡️🔆-Sides'
        unit_of_measurement: "W"
        scale: 0.1   
        slave: 223   
        address: 789 


# 🔶 Battery
# Votage -GX:840 
# tempture-invetert: 61
      - name: '⚡️🔋-V' # not use gx for vote. better from mppt 
        unit_of_measurement: "V"
        scale: 0.01  
        precision: 2   # no 13v; 1 13.1v; 2 13.11v 
        slave: 226
        address: 771

      - name: '⚡️🔋-A'
        unit_of_measurement: "A"
        scale: 0.1  
        slave: 100
        address: 841

      - name: '⚡️🔋-T'
        unit_of_measurement: "°C"
        scale: 0.1  
        precision: 1
        slave: 227
        address: 61

      - name: '⚡️🔋-W'
        unit_of_measurement: "W" 
        slave: 100
        address: 842


# 🔶 AC Info: 
      - name: '⚡️♻️-AC'
        unit_of_measurement: "W" 
        slave: 100
        address: 817




```