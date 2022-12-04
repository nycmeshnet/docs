---
title: Typical Node Install - LiteBeamAC + OmniTik5ac
weight: 900
---

The purpose of this diagram is to give a technical overview of the typical LiteBeam + Omnitik5ac install described in the [Typical Installations page]({{< ref "/intro/typical installs" >}}) - scenario 2

**NOTES**

* The last two octets of the 10.68.x.x/16 and 10.69.x.x/16 (mesh backbone) prefixes [are determined by node number]({{< ref "/networking/10-69-net-network.md" >}})

* The last three octets of the (subscriber-side of the Omni) 10.x.x.x/26 network are also determined by node number and are calculated by the [OmniTik5ac config](https://github.com/nycmeshnet/nycmesh-configs/blob/master/Omnitik5AC/omni-poe-ether5.rsc.tmpl) on line 5. Each mesh subscriber has one of these unique /26 networks on the subscriber side of its mesh router. This 10.x.x.x/26 network is redistributed to the mesh backbone via OSPF.

* [LiteBeam5AC config here](https://github.com/nycmeshnet/nycmesh-configs/blob/master/LiteBeam5AC/lbe-new-8_7_1.cfg.tmpl)

* This diagram was created on app.diagrams.net (formerly draw.io). The diagram source is located in /assets/diagram_source/ at the root of this git repository

<img src="/img/diagrams/Mesh_typical_install.png">
