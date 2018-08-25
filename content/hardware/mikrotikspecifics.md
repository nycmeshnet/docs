---
layout: default
title: MikroTik Specifics
category: Hardware
---

Mikrotik routers have a few interesting things to note in order to under and use them well. This page documents those interesting pieces and might help clarify some things.
This page will be referenced by other pages and should be Mikrotik general.

## Device variants

### License

Mikrotik software usually requires a license, though all Mikrotik devices come with an internal license, which varies with the model.
This router comes with a Level 4 licnese which is sufficient for its use.

### US vs International version

There are both US and international versions that need to be considered. Please make sure to buy an international version if possible.

### PoE vs non-PoE

There are models that both have PoE and do not. Be sure to buy a PoE model.

## Platform how-tos

### Reset

To factory reset a mikrotik router, hold down the reset button (located near the PoE-in port), then plug in the power, until the main power ( or USR led ) light starts flashing, then release the button to reset RouterOS configuration (total 5 seconds).

### Connecting

The initial IP address out of the box is 192.168.88.1, so set you computer’s local IP to something similar ( 192.168.88.5 ). The username is admin and there is no password.  
__Note: Many models have ether1 / Port 1 as WAN by default, you may need to connect your computer to a port besides Port 1 for initial configuration__

### Configurations

Mikrotik devices don't directly work well with the old "restore a file" method of configuration. Instead, you need to generate a script that, when run, alters the config from the default. Technically, yes, it's possible to restore a file, however, the format and ability to restore might change each version, for each devices, and depending what hardware is connected.

Each device should have a config template which needs some blanks filled in. The result is a script that can be run to setup the device after a factory default.
