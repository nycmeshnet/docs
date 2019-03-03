---
title: "Configs"
weight: 99
---

**List of devices we use and links to standard configs and firmware**   
  
This doc is in progress. Please add links below to the specific config instructions   
  
Check out our new [SXTsq VPN kiosk client config](#sxtVpn)!
  
## SXTsq    
* [Kiosk client](#sxtKiosk)   
* [Kiosk client + vpn](#sxtVpn)  
* [OmniTik client](#sxtClient)  
* [Point-to-point](#sxtP2P)   
  
## LiteBeams  
SN1 clients need to have an IP address assigned 192.168.42.xxx
SN2+ and hub clients use DHCP for the IP address and use WPA password:nycmeshnet
  
* SN1 orig config- [Detailed config](/installs/cpe), [Easy config](#lbe-client)     
* SN2+ and hubs [Detailed config](/installs/cpe2), [Easy config](#lbe-client)         
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

## TP-Link N300 (TL-WR841N)  
* [Config](/installs/tp-link/)
  
---  

### <a name="lbe-client"></a>Litebeam client for Supernodes and hubs

All Supernodes and hubs (apart from SN1) use the same sn2.cfg. Supernode 1 has a slightly different config (sn1.cnf) and it also needs an assigned IP address. 

First download the [firmware](https://www.ubnt.com/download/airmax-ac/litebeam-ac-gen2/lbe-5ac-gen2) and the [sn1 config file](/download/sn1.html) and [sn2 config file](/download/sn2.html) and save to a folder for offline use. Also save these instructions (Cmd-S).

Plug in LiteBeam to POE and connect via management wifi- SSID- "LBE-5AC-Gen2:...." or "NBE..." (booting turns on wifi for 15 minutes)

Go to https://192.168.172.1 in your browser, click "advanced" to proceed.

Log in with username: ubnt and password: ubnt for a new device (or select upload config!)

Go to Settings>System and select "upload firmware" and choose the WA .bin file you downloaded before

While still in System, scroll down to "upload configuration" and select sn1.cfg or sn2.cfg file you downloaded before

Change the "nn" device name from lbe-nycmesh-nn to your node number e.g. lbe-nycmesh-1234

For SN1 **only**, Go to Network and change the management IP address (192.168.1.20) to the assigned IP address we have given you (192.168.42.xxx)  

Click save (twice if necessary)  

To pair with the supernode or hub, go to Settings>Wireless and click the SSID "SELECT..." button. This will do a scan. Click the button next to the best AirMac AC signal. (-80 is bad, -50 is good) Click "SELECT" and then "SAVE CHANGES" (twice if necessary)

For SN2+ and hubs, once this device pairs (numbers appear on dashboard) it will get a different management IP address using DHCP. To stay logged in to router, you must use the management wifi!

To disconnect from the LiteBeam dashboard and do a bandwidth test, connect via ethernet and set your network settings to "DHCP" (or "Automatic") and go to [speedtest](http://www.speedtest.net/)

Troubleshooting: If you are unable to log into the LiteBeam, reset it to factory defaults- press and hold the Reset button for more than 10 seconds while the LiteBeam ac is already powered on.

---  

### <a name="sxtKiosk"></a>SXTsq kiosk  

**This config may not work with Windows computers**
  
The following works with a new SXTsq or a reset SXTsq. You must have the "International" version. To reset an SXTsq, hold the reset button for about 5 seconds while the unit is booting and release as soon as green LED starts flashing (to reset RouterOS configuration to defaults).

Connect to the SXTsq via ethernet and DHCP. You will get a 192.168.88.xxx address
  
In the terminal
```
ssh -o StrictHostKeyChecking=no admin@192.168.88.1
```   
Say 'yes' to the warning and paste this-  
  
```  
/interface wireless security-profiles  
add authentication-types=wpa-eap,wpa2-eap eap-methods=eap-ttls-mschapv2 group-ciphers=tkip,aes-ccm mode=dynamic-keys mschapv2-password=5fsOpxER mschapv2-username=anonymous@citybridge.com name=linknyc supplicant-identity=anonymous@citybridge.com tls-mode=dont-verify-certificate unicast-ciphers=tkip,aes-ccm  
  
/interface wireless  
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40/80mhz-Ceee country="united states2" default-authentication=no disabled=no frequency=auto security-profile=linknyc ssid="LinkNYC Private" wireless-protocol=802.11  
  
/interface wireless connect-list  
add interface=wlan1 security-profile=linknyc ssid="LinkNYC Private" wireless-protocol=802.11  
  
```  
  
This script automatically connects the SXTsq to the private LinkNYC Kiosk channel. No login is required.  
  
  ---  
  
### <a name="sxtVpn"></a>SXTsq Kiosk + VPN  

[About VPN](/networking/vpn)

**We're currently having problems with this config. It allows Windows computers to connect but introduces another problem ith L2TP/IPSEC and the way the kiosks assign public IP addresses. Help us solve this if you can!**

This adds a VPN to the configuration so you will be connected to the mesh network over a virtual private network.  This bypasses any possible privacy issues of using the kiosk. This will limit your connection to around 100Mbps (still fast) but could go faster as the router cpu must work harder to encrypt the data for a VPN connection. It's a limitation of the hardware, SXT in this case, not of the vpn.
  
The following works with a new SXTsq or a reset SXTsq. You must have the "International" version. To reset an SXTsq, hold the reset button for about 5 seconds while the unit is booting and release as soon as green LED starts flashing (to reset RouterOS configuration to defaults).
  
Connect to the SXTsq via ethernet and DHCP. You will get a 192.168.88.xxx address
  
In the terminal
```
ssh -o StrictHostKeyChecking=no admin@192.168.88.1
```   
Say 'yes' to the warning and paste this-  
```
# SXT to Kiosk Private
/interface wireless security-profiles
add authentication-types=wpa-eap,wpa2-eap eap-methods=eap-ttls-mschapv2 \
group-ciphers=tkip,aes-ccm mode=dynamic-keys mschapv2-password=5fsOpxER \
mschapv2-username=anonymous@citybridge.com name=linknyc \
supplicant-identity=anonymous@citybridge.com tls-mode=\
dont-verify-certificate unicast-ciphers=tkip,aes-ccm
/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=\
20/40/80mhz-Ceee country="united states2" default-authentication=no \
disabled=no frequency=auto security-profile=linknyc ssid=\
"LinkNYC Private" wireless-protocol=802.11
/interface wireless connect-list
add interface=wlan1 security-profile=linknyc ssid="LinkNYC Private" \
wireless-protocol=802.11
  
# VPN to NYCMEsh
/interface l2tp-client
add connect-to=199.167.59.6 disabled=no ipsec-secret=nycmeshnet \
keepalive-timeout=disabled max-mtu=1300 name="NYCMESH l2tp-out1" \
password=nycmeshnet use-ipsec=yes user=nycmesh
/ip neighbor discovery-settings
set discover-interface-list=LAN
/interface list member
add interface="NYCMESH l2tp-out1" list=WAN
  
# DHCP-Client setup and lease script
/ip dhcp-client
set add-default-route=no comment=defcon dhcp-options=hostname,clientid disabled=no interface=wlan1 use-peer-dns=no script=":local currentGateway [/ip dhcp-client\
\_get [/ip dhcp-client find status=bound ] gateway ]\
\n:local count [/ip route print count-only where comment=\"NYCMeshVPN\" ]\
\n:if ( \$count = 0 ) do={/ip route add gateway=\$currentGateway dst-addre\
ss=199.167.59.6/32 comment=NYCMeshVPN } else={\
\n:if ( \$count = 1) do={:local champ [ /ip route find where comment=\"NYC\
MeshVPN\" ] \
\n:if ([/ip route get \$champ gateway] != \$currentGateway) do={/ip route \
set \$champ gateway=\$currentGateway }\
\n}\
\n}" number=0
  
# DNS Firewall NAT
/ip dns
set allow-remote-requests=yes servers=10.10.10.10,8.8.8.8
/ip firewall address-list
add address=10.0.0.0/8 list=mesh
add address=199.167.59.0/24 list=mesh
add address=192.168.88.0/24 list=mesh
/ip firewall filter
add action=drop chain=input comment="drop all not coming from mesh" src-address-list=!mesh 
/ip firewall nat
add action=masquerade chain=srcnat comment="defconf: masquerade" ipsec-policy=out,none out-interface="NYCMESH l2tp-out1"
/ip route
add comment="New default" distance=1 gateway=10.70.72.1
/system clock
set time-zone-name=America/New_York
  
```
replace 1111 by your node number.
```
/system identity
set name=n1111-sxt-0
  
```
  

---  
### <a name="sxtClient"></a>SXTsq Client    
  
  
Set your computer to connect using DHCP ("automatic" on PC)  
Connect via ethernet and you will get an address like 192.168.88.xxx
  
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
  
  ---  
  
### <a name="sxtP2P"></a>SXTsq Point-to-Point  (PtP)  
  
  
  The following works with two new SXTsq or a reset SXTsq. To reset an SXTsq, hold the reset button for about 5 seconds while the unit is booting and release as soon as green LED starts flashing (to reset RouterOS configuration to defaults). It is recommended to update the firmware of your SXTsq to the latest. The under has been tested with firmware v.6.43.12
  
  One of the SXT will act as an "AP" but can be associated to only one "client". The second SXT will be the "client".
  
  After the configuration there will be no DHCP Server or Client, thus you will need to configure your laptop IP mannually in the same network range, for exemple  192.168.88.11
  
The SXT-AP and SXT-Client port address will be change in order to not interfere with another potential SXT default IP.  
- AP will be ether1:  192.168.88.2  and bridge1:  192.168.88.3  
 - Client will be ether1:  192.168.88.4  and bridge1:  192.168.88.5  
 
Connect to the SXTsq via ethernet and DHCP. You will get a 192.168.88.xxx address



In the terminal
  ```
ssh -o StrictHostKeyChecking=no admin@192.168.88.1
  ```   
Say 'yes' to the warning and paste this for the SXT-AP-
  
  ```
# Feb 25th 2019 for RouterOS 6.43.12
# model = RBSXTsqG-5acD

# SXT PtP / This is the AP 

# Set the SXT Identity
/system identity
set name="sxt ptp ap"

#add security profile (to secure wifi connection login) and SSID
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
add authentication-types=wpa-psk,wpa2-psk management-protection=allowed mode=\
dynamic-keys name=sxt-ap supplicant-identity="SXT PtP AP" \
wpa-pre-shared-key=nycmeshnet wpa2-pre-shared-key=nycmeshnet

#set the wireless (wlan1) to USA 2 and the proper band
/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=\
20/40/80mhz-Ceee country="united states2" disabled=no mode=bridge \
security-profile=sxt-ap ssid=nycmesh-nn-sxtptp

# disable the NAT and disable all the firewall filters
/ip firewall nat
set numbers=0 disabled=yes

/ip firewall filter
set numbers=1 disabled=yes
set numbers=2 disabled=yes
set numbers=3 disabled=yes
set numbers=4 disabled=yes
set numbers=5 disabled=yes
set numbers=6 disabled=yes
set numbers=7 disabled=yes
set numbers=8 disabled=yes
set numbers=9 disabled=yes
set numbers=10 disabled=yes

# disable the dhcp-client and server
/ip dhcp-client
set [find interface=wlan1 ] disabled=yes
/ip dhcp-server
set [find interface=ether1] disabled=yes

#add a bridge and add port ether1 and wlan1 (switch)
/interface bridge
add name=bridge1
/interface bridge port
add bridge=bridge1 interface=ether1
add bridge=bridge1 interface=wlan1

#change IP address of the "sxt ptp client" to not mix with potential other SXT default IP address
/ip address
add address=192.168.88.3/24 interface=bridge1 network=192.168.88.0
set [ find interface=ether1] address=192.168.88.2/24

  ```  
  
  Say 'yes' to the warning and paste this for the SXT-Client-
  
  ```
# Feb 25th 2019 for RouterOS 6.43.12 
# model = RBSXTsqG-5acD 

# SXT PtP / This is the Client 

# Set the SXT Identity
/system identity
set name="sxt ptp client"

#add security profile (to secure wifi connection login)
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa-psk,wpa2-psk group-ciphers=\
tkip,aes-ccm mode=dynamic-keys supplicant-identity=MikroTik \
unicast-ciphers=tkip,aes-ccm wpa-pre-shared-key=nycmeshnet \
wpa2-pre-shared-key=nycmeshnet
/interface wireless security-profiles
add authentication-types=wpa-psk,wpa2-psk group-ciphers=tkip,aes-ccm \
management-protection=allowed mode=dynamic-keys name=sxt-ap \
supplicant-identity="sxt ptp client" unicast-ciphers=tkip,aes-ccm \
wpa-pre-shared-key=nycmeshnet wpa2-pre-shared-key=nycmeshnet


#set the wireless (wlan1) to USA 2 and the proper band.
/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=\
20/40/80mhz-Ceee country="united states2" disabled=no frequency=auto \
mode=station-bridge security-profile=sxt-ap ssid=nycmesh-nn-sxtptp

/interface wireless connect-list
add interface=wlan1 security-profile=sxt-ap ssid=nycmesh-nn-sxptp

# disable the NAT and disable all the firewall filters
/ip firewall nat
set numbers=0 disabled=yes

/ip firewall filter
set numbers=1 disabled=yes
set numbers=2 disabled=yes
set numbers=3 disabled=yes
set numbers=4 disabled=yes
set numbers=5 disabled=yes
set numbers=6 disabled=yes
set numbers=7 disabled=yes
set numbers=8 disabled=yes
set numbers=9 disabled=yes
set numbers=10 disabled=yes

# disable the dhcp-client and server
/ip dhcp-client
set [find interface=wlan1 ] disabled=yes
/ip dhcp-server
set [find interface=ether1] disabled=yes

#add a bridge and add port ether1 and wlan1 (switch)
/interface bridge
add name=bridge1
/interface bridge port
add bridge=bridge1 interface=ether1
add bridge=bridge1 interface=wlan1

#change IP address of the "sxt ptp client" to not mix with potential other SXT default IP address
/ip address
add address=192.168.88.5/24 interface=bridge1 network=192.168.88.0
set [ find interface=ether1] address=192.168.88.4/24

  ```  
  
  
  
