---
title: OSPF
---
Open Shortest Path First (OSPF) is a dynamic routing protocol. It uses a link state routing algorithm, thus, it performs functions such as detecting topologychanges and link failures. It generally converges quickly and in a loop-free manner. OSPF is often used in corporate networks within a datacenter or building.  

While OSPF is not generally used as a mesh protocol across a city, it has properties similar to other mesh protocols such as use of link state routing algorithms and auto-convergence.  

## Interfaces, Modes, and Network

Interfaces are the physical interfaces that OSPF may use to discover and connect with neighbors.  OSPF assumes that, by definition, an interface only has ONE IP Address. Since it's often not true, most implementations work-around this by creating multiple logical interfaces for each Interface-IP combo, but be aware it might not be true.  
Each interfaces has a "Network Type" which changes the way the interface discovers its neighbors.   
__Network types:__ 

  - __Broadcast__ - Broadcasts Hello packets for discovery, Adds the local network as "intra-area network" to the topology
  - __Point-To-Multipoint (PTMP)__ - Broadcasts Hello packets for discovery, Only exchanges the local router's IP into the topology.
  - __Point-To-Point (PTP)__ - Does not broadcast Hello packets, Neighbors must be manually added. Only exchanges the local router's IP into the topology.

The Broadcast network type _seems like_ it would be the most desirable -- but there is a major flaw:  
When an interface is put into this mode, the routers all exchange "Hello" packets, and collectively elect a Designated Router (DR). This one router is responsible for communicating with all other routers and making collective decisions.  However, it is assumed that all nodes can equally be the DR and can speak with all other nodes on the network directly.  If it's not possible, due to Client Isolation, filtering, or something else, then the network will fail to form properly and strange things will happen. For example, a DR could be elected that cannot communicate with some of the nodes, if so, those other nodes will show-up in the network as neighbors, but will not be routable, making the network very confusing.

PTMP, on the other hand, still sends "Hello" packets for discovery, but forms full connects between each node pair rather than electings DR.  
At first it sounds confusing, but, with no DR, each router only learns about the neighbors it can see; but still exchanges all neighbor's neighbors with each other.  The major positive is that the network need not be fully broadcast capable for this to function.  

On the down side, PTMP mode does not exchange the local-subnet, but rather just each router's single IP address. ( a /32 IPv4 for example. )  
This might be great for node discovery, but it doesnt help laptops that are connected to the node via the local subnet. These network should be Broadcast or External.

Example topology:

![nycmesh-ospf-broadcastvsptmp.png](/img/nycmesh-ospf-broadcastvsptmp.png)


## Positives and negatives

OSPF is an interesting choice as an in-neighborhood routing protocol because of it's easy of setup ( auto convergence, no ASNs ), and how ubiquitous it is ( nearly every cheap and expensive commercial and open device supports it ). These two positives alone make OSPF worth considering.

On the down-side, it is not specifically designed for an adhoc mesh, it trusts blindly, and has very few tunables. Additionally, there are a few technical challenges such as the lack of link-local address use, only advertising connected networks ( not summaries ), and some common defaults on various platforms.  

Many of these challenges can be overcome by taking some care to make good choices for options when setting up a network.

## NYC Mesh OSPF Rules

As OSPF has some challenges in deployment outside of a datacenter environment, we will need to all adhere to some rules to prevent routing problems.
OSPF, unlike BGP or other protocols, may/will refuse to connect to a peer which has different parameters set and can be a source of confusion.  
Please follow these rules unless there is a good reason not to:

  1. General
    1. All OSPF usage will be on area `0.0.0.0` ( backbone area )
    1. Set Router ID to the "dot 1" of the Node's IP Allocation
    1. Network Types:
      - "Point-to-Multipoint" Network Type should be used on: Subnets with Client Isolation, Networks between Nodes.
      - "Broadcast" Network Type should be used on: Subnets for user-access (within a node).
    1. All OSPF timers should be set to ( this is typically default ): 
      - Link Cost 10
      - Retransmit Interval 5
      - Transmit Delay 1
      - Hello Interval 10
      - Dead Router Interval 40
  1. Rooftops:
    1. Choose BGP **or** OSPF ( if both, go to next category )
    1. Enable and add OSPF Interface for Peer links as PTMP Network Type. Add the IP Range for peer to OSPF Networks.
       - Rooftops will probably use DHCP to connect to a Hub or each other, static addresses are not required and the IP can change. 
       - Do not install a DHCP Default route; let this come from OSPF.
    1. Enable and add OSPF Interface(s) for local networks as Broadcast Network Type. Add the IP Range for the peer to the OSPF Networks.
    1. Optionally set administrative distance for OSPF to 205
  1. Hubs ( or nodes running both BGP and OSPF ):
    1. All routers at a site that run BGP must also run OSPF and use the same ASN
    1. OSPF routes are redistributed to BGP; but never BGP redistributed to OSPF
    1. A default route should be distributed "always" as a "type 1" route
    1. On Interfaces connected to other Hubs or Supernodes, do not enable OSPF, only BGP
       - _If you must enables OSPF, set the administrative distance to 205_
       - _All through-hub-paths across multiple routers must follow the above BGP plus OSPF rule_
    1. Add import and export filter for routes that add BGP Community `65000:110` and set the Distance to `205`
    1. Enable and add OSPF Interface for Sector antennas as PTMP Network Type. Add the IP Range for the network to OSPF Networks
       - Enable a DHCP Server on this network for clients to connect with.
    1. Enable and add OSPF Interface(s) for local networks as Broadcast Network Type. Add the IP Range for the peer to the OSPF Networks.


