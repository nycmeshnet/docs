---
title: "LinkNYC Kiosk"
---

We do not install LinkNYC Kiosk repeaters as they are not as reliable as a mesh connection. We still support DIY kiosk repeaters through our Slack group.

If you are too far away from an access point to get a good connection, you can use a directional router to connect to [Link NYC](https://link.nyc). We recommend using a [Mikrotik SXTsq G-5acD](/hardware/sxtsqg5acd/) **international version**. The LinkNYC kiosks use [DFS channels](https://en.wikipedia.org/wiki/Dynamic_frequency_selection) which, although legal and FCC approved, aren't supported in some USA versions of hardware.

To use the SXTsq 5 ac you need to get the international version and configure it according to [our detailed instructions](/hardware/sxtsqg5acd), the simplified [fast config](/hardware/config/#sxtKiosk) or the [VPN config](/hardware/config/#sxtVpn) which connects you to our mesh network.

[Here is the link to buy the SXTsq.](https://www.multilink.us/SXTsq-5-ac_p_1271.html) Make sure to specify **international**.

With all these gateways we get lots of questions about security. As always, https (used by most web sites) is a secure way to transmit information across wifi. We recommend our [VPN config](/hardware/config/#sxtVpn) for end-to-end encryption for total security.
