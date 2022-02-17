---
title: "Protecting the Mesh"
---

A common misconception about the mesh is that we are an "Internet Service Provider", strictly speaking. While we provide an alternative connection to the Internet and thus serve as an alternative to the big NYC ISPs, we are first and foremost a community that supports a community network.

That being said, reliability is something we are trying to push into the 99.9 percentile as the vast majority of members rely on this network for their daily lives. We have an obligation to maintain the network to ensure the people who use this as their primary connection to the Internet can use it unencumbered.

At the moment, here are the biggest issues localized parts of our network face when it comes to ensuring reliable and fast access to the Internet:

### One member on a node consuming an inordinate amount of bandwidth through a shared connection.

Many nodes on the network are individually connected, meaning that your connection to the Mesh is only used by one router on a building and is not shared by anyone else. The equipment we use allows for 3-4 routers or apartments to be added to a node without any additional hardware.

If multiple people in a building join the Mesh, they can typically use the same connection to the Mesh without saturating their link (you can see a list of bandwidth requirements for common internet services [here](https://docs.nycmesh.net/diy/troubleshooting]). However, issues do arise when a member uses file-sharing or torrenting services that can often max out the shared connection during periods of high load.

If we notice this type of usage or receive a support request from a neighbor who is experiencing degraded service as a result, we will reach out to figure out a solution. **The fix is often as simple as leaving large downloads for overnight or enabling a throughput limit on syncs and backups for cloud services.**

### A member or router generating known abuse traffic and spam connections to the Internet.

We are a net-neutral network, where we do not log, inspect, or throttle any traffic that passes inside or outside network. There are a few services that we do block on **outbound** connections to try to limit the amount of DMCA, abuse, and spam notifications we receive which affects the whole network:

- Unencrypted torrent traffic
- Port 25 (SMTP)
- Un"NATed" traffic (connections that originate towards the Mesh without outbound initiation)

As we do not track member activity, there is simply no mechanism for investigating which member has caused a DMCA alert or spam filter to be triggered. However, we keep a public log of these alerts in [#abuse](https://nycmesh.slack.com/archives/CCY36KSHY) to make members aware of the content that generates these negative actions against the network as a whole.

If there is clear evidence that such traffic is being generated from a node, we will reach out to figure out a solution. **The fix may be resolving a virus or botnet coming from a computer generating malicious traffic, which our volunteers can help resolve.**

### Misbehaving or misconfigured equipment disrupting connectivity for others or spamming log files slowing support functions.

Our network is built in such a way that anyone who reads our documentation along with resources on the Internet can set up their own node and experiment with their configurations. We ask that any DIY setup is based off of the [configuration files](https://docs.nycmesh.net/hardware/config) we provide so that volunteers have access to the equipment in case of an issue.

There are times where either user error or environmental factors cause harm to a piece of equipment that causes other members to become disconnected or our support system to flag your device as "flapping"; reconnecting rapidly for a period of over 5 minutes. These are both high priority issues that volunteers will quickly seek to rectify, and without guarantee of contact during a widespread outage.

If either of these conditions are observed by a volunteer, we will first determine the severity of the condition, disable or reconfigure equipment if it is causing a widespread outage, and reach out to figure out a solution. **The fix may be as simple as scheduling a support visit to replace a cable or equipment, or to assist in reconfiguring a DIY setup so as not to cause issues for other members.**

### Members not responding to volunteers for requests to modify, adjust, or otherwise maintain equipment.

By joining the Mesh, you agree to the [Network Commons License](https://www.nycmesh.net/ncl.pdf) which outlines:
*The network must allow access to any willing participant, except when doing so would jeopardize the proper functioning of the network.*

Part of ensuring the proper functioning of our network is maintaining contact with our members in case of issues. When you install a node on your roof, you are expanding the Mesh further in your corner of New York City, which means others may potentially connect through your node in the future.

Our volunteers need to be able to resolve issues that may arise with a particular connection, which means we may reach out to a member if their node has an issue affecting our support functions or the ability for others to connect to the Mesh. This outreach is essential; if we are not able to reach the member in order to resolve these operational issues, **it may become necessary to temporarily disconnect a node until we can resolve any underlying problem that has caused the issue.**

To prevent this from becoming necessary, we encourage all of our members to be as active in our community as is feasible for them. Being a network engineer isn't required; here are some of the ways a user of the network can be a good member of the community:

- [Reporting problems](https://www.nycmesh.net/support) in a timely manner (don't suffer in silence as others might have the same issue!)
- Getting to know their neighbors who are using the same rooftop equipment in a building (also [spreading the word](https://docs.nycmesh.net/organization/outreach) about the Mesh if you are enjoying your connection!)
- Asking questions if you aren't sure about *anything*. Part of being a member in this large community means that there are numerous people eager to share their knowledge about the Mesh and technology as a whole.

You are never bothering anyone by asking questions and sharing your experience with us. We are in this together!