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
