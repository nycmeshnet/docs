---
title: "Fiber splicing"
---
# NYC Mesh Fiber Background and Splicing Guide
​
These are notes collected by @JohnB from the fiber splicing class taught by Zach Giles at the NYC Mesh room on July 19, 2022. I took notes on my phone, so some of the information might be missing/inaccurate.
​
## Theory
- Rule 1 is to not touch the bare fiber. Getting it dirty can impede transmissibility, and breaking it is very easy to do. If that happens, embedding it in a finger or clothing is easy to do, and it's so small, sharp, and hard to see that it is considered dangerous. It is after all a 9-micron shard of glass
- Decibels and fiber signal
  - 0dB is considered "reference." For fiber and lasers, 1 milliwatt is this 0dB reference and all other decibel measurements are relative to this reference. 
  - Decibels are on a logarithmic scale. With every +3dB the power goes up by double, and for every -3dB the power goes down by half. For every +10dB, the power goes up by an order of magnitude, and for every -10dB, the power goes down by an order of magnitude. 
  - So if 0dB is 1mW, +3dB is 2mW, +6dB is 4mW, and in the opposite direction -3dB is 0.5mW, -10dB is .1mW, -20dB is .01mW, and so on. This will be important for a few reasons later 
  - (Background) The log scale is a result of the inverse square law of electromagnetic radiation, which basically says that a signal's power is cut in half for each unit of distance away from the source. If reference is 1 unit away and 1 power, moving to 2 units away will result in 1/4 power, moving to 4 units away will result in 1/16 power
- Fiber cable structure
  - At the core is a glass fiber that runs continuously through the length of the cable. If it breaks at any point due to bending, the cable will not transmit data. NYC Mesh uses mostly 9-micron diameter glass fiber, which is "single-mode." Multi-mode fiber is 50 microns in diameter.
  - Surrounding the glass core is the "cladding." This is another type of glass, but applied as a residue on the fiber. Since the cladding glass and fiber glass are slightly different, it acts as a sort of mirror surface. Light in the fiber that hits the edge will reflect back, ricocheting around. In essence, the cladding keeps the laser light inside the fiber.
  - Surrounding the cladding is the "coating." This is plastic, and may be multicolored. This is a very minor form of stress relief. This also serves to protect the cladding and core from handling. If the core is broken due to over-stressing and is being tested with visible light, red light may shine through the coating where the break occurred.
  - Surrounding the coating is a heavy duty "jacket," along with a Kevlar fabric line. This gives the cable the handling characteristics of a normal cable, allowing it to be pulled without stressing the core, and also allowing it to have more rigidity so bending does not have as much a chance of breaking the core. For most of NYC Mesh, the yellow jacket will contain a single fiber core and cladding within a white coating. In other setups, multiple fibers, each with a distinct color coating, may be bundled within a single jacket. 
  - All in all, this type of optical fiber cable may lose about 3dB per kilometer. Ignoring any signal loss from the connectors, if an input is 0dB/1mW, at the end of a 1 kilometer fiber cable, a -3dB/0.5mW signal would be received.
