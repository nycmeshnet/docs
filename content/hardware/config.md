---
title: "Configs"
weight: 99
---

**List of devices we use and links to standard configs and firmware**   

This doc is in progress. Please add links below to the specific config instructions  

**Important**: Note that we use a **Network Number** (or **NN**) from now on to configure devices. The **Network Number** is not the Install Number (or request number) you received when registering.  You can find out your **NN** using your Install Number (request number) received by email when you registered. To find out what is your NN please see [Network Number](/installs/nn/)

## LiteBeam / LiteBeam-LR
All supernode and hub clients use DHCP for the IP address and use WPA password:nycmeshnet

* [LiteBeam Standard config](#lbe-client) (P2MP to connect to Supernode or hub sectors)
* Old detailed config- [sn2](/installs/cpe2)   
* P2P  

## OmniTik
* [Standard config](#omniTerm)
* [WinBox method](#omniWinbox)
* [General info](/hardware/mikrotikomnitik5ac)

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

### <a name="lbe-client"></a>LiteBeam client for Supernodes and hubs with sectors

First, download the `WA` [firmware](../../firmware/ubiquiti) in case your LiteBeam is running an outdated version. We currently use 8.7.1 and 8.7.4 in our network depending on the location. Do not use 8.7.5 and newer as there are bugs that break connectivity after several days.

Second, download the config file for either a standard [LiteBeam](https://configgen.nycmesh.net/?version=v4.5&device=LiteBeam5AC&template=lbeGen2-8_7_1.cfg.tmpl) or [LiteBeam LR](https://configgen.nycmesh.net/?version=v4.5&device=LiteBeamLR). You will need your network number which is obtained by entering your Install Number below (you should have received this your email after completing the [join form](https://nycmesh.net/join)). If `error: no address for ****` is displayed, please reach out to us on [Slack](https://slack.nycmesh.net) at #install or via [email](mailto:install@nycmesh.net) to register your installation. If `Sorry, unable to open the file at this time
` is displayed, try using Incognito Mode or Private Browsing.

<form action="https://script.google.com/macros/s/AKfycbzYLzA7LSoTsXXaPKaKCXI2ZEviYvSjQloMurzW4w3LkuykewOSaVR6__ZL7P7VD1Bm/exec">
  <label for="installnum">Install Number:</label>
  <input type="hidden" id="method" name="method" value="nn">
  <input type="hidden" name="format" value="1" />
  <input type="number" id="id" name="id" min="1" max="100000">
  <input type="submit" value='Get Network Number'>
  <button type="button" onclick="window.location.href='/installs/nn/'">More Information</button>
  <input type="hidden" name="format" value="1" />
</form>

Plug in LiteBeam to PoE and connect via management wifi- SSID- "LBE-5AC-Gen2:...." or "NBE..." (booting turns on wifi for 15 minutes)

Go to [https://192.168.172.1](https://192.168.172.1) in your browser if your device does not automatically redirect you. You may be met with a warning due to a self-signed security certificate, which you can bypass.

At the "Please Set Up Your Device" prompt, select `United States` under Country and `English` under language. Select the Terms of Use checkbox and click `Upload Backup Configuration`. Chose the `.cfg` file you downloaded from Configgen.

You will see a prompt on the top-right corner of the screen saying `Configuration backup file uploaded.` Select `Apply` and wait a minute for the page to reload. Sometimes you will have to refresh the page to get back into the interface.

The username/password will be changed. Please mention your network number and that you’re looking for the new credentials on Slack in `#diy-install-support`, and they will be sent to you. **Please do not share them publicly!**

To pair with the supernode or hub, go to Settings>Wireless and click the SSID "SELECT..." button. This will do a scan. Click the button next to the best AirMac AC signal. (-80 is bad, -50 is good, -62 is typical) Click "SELECT" and then "SAVE CHANGES" (twice if necessary)

**Troubleshooting:** If you are unable to log into the LiteBeam, reset it to factory defaults- press and hold the Reset button for more than 10 seconds while the LiteBeam is already powered on.

What the config file does: The config file sets DHCP for the IP address, WPA password: nycmeshnet, adds the building number to the device name, adds the UNMS key for monitoring and sets the SNMP location and contact to "nycmesh".

---

### <a name="omniTerm"></a>Standard Omnitik mesh config

**1. Download Stable Firmware and Generate Configuration**

**Don't use version 7** of firmware. It won't work! Use 6.47.x

==> You will need your **Network Number** or **NN**. You can find out your NN using your Install Number (request number) received by email when you registered. To find out what is your NN please see [Network Number](/installs/nn/)

1. Download the latest stable v6 firmware - see [Mikrotik Firmware](https://docs.nycmesh.net/software/mikrotikfirmware).
2. Generate a configuration file for your Network Number by going to the NYC Mesh configuration generator.  [Configgen](https://configgen.nycmesh.net/?device=Omnitik5AC&template=rooftop-ospf.rsc.tmpl). Type in the network number and click “Download Config”. For SXTsq config file [see below](#sxtMeshConfig)

**2. Connect to the Router**

1. To connect to the Omnitik wirelessly, find the router’s SSID and connect to it. (For SXTsq connect via cable)  
2. To connect with a cable, plug one end of a patch cable into the Omnitik’s Port 2 and the other end into your computer’s LAN port. Set your computer to DHCP (automatic) and it will get an address like 192.168.88.xxx.
3. Navigate to the default Mikrotik IP [192.168.88.1](http://192.168.88.1) in your web browser. This will open the Mikrotik GUI.
The default username is admin and there is no password.

**3. Upload Firmware**

1. Open the Mikrotik GUI in your browser.
2. Click “Webfig” in the top right corner.
3. Click “Files” in the left side menu.
4. Click “Choose File” at the top.
5. Navigate to where you saved the firmware, select the file and click “Open”. You will see the file appear in the interface.
6. Wait for the firmware to fully upload (you will see the upload progress in the bottom left corner). This firmware will automatically be installed when you reboot with the new configuration (see next section).

**4. Upload Configuration**

1. If you are using a Mac or Linux operating system, go into Terminal, navigate to the folder where you’ve saved the config and enter the following command:

  ```
scp -o StrictHostKeyChecking=no rooftop-ospf.rsc admin@192.168.88.1:flash/
  ```

2. If you are using a Windows operating system, go into Command Prompt, navigate to the folder where you’ve saved the config and enter the following command. You must download pscp.exe from [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) (64-bit or  32-bit) to the same folder then run:

  ```
pscp -scp rooftop-ospf.rsc admin@192.168.88.1:flash/
  ```

3. If asked “Dangerous Reset anyway?” type in Y and return/enter.
4. Reopen the Mikrotik GUI in your web browser and navigate back to “Files” as described in section 3 above. You should see the config file you just uploaded.
5. Click “System” in the left side menu.
6. Click “Reset Configuration” in the left side menu dropdown. Select:
  * No Default Configuration
  * Run After Reset: flash/rooftop-ospf.rsc (click the popup on the right to select this)
7. Click "Reset Configuration"
8. The Omnitik will now reboot (and install new firmware if you uploaded it). If it plays some beeps, ending with a short tune [Kernkraft 400](https://www.youtube.com/watch?v=gbcG2TI4GBk), the configuration was a success!

The Omnitik IP address has changed to a 10.69.x.x address. This is generated from the network number, e.g. for network number 1234 the IP address will be 10.69.12.34

**5. Change the Password**

1. Click “System” in the left side menu.
2. Click “Password” in the left side menu dropdown.
3. Type in the standard NYC Mesh password.

**6. Force on POE for a LiteBeam**

A typical install also has a LiteBeam on port 5 that is powered from the OmniTik. To do this you must-

1. Go to Webfig>interfaces>ether5
2. Change "POE Out" to "forced on"

Other devices can be powered from other ports if you change this setting

---

### <a name="omniWinbox"></a>OmniTik mesh config with WinBox

You can configure OmniTik routers and all MikroTik equipment with their WinBox software and associated app.

**1. Download WinBox and other files**

First you will need to download a WinBox-compatible client to configure the OmniTik.

<details>
<summary>Windows</summary>

On the [MikroTik website](https://mikrotik.com/download), you can navigate to the WinBox button to download the version of WinBox that suits your computer.

</details>

<details>
<summary>macOS</summary>

Joshaven Potter has complied a version of WinBox with Wine which you can download [from their website](https://joshaven.com/resources/tools/winbox-for-mac/) and run without any additional configuration.

</details>

<details>
<summary>Android</summary>

The MikroTik Pro app uses the same WinBox protocol to upload files and configure your router without a computer. You can download it from the [Play Store](https://play.google.com/store/apps/details?id=com.mikrotik.android.tikapp).

</details>

<details>
<summary>iOS</summary>

The MikroTik app uses the same WinBox protocol to upload files and configure your router without a computer. You can download it from the [App Store](https://apps.apple.com/app/id1323064830).

</details>

Next you need to download new firmware from the [MikroTik website](https://mikrotik.com/download). In the RouterOS table, find the `MIPSBE` section and click on the floppy icon that corresponds with the "Main package" and "Stable" categories. You should see the downloaded file named `routeros-mipsbe-***.npk`.

Lastly you will need to download the network configuration specific to your location. After completing the [join form](https://nycmesh.net/join) you should have received an email containing your Install Number. Enter this number below. If `error: no address for ****` is displayed, please reach out to us on [Slack](https://slack.nycmesh.net) at #install or via [email](mailto:install@nycmesh.net) to register your installation. If `Sorry, unable to open the file at this time
` is displayed, try using Incognito Mode or Private Browsing.

<form action="https://script.google.com/macros/s/AKfycbzYLzA7LSoTsXXaPKaKCXI2ZEviYvSjQloMurzW4w3LkuykewOSaVR6__ZL7P7VD1Bm/exec">
  <label for="installnum">Install Number:</label>
  <input type="hidden" id="method" name="method" value="nn">
  <input type="hidden" name="format" value="1" />
  <input type="number" id="id" name="id" min="1" max="100000">
  <input type="submit" value='Get Network Number'>
  <button type="button" onclick="window.location.href='/installs/nn/'">More Information</button>
  <input type="hidden" name="format" value="1" />
</form>

Once you have your Network Number, go to the [Configgen utility](https://configgen.nycmesh.net/?device=Omnitik5AC&template=rooftop-ospf.rsc.tmpl) and enter the number into the "network_number" field and click "Download Config". You should see the downloaded file named `rooftop-ospf.rsc`. If the file has a `.csv` extension, rename the file to remove the extension so that it ends in `.rsc`.

**2. Connect to the router**

You can connect to the router using an Ethernet cable or through Wi-Fi. There are caveats to both, but configuring wirelessly is the easiest to do when doing the install outside.

<details>
<summary>Wired</summary>

Assuming your Ethernet adapter is setup to get an IP from the router using DHCP (probably default), all you have to do is plug an Ethernet cable from your computer to a Port 2-4 on the router.

Do NOT plug the computer into the PoE injector (Port 1) as the default configuration blocks all inbound connections to this port, including WinBox.

Do NOT plug the computer into Port 5, as we may be configuring this later to do PoE-Out which will damage any devices plugged in here that are not expecting power.

</details>

<details>
<summary>Wireless</summary>

Assuming your Wi-Fi adapter is setup to get an IP from the router using DHCP (probably default), all you have to do is look for a network in your Wi-Fi settings named `MikroTik-xxxxx`. This network will only appear after the router has fully powered on (two short beeps).

If you are on a phone, sometimes you will have to turn off your Mobile data/turn on airplane mode in order to reach the router that technically does not have any internet yet.

</details>

Make sure any VPN software you have is disabled at this point, as it will likely block any connections to the router.

From your WinBox software, find the "Neighbors" tab on the lower-half of the screen. On the MikroTik app, click on the "Discover" tab. You should see an entry on the list with Identity `MikroTik`. If you do not see anything, click "Refresh" or swipe down to rescan for devices. Double-check your connections and confirm you are getting an IP from the router (will be in the `192.168.88.***` range).

Double-click or tap on the entry to load the IP into the software. On the App, you will be prompted to select either MAC or IP; select IP. Now, the default login `admin/[no password]` will be displayed and you can hit "Connect".

You will get a prompt saying "RouterOS Default Configuration". Hit OK to get out of here (do NOT remove configuration or use quick setup). Now for the fun part.

**3. Upload the configuration**

On the sidebar (hamburger menu on mobile), click Files. Here is where we will upload those files from earlier.

From your WinBox software, drag and drop the `routeros-mipsbe-***.npk` file into the blank space in the window. You should see the file transfer take a few seconds before it finishes. Next, drag and drop the `rooftop-ospf.rsc` file onto the flash folder. You should see the uploaded file labeled `flash/rooftop-ospf.rsc`.

From your phone, hit the upload arrow button on the bottom-left of the screen and select the `routeros-mipsbe-***.npk` file. You can save as the original name and hit OK. You should see the file transfer take a few seconds before it finishes. Next, do the same with the rooftop-ospf.rsc file, but this time make sure you prepend the file name with `flash/` and hit OK. You should see the uploaded file labeled `flash/rooftop-ospf.rsc`.

**4. Flash the config and party**

On the sidebar (back button on mobile), click "System". Find the "Reset Configuration" option. Select the "No Default Configuration" checkbox, and under "Run After Reset", use the arrows to drop down the menu to reveal the files. Select `flash/rooftop-ospf.rsc`, and finally hit "Reset Configuration". The software will now disconnect and nothing will happen for a while; the router is upgrading the firmware. After you hear the two beeps and some music the configuration is complete.

**5. Confirm settings and configuration**

WinBox will inform you that the router has been disconnected. Hit Cancel. If you are connecting wirelessly, look in your Wi-Fi settings for `nycmesh-****-omni`. Connect to that wireless network with the password `nycmeshnet`. If you are connecting via Ethernet, you can test this on another device to make sure the Wi-Fi is working correctly. If you are not planning on adding devices or changing the configuration further, you are done! 🎉

If you are planning on connecting a LiteBeam to your router or just want to learn about the configuration, go back to "Neighbors" or "Discover" depending on your platform; you should see an entry on the list with Identity "nycmesh-****-omni". Login to it like before.

On the sidebar (hamburger on mobile), click "Interfaces" (then "Ethernet" on mobile). Double-click or tap on `ether5`. Click on the PoE tab, and change the "PoE Out" drop-down from `auto on` to `forced on`. Hit OK or the checkmark button on mobile. This improves reliability for connected PoE devices.


---

### <a name="sxtMeshConfig"></a>SXTsq to Omnitik mesh buggy config!

**You will need to edit the config. [Please see this bug](https://github.com/nycmeshnet/nycmesh-configgen/issues/9)**

The extra lines are specifically-  
installation=any  
before the  
frequency=5180   

You can install an SXTsq to connect to one of our OmniTik routers using OSPF/WDS meshing. The SXTsq is directional so it can reach further distances than an omnidirectional OmniTik.
<br/> <br/> 
==> You will need your **Network Number** or **NN**. You can find out your NN using your Install Number (request number) received by email when you registered. To find out what is your NN please see [Network Number](/installs/nn/)

If you are installing an SXTsq to plug into port 5 of an OmniTik use this [SXTsq config](https://configgen.nycmesh.net/?device=SXTsq5AC&template=sxtsq5ac-wds-ospf.rsc.tmpl)

**You will need to edit the config. [Please see this bug](https://github.com/nycmeshnet/nycmesh-configgen/issues/9)**

If you are installing an SXTsq to plug directly into a home router use the [SXTsq "solo" config](https://configgen.nycmesh.net/?device=SXTsq5AC&template=sxtsq5ac-wds-ospf-solo.rsc.tmpl)

**You will need to edit the config. [Please see this bug](https://github.com/nycmeshnet/nycmesh-configgen/issues/9)**

Once you have the configgen file you can use the [OmniTik instructions](#omni) on how to install it

---

### <a name="sxtKioskConfig"></a>SXTsq DIY kiosk config

The LinkNYC kiosks use [DFS channels](https://en.wikipedia.org/wiki/Dynamic_frequency_selection) which although legal and FCC approved aren't supported in some USA versions of hardware.
<br/> <br/> 
==> You will need your **Network Number** or **NN**. You can find out your NN using your Install Number (request number) received by email when you registered. To find out what is your NN please see [Network Number](/installs/nn/)

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
"n<your-network-id>-<device-type>-<index>". So if your network id is 1000, your device name could be: n1000-sxt-0  

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
Use the name you used for your device, plus the name of the access point to generate the correct URL. For example if your network id is 1000 and the hub id is 500, the URL would be:  
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

### <a name="liteac"></a>LiteAP 120 sector


Connect to the LiteAP GUI.  Upgrade the firmware

In Wireless set:<br>
- Wireless mode to **Access Point PtMP airmax AC** <br>
- SSID  "nycmesh-xxxx-direction" (for exemple: nycmesh-1635-east) <br>
- channel width  40 Mhz <br>
- Control Freq.  ON <br>
    Select all freq. and uncheck from 5565 to 5705 (5565 and 5705 included)  
    (This is extremely **important**, due to FCC regulations in NY we need to make sure to not use any channel overlapping 5590 - 5677)<br>
- choose a center freq. different then other local antenna (sector, litebeam, powerbeam, etc ...)<br>
- Wireless Security: WPA security personal  /  Preshared key: nycmeshnet <br>
- TDD framing: Flexible  (or Flexibe (new) depending on firmware)<br>
- ReSE ON <br>
- Advance:  Isolation ON <br>

In Network set:<br>
 - DHCP  and fallback IP 192.168.1.20
 
 In Services:<br>
  - Add UNMS key

In System set:<br>
  - Device name: same as SSID<br>
  - turn NTP server ON<br>
  - Set the time zone<br>
  
  <br><br>



---
