---
title: "VPN - L2TP/IPsec" 
---

An L2TP/IPsec VPN is an "enterprise VPN" setup that is based on a combination of the aforementioned L2TP and IPsec protocol standards. The former protocol (L2TP, the Layer 2 Tunneling Protocol) carries a "call" over the Internet, while the latter protocol suite (IPsec, Internet Protocol Security) encrypts and authenticates the participants in the call. Together, the L2TP/IPsec combination makes up an extremely common VPN configuration. It is called an "enterprise VPN" because it is most often used by corporations to provide remote access to one or more computers that are physically disconnected from the rest of their corporate network.

To offer an L2TP/IPsec VPN, the VPN provider operates a central server that waits to be contacted by remote computers. The central server is called the *VPN server* and the remote computers are called *VPN clients*. When a VPN client connects to the VPN server, the VPN server presents a subnet to the client, informing it of how to reach additional computers on the private network, and the VPN server offers itself as the client's default route to those computers. The connection between the remote employee and the corporate network is secure because of the use of IPsec, which encrypts the traffic between the VPN client and the VPN server in a similar way as HTTPS connections encrypt the connection between a Web browser and a Web server.

Although it's possible to use either protocol without the other, L2TP and IPsec are most often used together. This is because L2TP creates a subnet between the server and client but does not protect the connection, so using this protocol alone would result in an insecure remote link. Meanwhile, IPsec protects traffic traveling from one computer to another, but does not present a subnet (virtualized, i.e., tunneled network layer) to connecting clients.

L2TP/IPsec VPNs are usually limited in speed because the traffic (packets) that they carry need to be processed by each participating router's CPU. This is slower than just encrypting the packets, resulting in a likely performance bottleneck. In other words, the speed of the VPN is only as fast as the slowest router's CPU. The best performance you can reasonably expect from most routers is around ~100Mbps.

This protocol is best for [BGP]({{< relref "bgp" >}}) mesh-peering because you can route either direction on a tunnel and there is a subnet for the VPN itself.

## Device support
L2TP/IPsec enjoys very wide support across platforms and vendors.

* Mikrotik devices: All ( various speeds ) - Guide Here
* Apple devices: iPhones, Mac laptops, natively - Guide Here
* Android devices: Most yes - Guide Here
* Ubnt routers: Yes, but slow - Guide Here
* OpenWRT: Should work - No Guide Yet
* Windows devices: Should work - No Guide Yet
* Linux: Yes, complicated without GUI, works well with Network Manager - Guide

## Security
An L2TP/IPsec VPNs provide a number of different authentication mechanisms. You can use a username and password to authenticate to the VPN server, X.509 security certificates, or many other methods. Additionally, these mechanisms can be mixed; the server can still present a certificate to the client in order to verify its identity even if you (the client) are authenticating to the server using a simple username/password combination.

## Endpoints
This section provides connection information for NYC Mesh VPN endpoints that use L2TP/IPsec.

### Supernode 1
* Server domain name: `l2tpvpn.sn1.mesh.nycmesh.net`
* Supported protocols:
    * L2TP over IPSEC (ESP, port 1701)
* Supported connection methods:
    * Anonymous:
        * Username: `nycmesh`
        * Password: `nycmeshnet`
    * OSPF Node-Peering ( Same, connect as above, use OSPF afterwards )
    * BGP Node-Peering ( Get a username and password from Zach _This will change later, just for not to get the Docs out, this is what we currently do._ )

## How To Connect

This section provides step-by-step guides for connecting to one of NYC Mesh's L2TP/IPsec VPN servers. We have published guides for:

* [Windows 10]({{< relref "#windows-10" >}})
* [macOS]({{< relref "#macos" >}})
* [Apple iOS]({{< relref "#apple-ios" >}})
* [Android]({{< relref "#android" >}})
* [GNU/Linux]({{< relref "#gnu-linux" >}})

### Windows 10
* Click on Start (Title menu) and type VPN
* Click on on Change Virtual Private Networks (VPN)
* Click on the plus button (Add a VPN connection)
* Choose VPN provider (Microsoft by default)
* Conenction name (Name it whatever you want)
* Server name or address **l2tpvpn.sn1.mesh.nycmesh.net**
* VPN Type: L2TP/IPsec with pre-shared key
* Pre-shared key: **nycmeshnet**
* Type of sign-in info: User name and password
* Username: **nycmesh**
* Password: **nycmeshnet**
* Check box to remember password so you don't have to type this everytime 
* Click save
* Click on newly created VPN connection and click connect

### macOS

See [Apple Support: Set up a VPN Connection](https://support.apple.com/guide/mac-help/set-up-a-vpn-connection-on-mac-mchlp2963/10.14/mac/10.14). Be sure to use the appropriate authentication credentials for your connection. For an anonymous connection, enter `nycmesh` as the "account name" and `nycmeshnet` in both the User Authentication's "password" field *and* the Machine Authentication's "Shared Secret" field. 

### Apple iOS

These instructions refer to Apple-branded handheld devices such as the iPhone and iPad.

* Go to Settings
* Tap on VPN
* Tap on Add VPN Configuration
* Tap on Type and choose L2TOP
* Description (Anything you want)
* Server: **l2tpvpn.sn1.mesh.nycmesh.net**
* Account: **nycmesh**
* Leave RSA SecurID off
* Password **nycmeshnet**
* Secret: **nycmeshnet**

### Android

### GNU/Linux

Using GNOME/Network Manager:

 * Make sure you have the L2TP/IPsec NetworkManager plugin installed (`NetworkManager-l2tp-gnome` on Fedora)
 * Add a new VPN of type 'Layer 2 Tunneling Protocol'
 * Gateway: **l2tpvpn.sn1.mesh.nycmesh.net**
 * Username: **nycmesh**
 * Password: **nycmeshnet** (you may have to click a question mark on the right of the textbox to allow saving the password)
 * Click "IPsec Settings"
 * Check "Enable IPsec tunnel to L2TP host"
 * Pre-shared key: **nycmeshnet**
 * Save & Connect
