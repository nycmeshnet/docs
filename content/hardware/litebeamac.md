---
title: "Ubiquiti LiteBeam AC"
---
The LiteBeamAC is a very good, cheap directional router. We use it for most rooftop installs. As with all Ubiquiti gear you need to flash it with the latest firmware first. Often they ship with old beta firmware, and the latest firmware usually gets you faster speeds.

The AC in the name is not [802.11ac] (https://en.wikipedia.org/wiki/IEEE_802.11), it is Ubiquiti's own protocol. These devices can only connect to other Ubiquiti "AC" devices.

![Ubiquity LiteBeam 5AC Gen2](/img/hardware/ubiquity_litebeam5acgen2.png)

Device specs are available at [store.ubnt.com](https://store.ubnt.com/collections/all/products/litebeam-5ac-gen2).

There are two versions- gen1 and gen2. By default they are on two different sets of channels which causes much confusion. The gen1 cannot use the DFS channels unless you unlock it with a code on the System tab. Once you unlock a gen1 it has the same channels as the gen2. We have the unlock code for "NYCMesh". Ask us if you need to connect a gen1 to one of our hubs or supernodes.

Gen2 comes with a more sturdy mount (though less range) and also a management 2.4Ghz radio. The new mount has no movement clockwise so the only way to get the level bubble in the middle is with a straight mount! The management radio is very handy as you don't need to know the IP of the device. The management radio is on a timer so it will go off after about 5 minutes.

LiteBeams are very directional so use the built-in alignment tool to get the strongest signal. We like to get better than -65db. Very close to the supernodes you can get -45db.

The default IP is https://192.168.1.20/ with:

* name:ubnt
* pwd:ubnt

For Supernode1 we assign IP addresses in the 192.168.42.xxx range

[Install instructions are in these docs](../../hardware/config/#lbe-client)
