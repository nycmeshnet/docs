---
title: "Workflow"
---

# Overview

**Join Form**

Everything begins when a user fills out our [Join Form](https://nycmesh.net/join).

Submitting it assigns the user a node number, sends a support ticket, and adds a row to a spredsheet in Google Docs we refer to as our "main spreadsheet."

**Main Spreadsheet**

New nodes are displayed as gray dots on [our map](https://nycmesh.net/map). They are rendered from the spreadsheet using the [map-nodes](https://github.com/nycmeshnet/map-nodes) code on our Github.

**Support Ticketing**

We use OSTicket for support tickets

**Install viability, panoramas etc**

A main bottleneck is figuring out which installs are viable. Usually this means line-of-sight to one of our supernodes, or a nearby kiosk.

**Scheduling an install**

Once an install is deemed viable we send a link to our calendar so the new member can book an install. 

**Acuity calendar**

Info to come.


**General Workflow Description:**

1. User fills out the join form
> Ticket is automatically assigned the help topic "010-join form / rooftop" or "010-join form / standard".  
> Row with node number and user info is created in the main spreadsheet.  
> Ticket is created in OSTickets to be claimed by a NYC Mesh volunteer ("agent").  
> OSTickets sends auto-response asking for confirmation and a panoramic image of the user's view.

2. Ticket is claimed by an agent.
> On the ticket, agent should assign the Help topic “01 waiting for pano” and save.

3. If no response from the user (maybe auto-response went to spam) agent sends Spam SMS following this procedure:
* Go to the ticket and copy the phone number.
* Sign into nycmeshmail@gmail.com.
* On the left you’ll see the NYC Mesh icon with a “+”. Click on the plus, and paste in the phone number. Click on “Send SMS”.
* Back at the bottom of the ticket, select the canned response “15-spam sms message”. Copy the generated message. Do not send this message to the user via the ticket.
* Paste this message into the SMS text area and send the SMS.
* Back at the ticket, click on “Post Internal Note” and paste the message there as well.
* Edit the ticket and assign it the Help topic “012-sent spam sms” and save.
* If another week goes by with no response, then close the ticket.

4. User responds with a pano.
> Agent should then reassign ticket to Jason Howard to add the pano the map.  
> Jason will assign the ticket back to Agent when pano is added.

5. Agent should correspond with the user until install type is determined.

6. Agent should then encourage the user to schedule an install.
> On the ticket, send the canned response "25-Schedule an Install"

7. The user will be directed to Acuity Scheduling where they will select an available install time slot.
  * The selected time slot will appear in the "NYC Mesh Community Network" google calendar.
  * The event needs to be copied into the "install requests" google calendar.
  
8. Installer volunteers to do install.

9. Install info [here](https://docs.google.com/presentation/d/1tIi4QSxitKx6un9pPfzCNJnribGZKAK1y9t8FtPl0gg/edit#slide=id.g3715bd45a8_0_6).
