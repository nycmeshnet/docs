---
title: "DNS"
---

NYC Mesh maintains an internal [Domain Name System (DNS)](https://en.wikipedia.org/wiki/Domain_Name_System) with a private top-level domain (TLD) of `.mesh` ("dot-mesh"). By providing this infrastructural service, NYC Mesh members can host their own [intra-mesh services and applications]({{< relref "intra-mesh-services" >}}) for their own benefit and for the benefit of other NYC Mesh members.

## Configuring DNS clients

Use `10.10.10.10` for your DNS server.

## DNS server configuration
The NYC Mesh DNS is hosted using standard DNS zones made available through the [Knot Resolver and Knot DNS Server](https://www.knot-dns.cz/).

The [zone file](https://github.com/nycmeshnet/nycmesh-dns/blob/master/mesh.zone) and other supporting files are made available via [GitHub under the NYC Mesh Organization's `nycmesh-dns` repository](https://github.com/nycmeshnet/nycmesh-dns). The in-mesh DNS servers periodically update and refresh their configuration from this repository's `master` branch over Git. 

## Anycast DNS and IPs
### Anycast  
The DNS system is available through a "trick" called Anycast. Anycast is the number one way DNS is provided on the main public internet.
With anycast, many DNS servers all present the same virtual IP. They announce this IP in the routing table (mesh routing table, BGP or other protocol). With this, the clients believe they all have a very short route to the same network, but in fact it is a copy of the same service running many times with the same configuration. Any of the services may answer the request equally well. Reply packets are sent via the normal means.

### IPs

* `10.10.10.10` - Resolving DNS endpoint for the mesh (*Use this one!*)  
* `10.10.10.11` - Authoritative endpoint for dot-mesh TLD.  
* `199.167.59.10` - Public DNS Resolver for anyone in the world. No logs, no filtering.

The reason for two endpoints rather than one is to enable resolving the dot-mesh TLD separately. In-fact, the caching resolver forwards to the dot-mesh TLD server for dot-mesh addresses. This also allows more than one node to host a resolver or a dot-mesh DNS server or both.   

## Top Level Domains
* `.mesh` - Internal dot-mesh domain for NYC Mesh.
* `.mesh.nycmesh.net` - Public version of the same domain. Equivalent of `.mesh`, and available on the entire Internet.

## Future work

This section briefly describes the work we'd like to see done to improve our DNS infrastructure in the future.

### Remove Internet connection dependency for updating in-mesh DNS

There are plans to provide an in-mesh Git hosting service (perhaps [GitLab]({{< relref "intra-mesh-services/gitlab" >}})?) so that Internet connectivity is not required for the DNS servers to update and refresh their configuration, but this is not yet implemented.

### Deploy additional DNS servers

Today there is a DNS server run at [Supernode 1]({{< relref "nodes/supernode1" >}}) as a VM. More are planned. It would be nice if at least every supernode ran a DNS clone.  

In the future it is expected that anyone who wants to run one can do so using a Docker container or similarly simple deployment.

To get a jump start on this, check out [the Git repo](https://github.com/nycmeshnet/nycmesh-dns)'s README. It's an ever-changing process.
