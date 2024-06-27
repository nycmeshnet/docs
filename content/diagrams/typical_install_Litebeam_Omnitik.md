---
title: Typical Node Install - LiteBeamAC + OmniTik5ac
weight: 800
---

The purpose of this diagram is to give a technical overview of the typical LiteBeam + Omnitik5ac install described in the [Typical Installations page]({{< ref "/intro/typical installs" >}}) - scenario 2 <br/><br/>

**NOTES**

* The last two octets of the 10.68.x.x/16 and 10.69.x.x/16 (mesh backbone) addresses [are determined by node number]({{< ref "/networking/10-69-net-network.md" >}})

* The last three octets of the 10.x.x.x/26 (member side of the OmniTik) network are also determined by node number and are calculated by the [OmniTik5ac config](https://github.com/nycmeshnet/nycmesh-configs/blob/master/Omnitik5AC/omni-poe-ether5-ros7.rsc.tmpl) on line 5. Each NYC Mesh LiteBeam/OmniTik installation has one of these unique /26 networks on the member side of its OmniTik. The OmniTik provides DHCP to this network, with the bottom *and top* 5 usable addresses being left out of the scope (for static assignment to home-routers, LiteBeam management etc). DNS is provided by 10.10.10.10. This 10.x.x.x/26 network is redistributed to the mesh backbone via OSPF.

* [LiteBeam5AC config here](https://github.com/nycmeshnet/nycmesh-configs/blob/master/LiteBeam5AC/lbe-new-8_7_1.cfg.tmpl)

* This diagram was created on app.diagrams.net (formerly draw.io). The diagram source is located in `/assets/diagram_source/` in this git repository


<img src="/img/diagrams/typical_install_Litebeam_Omni.png">
