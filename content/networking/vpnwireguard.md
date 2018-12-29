---
title: "VPN - Wireguard" 
---

Wireguard is a new, simple, fast VPN protocol. It is designed to live within the Linux Kernel and thus is very small, simple, and fast. The entire project is very open and libre software, and the primary author is an excellent person.  
As it is intended to live within the Linux Kernel, it is not portable to other platforms, however, user-space (not in the kernel) implementation are up and coming, though all fairly new and spares. Wireguard works well on modern Linux devices ( See distros and packages [here](https://www.wireguard.com/install/).  
Speeds can be upwards of **300-400Mbps** on decent hardware, and **1Gbps** on a good workstation.  

Wireguard has some great features including Roaming ( a single encrypted packet moves the tunnel to your new IP ), Cryptokey Routing, Formal cryptographic verification, and very high speeds.  
It also has some challenges: pre-key exchange, no automatic address assignment, and Cryptokey routing.

The protocol is best for connecting end-devices to the mesh from afar ( phones, laptops, etc. ). 

## Cryptokey Routing
It's worth a section to touch on the cryptokey routign feature of Wireguard and how it works with the Mesh.  

All Wireguard nodes list their peers in a configuration file. Among the peer configuration is a public key and a list of acceptable IP ranges for the peer.  
Once the tunnel is brought up, packets from inside the tunnel must match the IPs in the list, and packets are routed to the peer using the IP range list and encrypted destine for the peer with the specific public key.
Given this, no two peers may have overlapping IP ranges, therefore routing through two peers to another peer downstream on a network cannot be accomplished using Wireguard in this manner.  

However, the cryptokey Routing is _per-interface_. It's possible for an interface to allow "all IPs" ( 0.0.0.0/0 ) to/from a peer. All IPs and dynamic routing can be accomplished over a fully open wireguard interface, but only with one other peer, and one new interface for each peer pair.


## Devices supported:
* Linux: Yes!
* Android devices: Yes, some - See Wireguard website
* Openwrt: Yes, in LEDE on latest versions, in certain builds
* Apple devices: iPhones using Testflight beta - See Wireguard website
* Mikrotik devices: No
* Ubnt routers: No ( yes, but the module has caused lots of problems, please don't use )
* Windows devices: No


## Endpoints

### Supernode 1:
 * IPv4/6: **wgvpn.sn1.mesh.nycmesh.net:51820**
 * Protocols: Wireguard
 * Supported connect methods:
   * End Device
   * BGP Node-Peering

## How To Connect
 * How to connect:
   * End-Device:
     * Ensure wireguard will work on your device, generate a public key, and give it to Zach. He will give you the server public key and assign you an IP.  
       _This will change later, just for not to get the Docs out, this is what we currently do._

