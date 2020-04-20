---
title: "VPN - L2TP/IPsec"
---

L2TP/IPSec is a common general-purpose VPN protocol that work with most platforms. For example, computers running Windows, macOS, iPhones, and Android devices all support this type of VPN out-of-the-box. This type of VPN is a little bit oldschool, in that it is typically found in enterprise corporate environments, which is part of what makes it so ubiquitous.  
For this reason, we have decided to provide and endpoint of this protocol.

Technically speaking, it is a combination of L2TP and IPsec protocol standards. The former protocol (L2TP, the [Layer 2 Tunneling Protocol](https://en.wikipedia.org/wiki/Layer_2_Tunneling_Protocol)) carries a "call" over the Internet, while the latter protocol suite ([IPsec](https://en.wikipedia.org/wiki/IPsec), Internet Protocol Security) encrypts the call and authenticates the participants. Although it's possible to use either protocol without the other, L2TP and IPsec are most often used together. This is because L2TP creates a connection but does not secure the connection, while IPSec protects traffic but does not itself create a network connection to carry traffic.

L2TP/IPsec VPNs are often slower than more modern protocols because the implementation on smaller routers is usually implemented in software which makes heavy use of the router's CPU. On the other hand, more expensive routers often have a custom chip to speed-up IPSec encryption, actually making L2TP/IPsec the fastest choice in certain cases.

The best performance you can reasonably expect from on small routers is around ~100Mbps.

## Device support
The L2TP/IPsec protocol enjoys very wide support across platforms and vendors.

* Mikrotik devices: All ( various speeds ) - No Guide Yet
* Apple devices: iPhones, Mac laptops, natively - [iOS Guide Here]({{< relref "#apple-ios" >}}), [macOS Guide Here]({{< relref "#macos" >}})
* Android devices: Most yes - [Guide Here]({{< relref "#android" >}})
* Ubnt routers: Yes, but slow - No Guide Yet
* OpenWRT: Should work - No Guide Yet
* Windows devices: Should work - [Guide Here]({{< relref "#windows-10" >}})
* Linux: Yes, complicated without GUI, works well with Network Manager - [Guide Here]({{< relref "#gnu-linux-gnome-network-manager" >}})


## Endpoints
This section provides connection information for NYC Mesh VPN endpoints that use L2TP/IPsec.

### Supernode 1
* Server domain name: `l2tpvpn.sn1.mesh.nycmesh.net`
* Supported connection methods:
    * Anonymous:
        * Username: `nycmesh`
        * Password: `nycmeshnet`
    * OSPF Node-Peering (Same, connect as above, use [OSPF]({{< relref "ospf" >}}) afterwards.)

## Connection Guides
Please follow the below connection guides for each platform.

### Windows 10
<details>
<summary>Expand to view instructions...</summary>

1. Click on Start (Title menu) and type VPN
1. Click on on Change Virtual Private Networks (VPN)
1. Click on the plus button (Add a VPN connection)
1. Choose VPN provider (Microsoft by default)
1. Conenction name (Name it whatever you want)
1. Server name or address `l2tpvpn.sn1.mesh.nycmesh.net`
1. VPN Type: L2TP/IPsec with pre-shared key
1. Pre-shared key: `nycmeshnet`
1. Type of sign-in info: User name and password
1. Username: `nycmesh`
1. Password: `nycmeshnet`
1. Check box to remember password so you don't have to type this everytime
1. Click save
1. Click on newly created VPN connection and click connect

</details>

### macOS
<details>
<summary>Expand to view instructions...</summary>

See [Apple Support: Set up a VPN Connection](https://support.apple.com/guide/mac-help/set-up-a-vpn-connection-on-mac-mchlp2963/10.14/mac/10.14). Be sure to use the appropriate authentication credentials for your connection. For an anonymous connection, enter `nycmesh` as the "account name" and `nycmeshnet` in both the User Authentication's "password" field *and* the Machine Authentication's "Shared Secret" field.
</details>

### Apple iOS
<details>
<summary>Expand to view instructions...</summary>

These instructions refer to Apple-branded handheld devices such as the iPhone and iPad.

1. Go to Settings
1. Tap on VPN
1. Tap on Add VPN Configuration
1. Tap on Type and choose L2TP
1. Description (Anything you want)
1. Server: `l2tpvpn.sn1.mesh.nycmesh.net`
1. Account: `nycmesh`
1. Leave RSA SecurID off
1. Password `nycmeshnet`
1. Secret: `nycmeshnet`

See also [How-To Geek: How to Connect to a VPN From Your iPhone or iPad § Connect to IKEv2, L2TP/IPSec, and Cisco IPSec VPNs in iOS](https://www.howtogeek.com/215730/how-to-connect-to-a-vpn-from-your-iphone-or-ipad/).

</details>

### Android
<details>
<summary>Expand to view instructions...</summary>

See [How-To Geek: How to Connect to a VPN on Android § Android’s Built-In VPN Support](https://www.howtogeek.com/135036/how-to-connect-to-a-vpn-on-android/).

</details>

### GNU/Linux - GNOME/Network Manager
<details>
<summary>Expand to view instructions...</summary>

Using GNOME/Network Manager:

1. Make sure you have the L2TP/IPsec NetworkManager plugin installed (`NetworkManager-l2tp-gnome` on Fedora)
1. Add a new VPN of type 'Layer 2 Tunneling Protocol'
1. Gateway: `l2tpvpn.sn1.mesh.nycmesh.net`
1. Username: `nycmesh`
1. Password: `nycmeshnet` (you may have to click a question mark on the right of the textbox to allow saving the password)
1. Click "IPsec Settings"
1. Check "Enable IPsec tunnel to L2TP host"
1. Pre-shared key: `nycmeshnet`
1. Save & Connect

</details>
