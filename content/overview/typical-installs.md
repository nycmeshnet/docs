---
title: "Typical Installation Example"
aliases:
    - /intro/typical-installs
---

Now that you understand that NYC Mesh is composed of [end-user devices]({{< relref "end-user-connectivity" >}}), indoor and [outdoor routers]({{< relref "intra-mesh-connectivity" >}}), and a [connection to the Internet]({{< relref "internet-connectivity" >}}), let's put it all together by stepping through an example installation for a new NYC Mesh node at a very high level.

Bear in mind that while this page describes a typical installation, it is merely an example. In real life, an install may not follow these steps exactly, and there may be extra steps that must be taken to connect the new node which are not described here. For a more thorough treatment of this process, please refer to our [New Node Installation Guide]({{< relref "installs" >}}). Also, as a reminder, please read our [FAQ](https://nycmesh.net/faq) *instead of* this page if you have not already done so and are simply curious about how NYC Mesh works at a very basic level.

When the installation is complete, we will have successfully connected a new apartment at a new location to the rest of the NYC Mesh network using an implementation that is similar to Figure 1, below:

{{< figure src="/img/typicalInstall/diagram_lbeonly_textbottom.jpg" alt="Diagram for a simple, single-apartment connection to NYC Mesh." caption="Figure 1." >}}

## Determine connection possibility

The process for installing a new node always starts with a [join request](https://nycmesh.net/join) by a prospective member of the community. This drops a pin for the location of the potential new node on the [NYC Mesh node map](https://nycmesh.net/map), and starts a conversation between an Install Team leader and the prospective new member about what joining NYC Mesh means. One of the considerations discussed is how to physically connect to our network.

Since NYC Mesh is an "over the air" network that connects new nodes "rooftop-to-rooftop," the very first step is to make sure that the new code actually *can* be physically connected to the rest of the network. If the new node is simply too far away from an existing node, or if it cannot receive a good radio signal for other reasons such as obstacles that are in the way, we cannot proceed because we won't be able to physically attach any equipment we install to the rest of our network.

However, let's assume that the new node is somewhere in New York City that we actually can reach with the radio signal from one of our other nodes. In this case, the Install Team leader will visit the potential new node location to perform a site survey. This simply means that they will check to make sure that the install team will be able to climb up on the roof safely and that the roof has at least some accomodations for installing routers and antennas.

Assuming the site survey results in a green light for the install operation, the Install Team leader will coordinate with the new NYC Mesh member to choose a time for the install. They will also recruit an install team made up of volunteers, and they will be responsible for collecting the installation fee from the new member in order to cover the costs of the equipment that the install team will need to carry out their work.

## Install the outdoor router

After the install team arrives at the site of the new node location, politely introduces themselves to the new NYC Mesh member, and is directed to the rooftop, the first task to complete is to install the outdoor router. Although any of a variety of outdoor router hardware could be used, we'll assume that the Install Team leader has brought along a [Ubiquiti-branded Litebeam AC]({{< relref "hardware/litebeamac" >}}), which is a very good device for this kind of installation. A picture of this device is shown in Figure 2.

{{< figure src="/img/hardware/ubiquity_litebeam5acgen2.png" alt="Photograph of a Ubiquiti Litebeam AC, second generation outdoor router." caption="Figure 2." >}}

The Ubiquiti Litebeam AC (or just "Litebeam" for short) is a single piece of hardware that functions as both a router and an antenna in a single casing. Another major advantage of this device is that it receives electrical power over a standard Ethernet network cable using a technology called [Power-over-Ethernet, or PoE](https://en.wikipedia.org/wiki/Power_over_Ethernet) for short. This means we can plug an Ethernet network cable into the Litebeam and that same cable will serve as *both* a power cable and the network cable that will attach this outdoor router to the indoor router that we will install shortly.

Before the Install Team can begin to attach the Litebeam to the roof, however, they need to find one or more existing NYC Mesh antennas installed on nearby rooftops.

### Angling the antenna towards other nodes

In order for the Litebeam to provide the new NYC Mesh member with connectivity to the rest of the NYC Mesh network, it must be attached to the roof such that it points towards other NYC Mesh nodes. This is particularly important because the Litebeam's radio antenna is *directional*. In other words, it can only receive and send radio signals in a single direction, as opposed to "in all directions," which is what an omni-directional antenna can do. If the Install Team mounts the Litebeam to the roof without pointing it in the correct direction, the new node will not be connected to the rest of NYC Mesh and will, to put it bluntly, simply not work.


**1.- Connect to a hub or supernode (one apartment - no roof-to-roof expansion). Such installation does not allow expansion of the Mesh network, nor allow sharing with neighbor community**  

A typical installation has a [LiteBeam] (/hardware/litebeamac) antenna on the roof. From that antenna an ethernet cable is run to the apartment. (note: the antenna is sometimes referred as the outdoor router).

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

