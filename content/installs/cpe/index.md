---
title: "Supernode 1 CPE"
---

Members can buy their own cpe on Amazon etc. We can swap it with a preconfigured one on site to save time.

The following is a detailed explanation. Please go to [hardware/config](/hardware/config/#lbe-client) for much easier instructions.

## Configuring supernode1 CPEs

Line of sight to 375 Pearl St. Manhattan

[For connecting to supernode 2 see here](../cpe2)

## Ubiquiti Prism clients-

[Laptop Network preferences](./litebeam/netprefs.png)

A new Ubiquiti device has a default IP address 192.168.1.20 and name/pass ubnt, ubnt

Connect to the LiteBeamAC or NanoBeamAC via ethernet. Make sure you are on the same subnet by manually setting your network preferences, e.g. 192.168.1.11, Mask: 255.255.255.0

You will get an ssh warning "Your connection is not...", ignore and click "advanced" to proceed. (This is because the interface uses https)

**Flash with latest firmware**

Go to System:Configuration:Reset to factory defaults and click Reset

Download latest version of [AirMaxAC](https://www.ubnt.com/download/airmax-ac) for the particular hardware

System:Upload Firmware

Reset to factory again

Change the pass

Click the "Settings" button (gear icon) on the left to give you-  
Wireless \| Network \| Services \| System

[**Wireless**](./litebeam/wireless.png)

*   Wireless Mode : Station PtMP
*   SSID : nycmesh prism1 s2  
     - see "Pairing" below for selecting s1, s2 or s3
*   Antenna : 23 -23dbi  


[**Network**](./litebeam/network.png)

*   Manegement IP address : Static
*   IP address : [192.168.42.x ] <-- Ask NYCMesh to assign this last number to you.
                      

[**Services**](./litebeam/services.png)

*   [x]SNMP Agent
*   community : public 
*   location : nycmesh
*   contact : nycmesh  


[**System**](./litebeam/system.png)

*   Device name : nycmesh-lbe-nn (nn = Node Number) 
*   (**lbe** is LiteBeam, **nbe** is NanoBeam)

You can download this example [LiteBeamAC config](./litebeam/WA-F09FC242795C.cfg) with the above configuration

[**Wireless**] 

*   Click [Select] then you wll see a lot of networks
*   In the search box, type "nyc" to narrow down the search results --> [SCAN]
*   Choose the strongest "nycmesh prism" signal.  eg.-50 is stronger than -80
    You can only choose the ones with a circle mark on the left        


**Pairing with Supernode1**

* Go to [Dash board] 

Gen1 LiteBeams can only see s1 and s2 sectors, unless they are unlocked (giving them gen2 specs)
Gen2 can see s2, s3 and prism2

Ask us for the unlock codes for Gen1

Prism1 has 3 radios. You need to select the strongest. **s1** faces North, **s2** and **s3** face north east. East Village would probably be s1 and LES and Alphabet City would probably be "s2". "s3" is towards Williamsburg. Chinatown could be any of the radios.

Prism2 has one radio facing North. It is very strong in Chinatown

**Antenna Alignment**

There is a "tools" menu in the upper right of the interface. Click this and select [alignment]. First align the antenna by pointing it directly at the supernode. Now move it slightly up or down to get a stronger signal. Once you have the vertical alignment, do the same by moving the antenna horizontally. The sound option is very helpful for this.

**Download test**

To get internet from the CPE you need to set your laptop's network configuration to IPv4:using DHCP ("automatic" setting on some machines). If the device is paired with the supernode it will automatically get an IP address in our range- 199.x.x.x

A good speed is over 50Mps. We have been getting 60 to 120Mbps so far. If the speed is under 20Mbps explain to the member the limitations (Netflix standard streaming is 5Mbps). It is not good to install if connection is less than 10Mbps as it won't reliably play video.

You must have a gigabit adapter to get over 100Mbps. It is possible to get 200Mbps if you are close with good line of sight. If you don't have a gigabit adapter the maximum speed is going to be under 95Mbps.
