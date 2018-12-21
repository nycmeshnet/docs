---
title: "Configs"
weight: 99
---

**List of devices we use and links to standard configs and firmware**   
  
This doc is in progress. Please add links below to the specific config instructions   
  
**What is immediately needed is an [SXTsq VPN kiosk client config](#sxtVpn)**  
  
We also need a simple way to log into cpe through a omnitik or edgepoint BGP config  
  
## SXTsq    
* [Kiosk client](#sxtKiosk)   
* [Kiosk client + vpn?](#sxtVpn)  
* [OmniTik client](#sxtClient)  
* [Point-to-point](#sxtP2P)   
  
## LiteBeams  
SN1 clients need to have an IP address assigned 192.168.42.xxx
SN2+ and hub clients use DHCP for the IP address and use WPA password:nycmeshnet
  
* SN1 orig config- [Detailed config](/installs/cpe), [Easy config](#sn1)     
* SN2+ and hubs [Detailed config](/installs/cpe2), [Easy config](#sn2)         
* P2P    
  
## LiteAC / LBE120 Sector    
* SN and Hub  
  
## OmniTik    
* BGP/WDS    
* Simple hub  
  
## EdgePoint    
* Switch    
* BGP    
  
## NanoStation NSM5    
* Dan Grinkevich image (qMp/bmx6/tinc)    
* Joachim’s image (LEDE/bmx6)  

## TPLink TL-WR841N  
  
---  

### <a name="sn1"></a>Litebeam client SN1 

First update the firmware on the LiteBeam or NanoBeam.  

When it relaunches "upload backup configuration" with this file-  

[download SN1 config file](/download/sn1.html)

Change the management IP address 192.168.1.20 to the assigned IP address we have given you (192.168.42.xxx)    

Change the "nn" device name from lbe-nycmesh-nn to your node number e.g. lbe-nycmesh-1234  
 
Click save (twice if necessary)  

### <a name="sn2"></a>Litebeam client SN2, 3, 4, and hubs 

First update the firmware on the LiteBeam or NanoBeam.  
When it relaunches "upload backup configuration" with this file-  

[download SN2+ hub config file](/download/sn2.html)

Change the "nn" device name from lbe-nycmesh-nn to your node number e.g. lbe-nycmesh-1234

Click save (twice if necessary)  

### <a name="sxtKiosk"></a>SXTsq kiosk  
  
The following works with a new SXTsq or a reset SXTsq. You must have the "International" version. To reset an SXTsq, hold the reset button for 10 seconds while the unit is running  
  
In the terminal-
```ssh admin@192.168.88.1```   
and paste this-  
  
```  
/interface wireless security-profiles  
add authentication-types=wpa-eap,wpa2-eap eap-methods=eap-ttls-mschapv2 group-ciphers=tkip,aes-ccm mode=dynamic-keys mschapv2-password=5fsOpxER mschapv2-username=anonymous@citybridge.com name=linknyc supplicant-identity=anonymous@citybridge.com tls-mode=dont-verify-certificate unicast-ciphers=tkip,aes-ccm  
  
/interface wireless  
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40/80mhz-Ceee country="united states2" default-authentication=no disabled=no frequency=auto security-profile=linknyc ssid="LinkNYC Private" wireless-protocol=802.11  
  
/interface wireless connect-list  
add interface=wlan1 security-profile=linknyc ssid="LinkNYC Private" wireless-protocol=802.11  
  
```  
  
This script automatically connects the SXTsq to the private LinkNYC Kiosk channel. No login is required.  
  
### <a name="sxtVpn"></a>SXTsq VPN  
  
Lots of requests for this!  



  
### <a name="sxtClient"></a>SXTsq Client    
  
  
Assign a static IP to the computer you connect from  
IP address: 192.168.88.5  
subnet mask: 255.255.255.0  
  
  
**Reset**  
press the reset button WHILE powering on the unit by plugging in the POE cable.  
Once one of the LEDs begins to flash white/blue (about 5 seconds), release reset button while it's flashing. After one minute the device will be ready  
  
**Connect to GUI**  
open your browser and connect to http://192.168.88.1/  
default username: admin  
default password: (leave empty)  
Click the button that says "Webfig" in the top right  
  
**Name the device**   
system > identity  
"n<your-node-id>-<device-type>-<index>". So if your node id is 1000, your device name could be: n1000-sxt-0  
  
**Set a password**  
System > password  
IMPORTANT: You must use a unique and strong (at least 8 characters, the longer the better) password to ensure the security of your device!  

**IP > Services**  
- Disable telnet  
- Disable ftp  
- Consider disabling the api and winbox services if you will not be using them.  

Other security precautions to consider
https://wiki.mikrotik.com/wiki/Manual:Securing_Your_Router

  
**IP > firewall**  
Find and disable this input rule:  
4  
;;; defconf: drop all not coming from LAN  
  
**Bridge**  
- add new  
set Protocol Mode to "none"  
- hit apply and OK  
  
**IP > DHCP Server**  
disable by clicking the small [D] button  
  
**IP > DHCP Client**  
- change Interface to bridge1  
- hit apply and OK  
  
**Wireless > security profiles (tab)**   
add new  
name: nycmeshnet  
uncheck wpa psk  
leave wpa2 psk checked  
write in wpa2 Pre-Shared-Key field: nycmeshnet  
apply and ok  
  
**Wireless > wlan1**  
Set mode to station-bridge  
Set SSID of the hub you want to connect to e.g. nycmesh-xxx   
Set channel width to 20/40/80MHz XXXX  
Set frequency to auto  
Set security profile to nycmeshnet  
(below only if you have SXT international version)  
Click Advanced Mode button at top  
Scroll down and set country drop down to united states   
  
When all settings are correct and the station connects the status should change from "searching for network" to "connected to ess".  
  
**Bridge > Ports**   
Add new, set interface to ether1, set bridge to bridge1  
Add new, set interface to wlan1, set bridge to bridge1  
  
**IP  > Addresses**   
- Add new, set address to 192.168.88.1/24 set interface to bridge1
- Delete entry 192.168.88.1/24 on interface ether1

**Change your computer network settings back to automatic or DHCP**  
(Note you must be connected to the access point to proceed beyond this point)
  
**Access GUI via routable IP address**  
Use the name you used for your device, plus the name of the access point to generate the correct URL. For example if your node id is 1000 and the hub id is 500, the URL would be:  
http://n1000-sxt-0.n500.mesh/  

**Update (2 step process)**   
1. system > packages  
- enable ipv6   
- update / reboot  
2. system > routerboard > update  
Reboot  
  
  
### <a name="sxtP2P"></a>SXTsq Point-to-Point  
  
?  
  
 
  
  
  
  
  
  
  
  
  
  
  
  
  
