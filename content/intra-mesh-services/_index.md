---
title: Intra-Mesh Services and Applications
weight: 300
---

Among the many benefits of participating in NYC Mesh is the ability to access services and applications that are owned and operated by fellow New Yorkers, be they neighbors who live across the street or friends who live in another part of the city. Since these applications are hosted by computers that are (usually) physically attached to the NYC Mesh network, they will remain available even if access to the Internet at large is not. This characteristic, in which a major Internet outage would not affect NYC Mesh-hosted applications and websites, is why we call these services *intra-mesh services*. Colloquially, you may hear people describe these services as being "on the mesh."

Inversely, this same characteristic means that intra-mesh services are typically *not* available to the Internet at large. A friend living in Europe, for example, can not access an NYC Mesh intra-mesh service because they are simply too far away from NYC Mesh's mesh network in order to connect to it. The only exception to this is in the case of a computer or network connected to the NYC Mesh mesh network by way of a *Virtual Private Network (VPN)* interface. The VPN is a special-case service that provides a way to temporarily "move" a computer that is physically outside of the mesh so that it is logically inside of it. Refer to the [NYC Mesh VPN documentation]({{< relref "vpn" >}}) for more details about this feature.

Unlike many well-known sites on the Internet such as Facebook, intra-mesh services are run by individual members just like you. This arguably makes them much more personable. It also means that most of the intra-mesh services currently hosted on the mesh focus on very local topics, such as issues relevent to specific neighborhoods or applications that help NYC Mesh volunteers monitor the health of the network itself.

This section of the NYC Mesh Docs attempts to document all known intra-mesh services and applications that are accessible to NYC Mesh members. It also offers a brief overview of the purpose, use, and configuration of the application or service, along with contact information for the service's operator or administrative team, if available. If you run an intra-mesh service and want it listed here, please get in touch with the NYC Mesh Documentation team by [submitting a new issue ticket](https://github.com/nycmeshnet/docs/issues/new) or [opening a new pull request on GitHub](https://github.com/nycmeshnet/docs/blob/master/README.md#making-changes), or posting a message to [the `#docs` channel on our Slack](https://nycmesh.slack.com/messages/docs).

## Accessing intra-mesh services

In the simplest cases, an intra-mesh service can be accessed merely by typing its address into your Web browser's location bar while your computer is connected to the NYC Mesh network. This is because, at the most basic level, an intra-mesh service functions very similarly to any other online service available on the Internet. Each service has a network address (a URL), and many also have graphical user interfaces (GUIs) that can be loaded in a traditional Web browser such as [Mozilla Firefox](https://getfirefox.com/).

### Accessing intra-mesh services at `.mesh` domain names

NYC Mesh supplies internal [domain names](https://simple.wikipedia.org/wiki/Domain_Name_System) to intra-mesh services for free under a `.mesh` top-level domain. A top-level domain (TLD) is simply the last or right-most part of the domain name for a given service. For example, the TLD for both "Google.com" and "Facebook.com" is `.com`.

In addition to these conventional TLDs, computers connected to NYC Mesh can *also* access services that have been given `.mesh` domain names. So, for example, you could host a blog at a URL like `my-mesh-life.mesh` and readers would be able to type `http://my-mesh-life.mesh` into their Web browsers to load and read it.

For more information about the `.mesh` TLD, see our [Network Design Reference § DNS]({{< relref "network-design/dns" >}}) documentation.

### Accessing intra-mesh services at IP addresses

In addition to `.mesh` domain names, many intra-mesh services are also (or only!) available via their IP addresses. These services are not inherently different from services that have been given a `.mesh` domain name. Rather, they simply lack a human-language name as their network address. Depending on the specific service, you can still access them using a Web browser. In this case, you would simply type something like `http://10.1.2.3` into your Web browser's location bar to load the intra-mesh Web service. Some intra-mesh services can even be accessed via *both* a domain name and an IP address directly.

Regardless of whether you access an intra-mesh service via a domain name or an IP address, the important thing to remember is that you are using resources generously provided to you by your fellow New Yorkers. Please be kind to one another! :)
