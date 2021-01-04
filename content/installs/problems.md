---
title: "Avoiding problems"
---

# Alignment and wind

We've had many antennas lose alignment in the wind. There's a few simple things you can do to prevent this-

1. Use a socket and drill to tighten hose clamps. It's hard to get the hose clamp tight with a screw driver. You need a socket and a drill to get it really tight. You'll need a socket set that has both [american and metric sockets like this](https://www.amazon.com/PANOVOS-Driver-Metric-Socket-Wrench/dp/B01J3O4RYS/ref=sr_1_13?crid=2TECPORUO14Y4)

2. Put one layer of electrical tape under the hose clamp. This can help stop slipping, especially on smooth j-pipes like the Ubiquiti ones.

3. Make sure pipe mounts can't twist by putting a bolt through them. You'll need a set of metal drill bits (such as titanium) and some 2 1/2" long 1/4" bolts.

# Bad crimps

Ethernet testers aren't perfect so you need to check your crimps visually-

1. Wires are in correct order!
2. All wires are pushed all the way to the end
3. All pins are pushed down after crimping (extremely important!)
4. The cable jacket is just inside the RJ-45 

If the first three things are correct the cable will work! The jacket being inside the rj-45 gives it a bit more strength.

It is possible that the wires aren't at the end and the pins aren't all down and the cable tester will wrongly say it is fine.

The crimping tool's job is to push the pins into the wires. Look at the pins before and after crimping and you should see that they are all pushed down by the same amount. 

# Not enough cable

To save carrying a full box of cable many installers take a roll of cable (and occasionally not enough)

Here’s a short guide to help:

1. Tough cable is marked every meter. Each box is 305m so if the end says 255m you have 50m left
2. 50 meters of cable is enough to do an average install
3. Each floor adds about 3 meters to the length
4. Member’s floor info is now on the schedule to help with calculation
5. Each extra apartment adds about 20m + floor calculation
5. 100m is the max length for Cat5 cable. (data loss and voltage loss is too much)
6. If you have a roll, you can measure one loop and multiply by the number of loops

1 meter = 3 feet

# OmniTik power problems

The biggest confusion with OmniTiks is that one model has POE out (OmniTik POE) and one doesn't. They both look the same. There is obscure print near the ethernet ports that will tell you if it is ethernet out. OmniTik POE has a much larger power injector and this must be used to power it. If you accidentally power it with a smaller adapter it will work but the LiteBeam will occasionally reboot.



