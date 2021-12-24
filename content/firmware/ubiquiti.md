---
title: Ubiquiti Firmware
weight: 800
---

Ubiquiti firmware has some buggy versions that need to be avoided. In general never use a ".0" release. It is beta quality and will probably have serious bugs that may be fixed by .1 or .2 version.

Ubiquiti have two very separate product lines with different firmware, AirMAX and UniFi

**Don't use the latest firmware from Ubiquiti!** Use the stable versions below-

**AirMAX**

We currently use 8.7.1 on most CPE (like the LiteBeams)

Download [8.7.1 here](https://dl.ui.com/firmwares/XC-fw/v8.7.1/WA.v8.7.1.42832.200623.1641.bin)

**For sector AP's we use 8.5.12 for DFS stability** (or 8.7.1 if this is not an issue)

Download [8.5.12 here](https://dl.ui.com/firmwares/XC-fw/v8.5.12/WA.v8.5.12.40181.190213.1104.bin)

NEVER UPGRADE A SECTOR WITHOUT ASKING EVERYONE FIRST!

We disable AirView on sectors to improve CPU performance

*Notes on recent AirMax firmware*-  
8.7.1 is fine, don't update!  
8.7.4 the signal levels are artificially higher.  
8.7.5 this has a TDMA bug which causes performance to fail after a few days.  


**UniFi**

We've found all versions after 4.3.20 to be buggy. Basically meshing broke in the later versions so your network will go down after a day or so, unless all of your AP's are wired. Not only will a meshed AP crash, it will take down the rest of the local network!

Download 4.3.20 [here](https://dl.ui.com/unifi/firmware/U7PG2/4.3.20.11298/BZ.qca956x.v4.3.20.11298.200704.1347.bin)
