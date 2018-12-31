---
layout: page
title: "TP-Link Indoor Router"
category: Hardware
---


An indoor router, connected by ethernet cable to the outdoor router, is required for an NYC Mesh member to connect their personal devices to the Internet. For volunteer-led installations, the install team will supply the new member with a [TP-Link N300 Router](https://www.tp-link.com/us/products/details/cat-9_TL-WR841N.html).

![alt text](https://i.imgur.com/2VTOmku.png "TPLink Router")



### Pre-Configuration Best Practices
**for volunteer installers**

Before configuring, ask the user member to tell you:
* Whether they would like to use the TP-Link router we supply or their own router
* A username and password for the router
* An SSID and password for the home wireless network

### TP-Link TL-WR841N Router Configuration Instructions
**for volunteer installers and DIY installers**

1.  Plug the ethernet cable from the outdoor antenna/router into the TP-Link’s blue WAN port.
1.  Plug the power adapter into the wall and the cable into the power socket of the router. The router will turn on automatically.
1.  Connect the installation laptop to the router by plugging an  Ethernet patch cable into the yellow LAN port or via Wifi (see the underside of the router for SSID and pwd). 

![alt text](https://i.imgur.com/5BVxd9h.jpg "TP-Link Router")

1.  Navigate to the router dashboard in an Internet browser. The Default IP address is **192.168.0.1** 
    *  Username: **admin**
    *  Password: **admin** 
    
1.  Set up the guest WiFi to “**-NYC Mesh Community WiFi-**” (including the dashes). 
Navigate to “Guest Network” and set as follows:

![alt text](https://i.imgur.com/BXzdita.jpg "Guest Network Configuration Settings")
[Obligations](https://www.nycmesh.net/faq#obligations)

1.  Set up the home WiFi. 
Navigate to Wireless > Basic Settings
to set the home WiFi network SSID you wish to use and  navigate to Wireless > Wireless Security to set the password. 

1.  Replace the router’s admin/admin login with a more secure username and password.
Navigate to System Tools > Password and input a new username and password. 

### Optional TP-Link TL-WR841N Firmware Upgrade
**for volunteer installers**

If you have time you should pre-configure the router as much as possible, including upgrading the firmware to the latest version. To do that the router does not need to be connected to a network. It can be pre-configured following the above steps excluding point 1.

1.  Download the latest firmware file [here](https://www.tp-link.com/us/download/TL-WR841N.html#Firmware).
1.  Connect to **192.168.0.1** and log in with the username and password you set for the router.
1.  Go to System Tools > Firmware Upgrade.
1.  Click Choose File to locate the downloaded firmware file, and click Upgrade.
1.  Setting the time is not a necessity but nice to do. Go to System Tools > Time Settings. You can use [apple NTP](time.apple.com), [pool.org](pool.ntp.org) and/or [Google](time1.google.com).


### Support
**for volunteer installers and DIY installers**

A Quick Installation Guide and User Guide for the TP-Link TL-WR841N router can be downloaded [here](https://www.tp-link.com/us/download/TL-WR841N.html).

