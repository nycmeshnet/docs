---
title: "60 GHz"
---

60 GHz, or the IEEE V band, is an unlicensed frequency range that can be used to create gigabit-ready links, for point-to-point (PTP) and point-to-multipoint (PTMP) configurations.

60 GHz tends to be susceptible to "rain-fade" depending on the frequency used and link distance, which is why it is not used in licensed spectrum.

Often these radios come with a 5GHz backup, which isn't really useful for bandwidth due to the small backup radio but it will keep your link online during rain.

# Comparison Chart

This is a chart with all the antennas made by the manufactuers we typically use. Ubiquiti's equipment works with their monitoring software UISP, but both manufacturers make their equipment accessible via SNMP.

## Ubiquiti

| Image | Product Name | Price per Link | Rated Range | Has Backup | Deployed in Mesh | Notes |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| <img src="/img/hardware/60ghz/GBE.png" height="160" /> | [GigaBeam](https://store.ui.com/us/en/products/gbe) | $260 | 300m | Yes* | Yes* | Used to connect lightpoles together at Vernon. No rooftop deployments due to limited distance. Max capacity is 1.62Gbps, only supports channels 1-4. Backup radio gain is low and unusable. |
| <img src="/img/hardware/60ghz/GBE-Plus.png" height="160" /> | [GigaBeam-Plus](https://store.ui.com/us/en/pro/category/all-60ghz-wireless/products/airmax-gigabeam-plus-60-ghz-radio) | $360 | 1.5km | No | Yes | Max capacity is 1.62Gbps. Similar performance to MikroTik Wireless Wire (LHG60 pair). |
| <img src="/img/hardware/60ghz/GBELR.png" height="160" /> | [GigaBeam-LR](https://store.ui.com/us/en/products/gbe-lr) | $400 | 2km | Yes | Yes | In service at a number of locations. Max capacity is 1.62Gbps. Backup radio gain is 11dBi, highly susceptible to interference. |
| <img src="/img/hardware/60ghz/AF60.png" height="160" /> | [airFiber 60](https://store.ui.com/us/en/products/af60) | $600 | 2km | Yes | No | Similar specs but different product category than the GBE-LR. Supports half-channel support and 2Gbps capacity. |
| <img src="/img/hardware/60ghz/AF60LR.png" height="160" /> | [airFiber 60-LR](https://store.ui.com/us/en/collections/uisp-60ghz-bridge-long-range/products/airfiber-60-lr) | $800 | 12km | No | Yes | Workhorse for any of our longer links as a higher-performance alternative to the AF24. Supports half-channel support, upper V band and 2Gbps capacity. |

## MikroTik

| Image | Product Name | Price per Link | Rated Range | Has Backup | Deployed in Mesh | Notes |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| <img src="/img/hardware/60ghz/LHG.jpg" height="160" /> | [LHG 60G](https://mikrotik.com/product/lhg_60g) | $300 | 1.5km | No | Yes | Original workhorse for short-to-medium-length links between buildings. Susceptible to rain at 800m, supports 2Gbps under ideal conditions. |

## IgniteNet

| Image | Product Name | Price per Link | Rated Range | Has Backup | Deployed in Mesh | Notes |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| <img src="/img/hardware/60ghz/ML1.jpg" height="160" /> | [Metrolinq One 60-19](https://www.ignitenet.com/wireless-backhaul/metrolinq-one-60/) | $500 | 1km | Yes* | Yes | Current deployment exceeds rated distance and may be misaligned, frequently goes out in the rain. Backup radio gain is 16dBi, highly susceptible to interference. |

We use these between Henry and Grand. It never got over 300 Mbps

- The mount is extremely heavy and obviously designed for the larger antenna
- The lights on the back aren't visible due to the mount
- It is possible to mount on horizontal pipe but you only have ~15 degrees of movement
- Bandwidth is about half of the cheaper Mikrotik 60Ghz
- Maybe we should have used the larger 60 – 35
- The backup 5GHz is strangely very low bandwidth (~20 Mbps)
- The telescope is very good, and great for aligning
- Everything is very well built and feels like a scientific instrument


