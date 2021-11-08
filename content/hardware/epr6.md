---
title: "Ubiquiti EdgePoint R6"
---

The EP-R6 is an outdoor rooftop switch/router with 6 ports (5 GigE, 1 SFP). It supports PoE, but only Ubiquiti's 24v Passive PoE style, not any of the fancier types.

It can be configured in switch mode (just a switch, with a management console) or routing mode (hub node setup, BGP, etc).

![Ubiquity EdgePoint R6 Front View](/img/hardware/ubiquity_edgepointr6_front.png)

![Ubiquity EdgePoint R6 Ports](/img/hardware/ubiquity_edgepointr6_ports.png)

Device specs are available at [store.ubnt.com](https://store.ubnt.com/products/edgepoint-r6).


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
To convert the EP-R6 to switched mode, there's now a [simple wizard](https://help.ui.com/hc/en-us/articles/217990978-EdgeRouter-Configure-an-EdgeRouter-as-a-Layer-2-Switch#1) in the GUI to help.

### Extend an OmniTik ###
A common use case for the EP-R6 as a switch is to add more PoE-capable ports to an OmniTik router on the roof. In order to preserve isolation between these ports and on the OmniTik, we need to make the switch __VLAN-Aware__. The following instructions assume the OmniTik has been configured with the [standard configuration](https://configgen.nycmesh.net/?device=Omnitik5AC&template=rooftop-ospf.rsc.tmpl) and IP allocations.

**1. Start the Wizard**

In the web interface, navigate to the "Wizards" tab on the top right of the screen. On the left sidebar, click "Switch".
Choose Static IP. You are probably connected directly to the switch right now, so you don't want to lose access to it while there's no DHCP server!

Log into the OmniTik you are planning on connecting the switch to; we are going to find an unused IP in its /26 subnet. On the left sidebar under IP->DHCP Server, click the "Leases" tab, and hit "Add New". Type in the address you are allocating, __uncheck__ "Enabled", and type `nycmesh-xxxx-epr6` in the "Comment" (where `xxxx` is the network number to which this will be attached).

Type this address into the switch with a /26 subnet with the OmniTik's /26 IP Address as the gateway. Use `10.10.10.10` as the DNS server.

**2. Set the VLANs on the EP-R6**

Under "VLAN Aware", check "Enabled". Depending on which port will be connected to the OmniTik (the "trunk" port), you will set the VLANs using a combination of the OmniTik's and the EP-R6's port numbers.

_Example:_ EP-R6 is plugged into Port 3 on the OmniTik, and we want to isolate Ports 1-5 on the EP-R6.

```
eth0: vid 301,302,303,304,305
eth1: pvid 301
eth2: pvid 303
eth3: pvid 303
eth4: pvid 304
eth5: pvid 305
```

In layman's terms, The PVID tags the port and VID tells where to send the tagged traffic out. The first digit will be the port number of the OmniTik, and the last digit will be the port number of the EP-R6. After setting up your credentials you can hit apply and reboot the router.

**3. Add the VLANs to the OmniTik**

Because eth0 did not have a PVID set, you should be able to access the switch using its new IP address without additional hardware. However, we need to configure the OmniTik to _receive_ the tagged traffic and add them to the mesh bridge.

On the OmniTik, navigate to Interfaces on the left sidebar. Click Add New->VLAN for each port on the EP-R6 we are configuring. Let's use the EP-R6 `eth1` from above as our example:

```
Name: ether1.301
VLAN ID: 301
Interface: ether3
```

Hit OK to save. Once you do this for each port on the EP-R6, you can navigate to the left sidebar and go to Bridge. Under the "Ports" tab, click "Add New" for each VLAN you are configuring. Select the Interface you just created (`ether1.301`) and the Bridge `mesh`. Hit OK, and do this for each VLAN interface.

__4. Test it!__

The easiest way to test your configuration is by connecting a DHCP client (like a router) to the port and testing traffic flow. Plug it into any of the configured ports of the EP-R6, where you will see the port turn purple, orange, or green on the top of the EP-R6's GUI (purple:10Mbps, orange:100Mbps, green:1G).

In the left sidebar of the OmniTik, under IP->DHCP Server, click on the "Leases" tab and check that it got an IP. Lastly, under Interfaces, check if traffic is visible on that particular VLAN. If you can see activity on that interface, you did it! 🎉

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







