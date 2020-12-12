---
title: Hubs
---

Hubs provide connectivity for many nodes in a neighborhood. They come in three different sizes: small, medium, and large. These categories are not strict, and you will find many variants in the wild. You can mod your hub to suit your needs and the needs of other mesh members in your area.

## Small

A small hub is a souped up node. It consists of the standard node equipment – an [OmniTik 5 ac]({{< ref "/hardware/mikrotikomnitik5ac" >}}) and a [LiteBeam AC]({{< ref "/hardware/litebeamac" >}}) connected to a sector antenna at another hub or a supernode – and adds three [LiteAP AC sector antennas]({{< ref "/hardware/liteap" >}}). Each LiteAP has a 120° coverage area, so three will cover a full 360° around the building.

This setup uses four of the OmniTik's five ethernet ports. The fifth can serve your apartment.

There are many variants on a small hub. If part of your roof is blocked, you can use fewer sector antennas, which leaves more ports for connecting your neighbors to the mesh. You can make a point-to-point connection with your LiteBeam to get a higher bandwidth link to another hub. Adding a switch will give you more ethernet ports to serve more apartments. If nobody in your building needs service, you can have three sectors and two point-to-points or three point-to-points and two sectors.

An OmniTik's CPU can forward between 200-300 Mbps of traffic. This includes traffic from apartments at your hub as well as apartments on other nodes whose traffic traverses your hub. Keep in mind how many apartments you need to serve. A good rule of thumb is `X` Mbps per apartment, though your actual capacity depends on the bandwidth needs of your connected members.

Your capacity is limited by both the bandwidth of your radio links and the performance of your router. Adding a higher capacity radio won't make a difference if your OmniTik is already maxed out.

Small hubs can use the [standard OmniTik config](https://configgen.nycmesh.net/?device=Omnitik5AC&template=rooftop-ospf.rsc.tmpl). Medium and large hubs require custom configuration.

## Medium

A medium hub can handle at least 500 Mbps of traffic and can support more than five radios. It consists of an outdoor panel with AC power and a non-wireless router with many ethernet ports. The ports are used for sector antennas and point-to-point links – perhaps higher capacity AirFiber instead of AirMax.

Medium hubs are somewhat rare. It's difficult to find routers with enough PoE ports to power all the antennas, and putting a bunch of PoE injectors on an outdoor panel is a pain.

Medium hubs exist to support 7-8 antennas on a budget. Ideally for less than $1,000. The [RB1100AHx4](https://mikrotik.com/product/rb1100ahx4) is a router that can be used at medium hubs.

## Large

A large hub can handle at least `X` Mbps of traffic. The panel and the wired router is moved indoors, and an outdoor PoE switch like the [EdgePoint S16](https://store.ui.com/collections/operator-edgemax-control-points/products/edgepoint-s16) is mounted on the roof. The router and the switch are connected using either copper or fiber. Having a separate switch to handle the antennas lets you use a router with fewer ports, which gives you a lot more options for which router to use.

Equipment at the panel uses AC power. The outdoor switch uses DC power which is brought up to the roof from a power supply like the [EP-54V-150W](https://store.ui.com/collections/operator-accessories/products/edgepower-54v-150w) at the panel. The antennas are powered by the outdoor switch. Power usage can be in the 100s of watts.

Routers used at large hubs include models from the Mikrotik CCR1009 series and CCR1036 series, as well as standard PC servers running Linux. Large hubs may have more than one router.

## Supernode

A supernode is a BGP-capable large hub. It's the interface between the mesh and the public internet.

Supernodes are located in data centers and internet exchange points so that they can be directly connected to other ISPs. These interconnections are made with fiber. Supernodes exchange routes with ISPs using BGP. They perform NAT to translate addresses from the mesh's private `10.0.0.0/8` network into public IP addresses, and inject a default route into the mesh so that nodes on the mesh know how to reach the internet.

## Future

Hubs of these types do not exist yet. They may be built in the future as the mesh grows.

### Backbone nodes

A backbone node is a supernode, but just with fiber, no radio.

The buildings with the most abundant, cheapest opportunities to interconnect with other ISPs are not always the tallest buildings with the best lines of sight to surrounding neighborhoods. Building a backbone node at a location with inexpensive interconnection can save money by converting expensive supernodes into large fiber-attached hubs.

### Fiber-attached hubs

A fiber-attached hub is a hub of any size connected by fiber to a supernode or backbone node.

Currently, hubs are connected to other hubs and supernodes using a combination of point-to-point and point-to-multipoint radio links. Radio is susceptible to signal loss caused by rain, snow, and interference from other nearby radio transmitters. The more radio links your data has to traverse before it reaches a wired connection, the higher the odds that you experience service loss.

Ideally, every hub would be a fiber-attached hub. This would mean that everyone with line of sight to a hub would only have one wireless hop that's subject to interference and signal loss, substantially increasing reliability. To do this, the mesh would need to lease or get donations of dark fiber that run underground between each hub and a supernode or backbone node.

