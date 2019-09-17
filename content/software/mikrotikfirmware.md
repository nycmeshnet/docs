---
title: "MikroTik Firmware"
---

Mikrotik devices come in a variety of architectures and form-factors. Fortunately the firmware versioning and built levels are the same across all platforms. The main variant is the architecture, which might be a different chip for each device model.  

The firmware testing quality is fairly high, so there is little reason to wait to update after a firmware version comes out.  

Below is a table of the latest firmwares for Mikrotik devices that are in the mesh:  
Current Version: __6.44.2__

|Model|Architecture|Firmware link|
|---|---|---|
| SXTsq ac | ARM | [Download](https://download.mikrotik.com/routeros/6.44.2/routeros-arm-6.44.2.npk) |
| hAP ac^2 | ARM | [Download](https://download.mikrotik.com/routeros/6.44.2/routeros-arm-6.44.2.npk) |
| OmniTik 5ac | MIPSBE | [Download](https://download.mikrotik.com/routeros/6.45.6/routeros-mipsbe-6.45.6.npk) |
| CCR Series | TILE | [Download](https://download.mikrotik.com/routeros/6.44.2/routeros-tile-6.44.2.npk) |
| hAP mini | SMIPS | [Download](https://download.mikrotik.com/routeros/6.44.2/routeros-smips-6.44.2.npk) |
| hAP lite | SMIPS | [Download](https://download.mikrotik.com/routeros/6.44.2/routeros-smips-6.44.2.npk) |

## Installing firmware
*   Login to your Mikrotik box Web UI ( CLI if you know how )
*   Go to WebFig > Files section, upload the firmware file
*   Reboot the router
*   The firmware version is visible at the top of the Web UI, watch for the new version
