---
title: "Configs"
weight: 99
---

**List of devices we use and links to standard configs and firmware**   
  
This doc is in progress. Please add links below to the specific config instructions  

## LiteBeams  
All supernode and hub clients use DHCP for the IP address and use WPA password:nycmeshnet
  
* P2MP (Supernode or hub sectors), [Easy config](#lbe-client)     
* Old detailed config- [sn2](/installs/cpe2)   
* P2P  

## OmniTik    
* [Standard config](#omni)  
* [Old instructions](/hardware/mikrotikomnitik5ac)
    
## SXTsq   
* [Mesh config](#sxtMeshConfig)  
* [Kiosk config](#sxtKioskConfig)  

SXTsq old manual config-   
* [Kiosk client](#sxtKiosk)   
* [OmniTik client](#sxtClient)  
* [Point-to-point](#sxtP2P)   
  
## LiteAC / LBE120 Sector    
* SN and Hub  [Easy config](#liteac)
  
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

All Supernodes and hubs use the same sn2.cfg

First download the [firmware](https://www.ubnt.com/download/airmax-ac/litebeam-ac-gen2/lbe-5ac-gen2) and the [config file](https://configgen.nycmesh.net/?device=LiteBeam5AC&template=sn2.cfg.tmpl)

Plug in LiteBeam to POE and connect via management wifi- SSID- "LBE-5AC-Gen2:...." or "NBE..." (booting turns on wifi for 15 minutes)

Go to https://192.168.172.1 in your browser, click "advanced" to proceed.

Log in with username: ubnt and password: ubnt for a new device (or select upload config!)

Go to Settings>System and select "upload firmware" and choose the WA .bin file you downloaded before

While still in System, scroll down to "upload configuration" and select sn2.cfg file you downloaded before

Check that the device name "nycmesh-lbe-xxxx" matches your node building number e.g. "nycmesh-lbe-1234" (building number is usually the node number)

Click save (twice if necessary)  

To pair with the supernode or hub, go to Settings>Wireless and click the SSID "SELECT..." button. This will do a scan. Click the button next to the best AirMac AC signal. (-80 is bad, -50 is good, -62 is typical) Click "SELECT" and then "SAVE CHANGES" (twice if necessary)

Once this device pairs (numbers appear on dashboard) it will get a different IP address using DHCP. To stay logged in to router, you must use the management wifi!

To disconnect from the LiteBeam dashboard and do a bandwidth test, connect via ethernet and set your network settings to "DHCP" (or "Automatic") and go to [speedtest](http://www.speedtest.net/)

Troubleshooting: If you are unable to log into the LiteBeam, reset it to factory defaults- press and hold the Reset button for more than 10 seconds while the LiteBeam ac is already powered on.

What the config file does: The config file sets DHCP for the IP address, WPA password: nycmeshnet, adds the  building number to the device name, adds the UNMS key for monitoring and sets the SNMP location and contact to "nycmesh".

--- 

### <a name="omni"></a>Standard Omnitik mesh config

**1. Download Latest Firmware and Generate Configuration**

1. Download the latest firmware - see [Mikrotik Firmware](https://docs.nycmesh.net/software/mikrotikfirmware).
2. Generate a configuration file for your node by going to the NYC Mesh configuration generator [Configgen](https://configgen.nycmesh.net/?device=Omnitik5AC&template=rooftop-ospf.rsc.tmpl). Type in the node number and click “Download Config”. For SXTsq config file [see below](#sxtMeshConfig)

**2. Connect to the Router**

1. To connect to the Omnitik wirelessly, find the router’s SSID and connect to it.
2. To connect with a cable, plug one end of a patch cable into the Omnitik’s Port 2 and the other end into your computer’s LAN port. Set your computer to DHCP (automatic) and it will get an address like 192.168.88.xxx.
3. Navigate to the default Mikrotik IP [192.168.88.1](http://192.168.88.1) in your web browser. This will open the Mikrotik GUI.
The default username is admin and there is no password.

**3. Upload Firmware**

1. Open the Mikrotik GUI in your browser.
2. Click “Webfig” in the top right corner.
3. Click “Files” in the left side menu.
4. Click “Choose File” at the top.
5. Navigate to where you saved the firmware, select the file and click “Open”. You will see the file appear in the interface.
6. Wait for the firmware to fully upload (you will see the upload progress in the bottom left corner).
7. Click “System” in the left side menu.
8. Click “Reboot” in the dropdown menu.
9. Click OK when prompted.
10. Wait about one minute for the router to reboot. You will see the computer LED flashing on the router when it is ready.
Refresh your browser to reenter the GUI. If the firmware update was successful, you will see the current firmware version in very small letters and numbers at the top left of the screen.

**4. Upload Configuration**

1. If you are using a Mac or Linux operating system, go into Terminal, navigate to the folder where you’ve saved the config and enter the following command, replacing “rooftop-ospf-####.rsc” with your file’s name.

  ```
scp -o StrictHostKeyChecking=no rooftop-ospf-####.rsc admin@192.168.88.1:flash/
  ```
  
2. If you are using a Windows operating system, go into Command Prompt, navigate to the folder where you’ve saved the config and enter the following command, replacing “rooftop-ospf-####.rsc” with your file’s name. You must download pscp.exe from [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) (64-bit or  32-bit) to the same folder then run:

  ```
pscp -scp rooftop-ospf-####.rsc admin@192.168.88.1:flash/ 
  ```
  
3. If asked “Dangerous Reset anyway?” type in Y and return/enter.
4. Reopen the Mikrotik GUI in your web browser and navigate back to “Files” as described in section 3 above. You should see the config file you just uploaded.
5. Click “System” in the left side menu.
6. Click “Reset Configuration” in the left side menu dropdown. Select:
  * No Default Configuration
  * Run After Reset: flash/nycmesh-omni-####.rsc (click the popup on the right to select this)
7. Click "Reset Configuration"
8. The Omnitik will now reboot. If it plays some beeps, ending with a short tune [Kernkraft 400](https://www.youtube.com/watch?v=gbcG2TI4GBk), the configuration was a success!
9. Port 1 is now a LAN port but still POE IN. Ports 1, 2, 3 and 4 can be used as LAN ports to run cables down to apartments.  
**Port 5 is now a WAN (mesh) port and you can plug a LiteBeam into it.** You can't plug a LiteBeam into other ports with this config!

The Omnitik IP address has changed to a 10.69.x.x address. This is generated from the node number, e.g. for node 1234 the IP address will be 10.69.12.34

**5. Change the Password**

1. Click “System” in the left side menu.
2. Click “Password” in the left side menu dropdown.
3. Type in the standard NYC Mesh password.

---

### <a name="sxtMeshConfig"></a>SXTsq to Omnitik mesh config

You can install an SXTsq to connect to one of our OmniTik routers using OSPF/WDS meshing. The SXTsq is directional so it can reach further distances than an omnidirectional OmniTik.

If you are installing an SXTsq to plug into port 5 of an OmniTik use this [SXTsq config](https://configgen.nycmesh.net/?device=SXTsq5AC&template=sxtsq5ac-wds-ospf.rsc.tmpl)

If you are installing an SXTsq to plug directly into a home router use the [SXTsq "solo" config](https://configgen.nycmesh.net/?device=SXTsq5AC&template=sxtsq5ac-wds-ospf-solo.rsc.tmpl)

Once you have the configgen file you can use the [OmniTik instructions](#omni) on how to install it

---

### <a name="sxtKioskConfig"></a>SXTsq DIY kiosk config
  
For connecting to a kiosk, download this [config file](https://configgen.nycmesh.net/?device=SXTsq5AC&template=sxtsq5ac-kiosk-vpn-ospf.rsc.tmpl)

Once you have the configgen file you can use the [OmniTik instructions](#omni) on how to install it

---

### <a name="sxtKiosk"></a>SXTsq kiosk old manual config

**This config may not work with Windows computers**
  
The following works with a new SXTsq or a reset SXTsq. You must have the "International" version. To reset an SXTsq, hold the reset button for about 5 seconds while the unit is booting and release as soon as green LED starts flashing (to reset RouterOS configuration to defaults).

Connect to the SXTsq via ethernet and DHCP. You will get a 192.168.88.xxx address
  
In the terminal
```
ssh -o StrictHostKeyChecking=no admin@192.168.88.1
```   
Hit return to get the "[admin@MikroTik] >" prompt, and paste this-  
  
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

---

### <a name="liteac"></a>LiteAC 120 sector

---

