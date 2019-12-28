---
title: "MikroTik Firmware"
---

Mikrotik devices come in a variety of architectures and form-factors. Fortunately the firmware versioning and built levels are the same across all platforms. The main variant is the architecture, which might be a different chip for each device model.  

We follow the stable version of RouterOS (__6.46.1__), which is fairly well-tested, so there is little reason to wait to update after a new version comes out.

Below is a table of the latest firmwares for Mikrotik devices that are in the mesh:

|Model|Architecture|Firmware link|
|---|---|---|
| SXTsq ac | ARM | [Download](https://download.mikrotik.com/routeros/6.46.1/routeros-arm-6.46.1.npk) |
| hAP ac^2 | ARM | [Download](https://download.mikrotik.com/routeros/6.46.1/routeros-arm-6.46.1.npk) |
| OmniTik 5ac | MIPSBE | [Download](https://download.mikrotik.com/routeros/6.46.1/routeros-mipsbe-6.46.1.npk) |
| CCR Series | TILE | [Download](https://download.mikrotik.com/routeros/6.46.1/routeros-tile-6.46.1.npk) |
| hAP mini | SMIPS | [Download](https://download.mikrotik.com/routeros/6.46.1/routeros-smips-6.46.1.npk) |
| hAP lite | SMIPS | [Download](https://download.mikrotik.com/routeros/6.46.1/routeros-smips-6.46.1.npk) |

## Installing firmware
*   Login to your Mikrotik box Web UI ( CLI if you know how )
*   Go to WebFig > Files section, upload the firmware file
*   Reboot the router
*   The firmware version is visible at the top of the Web UI, watch for the new version
