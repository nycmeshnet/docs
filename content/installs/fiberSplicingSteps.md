---
title: "Fiber Splicing Tutorial"
---

TOC
  1. Intro
  2. Steps with pictures
  3. Detailed list of steps
  4. Template

## 1. Intro

These instructions assume only the required tools are used, and minimal precautions taken; no assumptions about safety equiment or convenient tools.


There are 7 procedures to perform in the splicing process; roughly in the following order:

1) setup
2) strip cable to bare fiber
3) cleave bare fiber
4) fuse
5) test
6) apply heat to shrink sleeve and tube
7) clean up

Procedures 2 and 3 will be performed twice; once for each of the two cables. However, one side will need to have more outer jacket stripped off to make room for the shrink sleeve; to move it out of the splicer. The side on which the sleeve will be is refered to as Side With Sleeve (SWS), and the other as Side WithOut Sleeve (SWOS). Note that the sequence will be strip SWS, cleave SWS, position SWS in splicer, AND THEN strip SWOS, cleave SWOS and position SWOS in splicer. That sequence minimizes the risks of mishandling each cable, which could result in one or both of 1) a fiber splinter and 2) breaking the bare fiber; either of which could require starting the process over for that cable since even if the bare fiber did not break, if it has been cleaved, poking any surface could ruin the cut.<br>

During procedure 4, the fibers may need to be repositioned multiple times to align the fiber correctly. This is because, as noted in the [fiber safety page](/installs/fibersafety) (detail 3 to consider), the cable is curved; making this part challenging since the cable needs to be positioned straight and precisely.<br>

Procedure 5 is performed before 6 since it would be a waste of time and resources to shrink the shrink sleeve and the shrink tube if the splice needs to be redone.<br>

## 2. Steps with pictures

Bellow are pictures taken through out the splicing process. (the ordering numbers come from the detailed list in the next section)

07) Stripping the outer jacket of SWS:

![](/img/installs/fiberSplicingSteps/01_strip_12cm_outerjacket_SWS.JPG)

09) Stripping the inner jacket of SWS:

![](/img/installs/fiberSplicingSteps/02_strip_2cm_innerjacket_SWS.JPG)

11) Positioning the stripped SWS in the cleaver:

![](/img/installs/fiberSplicingSteps/03_position_SWS_in_cleaver_closeup.JPG)

13) Positioning the cleaved SWS in the splicer:

![](/img/installs/fiberSplicingSteps/04_position_SWS_in_splicer.JPG)

16-17) Stripping the outer and inner jackets of SWOS:

![](/img/installs/fiberSplicingSteps/05_strip_5cm_outerjacket_2cm_innerjacket_SWOS.JPG)

21) Positioning the cleaved SWOS in the splicer:

![](/img/installs/fiberSplicingSteps/06_position_SWOS_in_splicer_closeup.JPG)

23) Read splicer sceen to view the quality of the splice and an estimate of signal loss:

![](/img/installs/fiberSplicingSteps/07_fiber_fused.JPG)

24) Test splice:

![](/img/installs/fiberSplicingSteps/08_optical_power_meter_1550nm_reading_neg320dBm.JPG)

26) Place shrink sleeve over the fused, bare fiber and move the whole to the splicer's heating compartment to shrink the sleeve:

![](/img/installs/fiberSplicingSteps/09_place_fused_fiber_with_shrinksleeve_in_heating_compartment.JPG)

27) Verify that the sleeve has in fact shrunk (may need to heat 1-3 times):

![](/img/installs/fiberSplicingSteps/10_shrunk_sleeve_wrapping_bare_fiber.JPG)

The result:

![](/img/installs/fiberSplicingSteps/11_fused_cable_on_ruler_15cm_between_outerjackets.JPG)


## 3. Detailed list of steps

### 3.1 Prep
  01) prepare all the equipment required; includes tools and any PPE.

  02) cut shrink tube (20cm).

  03) prepare shrink sleeve.

  04) mark location to cut on cable from each side.

  05) slide shrink tube down either cable.

