---
title: OSPF
---
Open Shortest Path First (OSPF) is a dynamic routing protocol. It uses a link state routing algorithm, thus, it performs functions such as detecting topology changes and link failures. It generally converges quickly and in a loop-free manner. OSPF is often used in corporate networks within a datacenter or building.  

While OSPF is not generally used as a mesh protocol across a city, it has properties similar to other mesh protocols such as use of link state routing algorithms and auto-convergence.  

## Positives and negatives

OSPF is an interesting choice as an in-neighborhood routing protocol because of its ease of setup (auto convergence, no ASNs), and how ubiquitous it is -- nearly every cheap and expensive commercial and open device supports it. These two positives alone make OSPF worth considering.

On the down-side, it is not specifically designed for an adhoc mesh, it trusts blindly, and has very few tuneables. Additionally, there are a few technical challenges such as the lack of link-local address use, only advertising connected networks (not summaries), and some common defaults on various platforms.  

Many of these challenges can be overcome by taking some care to make good choices for options when setting up a network.

## OSPF Selection

NYC Mesh has chosen to use OSPF as the standard mesh routing protocol of choice. This may be a controversial choice, as _most_ mesh networks in Europe are using custom mesh routing protocols, or encrypted routing protocols. We have chosen this path because:

* OSPF is an open-standard with implementations on many platforms, open and closed, including cheap older professional switches
* OSPF hugely reduces the burden for installers and members to maintain the network
* OSPF cooperates well with other protocols such as BGP
* Other Mesh networks ( CTWUG in South Africa for example ) have scaled OSPF to 1000+ routers.

## NYC Mesh OSPF Rules

As OSPF has some challenges in deployment outside of a datacenter environment, we will need to all adhere to some rules to prevent from encountering a routing problem.
OSPF, unlike BGP or other protocols, may/will refuse to connect to a peer which has different parameters set and can be a source of confusion.  
Please follow these rules unless there is a good reason not to:

  1. General
    1. All OSPF usage will be on area `0.0.0.0` ( backbone area )
    1. Set Router ID to the 10-69-net address of the Node
    1. All OSPF timers will be set to ( this is typically default ):
      - Link Cost 10
      - Retransmit Interval 5
      - Transmit Delay 1
      - Hello Interval 10
      - Dead Router Interval 40
  1. Interfaces should be in PtMP mode (not broadcast)
  1. OSPF "networks" should only be the 10-69-net, unless there is a special case
  1. Redistribute Default Route should be `never`, unless you are distributing a default route
    1. If you are redistributing a default route, do so `as type 1`
    1. Check with the rest of the network what the correct metric should be
  1. Redistribute user networks via Redistribute Connected `as type 1`
  1. Mikrotik Only: Filter VPN point-to-point /32 links. They cause trouble.
  1. Do not also run BGP, unless there is a special case; take care of metrics in this case.

## Point-to-Point Configuration

_Note: This guide contains in-depth parameters on Layer 2 and 3 configurations. This guide is not meant to be a comprehensive guide on overall networking, but an extension of existing concepts to solve Mesh-specific problems._

### What is the "Mesh bridge"?
On the Mesh, most intranet connections will have the parameters listed above, in most cases on the "mesh bridge", which on most routers is an isolated, virtualized switch that connects home/apartment routers and radios together. All of the radios on the NYC Mesh network are configured to operate in "bridge" mode, which means that the routers themselves are responsible for sending and routing packets to their neighbors which will be visible through the connected radios.

Sometimes the need will arise that a particular link should have different parameters than the ones listed above, most frequently that the Link Cost will be higher or lower to adjust its "priority" when dealing with multiple links and routes between hubs. The solution to this is to remove the link from the mesh bridge and implement a dedicated OSPF interface between two routers with a point-to-point address space. However, the implementation depends on the path that the route takes, specifically if there are any switches in the way.

#### Preparation: Maintain reachability of the radios with a management VLAN

By default, most equipment being deployed on the Mesh will use in-band management, where the settings page of the radio will be accessible via the same port as the link traffic. Now that the link will be taken off of the mesh bridge, we have to ensure that we set up an alternative path for us to reach the management page of the radios before making this change.

