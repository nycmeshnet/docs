---
title: MikroTik Firmware
aliases: ["/software/mikrotikfirmware"]
weight: 999
---

MikroTik routerOS 6 firmware is generally stable. We are currently using 6.49.8. 

___Do not use version 7 (not yet supported) or version 6.47/6.48/6.49.2 (occasional hangs)___

___Previous stable firmware 6.49.6 has a security vulnerability, see thread at [https://nycmesh.slack.com/archives/C03373JET/p1684787440909939](https://nycmesh.slack.com/archives/C03373JET/p1684787440909939)___

<br>

---


**routerOS 6**

We currently use the stable version of RouterOS 6 (__6.49.8__)

We have documented issues with 6.47/6.48/6.49.2 so don't use them.
<br>

Mikrotik devices come in a variety of architectures and form-factors. Fortunately the firmware versioning and built levels are the same across all platforms. The main variant is the architecture, which might be a different chip for each device model.  
Remember that OmniTiks use the "mipsbe" firmware and SXT's use the "arm" firmware due to different processors.


__Below is a table of the 6.49.8 firmware for Mikrotik devices that are in the mesh:__


|Model|Architecture|Firmware link|
|---|---|---|
| OmniTik 5ac | MIPSBE | [Download](https://download.mikrotik.com/routeros/6.49.8/routeros-mipsbe-6.49.8.npk) |
| SXTsq ac | ARM | [Download](https://download.mikrotik.com/routeros/6.49.8/routeros-arm-6.49.8.npk) |
| hAP ac^2 | ARM | [Download](https://download.mikrotik.com/routeros/6.49.8/routeros-arm-6.49.8.npk) |
| CCR Series | TILE | [Download](https://download.mikrotik.com/routeros/6.49.8/routeros-tile-6.49.8.npk) |
| hAP mini | SMIPS | [Download](https://download.mikrotik.com/routeros/6.49.8/routeros-smips-6.49.8.npk) |
| hAP lite | SMIPS | [Download](https://download.mikrotik.com/routeros/6.49.8/routeros-smips-6.49.8.npk) |

<br>

---

**routerOS 7**

Don't use it yet - it won't work!

This has finally been released but it doesn't work with our configuration yet. We keep testing it as we are eager to deploy the newly added WireGuard.
If you are interested in beta-testing the WG setup, post in the #software-firmware channel on Slack.

If you need to downgrade, read the [instructions here](../../hardware/mikrotikomnitik5ac/)

---

<br>

## Installing firmware
*   Login to your Mikrotik box Web UI. (or CLI if you know how)
*   Go to WebFig > Files section, upload the firmware file to the root of the flash storage.
*   Reboot the router.
*   The firmware version is visible at the top of the Web UI, watch for the new version.
