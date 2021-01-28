---
title: "Network Number"
---
Enter the Install Number* below to get the NN that can be used to configure the rooftop antennas/routers. This can also be used with existing multiple apartment installs to figure out the network number (NN) for the roof/building you are connected to.

<form action="https://script.google.com/macros/s/AKfycbxpdoWgLX8YCywbYXWKyi5ZXUbjG46omTCxNCwSybc/dev" method="nn">
  <label for="installnum">Install Number:</label>
  <input type="hidden" id="method" name="method" value="nn">
  <input type="number" id="id" name="id" min="1" max="100000">
  <input type="submit" value='Get NN'>
</form>

<br/>
<br/>

_*The Install Number is the number you received in an email right after you registered. If you can't find the email with your Install Number please [contact us](mailto:install@nycmesh.net)._
<br/>
<br/>

If you have the password you can assign a NN for an install number

<form action="https://script.google.com/macros/s/AKfycbxpdoWgLX8YCywbYXWKyi5ZXUbjG46omTCxNCwSybc/dev" method="nn">
  <label for="installnum">Install Number:</label>
  <input type="hidden" id="method" name="method" value="nn">
  <input type="number" id="id" name="id" min="1" max="100000">
  <label for="pwd">Password:</label>
  <input type="password" minlength="8" id="id" name="pwd" >
  <input type="submit" value='Assign NN'>
</form>

<br/>
<br/>


We have changed the way "Node Numbers" work and we're now using the term NN or "Network Number". 

Previously each registration would receive a **Node Number**. This number would be used to configure the devices. For example used in the litebeam naming and in the OmniTik configuration. The Node Number was used to generate the IP address range used by the OmniTik device.  Many registrations do not end up being installed and thus a lot of addresses are being “blocked” as reserved for those Node Numbers, Nodes associated with persons.  We gave ourselves a limit of 8192 “nodes”. This in order to “save” the IP range above, for further usage.

We need now to start using the unused or unassigned IPs in the lower range. 

From now on, when a person registers, they receive an **Install Number** (or install request number).  A person can register for several addresses and receive several Install Numbers. An Install Number can be seen a bit like a work-order.
When devices are being configured and installed, they will receive a **Network Number** or **NN**, different from the Install Number. The IPs for an OmniTik device will be generated out of the **Network Number (NN)**. A member thus will have an **Install number** and a **NN**. It is possible that for some installations the Network Number and the Install Number are the same number. The second member connected to the same node (Network Number) will have a different Install number.

The Install Number is associated with a member. When installed it is linked to a Network Number.  The Network Number is associated with a building number (street address / BIN ). A building can have several Network Numbers in the event that it has for technical reasons 2 or more “nodes”.
When a member moves, the Network Number stays with the building (especially when there are other members connected to this Network Number (Node). The moving member will register with their new street address and will receive a new Install Number. 
<br/><br/><br/><br/>*Examples*<br/><br/>
*John D. Install Number 2000, is connected to node with Network Number 5000*<br/>
*Elis W. Insall Number 3000, is also connected to node with Network Number 5000*<br/>
*Node with Network Number 5000 is on the building at address 55 Main Street.*<br/><br/>

*John D. has also Install Number 4000, is connected to node with Network Number 6000*<br/>
*Node with Network Number 6000 is on the building at address 102 Down Street.*<br/>
