---
title: "VPN - L2TP/IPsec" 
---

An L2TP/IPsec VPN is an "enterprise VPN" setup, so called because it is most often used by corporations to provide remote access to one or more computers that are physically disconnected from the rest of their corporate network. It is based on a combination of the aforementioned L2TP and IPsec protocol standards. The former protocol (L2TP, the [Layer 2 Tunneling Protocol](https://en.wikipedia.org/wiki/Layer_2_Tunneling_Protocol)) carries a "call" over the Internet, while the latter protocol suite ([IPsec](https://en.wikipedia.org/wiki/IPsec), Internet Protocol Security) encrypts the call and authenticates the participants.

To offer an L2TP/IPsec VPN, the VPN provider operates a central server that waits to be contacted by remote computers. The central server is called the *VPN server* and the remote computers are called *VPN clients*. When a VPN client connects to the VPN server, the VPN server presents a subnet to the client, informing it of how to reach additional computers on the private network, and the VPN server offers itself as the client's default route to those computers. The connection between the client and the server is secure because of the use of IPsec, which encrypts the traffic in a similar way as HTTPS encrypts the connection between a Web browser and a Web server.

Although it's possible to use either protocol without the other, L2TP and IPsec are most often used together. This is because L2TP creates a subnet between the server and client but does not protect the connection, so using L2TP alone would result in an insecure connection. Meanwhile, IPsec protects traffic traveling from one computer to another, but does not itself provide a network layer over which that traffic can travel. L2TP/IPsec VPNs are usually slower than certain other types of VPN technologies because the traffic (packets) that they carry need to be processed by each participating router's CPU. This limits the maximum speed of the VPN to the speed at which the slowest router's CPU can process the traffic (packets) traveling over the VPN connection. The best performance you can reasonably expect from most routers is around ~100Mbps.

L2TP/IPsec VPNs are best suited for [BGP]({{< relref "bgp" >}}) mesh-peering because you can route either direction on a tunnel, and it creates a subnet for the VPN itself.

## Device support
The L2TP/IPsec protocol stack enjoys very wide support across platforms and vendors.

* Mikrotik devices: All ( various speeds ) - Guide Here
* Apple devices: iPhones, Mac laptops, natively - Guide Here
* Android devices: Most yes - Guide Here
* Ubnt routers: Yes, but slow - Guide Here
* OpenWRT: Should work - No Guide Yet
* Windows devices: Should work - No Guide Yet
* Linux: Yes, complicated without GUI, works well with Network Manager - Guide

## Security
An L2TP/IPsec VPN can provide a number of different authentication mechanisms. Both clients and servers can use X.509 security certificates to authenticate themselves to the other side of the connection. Additionally, clients can use a username and password to authenticate to the VPN server. Moreover, these mechanisms can be mixed; the server can present a certificate to the client in order to verify its identity even if you (the client) are authenticating to the server using a simple username/password combination. There are more authentication mechanisms but these two are the most common.

## Endpoints
This section provides connection information for NYC Mesh VPN endpoints that use L2TP/IPsec.

### Supernode 1
* Server domain name: `l2tpvpn.sn1.mesh.nycmesh.net`
* Supported protocols:
    * L2TP over IPsec ([Encapsulating Security Payload](https://en.wikipedia.org/wiki/IPsec#Encapsulating_Security_Payload), port 1701)
* Supported connection methods:
    * Anonymous:
        * Username: `nycmesh`
        * Password: `nycmeshnet`
    * OSPF Node-Peering (Same, connect as above, use [OSPF]({{< relref "ospf" >}}) afterwards.)
    * BGP Node-Peering (Get a username and password from Zach. _This will change later, just for now to get the docs out, this is what we currently do._)

## How To Connect
This section provides step-by-step guides for connecting to one of NYC Mesh's L2TP/IPsec VPN servers. We have published guides for:

* [Windows 10]({{< relref "#windows-10" >}})
* [macOS]({{< relref "#macos" >}})
* [Apple iOS]({{< relref "#apple-ios" >}})
* [Android]({{< relref "#android" >}})
* [GNU/Linux]({{< relref "#gnu-linux" >}})

### Windows 10
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

### macOS

See [Apple Support: Set up a VPN Connection](https://support.apple.com/guide/mac-help/set-up-a-vpn-connection-on-mac-mchlp2963/10.14/mac/10.14). Be sure to use the appropriate authentication credentials for your connection. For an anonymous connection, enter `nycmesh` as the "account name" and `nycmeshnet` in both the User Authentication's "password" field *and* the Machine Authentication's "Shared Secret" field. 

### Apple iOS

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

### Android

See [How-To Geek: How to Connect to a VPN on Android § Android’s Built-In VPN Support](https://www.howtogeek.com/135036/how-to-connect-to-a-vpn-on-android/).

### GNU/Linux

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
