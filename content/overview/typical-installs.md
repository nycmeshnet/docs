---
title: "Typical Installation Example"
aliases:
    - /intro/typical-installs
---

Now that you understand that NYC Mesh is composed of [end-user devices]({{< relref "end-user-connectivity" >}}), indoor and [outdoor routers]({{< relref "intra-mesh-connectivity" >}}), and a [connection to the Internet]({{< relref "internet-connectivity" >}}), let's put it all together by stepping through an example installation for a new NYC Mesh node at a very high level. Bear in mind that while this page describes a typical installation, it is merely an example. In real life, an install may not follow these steps exactly, and there may be extra steps that must be taken to connect the new node which are not described here.

Also, as a reminder, please read our [FAQ](https://nycmesh.net/faq) *instead of* this page if you are simply curious about how NYC Mesh works at a very basic level and have not done so already.

NYC Mesh is an "over the air" network. The aim is to connect rooftop to rooftop" using different type of equipment based on geography and topology. And doing so, expand NYC Mesh network coverage to the next block and so on*. The fondment of NYC Mesh is to share the connectivity with the neignbors, share ressources, share equipment, share the network. Create a community of communities connecting to each others. NYC Mesh uses basically two categories of equipment. 

* In the first category are equipment that "speaks" [AirMAX] (https://dl.ubnt.com/datasheets/airmax/UBNT_DS_airMAX_TDMA.pdf) (AirMax protocol).  Some hubs and supernodes have antennas covering a sector, or 360°, that "speak" AirMax. To connect to those, you need to install on your roof an antenna that understands that same AirMax protocol. See [Ubiquiti] (/hardware) equipment. In addition, some hubs may as well have antennas of the second category. 

* The second category of equipment uses the same wifi as your home router, [802.11] (https://en.wikipedia.org/wiki/IEEE_802.11) (there are different versions of wifi- 802.11a/b/g/n/ac) see [Mikrotik] (/hardware) equipment.

*Note: In some cases, such as large buildings we may use fiber to connect but would setup a rooftop "hub" to expand the network to surrounding neighbors. <br><br><br>

<p align="center"><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/glW_S9bKAHk?VIDEO_ID?version=3&loop=1&playlist=glW_S9bKAHk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen; loop></iframe></p>
<br><hr><br>
**1.- Connect to a hub or supernode (one apartment - no roof-to-roof expansion). Such installation does not allow expansion of the Mesh network, nor allow sharing with neighbor community**  

A typical installation has a [LiteBeam] (/hardware/litebeamac) antenna on the roof. From that antenna an ethernet cable is run to the apartment. (note: the antenna is sometimes referred as the outdoor router).

<img src="/img/typicalInstall/diagram_lbeonly_textbottom.jpg" alt="photo" style="width:350px;height:400px;" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="/img/typicalInstall/lbejpipe.jpg" alt="photo" style="width:300px;height:400px;" >

Depending on the roof it can be mounted on an old TV antenna pole, on an added pole, a wall, a chimney, or any existing infrastructure.

<img src="/img/typicalInstall/lbeinfrastructure.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbelongpole.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbejpipe2.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbeventpipe.jpg" alt="photo" style="width:300px;height:400px;" >

In the apartment any type of WiFi router can be installed. We install a [TP-Link router] (/hardware/tplink).

<br><hr><br>

**2.- Connect to a hub or supernode (one or several apartments - with roof-to-roof expansion). Allow Mesh network expansion and sharing with the neighbor community**

To allow others to connect to your rooftop LiteBeam router we need to add an ethernet router and an access point. For this we usually use an [OmniTik] (/hardware/mikrotikomnitik5ac/) mounted on the same pole or it can be mounted somewhere else on the roof. The OmniTik will give you wifi on your roof and also allow 4 other apartments to connect with ethernet.

<img src="/img/typicalInstall/diagram_lbeOmni_textside.jpg" alt="photo" style="width:700px;height:400px;" >
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="/img/typicalInstall/lbe+Omni.jpg" alt="photo" style="width:300px;height:400px;" >

The OmniTik is an Omnidirectional (360°) antenna. It has about 2-3 block radius. We connect the Litebeam to the OmniTik and  apartments to the OmniTik via ethernet.

<img src="/img/typicalInstall/lbe+OmniPipe.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbe+OmniPole.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/lbe+Omniwall.jpg" alt="photo" style="width:711px;height:400px;" >

<br>
<br> OmniTik not located next to the Litebeam<br>
<img src="/img/typicalInstall/OmniAlone.jpg" alt="photo" style="width:400px;height:533px;">

Other rooftops can connect to the OmniTik by using another Omnitik if they are close enough or we use, in some cases, an [SXT] (/hardware/sxtsqg5acd/).

This setup as a major benefit. It allows the devices to mesh with each other. If an other Omnitik is installed in a 2-3 blocks radius they will connect to each other and create a mesh, thus improving reliability and allowing a) the Mesh network to expand, and b) the neighbor community to use it to access internet. 

<br><hr><br>

**3.- A good rooftop can be "beefed up" to allow for more connectivity.**

If the rooftop is interesting (at a good location, it's high enough, etc) we may install "[sectors] (/hardware/liteap/)" or other type of equipement. Sectors are antennas that communicate via Ubiquiti's AirMax protocol and have a longer range than an OmniTik. Additionally, we may connect to two hubs, etc....

Here are four examples.

<img src="/img/typicalInstall/hub100AVA.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/hub-sn4.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/hub-1350.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/hub-greenpoint.jpg" alt="photo" style="width:300px;height:400px;" >

<br><hr><br>

**4.- A building can connect to another building with an OmniTik using a different antenna**

A building can connect to another building with an OmniTik using a [SXT] ( /hardware/sxtsqg5acd/ ) antenna. It can then serve one or several apartments.

<img src="/img/typicalInstall/sxt-2.jpg" alt="photo" style="width:300px;height:400px;" >
<img src="/img/typicalInstall/sxt-3.jpg" alt="photo" style="width:300px;height:400px;" >

<br><hr><br>
Those are typical installations. Other setups are possible and in use throughout NYC Mesh.

For the most up-to-date overview of the entire install process, check out the [Install Training Presentation](https://docs.google.com/presentation/d/1Y0bafeH7h9SuAOrUSC_WHOnA7q-rLGTD0OOOmZLBETg/edit?usp=sharing).