### 3.2 Begin Process

  06) Take a cable from either side; this cable will be the side with the
     shrink sleeve (SWS), the other will be the side with out the sleeve (SWOS).

  07) Strip outer jacket of SWS (12cm) and cut kevlar.

  08) Slide shrink sleeve over inner jacket of SWS.

  09) Strip inner jacket of SWS (2cm) into sharps container.

  10) Strip cladding of SWS into sharps container and apply alcohol pad.

  11) Cleave SWS.

  12) Use tweezers to pick up fiber fragment and drop into sharps container;
     verify that the segment was indeed in the tweezers all the way to the sharps
     container, and that it fell in the container before putting the tweezers
     down.

  13) Position SWS in fusion splicer.

  14) Use tape to clean any potential glass pieces around and between cleaver and
     sharps container (if they are not moved before cleaving the other side,
     this can be done after the second cable is cleaved).

  15) Take SWOS.

  16) Strip outer jacket of SWOS (5cm) and cut kevlar.

  17) Strip inner jacket of SWOS (2cm).

  18) Strip cladding of SWOS and apply alcohol pad.

  19) Cleave SWOS.

  20) Use tweezers to pick up fiber fragment and drop into sharps container;
     verify that the segment was indeed in the tweezer all the way to the sharps
     container, and that it fell in the container before putting the tweezers
     down.

  21) Clamp SWOS and position it in fusion splicer (clamp to reduce movement when
     removing the splicer clamp; due to cable curve).

  22) Use tape to clean any potential glass pieces around and between cleaver and
     sharps container.

  23) Fuse cables.

  24) Connect cable ends to testing devices and test signal loss.

  25) Carefully release each cable from splicer clamps.

  26) Slide shrink sleeve over exposed fiber and place in splicer's heating
     compartment; sleeve should cover each side roughly 3cm from joint.

  27) Heat 2-3 times.

  28) Slide shrink tube over shrunk sleeve; the shrink tube must leave no inner 
     jacket exposed.

  29) Shrink shrink tube with lighter while adjusting grip to ensure the shrink 
     tube cools straight; may consider using solder clamps for this step.

### 3.3 Clean and pack up

  30) Use tape to clean each piece of equipement and put them back in toolbox

  31) Fold tape in half, sticky side in, to trap any potential glass pieces.

  32) Dispose of tape and packup rest of equipment. 



## 4. Template


In order to strip jackets quickly and precisely the installer should make a template, such as the one shown bellow.

{{< figure src="/img/installs/fiberSplicingSteps/edu_template.JPG" height=375 width=500 >}}


Note that the template in the picture is crowded to illustrate the instructions in section 3; a color coded stick may be easier to work with.

Stick template example (1 dash = 1cm):

< - - - -0- - - - >< -1- >< -2- - >< - - -3- - - - >< - - - -4- - - - >

0: no color ->  8cm; Space for palm of hand.

1: green    -> 2cm; Strip inner jacket of both SWS and SWOS.

2: white    -> 3cm; green + white = 5cm to strip SWOS outer jacket.

3: yellow   -> 7cm; green + white + yellow = 12cm to strip SWS outer jacket.

4: black    -> 8cm; green + white + yellow + black = 20cm to cut shrink tubing.

The following pictures show the measurements used to determine the lengths. Note that template lengths are longer to leave ample room for errors.

The pictures show that:

- The outer edges of the cleaver pads are 1.8cm apart; this is the minimum length of bare fiber required for proper grip to cleave.
- The cleaver will leave about 1.5cm of bare fiber on each cable -> the 6cm shrink sleeve will cover about 3cm of bare fiber and 3cm of inner jacket.
- The shrink sleeve on SWS needs to be >4cm away from the splicer needles to clear the clamp (includes 1.5cm of bare fiber) -> 10cm of inner jacket on top of the 1.5cm of bare fiber.
- The resulting gap (shown in the result picture in section 2), from outer jacket to outer jacket, which needs to be wrapped in shrink tubing is about 16cm -> cut 20cm of unshrunk shrink tubing.

![cleaver pads under ruler](/img/installs/fiberSplicingSteps/cleaver_pads_under_ruler.JPG)

![shrinksleeve on ruler](/img/installs/fiberSplicingSteps/shrinksleeve_on_ruler.JPG)

![splicer measurement](/img/installs/fiberSplicingSteps/splicer_measurement.JPG)
