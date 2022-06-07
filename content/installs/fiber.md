---
title: "Fiber to the apartment"
aliases: ["/fiber"]
---

The first step is to screw the ONT into the wall in a convenient place using drywall achors. The ONT we are currently using is the Ubiquiti "UFiber loco GPON CPE"

Only use white fiber inside apartments, never yellow or any other color. This is to better blend in with the wall. We have custom made 3mm white fiber with termination at one end. 

Once the ONT is screwed into the wall, plug in the terminated end of the white fiber. Now you are ready to run the fiber to the exit point (usually above the front door). You first run the fiber down to the top of the baseboard and then along to the nearest corner, attaching it to the wall with silicon. You run the cable up the corner to the ceiling and follow along the corner of the ceiling to the exit point using silicon along the way.

![Ufiber ONT](/img/install/wallONT.jpg)

As always with fiber, don't do any hard bends! Let the fiber curve around corners.

There is no loose fiber in the apartment. No service loops. All the fiber is locked down with silicon the whole way. Any loose fiber will result in service calls. Any excess fiber is left in the raceways outside of the apartment!

At the exit point you drill a small hole (6mm?) and feed the unterminated end of the fiber through to the raceway. The fiber will be spliced outside of the apartment either with a fusion splicer or with a mechanical splice. The hole must be sealed after you're finished!

Inside you can now power up the UFiber ONT by connecting it to a POE injector, and connecting the data port to a TP-Link home router. 

**Support**

[to be expanded!]

Fiber support is fairly straightforward. First do the usual test of the wifi router to eliminate that as the problem. Next test the signal going into the ONT by unplugging the connector and connecting it to your meter.

Test db of signal using an OTDR or optical power meter (OPM). The signal should be between -22db to -10db. Less than -24db and the signal is too weak. -8db is the highest limit that will work. 

If the signal is outside of the range of -22 to -10 you need to look for where signal loss is occurring. This is typically the splice in the raceway or damaged fiber that has been bent.

Light fiber with red test signal using the OPM or OTDR. This is done from the hallway access box.

Look for loss along the way, especially in the raceway splice. Redo splice if signal loss is there. If the cable is damaged elsewhere, splice around the damage.
