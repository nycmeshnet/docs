---
title: 10-69-net Network
---

The 10-69 network is used to connect nodes on NYC Mesh. Every mesh router at every node on the mesh gets an IP address from `10.69.0.0/16`. Each router's IP address can be computed from the router's node number. The 10-69 network supports up to two routers per node.

The 10-69 network allows for routers at nodes to auto-discover each other using [OSPF]({{< relref "ospf" >}}) with minimal configuration. This makes it possible for anyone to join the mesh with almost no intervention from other mesh members. All you need to do is [request a node number](https://nycmesh.net/join). No IP addresses, subnets or VLANs have to be statically allocated, configuration can be [auto-generated](https://configgen.nycmesh.net) from your node number, and nobody has to log in to any routers at neighboring nodes to update their configuration. As long as you have line of sight to another node and configure your router to use OSPF on the 10-69 network, you can join the mesh.

Each mesh router bridges its wired and wireless interfaces together into a single interface. The 10-69 network is link-local to this bridge. The bridge's IP address is the router's 10-69 address, and every router sees `10.69.0.0/16` as directly connected in its routing table. Because the 10-69 network is link-local, you will never see `10.69.0.0/16` in the OSPF routing table. Instead, you will see a `/32` (a route to a single host) for every router that's online.

All routers connected to the bridge are isolated from each other at layer 2. They can only talk to the router hosting the bridge. This is equivalent to a port-isolated switch with the host router on the uplink port. Without port isolation, the mesh would become a huge layer 2 broadcast domain: every router's bridge would be directly connected to every other router's bridge.

Port isolation also makes sure that the topology of the layer 2 network mirrors the physical layer's topology. A bridge without port isolation is a broadcast domain, but the mesh is primarily made up of point-to-point and point-to-multipoint radio links. If routers A and B connect wirelessly to router C's bridge, we want OSPF adjacencies for A-C and B-C, but not A-B. This is because routers A and B are not actually neighbors – all traffic between A and B has to flow through C.

All OSPF interfaces that use the 10-69 network are configured in point-to-multipoint mode. Like broadcast interfaces, PtMP interfaces can automatically discover their neighbors, so OSPF neighbors don't have to be set statically in the router's configuration. Unlike broadcast interfaces,  [RFC 2328](https://tools.ietf.org/html/rfc2328) does not specify how OSPF should perform auto-discovery on PtMP interfaces. The mesh assumes that auto-discovery will be performed using the AllSPFRouters multicast IP address (`224.0.0.5`), but not all OSPF implementations support this.

The ability to easily compute IP address from node number is also useful for troubleshooting: if you need to see if a node is reachable, convert its node number into its first router's 10-69 address and ping it.

In addition to the 10-69 network, a `/26` for users of your node can be computed from your node number. The [standard OmniTik config](https://configgen.nycmesh.net/?device=Omnitik5AC&template=rooftop-ospf.rsc.tmpl) will hand these addresses out using DHCP. These addresses are computed linearly starting at `10.96.0.0/26` (followed by `10.96.0.64/26`, `10.96.0.128/26`, etc.).

## Generating an IP address

The first router at each node can auto-generate its own 10-69 IP address using the following method:

The router's address will take the form of `10.69.X.Y`. Take the node number and split it after the second digit. For example, node number 12345 becomes 123 and 45. The digits on the left, in this case 123, are bound to `X`, and the digits on the right are bound to `Y`, giving us `10.69.123.45`.

`Y` can be between one and two digits, so it can't be greater than 99. `X` can in theory be any number of digits, but each number in an IPv4 address can only range from 0 to 255, so `X` can't be greater than 255. This means that the highest node number possible in this addressing scheme is 25,599.

For example:

|Node Number|X|Y|10-69-net Address|
|---|---|---|---|
|5|0|5|10.69.0.5|
|50|0|50|10.69.0.50|
|500|5|00|10.69.5.0|
|5000|50|00|10.69.50.0|
|50000|X|Y|Not Possible|
|25599|255|99|10.69.255.99|

## Adding a second router

Most of the time, one router per node is enough, but sometimes it's useful to add a second router.

To generate an address for a second router, just add 100 to `Y`. Going back to the previous example, the address of the second router at node 12345 would be `10.69.123.145`.

For example:

|Node Number|X|Y|First router|Second Router|
|---|---|---|---|---|
|5|0|5|10.69.0.5|10.69.0.105|
|50|0|50|10.69.0.50|10.69.0.150|
|500|5|00|10.69.5.0|10.69.5.100|
|5000|50|00|10.69.50.0|10.69.50.100|
|50000|X|Y|Not Possible|Not Possible|
|25599|255|99|10.69.255.99|10.69.255.199|
