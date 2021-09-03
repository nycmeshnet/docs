---
title: "Unifi Access Points"
---

We are using more UNIFI access points on installs these days. These devices are very frustrating to set up, so this document is designed to help.

As of 2021 the latest firmware 4.3.28 has very short uptime (~30 days), so we are using a stable older version [4.3.20](https://dl.ui.com/unifi/firmware/U7PG2/4.3.20.11298/BZ.qca956x.v4.3.20.11298.200704.1347.bin) (copy this link)

Never use 4.3.28 or later, as the device will go down and require a site visit to reboot!

The devices are coming with very old firmware that isn't even compatible with the controller so step one is to SSH into the AP and upgrade it to 4.3.20. 

Adopting wirelessly doesn't work, so we adopt the AP to the controller wired before installing!

After moving on site, you may need to ssh in and set-inform

## SSH firmware instructions
[Here's Ubiquiti's instructions](https://help.ui.com/hc/en-us/articles/204910064-UniFi-Upgrade-the-Firmware-of-a-UniFi-Device#h_01F8GWSNHCB18N8Z2PKGDXEYDY)

We usually download the 4.3.20 update and choose the "Updating without internet..." option using scp.

We mostly install these devices with one wired connection for every two or three unwired ("meshed"). It's best to avoid more than one wireless hop. Wireless meshing doesn't work after version 4.3.20. We're in a very long conversation with Ubiquiti about this.

## UAP-AC-M (rabbit ears)  
<img src="/img/hardware/uap/uap-ac-m.png" height="160" />

- Price $100 (also comes in 3 packs and 5 packs)  

We've installed these at Clemente and they have proved to be reliable when running 4.3.20

## UAP-AC-M-PRO
<img src="/img/hardware/uap/uap-ac-m-pro.jpg" height="160" />

- Price $200 (also comes in 5 pack)

We've installed these at Grand St and Vernon

They are designed to mount on a wall. We've been mounting them on light poles which means creating your own mount (a lot of work!)

They seem ok and we haven't had any completely fail yet. The case is just snapped together. I had one randomly come apart before installing.