On Ubiquiti radios, the Management VLAN option can be selected on the "Network" menu. The number is mostly arbitrary, as long as it is unique on both ends of the link. The standard Mesh practice is to name it in relation to the port the radio is connected to (e.g. an AF60LR is connected to port 5 on an OmniTik, so its management VLAN will be 501).

_Note: Some hubs, especially if there is a managed switch present connecting all the radios, may have a dedicated mesh bridge VLAN for management purposes, which you should set this to instead. You can then skip the line below, which refers to a radio directly connected to a router._

On the router side, this VLAN has to be added to the mesh bridge. First, the VLAN has to be associated with the port in question, and then the VLAN will be added to the mesh bridge for the radio to be reachable. The commands for the above example are as follows:
```
/interface vlan add interface=ether5 vlan-id=501 name="ether5.501"
/interface bridge port add interface=ether5.501 bridge=mesh 
```

#### Analysis: Evaluate the path of the link

The simplest configuration for a point-to-point OSPF configuration is to be where the radios are directly connected to two routers (e.g. OmniTik to OmniTik) with no switches in the way. In this setup, you can leave the ports on the routers "untagged", meaning that the traffic is unaltered after it leaves the interface on one router and arrives on another.

A more complex yet common setup is where one or more of the radios are connected to a managed switch. The switch will need to know that this link is dedicated, so you will have to assign a new VLAN for traffic on either end between the router and the swtich.

##### Example: Router only on one side (port 5), router+switch on other side (port 9)
OmniTik < Untagged > AF60LR Link < Untagged > EP-S16 < VLAN 901 > OmniTik

##### Example: Route+switch on both sides, one side on port 3 and other side on port 9
OmniTik < VLAN 301 > EP-S16 < Untagged > AF60LR Link < Untagged > EP-S16 < VLAN 1090 > OmniTik

_Note: In these examples, the wireless link has no tags on it, as the switches have the radio ports untagged - only the link to the router is tagged. This is not a hard-and-fast design decision nor a requirement, but avoids having to unnecesarily coordinate VLANs across hubs._

The most complex variation of this configuration is when you are traversing an "unmanaged" switch. To achieve proper isolation across the link with the mesh bridge on the interface, your OSPF setup will need to traverse the VLAN on the whole route.

##### Example: Router only on one side (port 5), router+dumb switch on other side (port 2)
OmniTik < VLAN 502 > LBE-LR Link < VLAN 502 > Nanoswitch < VLAN 502 > OmniTik

#### Implementation: add the IP and OSPF configuration to your new interface

Once you have your VLANs configured on any routers or switches on the path, you can now add the point-to-point IP configuration to the link. On the Mesh, we use /31s between routers that support this type of addressing, and /30s for routers that do not support /31s or if the support is not consistent on both sides (e.g. MikroTik to Juniper).

The first step is to add your IPs to the interfaces on each router. On a MikroTik, /31s are configured in a strange way indicated below, but other routers would use a /30 in a traditional fashion.
```
# Router A
/ip address add interface=ether5.502 address=10.70.253.0/31 network=10.70.253.1
# Router B
/ip address add interface=ether2.205 address=10.70.253.1/31 network=10.70.253.0 # Router B
```

Then, create an OSPF interface on your link interfaces. The parameters should match the above, except for the link cost if you are setting this up to be different than 10. _Note: You can also adjust your OSPF timers in this step, but make sure they are the same on both routers, or else the adjacency will not be established._ The most important part is to keep the defaults except for setting the link type to "ptmp". Next, you will add the /30 or /31 in your networks list.

Finally, check to see if the adjacency establishes by looking at the neighbors output. If you see the other IP address on the list with a "Full" state, you did it! The routers are now able to exchange routes and send traffic to each other. If the state is "Init", "Exchange", "2-Way" or some other weird thing, give it a couple minutes to establish, but your VLAN, IP, or OSPF configuration may be wrong, preventing OSPF traffic from reaching the other router.
