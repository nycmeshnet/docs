---
title: "VPN - L2TP/IPSEC" 
---

L2TP/IPSEC is a standards-based "enterprise VPN" type setup. There is a central server which is connected to and presents a subnet.  
The "L2TP" ( Layer 2 Tunneling Protocol ) part creates a subnet between the server and client. The "IPSEC" part performs encryption and authentication.  
It's possible to use either protocol without the other but one would be insecure and the other would lack a network layer, thus they are usually used together.

L2TP/IPSEC is usually limited in speed because the packets need to be processed by the router CPU which is slower than just purely encrypting the packets. Maximum expected performance from most routers is around **~100Mbps**

This protocol is best for BGP mesh-peering because you can route either direction on a tunnel and there is a subnet for the VPN itself.

## Devices supported:
* Mikrotik devices: All ( various speeds ) - Guide Here
* Apple devices: iPhones, Mac laptops, natively - Guide Here
* Android devices: Most yes - Guide Here
* Ubnt routers: Yes, but slow - Guide Here
* Openwrt: Should work - No Guide Yet
* Windows devices: Should work - No Guide Yet
* Linux: Yes, complicated without GUI, works well with Network Manager - Guide


## Security
L2TP/IPSEC has a changable authentication type. You can use a username and password, or, certificates ( or many other methods ).  
Additionally, even with a simple username and password, the server can also still present a certificate during connection to verify the server.  
~~NYC Mesh L2TP/IPSEC servers present a certificate signed by the [NYC Mesh Certificate Authority](/security/ca) to verify their authenticity and help against Man In the Middle attacks.~~

## Endpoints

### Supernode 1:
 * IPv4/6: **l2tpvpn.sn1.mesh.nycmesh.net**
 * Protocols: **L2TP over IPSEC ( ESP, port 1701 )**
 * Supported connect methods:
   * Anonymous (username: **nycmesh** password: **nycmeshnet** )
   * OSPF Node-Peering ( Same, connect as above, use OSPF afterwards )
   * BGP Node-Peering ( Get a username and password from Zach _This will change later, just for not to get the Docs out, this is what we currently do._ )

## How To Connect

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
 ### iPhone
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
 
**TODO** _Coming December2018/January2019_
