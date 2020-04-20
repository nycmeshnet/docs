---
title: 10-69-net Network
---

The 10-69 network is a custom Link Local network used by NYC Mesh for connecting between nodes.

Each Node ( actually, each router at a node ) will have an address from the subnet `10.69.0.0/16`, using the last two octets for node identification, described below.

The 10-69 network should **not** appear in routing tables around the network, only the individual IPs, which indicates they are online.

The network can also be used as a ways to predicatively get to a specific node by node-number: Simply connect to that node's 10-69 IP address.

## Node Identification
Each Node can auto-generate its own 10-69 net number by the following method:

For the subnet `10.69.X.Y/16`, we need to determine X and Y. Note X and Y are both 0-255, as this is an IPv4 address.

For node numbers up to 5 digits long, segment the lowest two digits (one and tens places) and place them in `Y`.  All other higher digits (hundreds, thousands, ten thousands) should be moved to `X`.  
In other words, physically split the number into two segments.

For Example:

|Node Number|X|Y|10-69-net Address|
|---|---|---|---|
|5|0|5|10.69.0.5|
|50|0|50|10.69.0.50|
|500|5|00|10.69.5.0|
|5000|50|00|10.69.50.0|
|50000|X|Y|Not Possible|
|25599|255|99|10.69.255.99|

Note that the maximum node number via this method is 25599.

## Second Routers
Each Router at a Node ( often one router ) will need a different 10-69 address. To make things easy, we have optimized for the common case of _one router_, above.  
The second most common case, of _two routers_, is just as easy.

Simply add `100` to the Y value. All Y values between 100-199 are reserved for the Second router at a site.

For Example:

|Node Number|X|Y|First router|Second Router|
|---|---|---|---|---|
|5|0|5|10.69.0.5|10.69.0.105|
|50|0|50|10.69.0.50|10.69.0.150|
|500|5|00|10.69.5.0|10.69.5.100|
|5000|50|00|10.69.50.0|10.69.50.100|
|50000|X|Y|Not Possible|No Possible|
|25599|255|99|10.69.255.99|10.69.255.199|
