---
title: "Typical Installations"
---

Please read our [FAQ](https://nycmesh.net/faq) if you haven't already.

The intention of this page is not to be technical but rather give to the non-technical person an understanding of a typical installation. 

NYC Mesh is an "over the air" network. The aim is to connect rooftop to rooftop" using different type of equipment based on geography and topology. And doing so, expand NYC Mesh network coverage to the next block and so on*. The fondment of NYC Mesh is to share the connectivity with the neignbors, share ressources, share equipment, share the network. Create a community of communities connecting to each others. NYC Mesh uses basically two categories of equipment. 

* In the first category are equipment that "speaks" [AirMAX] (https://dl.ubnt.com/datasheets/airmax/UBNT_DS_airMAX_TDMA.pdf) (AirMax protocol).  Some hubs and supernodes have antennas covering a sector, or 360o, that "speak" AirMax. To connect to those, you need to install on your roof an antenna that understands that same AirMax protocol. See [Ubiquiti] (/hardware) equipment. In addition, some hubs may as well have antennas of the second category. 

* The second category of equipment uses the same wifi as your home router, [802.11] (https://en.wikipedia.org/wiki/IEEE_802.11) (there are different versions of wifi- 802.11a/b/g/n/ac) see [Mikrotik] (/hardware) equipment.

*Note: In some cases, such as large buildings we may use fiber to connect but would setup a rooftop "hub" to expand the network to surrounding neighbors. <br>

<p align="center"><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/glW_S9bKAHk?VIDEO_ID?version=3&loop=1&playlist=glW_S9bKAHk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen; loop></iframe></p>
<br><hr><br>
**1.- Connect to a hub or supernode (one apartment - no roof-to-roof expansion)**  

A typical installation has a [LiteBeam] (/hardware/litebeamac) antenna on the roof. From that antenna an ethernet cable is run to the apartment. (note: the antenna is sometimes referred as the outdoor router).

<img src="/img/typicalInstall/1unit.jpg" alt="photo" style="width:350px;height:400px;" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="/img/typicalInstall/lbejpipe.jpg" alt="photo" style="width:300px;height:400px;" >

Depending on the roof it can be mounted on an old TV antenna pole, on an added pole, a wall, a chimney, or any existing infrastructure.

<img src="/img/typicalInstall/lbeinfrastructure.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbelongpole.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbejpipe2.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbeventpipe.jpg" alt="photo" style="width:300px;height:400px;" >

In the apartment any type of WiFi router can be installed. We install a [TP-Link router] (/hardware/tplink).

<br><hr><br>

**2.- Connect to a hub or supernode (one or several apartments - with roof-to-roof expansion)**

To allow others to connect to your rooftop LiteBeam router we need to add an ethernet router and an access point. For this we usually use an [OmniTik] (hardware/mikrotikomnitik5ac/) mounted on the same pole or it can be mounted somewhere else on the roof. The OmniTik will give you wifi on your roof and also allow 4 other apartments to connect with ethernet.

<img src="/img/typicalInstall/2units.jpg" alt="photo" style="width:350px;height:400px;" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="/img/typicalInstall/lbe+Omni.jpg" alt="photo" style="width:300px;height:400px;" >

The OmniTik is an Omnidirectional (360°) antenna. It has about 2-3 block radius. We connect the Litebeam to the OmniTik and  apartments to the OmniTik via ethernet.

<img src="/img/typicalInstall/lbe+OmniPipe.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbe+OmniPole.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbe+Omniwall.jpg" alt="photo" style="width:711px;height:400px;" >

<br>
<br> OmniTik not located next to the Litebeam<br>
<img src="/img/typicalInstall/OmniAlone.jpg" alt="photo" style="width:400px;height:533px;">

Other rooftops can connect to the OmniTik by using another Omnitik if they are close enough or we use, in some cases, an [SXT] (/hardware/sxtsqg5acd/)

<br><hr><br>

**3.- A good rooftop can be "beefed up" to allow for more connectivity.**

If the rooftop is interesting (at a good location, it's high enough, etc) we may install "sectors" or other type of equipement. Sectors are antennas that communicate via Ubiquiti's AirMax protocol and have a longer range than an OmniTik. Additionally, we may connect to two hubs, etc....

Here four examples.

<img src="/img/typicalInstall/hub100AVA.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/hub-sn4.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/hub-1350.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/hub-greenpoint.jpg" alt="photo" style="width:300px;height:400px;" >

<br><hr><br>

**4.- A building can connect to an other building with an OmniTik using a different antenna**

A building can connect to another building with an OmniTik using a [SXT] ( /hardware/sxtsqg5acd/ ) antenna. It can then serve one or several apartments.

<img src="/img/typicalInstall/sxt-2.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/sxt-3.jpg" alt="photo" style="width:300px;height:400px;" >

<br><hr><br>
Those are typical installations. Other setups are possible and in use throughout NYC Mesh.