- Fiber cable connectors
  - NYC Mesh does not terminate fiber cables. Rather, pre-terminated cables are purchased, or connectors are purchased with "pigtails" that allow for easy splicing to unterminated fiber.
  - Fiber cables come in a variety of different connectors, but the main form factors and types used by NYC Mesh are SC and LC connectors.
  - SC connectors are predominantly used due to their durability, and are the connector of choice at Grand Street
  - LC connectors are smaller and more efficient (size-wise or speed-wise? I'm not sure), but are more finicky. For this reason, they are used mostly in data centers where handling is less important.
  - Connectors are just methods of handling and connecting the bare fiber, so the bare fiber actually sticks out of the end of the connector.
  - The bare fiber is polished on the end, and the polish follows a variety of different standards that will be mentioned later. If two connectors are coupled together, the polish method must match.
  - The polish method can't be determined just by looking at it, so the connector's color convey the polish type. Thus, the SC connector might be green to represent an angled polish, and would be called an APC connector (Angled Physical Contact). The SC connector might also be blue, representing a rounded polish, and is called a UPC connector (Ultra Physical Contact)
- Connector polish methods
  - The bare fiber at the end of the connector is polished for efficiency reasons. If left raw and flat, the cable will be inefficient.
  - Inefficiency is a result of attenuation/backscatter. Light from one end of the cable reaching the opposite end and encountering a flat fiber end would hit it head on and bounce back toward the origin. This is able to be measured in Decibels, and comes in at -30dB reflected back to the origin. So if the input signal was -8dB, the backscatter with a flat connector would be -38dB. This is known as Optical Return Loss, or ORL, or attenuation.
  - Polishing the end can reduce the Decibel count and therefore optimize the signal. 
  - A blue UPC connector has a gentle bevel polish and its ORL/attenuation is -55dB, which is already 20dB or 100x better than the -30dB of the flat connector
  - A green APC connector has an angled bevel polish, meaning it's asymmetric. This is fantastic for ORL/attenuation, giving it a -65dB rating. However, couplers and connections to other cables/connectors must have correct orientation. APC connectors have keys on them to ensure orientation is correct.
- Fiber Splitters
  - A splitter can be used to duplicate a single input fiber signal into many duplicate signals. 
  - There is a cost to splitting, namely in the form of signal loss/attenuation. 10dB (?) is a common amount of attenuation to see for a signal going through a splitter.
  - NYC Mesh at Grand Street uses 8-way splitters with 10dB loss. If an input signal is +6db/4mW and goes through the splitter, the output signal level of each of the 8 splitter outputs would be -4dB, or a little less than 0.5mW. 
  - Since each of the different connections of a splitter would be shooting their light into a shared fiber, they can interfere with one another's signals. To manage this, they take turns at set intervals to transmit their separate information. These windows of time are passed along from connection to connection evenly, known as a "round-robin" strategy. This overall grand scheme of figuring out who goes when, and for how long, is known as GPON
- OLT and in-unit boxes
  - The OLT is the rack-mounted hardware and is the primary origin of the fiber installation. It has a number of ports, each outputting a +3dB/2mW signal. It expects a number of splitters to be connected in series on each port, so the stronger-than-reference signal is to compensate for the loss at each splitter. This way, the end client can still get a usable level of signal
  - NYC Mesh uses in-apartment client boxes that need a signal of -8dB to -28dB. Plugged directly into the OLT, the signal would be too strong for the client box to handle. BUT after two splitters, the +3dB signal would be -17dB, and with a couple cables in between the signal might be -23dB. This is perfect for the client, AND means that two tiers of splitters can be used. This gives one OLT port the ability to split 8 times, and then each of those 8 additional times, or 64 client boxes to a single OLT port
  - This works great for Grand Street, where there are 7-floor apartment buildings with 6 apartments per floor. Each building gets a splitter in the basement, with one cable going to each floor. Each floor then gets its own splitter, yielding 6 to 8 connections per floor. One OLT port can then serve an entire apartment building
​
​
​
## Fiber Splicing Guide
​
- Equipment
  - SPEEDWOLF Optical Fiber Fusion Splicer, OP-FS18 - This has the actual splicing bits, as well as a heater section to heat-shrink and stabilize the fused section. It has an X-axis and Y-axis camera so it can automatically align the two fiber cores to be spliced, and then two electrodes to clean and then fuse the fibers together. 
  - SPEEDWOLF Fiber Optic Cleaver, OFC-21 - The fiber core is placed inside the cleaver to get a perfectly flat end, ready for fusing
  - Fiber Optic Stripper - Jonard JIC-375 is an example. One with three holes is desired, optimized for each layer of the fiber cable: biggest and first is the plastic jacket, middle and second is the plastic coating, and last and third is the scraper for the cladding
  - Kevlar Scissors - Jonard JIC-186 is an example. These are super sharp and made for cutting the extremely-durable Kevlar inside a fiber cable. We also used them to slice the entire fiber cable, but I'm not sure if that's only because a regular wire cutter was missing
  - Tweezers - used to grab fiber core fragments, especially fragments left behind in the cleaver
  - Alcohol wipes - used after scraping the cladding off to get the fiber core squeaky clean and ready for fusion
  - Tape - Masking or Painter's tape works, and is only used to more easily pick up and collect fiber fragments for safe disposal later
  - Splice Protection Heat Shrink Sleeves - heat shrink, but with an added metal wire inside for rigidity, used to stabilize the splice after fusing
  - OTDR Fiber Tester - D YEDEMC Mini-Pro is an example - an expensive, powerful, multi-purpose fiber optic tester. Visible light testing, 1310nm signal loss testing, length testing, and more. 
- Step 1: Cable Prep
  - Start with a raw fiber cable sliced in half with wire cutters. Use the widest fiber optic stripper hole to remove 5-6 inches of the yellow outer jacket, leaving behind the white coating+cladding+core and a tangle of Kevlar
  - Use the Kevlar scissors to trim away as much of the kevlar as possible
  - Use the second hole of the fiber optic stripper to remove 2-3 inches of the white coating. Due to friction, removing it all at once is not possible. Start at the tip and remove 1cm at a time, until the full length is achieved
  - Use the third hole of the fiber optic stripper to remove the cladding from the fiber core. A white residue should appear on the strippers. Repeat this 2-3x to ensure all the cladding is removed
  - Pinch the bare fiber optic core with an alcohol wipe and wipe from where the white coating first becomes exposed all the way to the end. When going over the fiber optic core, it should sound "squeaky" clean. Repeat 2x. Do not touch the fiber core after this.
  - The cable is now ready for cleaving 
  - NOTE: The NYC Mesh sleeves are 60mm in length. That means that one of the two halves to be cleaved must have an extra 60mm of yellow jacket removed, relative to the other, in order to fit the sleeve during splicing. 
- Step 2: Cleaving
  - Open the two doors of the cleaver. One on the left holds the fiber core plus coating in place, and one on the right covers the blade wheel
  - Push the blade wheel assembly from the back of the cleaver forwards towards you, towards the front side of the cleaver. When the door is closed, it will only move front to back, so this is prepping it for a later cut
  - Place the fiber core and coating across the cleaver in the narrow slot. The fiber core needs cross over the blade and rest on the two black pads on either side. If not, the right door cannot trap it in place and the cut cannot be made. The cleaver has markings in millimeters for how much bare fiber core will remain after the cleave. I aimed to have the white coating begin somewhere under the left door. When in place, close the left door to hold it in place.
  - Close the right door
  - Push the blade assembly towards the back, performing the cleave
  - Open the right door carefully and use the tweezers to grab and dispose of the fiber fragment left behind. It may stick to one of the black pads on the right door's right side
  - Open the left door to free the coating and fiber core. Do not touch the fiber core. 
  - Once cleaved, the fiber is ready for placement in the splicer. Move it to the splicer in the next step
  - NOTE: The NYC Mesh sleeves are 60mm in length. That means that each of the two halves to be cleaved have to have less than 30mm of exposed fiber core after cleaving. However, if the fiber core is cut too short and the yellow jacket is not cut back enough, the primary door of the splicer might not close in the next step.
- Step 3: Splicing
  - Open the primary door of the splicer, and then open the left and right doors underneath.
  - With the splicer on, press the RESET button to move it into the starting position. If RESET is not pressed and the X and Y axis cameras are on, the splicer is in SET mode and still needs RESET pressed. RESET mode will take the splicer to a menu outlining the settings to be used for splicing. 
  - Also press HEAT to start pre-warming the heat shrink channel for a later step
  - Imagine an up/down line in between the two metal pointy electrodes of the splicer.  This marks the center line. Place the fiber in a perpendicular orientation to this line on either the left or right side, taking care not to cross the center line. Get the end of the fiber as close as possible but not crossing this imaginary line. The alignment motors can only move forward, so if the end were to cross, the splicing could not occur. The fiber core should sit within the crook of two blue V-shaped holders, and the white part will likely be under the left door closure area. The yellow jacket also needs to be beyond the edge of the splicer's primary door, or the door will not close. Once the fiber, coating, and jacket are all in place, close the left door to hold it. 
  - Repeat Step 1 for the other fiber. NOTE that at least one half needs the sleeve slid onto it before splicing. The yellow jacket is bigger than the sleeve, so it will need to be cut back further so the sleeve and jacket can be pushed out of the way of the splicer's primary door.
  - Repeat Step 2 for the other fiber, cleaving it and preparing it for splicing
  - Repeat Step 3 up to this point, placing the fiber on the right half of the splicer without crossing the imaginary center line. Close the right door
  - Close the primary door of the splicer
  - Press the SET button to begin the splicing process. First it will move the ends of each fiber core into view of the cameras. Each should appear flat and cylindrical and as "clean" as possible. The splicer will first "zap" the ends to clean them further, and will then run a longer fusion process to merge the two fibers. Once visible again, a single uninterrupted fiber should be seen on the camera views. 
- Step 4: Sleeving
  - Open the primary door of the splicer, and then open the door on the side with the sleeve. 
  - Grasp the fiber cable jacket/sleeve on the freed side, and then open  the opposite side's door and grab that side as well
  - Move the sleeve to cover the spliced area. Be VERY careful not to bend or shift the two halves of the cable, as the fiber cores are barely held together at this point and can snap/shear easily. The sleeve must fully cover the exposed fiber core, spanning from the white coating on one side to the white coating on the other. If it does not reach, the splice is invalid, and the full cutting/stripping/cleaning/cleaving process will need to be re-done.
  - Open the left, right, and clear center doors of the heat shrink heater portion of the splicer
  - Move the now-aligned sleeve plus the two cable halves into the heater. Close the heater doors, ensuring that that fiber cables sit in the U-shaped channels on each side.
  - Press the HEAT button on the splicer to perform the heat-shrinking operation. It will begin heating
  - Meanwhile, close the left/right/primary splicer doors and press RESET to prepare the splicer for the next run. 
  - Once the heat shrink operation is done, the splicer will beep. Open the doors and carefully move the cable to the cooling tray. Leaving it in the heater too long may cause it to cool and stick to the heater, making removal difficult.
  - NOTE: Ideally, regular black heat shrink would be added to the cable as well and fully cover the coating, going from yellow jacket to yellow jacket.
- Step 5: Testing
  - First, a visual check can be done using the OTDR. Set it into VFL mode, which emits a 650nm red light. Look for "light leaks" along the cable's length, especially around the splice. If red light can be seen, that means it's not being efficiently reflected down the length of the cable, and could indicate signal loss
  - Next, an attenuation check can be performed. the OTDR to OTDR mode, which will generate a graph with distance/position on the X axis and attenuation on the Y axis. Since the OTDR is outputting a known signal strength, the exact loss at any point can be measured. This can be done by emitting a very short-duration pulse and then switching into listening mode to evaluate when and how strong the backscatter returns. 
  - Next, an overall signal loss check can be performed. Set the OTDR to output a 1mW 1310nm signal, and plug the other end either into the OTDR receive jack, or a second strength tester's jack. The dB of the returned signal indicates how much loss there was simply from entering and exiting the newly-created cable. -3dB to -4dB is about what's expected in a well-made cable, after loss from the connectors plus the cable length. If -70dBm is being read, the cable either has a break, or the output from the OTDR is not yet emitting. 

## Resources

- OTDR tester https://www.amazon.com/YEDEMC-Mini-Pro-Mulit-Function-5m-60Km-Dynamic/dp/B07Z1XCRBF
- Heat shrink tubing sleeves https://www.amazon.com/Shrinkable-Optical-Fusion-Splice-Protection/dp/B01FR0ZTNA
- Fiber Optic stripper tool https://www.amazon.com/Jonard-Tools-Fiber-Optic-Stripper/dp/B006962CUK
- Fiber Optic Fusion Splicer https://www.amazon.com/SPEEDWOLF-Alignment-Portable-Splicing-6XElectrodes/dp/B07RKVXZ5R
- Article on different connector types https://www.fiber-optic-solutions.com/evolution-of-flat-pc-upc-and-apc-fiber-connectors.html
- Article on different components in a fiber cable http://labman.phys.utk.edu/phys222core/modules/m7/optical-fibers.html
- Article and calculator to convert decibels to milliwatts https://www.rapidtables.com/convert/power/dBm_to_mW.html
- Article on the inverse square law https://energyeducation.ca/encyclopedia/Inverse_square_law
- Article referencing the 9 micron size of single-mode fiber https://www.thefoa.org/tech/ref/basic/fiber.html
