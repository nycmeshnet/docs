---
title: "Unifi Access Points"
---

We are using more UNIFI access points on installs these days. These devices are very frustrating to set up, so this document is designed to help.

As of 2021 the latest firmware 4.3.28 has very short uptime (<30 days), so we are using a stable older version [4.3.20](https://dl.ui.com/unifi/firmware/U7PG2/4.3.20.11298/BZ.qca956x.v4.3.20.11298.200704.1347.bin) (copy this link)

Never use 4.3.28 or later, as the device will go down and require a site visit to reboot!

The devices are coming with very old firmware that isn't even compatible with the controller so step one is to SSH into the AP and upgrade it to 4.3.20. 

Adopting wirelessly doesn't work, so we adopt the AP to the controller wired before installing!

After moving on site, you may need to ssh in and set-inform to tell it the address of the controller

## SSH firmware instructions
[Here's Ubiquiti's instructions](https://help.ui.com/hc/en-us/articles/204910064-UniFi-Upgrade-the-Firmware-of-a-UniFi-Device#h_01F8GWSNHCB18N8Z2PKGDXEYDY)

We usually download the 4.3.20 update and choose the "Updating without internet..." option using scp.

## Meshing

We mostly install these devices with one wired connection for every two or three unwired ("meshed"). It's best to avoid more than one wireless hop. 

Wireless meshing basically doesn't work after version 4.3.20. Apart from later versions being unstable, when one goes down it can take down all the other meshed devices! We're in a very long conversation with Ubiquiti about this.

## UAP-AC-M (rabbit ears)  
<img src="/img/hardware/uap/uap-ac-m.png" height="160" />

- Price $100 (also comes in 3 packs and 5 packs)  

We've installed these at Clemente and they have proved to be reliable when running 4.3.20

### Configuring

Connect to omni network (`nycmesh-<nn>-omni`). Look for the IP address (in the DHCP Leases or use Torch on WebFig) and SSH into the rabbit ears (will probably have to disable bridge filters)

```
ssh -oHostKeyAlgorithms=+ssh-dss ubnt@10.103.175.49
```

Default password is `ubnt`

Run `set-inform http://10.70.95.63:8080/inform` to tell it where to phone home to (Our Unifi Controller)

You should see it in the unifi controller interface right away. Wait a bit. It'll reboot eventually.

Go ahead and configure it. Give it a name (NN and location). Move it into a site (create a new one if this is a new site)

## UAP-AC-M-PRO
<img src="/img/hardware/uap/uap-ac-m-pro.jpg" height="160" />

- Price $200 (also comes in 5 pack)

We've installed these at Grand St and Vernon

They are designed to mount on a wall. We've been mounting them on light poles which means creating your own mount (a lot of work!)

They seem ok and we haven't had any completely fail yet. The case is just snapped together. I had one randomly come apart before installing.