## Example Setup writeup:
 
Consider the following diagram:  
![nycmesh-ospfexample.png](/img/nycmesh-ospfexample.png)



- In this diagram are two hubs. They both speak BGP as two different ASNs and see many routes plus default routes. They run BGP and OSPF and install a Default Route in OSPF. They do not, however, distribute all the BGP routes into OSPF, so initially the OSPF table is just the nodes themselves with a default route. They also do not speak OSPF with each other, thus they only see BGP routes in the local routing table.  
- The next two rooftops which can see the Hubs speak only OSPF. With AP-to-Client antennas pointing to the Hubs, they get IPs from the Hubs via DHCP but do not install a default route. They join their hubs as neighbors and exchange routes. The Hubs each get a new set of local-routes from each rooftop, and the rooftops get the Hub's local routes plus a default route. As the default route is installed from the hubs, they also begin to originate a default route.  
- The first two rooftops are connected together somehow, one of them gives the other an address, and they also exchange the routes, including their own local routes, plus the hub local routes from each hub, plus each hub's respective default route. Now both nodes should have a four nodes worth of routes, and two default routes, and each routing to the nearest hub.  
- The third rooftop is connected to one or both of the other two via point to point antennas. It gets a DHCP IP Address from both of them ( two interfaces ), but does not install a default route. It announces its local routes via OSPF to those rooftops, which in-turn gives them to the other two rooftops, which give them to the hub. Likewise this third rooftop receives all routes plus two default routes for the two hubs. It chooses one of them via its routing algorithm and installs the default route. Upon this, it too announces a default route to rooftops that may connect to it.  
- The fourth rooftop is similar to the third. It gets an address from the third rooftop for routing, but it holds its own IPs as well, and send the prefixes into the OSPF mesh. It receives some routes from the third rooftop, including a default route, which it installs and also begins to announce.  
- The hub nodes each gather and announce all these routes under their own ASN ( "BGP Anycast" ) to the rest of the mesh. Approximately 13 additional routes are present from this setup -- one per connected interface per node, about 2-3 per node.


## Examples
Some configuration examples for BGP implementations known to be in use within NYC Mesh today are listed below in no particular order.

### Bird

<details>
<summary>**Expand Bird Example**</summary>

</details>

### UBNT/EdgeOS

<details>
<summary>**Expand UBNT/EdgeOS Example - GUI Version**</summary>

</details>

<details>
<summary>**Expand UBNT/EdgeOS Example - CLI Version**</summary>

</details>

### Mikrotik/RouterOS


<details>
<summary>**Expand Mikrotik Example - GUI Version**</summary>

- Click Routing > OSPF
  - Instances Tab - Click the default instance
    - Change the `Redistribute Default Route` to `always ( as type 1 )` for a hub, or `if installed ( as type 1 )` for a non-hub
    - Change the router-id to be appropriate
    - Click OK
  - Interfaces Tab
    - Click `Add New` and add an interface with default settings ( verify they are the same as above in rules, should be ), for each interface, or, `all` if appropriate.
  - Networks Tab
    - Click `Add New` and add a network for each subnet that should be routable in the network.
- click Routing > Filters
  - Click `Add New`, and set:
    - Matchers:
      - Chain: `ospf-in`
    - Actions: 
      - Action: `passthrough`
      - Set Distance: `205`
    - BGP Actions:
      - Set BGP Communities ( click Down arrow, then click new Down arrow to get a box ): `65000:110`
    - Click OK
- Neighbors will show under Routing > OSPF > Neighbors

</details>

<details>
<summary>**Expand Mikrotik Example - CLI Version**</summary>

Starting from the default configuration, assuming interface definitions haven't been created already, etc:

```
/routing ospf instance set [ find default=yes ] distribute-default=always-as-type-1 router-id=10.70.3.1
/routing filter add chain=ospf=in set-bgp-communities=65000:110 set-distance=205
/routing ospf interface add network-type=broadcast
/routing ospf network add area=backbone network=10.70.3.0/24

```

</details>


