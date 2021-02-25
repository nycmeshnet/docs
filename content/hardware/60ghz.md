---
title: "60 GHz"
---

60 GHz is an unlicensed band that now has some cheap gigabit point to point (p2p) antennas that we are using.

60 GHz is extremely susceptible to "rain-fade", which is why it is not used in licensed spectrum

Often these radios come with a 5GHz backup, which isn't really useful for bandwidth but it will keep your link online during rain.

## MikroTik LHG 60G  
<img src="/img/hardware/60ghz/LHG.jpg" height="160" />

- Price $300 pair  
- Range 200m 
- 5GHs backup: no
- Tested speed: 700 Mbps

We originally installed these for 800m links but they will go down every time in heavy rain. 200m seems a good distance for them. It's a cheap way to connect neighboring buildings. We use these between the Grand St towers.

## IgniteNet Metrolinq One 60-19  
<img src="/img/hardware/60ghz/ML1.jpg" height="160" />

- Price: $500 pair  
- Range: 200m?  
- 5GHz backup: yes
- Tested speed: 300 

We use these between Henry and Grand. It never got over 300 Mbps

- The mount is extremely heavy and obviously designed for the larger antenna
- The lights on the back aren't visible due to the mount
- It is possible to mount on horizontal pipe but you only have ~15 degrees of movement
- Bandwidth is about half of the cheaper Mikrotik 60Ghz
- Maybe we should have used the larger 60 – 35
- The backup 5GHz is strangely very low bandwidth (~20 Mbps)
- The telescope is very good, and great for aligning
- Everything is very well built and feels like a scientific instrument

# Ubiquiti

There's a very confusing range of Ubiquiti 60GHz. Basically there's dishes and enclosed headlight looking ones

## Ubiquiti Gigabeam  
<img src="/img/hardware/60ghz/GBE.png" height="160" />

- Price: $260 pair
- no quoted range! (assume it's meant for neighboring buildings)
- 5GHz backup:

## Ubiquiti Gigabeam Plus GBE-Plus  
<img src="/img/hardware/60ghz/GBE-Plus.png" height="160" />

- Price: $360 pair
- Range: "up to 1.5km"
- 5GHz backup: no

## Ubiquiti Gigabeam GBE-LR 
<img src="/img/hardware/60ghz/GBELR.png" height="160" />

- Price: $400 pair
- Range: "long range"? probably means "up to 2km" like the af60
- 5GHz backup: no

## Ubiquiti airFiber 60  
<img src="/img/hardware/60ghz/AF60.png" height="160" />

- Price: $600 pair
- Range: "Long range, up to 2 km"
- 5GHz backup: yes


## Ubiquiti airFiber 60 LR (dish)  
<img src="/img/hardware/60ghz/AF60LR.png" height="160" />

We are currently running two links with these. Grand to Navy Yard, and PH to 5283  

The Navy Yard link:  

- 2km and bandwidth decreases in the rain
- "1751" capacity (they are adding up and down capacity together)

The 5283 link:  
      
- 2.2km and works ok in rain
- "1951" capacity
- Price: $800 pair (sold as pair)
- Range: "Long Range, Up to 12 km" (hard to believe!)
- 5GHz: no



