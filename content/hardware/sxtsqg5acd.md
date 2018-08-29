---
layout: default
title: Mikrotik SXTsq G-5acD
category: Hardware
---

The SXTSQ 5acD ( sxtsq ) is a small client access antenna that is 802.11 standards compliant antenna ( and also nstream mikrotik if available ).  
The device was released in early 2018 and is capable of gigabit-level speeds with 80Mhz wide 802.11ac wifi connections.

_Please be sure to see [MikroTik Specifics](/hardware/mikrotikspecifics) for extra info about Mikrotik devices, how to connect, etc._


## Uses

*   [LinkNYC Kiosk connection](/installs/linknyc)
*   Hub node connection ( for standard 802.11ac hubs )


# Device idiosyncrasies

## License 
Mikrotik software usually requires a license, though all Mikrotik devices come with an internal license, which varies with the model.
This antenna comes with a "Level 3" license which technically only allows it to function as a CPE, not an AP. Therefore this device can not be used as a base station.  

## US vs International version
On the positive side, it is a great CPE and can connect to DFS channels ( international version ) and other intersting features such as EAP TTLS authentication.  
As a precaution, this antenna has a US version and an International version. The US version is locked to "united states3" channels which are the non-DFS range.  
The international version also has US settings, but it has two additional "united states" channel selections all for valid legal US channels.  To function on LinkNYC and other DFS networks, the international version is required, but be sure to put it in "united states2" mode before using it.


# Reset
To factory reset an SXTsq, hold down the RouterBOOT reset button (located behind the front panel) during boot time until LED light starts flashing, then release the button to reset RouterOS configuration (total 5 seconds).


# Connecting
The initial IP address out of the box is 192.168.88.1, so set you computer’s local IP to something similar ( 192.168.88.5 ). The username is admin and there is no password.


## Configurations

### LinkNYC Kiosk connection ( encrypted )

LinkNYC kiosks have both an unencrypted and encrypted network available. They function similarly and have the same internet available.  
The encrypted version is using a fancy feature which is marketed as "passpoint" ( an authentication tech that cable internet provider are trying to leverage that allows you to roam across an area with a login ).  
The encrypted network is more secure because no traffic can be sniffed between the kiosk and your CPE. Additionally there is no captive portal, which is a major positive.

The bottom line of passpoint is that it's EAP ( Enterprise Authentication Protocol ) TTLS ( Tunnelled TLS ) which is fancy for saying a login and password.  
To cover all these technical details, there are auto-config profiles that can be deployed to devices such as a phone. Once you login t othe unencrypted network, a captive portal prompts you to click a button, and if your device is supported, download a profile and reconnect to the encryted network.  
Today, only iPhones are supported with the auto-config feature, which is no fun. However, it's technically possible to connect with any capable device if you have the connection profile.
My taking the profile from an iPhone, we can extract the pieces needed to connect a standard antenna such as the sxtsq.

After powering on an sxtsq, configure it as a CPE with routing, NAT, and DHCP on the internal port.
Then, to configure the radio, apply the following lines on the CLI:
( This can be performed graphically, but it may be faster to paste these lines. )

```
/interface wireless security-profiles
add authentication-types=wpa-eap,wpa2-eap eap-methods=eap-ttls-mschapv2 group-ciphers=tkip,aes-ccm mode=dynamic-keys mschapv2-password=5fsOpxER mschapv2-username=anonymous@citybridge.com name=linknyc supplicant-identity=anonymous@citybridge.com tls-mode=dont-verify-certificate unicast-ciphers=tkip,aes-ccm

/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40/80mhz-Ceee country="united states2" default-authentication=no disabled=no frequency=auto security-profile=linknyc ssid="LinkNYC Private" wireless-protocol=802.11

/interface wireless connect-list
add interface=wlan1 security-profile=linknyc ssid="LinkNYC Private" wireless-protocol=802.11
```

Be sure to shutdown the antenna properly the first time to ensure the config is saved. This is not required, but Mikrotik antennas are especially sensitive to being powered off with no proper shutdown.
