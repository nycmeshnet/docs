---
title: Hubs
---

Hubs provide connectivity for many nodes in a neighborhood. They come in three different sizes: small, medium, and large. These categories are not strict, and you will find many variants in the field. You can modify your hub to suit your needs and the needs of other mesh members in your area.

## Small

The smallest possible hub is a standard node, an [OmniTik 5 POE ac]({{< ref "/hardware/mikrotikomnitik5ac" >}}), with an added [LiteBeam AC]({{< ref "/hardware/litebeamac" >}})  connected to a sector antenna at another hub or supernode to give it a reliable upstream connection. The OmniTik can then serve nearby nodes that have OmniTiks or other compatible equipment using WDS.

For a more robust small hub that can serve more nodes, you can add one or more [LiteAP AC sector antennas]({{< ref "/hardware/liteap" >}}). Each LiteAP has a 120° coverage area, so three will cover a full 360° around the building. A hub with three LiteAPs and a LiteBeam uses four of the OmniTik’s five ethernet ports. The fifth can serve your apartment.

There are many variants on a small hub. If part of your roof is blocked, you can use fewer sector antennas, which leaves more ports for connecting your neighbors to the mesh. You can make a point-to-point connection with your LiteBeam or with an [SXTsq 5 ac]({{< ref "/hardware/sxtsqg5acd" >}}) to get a higher bandwidth link to another hub. Adding an outdoor switch such as a [NanoSwitch](https://store.ui.com/collections/operator-accessories/products/nanoswitch), [EdgePoint R6]({{< ref "/hardware/epr6" >}}), [EdgePoint R8](https://store.ui.com/collections/operator-edgemax-control-points/products/edgepoint-r8), [netPower Lite 7R](https://mikrotik.com/product/netpower_lite_7r) or [netPower 15FR]({{< ref "/hardware/mikrotiknetpower15fr" >}}) will give you more ethernet ports to serve more apartments. If nobody in your building needs service, you can have three sectors and two point-to-points or three point-to-points and two sectors.

Small hubs can use the [standard OmniTik config](https://configgen.nycmesh.net/?device=Omnitik5AC&template=rooftop-ospf.rsc.tmpl). Medium and large hubs require custom configuration.

## Medium

A medium hub can support more than five radios and forward more traffic than a small hub, without requiring the building to provide indoor space for equipment. It consists of a weatherproof enclosure on the roof with AC power and a non-wireless router. The ethernet ports on the router are used for sector antennas and point-to-point links – which can be either Ubiquiti airMAX radios like the LiteBeam AC or higher capacity airFiber.

Medium hubs are somewhat rare. It’s difficult to find routers with enough Power over Ethernet ports to power all the antennas, and putting a large number of PoE injectors in a weatherproof enclosure can be impractical.

Medium hubs can support 7-8 antennas on a budget, ideally for less than $1,000. The [RB1100AHx4](https://mikrotik.com/product/rb1100ahx4) is a router that can be used at medium hubs.

## Large

A large hub is both more flexible and more expensive than a medium hub. It requires an indoor panel with AC power. The wired router is mounted on the panel indoors, and an outdoor PoE switch like the [EdgePoint S16](https://store.ui.com/collections/operator-edgemax-control-points/products/edgepoint-s16) is mounted on the roof. The router and the switch are connected using either copper or fiber. Having a separate router and switch lets you use a router with fewer ports, which gives you a lot more options for which router to use.

Equipment at the panel uses AC power. The outdoor switch uses DC power brought up to the roof from a power supply like the [EP-54V-150W](https://store.ui.com/collections/operator-accessories/products/edgepower-54v-150w), which is mounted at the panel. The antennas are powered by the outdoor switch. Power usage can be in the hundreds of watts.

Routers used at large hubs include models from the Mikrotik CCR1009 series and CCR1036 series, as well as standard PC servers running Linux. Large hubs may have more than one router.

## Supernode

A supernode is a BGP-capable large hub. It’s the interface between the mesh and the public internet.

Supernodes are located in data centers so that they can be connected to an internet exchange point or directly connected to other ISPs. These interconnections are mostly made with fiber. Supernodes exchange routes with ISPs using BGP. They perform NAT to translate addresses from the mesh’s private `10.0.0.0/8` network into public IP addresses, and inject a default route into the mesh so that nodes on the mesh know how to reach the internet.

## Future

These types of hubs don’t exist yet. They may be built in the future as the mesh grows, and are documented for planning purposes.

### Backbone nodes

A backbone node is a supernode, but with no radio on the roof. It is attached to other hubs with fiber.

The buildings with the most abundant, cheapest opportunities to interconnect with other ISPs are not always the tallest buildings with the best lines of sight to surrounding neighborhoods. Building a backbone node at a location with inexpensive interconnection can save money by converting expensive supernodes into large fiber-attached hubs.

### Fiber-attached hubs

A fiber-attached hub is a hub of any size connected by fiber to a supernode or backbone node.

Currently, hubs are connected to other hubs and supernodes using a combination of point-to-point and point-to-multipoint radio links. Radio is susceptible to signal loss caused by rain, snow, and interference from other nearby radio transmitters. The more radio links your data has to traverse before it reaches a wired connection, the higher the odds that you experience service loss.

Ideally, every hub would be a fiber-attached hub. This would mean that everyone with line of sight to a hub would only have one wireless hop that’s subject to interference and signal loss, substantially increasing reliability. To do this, the mesh would need to lease or get donations of dark fiber that run underground between each hub and a supernode or backbone node.

