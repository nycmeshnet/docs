---
layout: default
title: Ubiquiti EdgePoint R6
category: Hardware
---

The EP-R6 is an outdoor rooftop switch/router with 6 ports ( 5 GigE, 1 SFP ).  
It supports PoE, but only Ubiquiti's 24v Passive PoE style, not any of the fancier types.

It can be configured in switch mode ( just a switch, with a management console ) or routing mode ( hub node setup, BGP, etc ).

## Reset ##
To factory reset an EP-R6, press and hold the reset button, by the ethernet plugs, for about 10 seconds until the eth4 LED begins to flash, then release the button. The device will reboot and reset.

Or, reset it via the CLI by running the following commands:
```
sudo cp /opt/vyatta/etc/config.boot.default /config/config.boot
reboot 
```

## Connecting ##
The EP-R6 has a Web GUI and CLI.  
The initial IP address out of the box is 192.168.1.1, the Web GUI is at https://192.168.1.1
Set you computer's local IP to something similar ( 192.168.1.5 ), and connect to switch on port _eth0_.

Although there is a Web GUI, using SSH can allow for a much more rapid workflow. If possible, use that.  
Here is an example of SSHing to the EdgePoint when it is in factory default mode:
```
laptop$ ssh -o StrictHostKeyChecking=no ubnt@192.168.1.1
Welcome to EdgeOS
...

ubnt@192.168.1.1's password: ubnt
Linux ubnt 3.10.14-UBNT #1 SMP Wed Nov 11 14:42:04 PST 2015 mips
Welcome to EdgeOS
ubnt@ubnt:~$
```
From here you can apply commands such as the ones below.

## Device idiosyncrasies

# Hardware NAT
If using the device as a router in NAT mode ( not router on the mesh ), the default settings will yield a very slow connection.  
Hardware NAT should be enabled, which was just possible as of firmware version v1.9.7.  
This page at Ubnt discusses more: https://help.ubnt.com/hc/en-us/articles/115006567467-EdgeRouter-Hardware-Offloading-Explained

To enable hardware offload on this model, perform the following commands on the CLI:
```
configure
set system offload hwnat enable
commit
save
exit
```

## Wireguard VPN
coming


## Switched Mode ##
To convert the EP-R6 to switched mode, follow these steps.
This will create a switch, move all ports to it, move the management interface IP to it.
As opposed to some documentation, it is not necessary to move some ports at a time and change the IP. This can all be applied at one time.

```
configure
delete interfaces ethernet eth0 address
set interfaces switch switch0 switch-port interface eth0
set interfaces switch switch0 switch-port interface eth1
set interfaces switch switch0 switch-port interface eth2
set interfaces switch switch0 switch-port interface eth3
set interfaces switch switch0 switch-port interface eth4
set interfaces switch switch0 address 192.168.1.1/24
commit
save
exit
```
 
## Routed Mode ( NYCMesh Hub Node - BGP ) ##
You will need to know the following to be able to continue:
BGP ASN - Autonomous System Number within the network
Gateway Node Y/N - Are we going to be a gateway exit node
Peers ASN and IP - What are our Peer ASN and IP that we will connect with
Local Subnet - What local network will we have? One? Many?

Configuration:
The following sections below may be used in-part or in-whole depending on the need:
* Route Filters / Prefix list - Allows or denies certain ranges from the network. Good for ensuring functionality
  - The current filter set for NYCMesh can be found at [Filter](/network/filter)
* 

Example Parameters:
ASN: 65012
Gateway: N
Peer ASN: 65010
Peer IP: 10.180.14.1
Local Subnet: 10.70.50.0/24
```
configure

## Filters ##
set policy prefix-list nycmeshprefixes rule 10 prefix 10.0.0.0/8
set policy prefix-list nycmeshprefixes rule 10 ge 22
set policy prefix-list nycmeshprefixes rule 10 le 32
set policy prefix-list nycmeshprefixes rule 10 action permit

set policy prefix-list nycmeshprefixes rule 20 prefix 172.16.0.0/12
set policy prefix-list nycmeshprefixes rule 20 ge 24
set policy prefix-list nycmeshprefixes rule 20 le 32
set policy prefix-list nycmeshprefixes rule 20 action permit

set policy prefix-list defaultroute rule 10 prefix 0.0.0.0/0
set policy prefix-list defaultroute rule 10 action permit

set policy route-map nycmeshroutes rule 10 action permit
set policy route-map nycmeshroutes rule 10 match ip address prefix-list nycmeshprefixes

# BGP Config
set protocols bgp 65012
set protocols bgp 65012 neighbor 10.180.14.1 remote-as 65010
set protocols bgp 65012 neighbor 10.180.14.1 soft-reconfiguration inbound
set protocols bgp 65012 neighbor 10.180.14.1 nexthop-self
set protocols bgp 65012 neighbor 10.180.14.1 route-map import nycmeshroutes
set protocols bgp 65012 neighbor 10.180.14.1 route-map export nycmeshroutes

# BGP Network Config
set protocols bgp 65012 network 10.70.50.0/24
set protocols static route 10.70.50.0/24 blackhole

# Save and Reset BGP
commit
save
clear ip bgp all
```







