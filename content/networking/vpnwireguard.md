---
title: "VPN - WireGuard"
---

[WireGuard](https://wireguard.com/) is a newer, simpler, and faster [Free Software](https://www.gnu.org/philosophy/free-sw.html) VPN implementation and protocol. For comparison, the older [L2TP/IPsec VPNs]({{< relref "vpnl2tpipsec.md" >}}) will max out at about 100Mbps, but WireGuard VPNs can reach speeds upward of 300-400Mbps on decent hardware and even 1Gbps on a good workstation. Performance is better on computers running a Linux kernel because the WireGuard project was designed to live within the Linux kernel from the start. Userspace ports for macOS, Windows, iOS, Android, and other platforms are now available but are not as performant as the Linux kernelspace implementation.

In addition to its speed, WireGuard has some great features such as [built-in roaming](https://www.wireguard.com/#built-in-roaming) (a single encrypted packet moves the tunnel to your new IP), [cryptokey routing](https://www.wireguard.com/#cryptokey-routing), and formal cryptographic verification. It also has some challenges, such as pre-key exchange and a lack of automatic address assignment. Cryptokey routing also presents its own challenges in some situations (see [§ A Note on Cryptokey Routing]({{< relref "#a-note-on-cryptokey-routing" >}})).

A WireGuard VPN is best suited for connecting single end-user devices such as laptops and phones to the mesh from afar, especially if the link is of otherwise poor quality.

## A Note on Cryptokey Routing
It's worth a section to touch on the cryptokey routign feature of WireGuard and how it works with the Mesh.  

All Wireguard nodes list their peers in a configuration file. Among the peer configuration is a public key and a list of acceptable IP ranges for the peer. Once the tunnel is brought up, packets from inside the tunnel must match the IPs in the list. Packets are routed to the peer using the IP range list and encrypted for the destination peer with its specific public key. Given this, no two peers may have overlapping IP ranges. Therefore, routing through two peers to another peer downstream on a network cannot be accomplished using WireGuard in this manner.  

However, the cryptokey routing is _per-interface_. It's possible for an interface to allow "all IPs" ( 0.0.0.0/0 ) to/from a peer. All IPs and dynamic routing can be accomplished over a fully open WireGuard interface, but only with one other peer, and one new interface for each peer pair.

## Device support
WireGuard implementations are being developed on a variety of platforms. The following list provides an overview, but see the [WireGuard Installation](https://www.wireguard.com/install/) instructions for further details.

* Linux: Yes!
* Android devices: Yes, some - See WireGuard website
* OpenWRT: Yes, in LEDE on latest versions, in certain builds
* Apple devices: Yes, some - See Wireguard website
* Mikrotik devices: No
* Ubnt routers: No (well, technically yes, but the module has caused lots of problems, so please don't use it yet)
* Windows devices: Yes, some - See WireGuard website

## Endpoints

### Supernode 1:
* IPv4/6: `wgvpn.sn1.mesh.nycmesh.net:51820`
* Protocols: Wireguard
* Supported connect methods:
    * End Device
    * BGP Node-Peering

## How To Connect

### Connecting end-devices
1. Ensure WireGuard will work on your device
1. Generate a public key, and give it to Zach.
1. Zach will give you the server public key and assign you an IP address. _This will change later, but just for now to get the docs out, this is what we currently do._
