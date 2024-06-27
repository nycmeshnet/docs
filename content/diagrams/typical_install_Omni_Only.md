---
title: Omni-Only Install
weight: 900
---

The purpose of this diagram is to give a technical overview of an Omnitik5ac-only install. This type of install should only be done if it is impractical to also install a LightBeamAC (e.g. no line-of-sight to a hub). Both types of installations (with and without LiteBeamAC) are depicted in the [Typical Installations page]({{< ref "/intro/typical installs" >}}) - scenario 2 <br/><br/>  



**NOTES**

* The last two octets of the 10.68.x.x/16 and 10.69.x.x/16 (mesh backbone) addresses [are determined by node number]({{< ref "/networking/10-69-net-network.md" >}})

* The last three octets of the 10.x.x.x/26 (member side of the OmniTik) network are also determined by node number and are calculated by the [OmniTik5ac config](https://github.com/nycmeshnet/nycmesh-configs/blob/master/Omnitik5AC/omni-only-ros7.rsc.tmpl) on line 5. Each NYC Mesh LiteBeam/OmniTik installation has one of these unique /26 networks on the member side of its OmniTik. The OmniTik provides DHCP to this network, with the bottom *and top* 5 usable addresses being left out of the scope (for static assignment to home-routers etc). DNS is provided by 10.10.10.10. This 10.x.x.x/26 network is redistributed to the mesh backbone via OSPF.

* This diagram was created on app.diagrams.net (formerly draw.io). The diagram source is located in `/assets/diagram_source/` in this git repository

<img src="/img/diagrams/Omni-only_Install.png">
