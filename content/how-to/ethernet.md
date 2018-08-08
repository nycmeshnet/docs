---
layout: post
title: "Ethernet"
author: Brian
---

There are two standards for ethernet cables. We use T-568B. (oO-gB-bG-brBR)

![window/wall install](/img/ethernet/T-568B.gif)
[source](http://www.siongboon.com/projects/2006-03-06_serial_communication/)

A straight cable will work as long as both ends are the same configuration, but to stop confusion we are sticking to the standard T-568B, which is the most common one in this country.

In 100base-T (100Mbps most ethernet), orange is data transmit (pins 1 & 2) and green is receive (pins 3 & 6) pins 4,5,7,8 are not used for data.

In 1000Base-T (gigabit ethernet) all pins are used for data. If pins 4,5,7 & 8 are not connected the speed falls back to 100Mbps.

4,5,7,8 are used for power over ethernet (POE). Pins 4 & 5 are negative and 7 & 8 are positive.

If you plug POE into the "secondary" WAN port of a NanoStation, the main port will have live POE! This POE passthrough is great if you want to power a second NanoStation, but if you plug a live POE cable into an adapter or some device that does not expect POE it can break. We also turn on POE passthrough for both ports in some [installs](../nsm5-install/).

On a roof it is tempting to plug from a powered ethernet port into your laptop to configure the router. Usually the cheaper devices survive this accident because they don't use the POE pins. Apple's $30 thunderbolt ethernet adapters and other gigabit adapters will blow up. $9 USB 100Base-T adapters are a better bet if you think you will make this mistake. If you have a test cable with 4,5,7,8 disconnected you will be safe.

Ubiquiti POE is 24V DC, **half the voltage of standard 48V DC POE.** If you use standard POE you need to use a [Ubiquiti 8023af-adapter](https://www.ubnt.com/accessories/instant-8023af-adapters/)

Ethernet cables need to be shorter than 100m (300'). Longer than that you will have data loss and the POE voltage will drop too low.

