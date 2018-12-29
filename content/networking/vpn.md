---
title: "VPN" 
---
## VPN Infrastructure
NYC Mesh maintains some common VPN infrastructure for use by mesh member.   
The purpose of the VPN systems are to connect distant nodes, to provide backup for low-quality links, to give access to remote users ( in a coffee shop for example ), administrative access, etc..  
Please feel free to use the VPNs as you see fit. They are for everyone.  However, note NYCMesh is not a VPN provider / reseller, nor trying to achieve an internet-based dark-net.  
VPNs are subject to change / break.  

## When might you use a VPN:
* To tie distance neighborhoods together:
  *  If a distance part of the mesh is too far away from the other nodes to make a connect, a VPN might be used tie the mesh back together. This isn't required the distant mesh can have its own exit node and maintain itself locally, but won't be able to access the rest of the mesh.
* To connect your laptop -- If you are working in a coffee shop but needs mesh access to test and develop, or prefers the mesh exit instead of the coffee shop.
* To configure during installation -- An installation may involve connecting to another node to configure it. This can be difficult to accomplish without already being on the mesh.

## VPN types and endpoints:
Each Supernode can/will provide a few VPN options, depending on the hardware available locally.  
You may connect to any/all of the supernodes, and in some cases, multiple simultaneously ( for example with BGP peering, you can connect to multiple ).

### Choosing a VPN endpoint:
* Before using the VPN, you will need to decide how you will set it up.
  * What router/computer will be on your side of the VPN?
  * What can that device support?
  * Will you just connect to the mesh as a single device ( laptop, phone, home router ), or will you do meshing?
* Based on these decisions you will need to choose a different protocol and setup procedure below.

### Endpoint types:
 * [L2TP/IPSEC](/networking/vpnl2tpipsec): Good general purpose VPN, works with most platforms, little bit oldschool, not meshy, not very fast. **Allows Anonymous Connections**
 * [Wireguard](/networking/vpnwireguard): Modern very secure VPN that is mostly Linux-only, very fast, but has some funny routing requirements. 
 * OpenVPN: Good General purpose VPN, works with most platforms, usually pretty fast on computers/servers but very slow on embedded devices.
 * VTrunkD: Experimental VPN for bonding multiple connections together. Interesting concept
 * Others?


## Endpoints

### Supernode 1:
 * [L2TP/IPSEC](/networking/vpnl2tpipsec): **l2tpvpn.sn1.mesh.nycmesh.net**
 * [Wireguard](/networking/vpnwireguard):  **wgvpn.sn1.mesh.nycmesh.net:51820**

