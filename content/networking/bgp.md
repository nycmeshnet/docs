---
layout: default
title: BGP
category: Networking
---

The [Border Gateway Protocol](https://tools.ietf.org/html/rfc4271) (BGP) is an inter-Autonomous System routing protocol.

## Use within NYC Mesh
BGP is used externally at internet exchange points to connect with other networks, and internally to peer between members (using private ASNs). BGP is a popular dynamic routing protocol as it is relatively simple to configure, scales well and enjoys support across multiple hardware and software vendors.

## How it works
An Autonomous System (AS) is any entity, usually a network with some opaque internal topology, that is in possession of a unique identifier called an Autonomous System Number (ASN). The process of connecting two Autonomous Systems is called peering, and it requires BGP speakers from each AS to know the ASN and IP address of their neighbors in advance (how this information is exchanged is not specified by the protocol).

Once the relevant identifying information is known, two neighboring Autonomous Systems can establish a session during which they exchange information about which IP subnets (prefixes) they know how to reach. A message between BGP speakers about reachability (or withdrawal thereof) is called an advertisement and can describe prefixes originating from an AS itself or from some other AS.

As reachability information about a prefix propagates through a network of interconnected Autonomous Systems, each appends its ASN to an attribute list called the "AS path". The AS path can then used by each BGP speaker to prevent routing loops from forming and to determine the shortest path to the destination prefix in the event that more than one is known.

## Filters
BGP implementations include powerful tools for modifiying imported and exported routes. Filters are commonly used within the mesh to do things like setting a route's local preference, tagging or interpreting communities or preventing the accidental announcement of bogus routes.

## Local preference
If two routes to a particular destination prefix are known, a decision must be made about which route to select. BGP's [tie breaking algorithm](https://tools.ietf.org/html/rfc4271#section-9.1.2.2) usually bases the decision on an AS path length comparison, however it is possible to override this behavior by changing the route's local preference attribute. Its value (a 32-bit unsigned integer) should be increased from the default (100) to indicate that a particular route is preferred regardless of its relative AS path length.

## Communities
[BGP communities](https://tools.ietf.org/html/rfc1997) can be used to classify routes that are imported or exported by an AS. Some definitions generally agreed upon by BGP speakers within the mesh are listed below. They are primarily used for interpreting the "quality" of various routes to the internet.

|Community|Meaning|Suggested interpretation|
|---|---|---|
|65000:1001|Internet connected by NYC Mesh|Set local preference to 130|
|65000:1005|Internet connected by a fast, neutral 3rd party|Set local preference to 110|
|65000:1002|Internet connected by a fast, non-neutral 3rd party|Set local preference to 100|
|65000:1003|Internet connected by a slow, non-neutral 3rd party|Set local preference to 90|
|65000:1004|Internet connected by a slow, NATed or possibly compromised 3rd party|Set local preference to 80|

## Prefix lists
IPv4 and IPv6 prefix lists that BGP speakers within the mesh commonly filter on (for import and export) are listed below:

### IPv4
|Prefix (Bird notation)|Action|
|---|---|
|199.167.59.0/24{24,32}|Allow|
|10.0.0.0/8{22,32}|Allow|
|0.0.0.0/0|Allow|
|All others|Deny|

### IPv6
|Prefix (Bird notation)|Action|
|---|---|
|2620:12d:400d::/48{48,64}|Allow|
|fdff:1508:6410::/48{64,128}|Allow|
|::/0|Allow|
|All others|Deny|

## How to get an ASN or IP allocation
Currently the mesh uses a spreadsheet to keep track of allocated resources. The process will be automated soon, but in the mean time please contact an existing member via [Slack](https://slack.nycmesh.net) or [email](mailto:contact@nycmesh.net) to have them help you acquire an ASN and IPv4 and/or IPv6 resources.

## Examples
Some configuration examples for BGP implementations known to be in use within NYC Mesh today are listed below in no particular order.

### [Bird](http://bird.network.cz)
Bird is an open source routing daemon with support for a number of different routing protocols including BGP.
```
log stderr all;

router id 10.70.x.1;

function is_mesh_prefix_v4 () {
  return net ~ [
    199.167.59.0/24{24,32},
    10.0.0.0/8{22,32},
    0.0.0.0/0
  ];
}

function is_mesh_prefix_v6 {
  return net ~ [
    2620:12d:400d::/48{48,64},
    fdff:1508:6410::/48{64,128},
    ::/0
  ];
}

function set_local_pref () {
  if (65000,1001) ~ bgp_community then bgp_local_pref = 130;
  if (65000,1002) ~ bgp_community then bgp_local_pref = 110;
  if (65000,1003) ~ bgp_community then bgp_local_pref = 100;
  if (65000,1004) ~ bgp_community then bgp_local_pref = 90;
  if (65000,1005) ~ bgp_community then bgp_local_pref = 80;
}

filter is_not_deviceroute {
  if source = RTS_DEVICE then reject;
  accept;
}

filter mesh_import_v4 {
  if ! is_mesh_prefix_v4() then reject;
  set_local_pref();
  accept;
}

filter mesh_export_v4 {
  if ! is_mesh_prefix_v4() then reject;
  if ifname = "eth0" then bgp_community.add((65000,1005));
  accept;
}

filter mesh_import_v6 {
  if ! is_mesh_prefix_v6() then reject;
  set_local_pref();
  accept;
}

filter mesh_export_v6 {
  if ! is_mesh_prefix_v6() then reject;
  if ifname = "eth0" then bgp_community.add((65000,1005));
  accept;
}

protocol device {
  scan time 10;
}

protocol direct {
  ipv4;
  interface "br0" "eth0";
}

protocol kernel {
  scan time 10;
  ipv4 {
    export filter is_not_deviceroute;
  };
}

protocol kernel {
  scan time 10;
  ipv6 {
    export filter is_not_deviceroute;
  };
}

template bgp meshpeer {
  local 10.70.x.1 as 65xxx;
  hold time 15;
  keepalive time 5;
  ipv4 {
    next hop self;
    import filter mesh_import_v4;
    export filter mesh_export_v4;
  };
  ipv6 {
    next hop self;
    import filter mesh_import_v6;
    export filter mesh_export_v6;
  };
}

protocol bgp n1234 from meshpeer {
  neighbor 10.70.x.y as 65yyy;
}
```

### [UBNT/EdgeOS](https://www.ubnt.com/products/#edgemax)
UBNT's EdgeOS was forked from Vyatta, which in turn borrows from [Quagga](https://www.nongnu.org/quagga/).
```
protocols {
    bgp 65xxx {
        neighbor 10.70.x.y {
            description n1234
            nexthop-self
            remote-as 65yyy
            route-map {
                export nycmeshexport
                import nycmeshimport
            }
            soft-reconfiguration {
                inbound
            }
        }
        network 10.70.x.0/24 {
        }
        network 199.167.59.x/32 {
        }
        parameters {
            router-id 10.70.x.1
        }
        timers {
            holdtime 15
            keepalive 5
        }
        redistribute {
            static {
                route-map nycmeshexportIspDefault
            }
        }
    }
    static {
        route 10.70.x.0/24 {
            blackhole {
            }
        }
    }
}
policy {
    community-list 101 {
        rule 10 {
            action permit
            regex 65000:1001
        }
    }
    community-list 102 {
        rule 10 {
            action permit
            regex 65000:1002
        }
    }
    community-list 103 {
        rule 10 {
            action permit
            regex 65000:1003
        }
    }
    community-list 104 {
        rule 10 {
            action permit
            regex 65000:1004
        }
    }
    community-list 105 {
        rule 10 {
            action permit
            regex 65000:1005
        }
    }
    prefix-list nycmeshprefixes {
        rule 10 {
            action permit
            ge 22
            le 32
            prefix 10.0.0.0/8
        }
        rule 20 {
            action permit
            ge 24
            le 32
            prefix 199.167.56.0/22
        }
        rule 30 {
            action permit
            prefix 0.0.0.0/0
        }
    }
    route-map nycmeshexport {
        rule 10 {
            action permit
            match {
                ip {
                    address {
                        prefix-list nycmeshprefixes
                    }
                }
            }
        }
        rule 20 {
            action deny
        }
    }
    route-map nycmeshexportIspDefault {
        rule 10 {
            action permit
            match {
                interface eth0
            }
            set {
                community "65000:1005 additive"
            }
        }
        rule 20 {
            action deny
        }
    }
    route-map nycmeshimport {
        rule 10 {
            action permit
            match {
                community {
                    community-list 101
                }
            }
            set {
                local-preference 130
            }
        }
        rule 20 {
            action permit
            match {
                community {
                    community-list 102
                }
            }
            set {
                local-preference 110
            }
        }
        rule 30 {
            action permit
            match {
                community {
                    community-list 103
                }
            }
            set {
                local-preference 100
            }
        }
        rule 40 {
            action permit
            match {
                community {
                    community-list 104
                }
            }
            set {
                local-preference 90
            }
        }
        rule 50 {
            action permit
            match {
                community {
                    community-list 105
                }
            }
            set {
                local-preference 80
            }
        }
        rule 60 {
            action permit
            match {
                ip {
                    address {
                        prefix-list nycmeshprefixes
                    }
                }
            }
        }
        rule 70 {
            action deny
        }
    }
}

```

### [Mikrotik/RouterOS](https://wiki.mikrotik.com/wiki/Manual:TOC)
Mikrotik's RouterOS has its own closed source BGP implementation.
```
TODO
```

### [OpenBGPD](http://www.openbgpd.org/)
An example of a working configuration, abeit without BGP community rules, is available [here](https://github.com/bongozone/kibble/blob/master/src/etc/bgpd.conf).
