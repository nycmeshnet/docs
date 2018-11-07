---
title: "Configs"
weight: 99
---

**List of devices we use and links to standard configs and firmware** 

This doc is in progress. Please add links below to the specific config instructions 

**What is immediately needed is are SXTsq configs for omni client and also vpn kiosk client**

We also need a simple way to log into cpe through a omnitik or edgepoint BGP config

## SXTsq  
* [Kiosk client](#sxtKiosk) 
* [Kiosk client + vpn?](#sxtVpn)
* [OmniTik client?](#sxtClient)
* [Point-to-point](#sxtP2P) 

## LiteBeams  
* SN1 192.168.42.x orig config  
* SN2 (WPA: nycmeshnet)  
* Hub configs  
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

---

### <a name="sxtKiosk"></a>SXTsq kiosk

The following works with a new SXTsq or a reset SXTsq. To reset an SXTsq, hold the reset button for 10 seconds while the unit is running

ssh into 192.168.88.1 and paste this-

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

DHCP server?

### <a name="sxtClient"></a>SXTsq Client

?

### <a name="sxtP2P"></a>SXTsq Point-to-Point

?















