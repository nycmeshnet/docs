---
title: "Mikrotik SXTsq G-5acD"
---

The SXTSQ 5acD (sxtsq) is a small client access antenna that is 802.11 standards compliant antenna (and also nstream mikrotik if available).  
The device was released in early 2018 and is capable of gigabit-level speeds with 80Mhz wide 802.11ac wifi connections.


_Please be sure to see [MikroTik Specifics](/hardware/mikrotikspecifics) for extra info about Mikrotik devices, how to connect, etc._

![MikroTik SXTsq 5 ac](/img/hardware/mikrotik_sxtsq5ac.jpg)

Device specs are available at [mikrotik.com](https://mikrotik.com/product/sxtsq_5_ac).



## Uses

*   [LinkNYC Kiosk connection](/installs/linknyc)
*   Hub node connection (for standard 802.11ac hubs such as OmniTik 5AC)


## Device idiosyncrasies

### License 
Mikrotik software usually requires a license, though all Mikrotik devices come with an internal license, which varies with the model.
This antenna comes with a "Level 3" license which technically only allows it to function as a CPE, not an AP. Therefore this device can not be used as a base station.  

### US vs International version
On the positive side, it is a great CPE and can connect to DFS channels ( international version ) and other intersting features such as EAP TTLS authentication.  
Be aware during purchase -- this antenna has a US version and an International version.
The US version is locked to "united states3" channels which are the non-DFS range.  
The international version also has US settings, but it has two additional "united states" channel selections all for valid legal US channels. 

_To function on LinkNYC and other DFS networks, the international version is required, but be sure to put it in "united states2" mode before using it._


## Setting up the device 

### Resetting
To factory reset an SXTsq, hold down the RouterBOOT reset button (located behind the front panel) during boot time until LED light starts flashing, then release the button to reset RouterOS configuration (total 5 seconds).

### Connecting
The initial IP address out of the box is 192.168.88.1, so set you computer’s local IP ([windows](https://web.archive.org/web/20180917053130/https://www.howtogeek.com/howto/19249/how-to-assign-a-static-ip-address-in-xp-vista-or-windows-7/)|[mac](https://web.archive.org/web/20180910092344/http://www.macinstruct.com/node/550) to something similar (e.g. 192.168.88.5), and browse to http://192.168.88.1. The username is admin and there is no password.

  * Be sure to use the "http://" prefix when browsing to the admin panel
  * On some computers you might need to turn off your Wi-Fi to allow the cable to connect


## Configurations

We have a few different configs for the SXTsq. They are all in [hardware/config](../config)

The following is a detailed explanation of the unencrypted config. Please go to [hardware/config](../config) for the VPN config and all of the other configs.

### LinkNYC Kiosk connection ( encrypted )

LinkNYC kiosks have both an unencrypted and encrypted network available. They function similarly and have the same Internet available.

The encrypted version uses a feature marketed as "passpoint" which allows you to roam across an area with a user name and password using [EAP TTLS](https://en.wikipedia.org/wiki/Extensible_Authentication_Protocol#EAP_Tunneled_Transport_Layer_Security_(EAP-TTLS). The encrypted network is more secure because no traffic can be sniffed between the kiosk and your CPE. Another benefit is it skips the captive portal (a webpage that pops up when you connect).

When you login to the LinkNYC unencrypted network, a captive portal prompts you to click a button, and if your device is supported, download a profile and reconnect to the encrypted network. Currently only iPhones are supported with the auto-config feature. However, it's technically possible to connect with any capable device once you have a connection profile. By taking the profile from an iPhone, we can extract the pieces needed to connect a standard antenna such as the sxtsq.

After powering on an sxtsq you should configure it as a CPE with routing, NAT, and DHCP on the internal port.

Then, to configure the radio, apply the following lines on the command line interface (CLI):
(This can be performed using the graphical user interface, but it may be faster to paste these lines.)

```
/interface wireless security-profiles
add authentication-types=wpa-eap,wpa2-eap eap-methods=eap-ttls-mschapv2 group-ciphers=tkip,aes-ccm mode=dynamic-keys mschapv2-password=5fsOpxER mschapv2-username=anonymous@citybridge.com name=linknyc supplicant-identity=anonymous@citybridge.com tls-mode=dont-verify-certificate unicast-ciphers=tkip,aes-ccm

/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40/80mhz-Ceee country="united states2" default-authentication=no disabled=no frequency=auto security-profile=linknyc ssid="LinkNYC Private" wireless-protocol=802.11

/interface wireless connect-list
add interface=wlan1 security-profile=linknyc ssid="LinkNYC Private" wireless-protocol=802.11
```

Be sure to shutdown the antenna properly the first time to ensure the config is saved. This is not required, but Mikrotik antennas are especially sensitive to being powered off with no proper shutdown.
