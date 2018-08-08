---
layout: default
title: DNS
category: Networking
---
## DNS Infrastructure
NYCMesh maintains an internal DNS with the "fake" tld of `.mesh` ( dot mesh ).  
Through this, services can be hosted, internal sites, etc.  
Use **10.10.10.10** for your DNS server.

## DNS configuration
The DNS is hosted using standard DNS zones which are made available through the Knot Resolver and Knot DNS Server.  
The zone and scripts are made available via git. Once the master branch is updated, the DNS servers will periodically update and refresh their configuration.  
Git Repo: [Github nycmeshnet/nycmesh-dns](https://github.com/nycmeshnet/nycmesh-dns)  
Git Repo: NYCMesh in-mesh git ( does not exist yet )  

## Anycast DNS and IPs
### Anycast  
The DNS system is available through a "trick" called Anycast. Anycast is the number one way DNS is provided on the main public internet.
With anycast, many DNS servers all present the same virtual IP. They announce this IP in the routing table ( mesh routing table, BGP or other protocol ). With this, the clients believe they all have a very short route to the same network, but in fact it is a copy of the same service running many times with the same configuration. Any of the services may answer the request equally well. Reply packets are sent via the normal means.

### IPs
**10.10.10.10** - Resolving DNS endpoint for the mesh ( _Use this one_ )  
**10.10.10.11** - Authoritative endpoint for dot-mesh TLD.  
The reason to have two endpoints rather than one is tha the resolving DNS server can exist without the dot-mesh TLD, or, there can be many cache servers throughout the mesh, and a different set of authorative servers, potentially each node, or many nodes can be caches.

## Running a DNS Server
_This is a Work in progress_  
Today there is a DNS server run at Supernode 1 as a VM. More are planned. It would be nice if at least every supernode ran a DNS clone.  
In the future it is expected that anyone who wants to run one can do so using a Docker container etc.   
