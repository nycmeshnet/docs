---
title: OSPF
---
Open Shortest Path First (OSPF) is a dynamic routing protocol. It uses a link state routing algorithm, thus, it performs functions such as detecting topologychanges and link failures. It generally converges quickly and in a loop-free manner. OSPF is often used in corporate networks within a datacenter or building.  

While OSPF is not generally used as a mesh protocol across a city, it has properties similar to other mesh protocols such as use of link state routing algorithms and auto-convergence.  

## Positives and negatives

OSPF is an interesting choice as an in-neighborhood routing protocol because of it's easy of setup ( auto convergence, no ASNs ), and how ubiquitous it is ( nearly every cheap and expensive commercial and open device supports it ). These two positives alone make OSPF worth considering.

On the down-side, it is not specifically designed for an adhoc mesh, it trusts blindly, and has very few tunables. Additionally, there are a few technical challenges such as the lack of link-local address use, only advertising connected networks ( not summaries ), and some common defaults on various platforms.  

Many of these challenges can be overcome by taking some care to make good choices for options when setting up a network.

## NYC Mesh OSPF Rules

_( Updated Jan 2019, in progress )_

As OSPF has some challenges in deployment outside of a datacenter environment, we will need to all adhere to some rules to prevent from a routing problem.
OSPF, unlike BGP or other protocols, may/will refuse to connect to a peer which has different parameters set and can be a source of confusion.  
Please follow these rules unless there is a good reason not to:

  1. General
    1. All OSPF usage will be on area `0.0.0.0` ( backbone area )
    1. Set Router ID to the "dot 1" of the Node's IP Allocation
    1. All OSPF timers will be set to ( this is typically default ): 
      - Link Cost 10
      - Retransmit Interval 5
      - Transmit Delay 1
      - Hello Interval 10
      - Dead Router Interval 40
  1. Hubs ( or nodes running both BGP and OSPF ):
    1. All routers at a site that run BGP must also run OSPF and use the same ASN
    1. OSPF routes are redistributed to BGP; but never BGP redistributed to OSPF
    1. A default route should be distributed "always" as a "type 1" route
    1. On Interfaces connected to other Hubs, do not enable OSPF, only BGP
       - _If you must enables OSPF, set the administrative distance to 205_
       - _All through-hub-paths across multiple routers must follow the above BGP plus OSPF rule_
    1. Add import and export filter for routes that add BGP Community `65000:110` and set the Distance to `205`
    1. Enable and add OSPF Networks for all Sector / Tenant interfaces. Do not enable Hub-Hub or Hub-Supernode interfaces
  1. Rooftops:
    1. Choose BGP **or** OSPF ( if both, go up one category )
    1. A default route should distributed "if installed" as a "type 1" route
    1. Optionally set administrative distance to 205
    1. Enable and add OSPF Networks for all interfaces; manually set IP Range for the Sector interface of the hub this node would connect to.
    1. Rooftops will probably use DHCP to connect to a Hub or each other, static addresses are not required and the IP can change. 
       - Do not install a DHCP Default route; let this come from OSPF.


## Example Setup writeup:
 
Consider the following diagram:  
![nycmesh-ospfexample.png](/img/nycmesh-ospfexample.png)



- In this diagram are two hubs. They both speak BGP as two different ASNs and see many routes plus default routes. They run BGP and OSPF and install a Default Route in OSPF. They do not, however, distribute all the BGP routes into OSPF, so initially the OSPF table is just the nodes themselves with a default route. They also do not speak OSPF with each other, thus they only see BGP routes in the local routing table.  
- The next two rooftops which can see the Hubs speak only OSPF. With AP-to-Client antennas pointing to the Hubs, they get IPs from the Hubs via DHCP but do not install a default route. They join their hubs as neighbors and exchange routes. The Hubs each get a new set of local-routes from each rooftop, and the rooftops get the Hub's local routes plus a default route. As the default route is installed from the hubs, they also begin to originate a default route.  
- The first two rooftops are connected together somehow, one of them gives the other an address, and they also exchange the routes, including their own local routes, plus the hub local routes from each hub, plus each hub's respective default route. Now both nodes should have a four nodes worth of routes, and two default routes, and each routing to the nearest hub.  
- The third rooftop is connected to one or both of the other two via point to point antennas. It gets a DHCP IP Address from both of them ( two interfaces ), but does not install a default route. It announces its local routes via OSPF to those rooftops, which in-turn gives them to the other two rooftops, which give them to the hub. Likewise this third rooftop receives all routes plus two default routes for the two hubs. It chooses one of them via its routing algorithm and installs the default route. Upon this, it too announces a default route to rooftops that may connect to it.  
- The fourth rooftop is similar to the third. It gets an address from the third rooftop for routing, but it holds its own IPs as well, and send the prefixes into the OSPF mesh. It receives some routes from the third rooftop, including a default route, which it installs and also begins to announce.  
- The hub nodes each gather and announce all these routes under their own ASN ( "BGP Anycast" ) to the rest of the mesh. Approximately 13 additional routes are present from this setup -- one per connected interface per node, about 2-3 per node.


