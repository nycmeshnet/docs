---
title: MikroTik Netinstall Recovery
weight: 0
---

## How to resurrect a bootlooping OmniTIK with `netinstall`

### Symptoms

OmniTIK boots up but continually reboots. The LEDs repeat the pattern: device boots up, power eventually turns blue, then 1-5 turn orange and reboots. Rinse and repeat.

### Solution

Use `netinstall` to flash a fresh firmware on the router. This guide assumes Linux, though both Linux and Windows are supported. This should work for any RouterBOARD based device.

- [ ] Install `netinstall` on your laptop from mikrotik, and make sure it is in your command line path
- [ ] Download the [firmware](/firmware/mikrotik) you want to reset to (e.g. `routeros-mipsbe-6.47.8.npk`)
- [ ] Plug the data end of PoE injector into your computer's ethernet (e.g. `enp0s13f0u2u4u5`)
- [ ] Press and hold the reset button on the omnitik
  - [ ] Plug the poe+data end into ether1 of omnitik
  - [ ] Keep holding the reset button until LED 1 is solid orange, and the blue light has stopped flashing and is now off
- [ ] Finally, run `netinstall` and reset the board:

```
❱ netinstall -p ~/Downloads/routeros-mipsbe-6.47.8.npk -i enp0s13f0u2u4u5
Using server IP: 192.168.88.2
Starting PXE server
Waiting for RouterBOARD...
PXE client: CC:2D:E0:17:55:CB
Sending image: mips
Discovered RouterBOARD...
Formatting...
Sending package routeros-mipsbe-6.47.8.npk ...
Ready for reboot...
Sent reboot command
```

After all this, you should hear a few beeps indicating success. You can now try to connect via ether2 to configure it at 192.168.88.1 as normal.

