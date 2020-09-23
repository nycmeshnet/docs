---
title: "Ethernet"
---

There is one commonly used standard for ethernet: T-568B. (oO-gB-bG-brBR)

![window/wall install](/img/ethernet/T-568B.gif)
[source](https://www.siongboon.com/projects/2006-03-06_serial_communication/)

A straight cable will work as long as both ends are the same configuration, but to stop confusion we only use the standard T-568B, which is the most common one in this country.

In 100base-T (100Mbps most old ethernet), orange is data transmit (pins 1 & 2) and green is receive (pins 3 & 6) pins 4,5,7,8 are not used for data.

In 1000Base-T (gigabit ethernet) all pins are used for data. If pins 4,5,7 & 8 are not connected the speed falls back to 100Mbps.

4,5,7,8 are used for 24 volt passive power over ethernet (POE). Pins 4 & 5 are positive and 7 & 8 are negative.

If you plug a live POE cable into an adapter or some device that does not expect POE it can break. This is often how ethernet adapters and cable testers break! A cheap USB 100Base-T ethernet adapter will survive as it doesn't use the POE pins. 

Ubiquiti POE is 24V DC, **half the voltage of standard (802.3af/at) 48V DC POE.** If you use standard POE you need to use a [Ubiquiti 8023af-adapter](https://www.ubnt.com/accessories/instant-8023af-adapters/)

Ethernet cables need to be shorter than 100m (300'). Longer than that you will have data loss and the POE voltage will drop too low.

You must use black outdoor cable outside. Indoor cable will last about 6 months outside due to UV damage. We mostly use Ubiquiti ToughCable Pro CAT5.

