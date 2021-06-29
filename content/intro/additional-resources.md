---
title: Additional Resources
---

Our network is constantly evolving. Things change as technology improves, people come and go, volunteer-run services are added or abandoned, and challenges are faced and overcome. While we strive to document as much as possible as thoroughly as possible, sometimes we miss things or our (small) documentation team simply cannot record things in our docs as quickly as they happen.

If you find that our docs are incomplete or inaccurate, don't give up! There are numerous other avenues available to you to get answers, including:

1. [Slack]({{< relref "#slack" >}})
1. [In-person meetings]({{< relref "#in-person-meetings" >}})
1. [GitHub]({{< relref "#github" >}})

## Slack

Many NYC Mesh members stay in touch via our Slack group. It is available at https://slack.nycmesh.net and is basically a bunch of topically-oriented chat rooms. [Click here to join our Slack](https://slack.nycmesh.net).

Each room in our Slack group, called a channel, hosts a discussion about a certain topic. Here is a list of some of the most important Slack channels that you might want to join and check up on regularly:

`#docs`
: This channel is for documentation team members. Discussions about organizing NYC Mesh Docs happen here.

`#general`
: A general-purpose chat channel; like the lobby of a building or the living room in an apartment. Hang out with us here. :)

`#hardware`
: This channel is where general discussion about physical setups happen. Many people share pictures of custom attachments and insulation casings for their outdoor routers here, and ask questions about where to get the best tools or supplies.

`#hub-*`
: Slack channels whose names begin with `#hub-` are for discussions relating to their specific node. For example, the `#hub-saratoga-1340` Slack channel is about [the Saratoga node (number 1340)]({{< relref "nodes/node-1340" >}}).

`#install-team`
: This channel is for coordinating logistics regarding rooftop [installs]({{< relref "installs" >}}).

`#mesh-services`
: Hyperlocal services and content that are specific to NYC Mesh's network such as [the `.mesh` intra-mesh DNS TLD]({{< relref "networking/dns" >}}) are discussed here.

There are many additional Slack channels, and the channel list expands as people find new and fun things to talk about. You can spend a great deal of time searching within Slack to find even more topics, but the ones listed above are channels you should definitely be aware of.

## In-person meetings

If you are local to New York City, you can attend any of our public events where you can meet other NYC Mesh volunteers and community members face-to-face. In-person meetings are also a good place to ask questions about NYC Mesh that you didn't get answered on Slack or from our documentation, and you'll find many knowledgable and friendly people eager to help you learn how to contribute to our community. View [our Meetup.com events calendar](https://www.meetup.com/nycmesh/events/) for details about upcoming in-person meetings.

## GitHub

Another good source of information is [our GitHub Organization](https://github.com/nycmeshnet/) and its various code repositories. A majority of our production and open-source code is available in one or more of these publicly visible `git` repos. Sometimes, the best place to look for an answer to a question you have is by reading the source code of the software we use, and this is where you can do that.

Some important GitHub-hosted code repositories are listed here:

[`docs`](https://github.com/nycmeshnet/docs)
: The source code for the NYC Mesh Docs website (this one you're reading right now)!

[`node-map`](https://github.com/nycmeshnet/node-map)
: The source code behind the [map of nodes connected to our network](https://nycmesh.net/map).

[`nycmesh.net`](https://github.com/nycmeshnet/nycmesh.net)
: The source code for our main website at [NYCMesh.net](https://nycmesh.net/).

[`nycmesh-configs`](https://github.com/nycmeshnet/nycmesh-configs)
: Various assets and hardware-specific config files for the physical devices that make up the infrastructure of our network.

[`nycmesh-dns`](https://github.com/nycmeshnet/nycmesh-dns)
: Configuration and zone files for our intra-mesh [DNS]({{< relref "networking/dns" >}}) servers and the hyperlocal `.mesh` TLD.

In addition to the source code itself, we also make use of GitHub's issue tracker to have asynchronous conversations about our software and firmware builds. These issue boards are a little bit like forum postings that you can read to understand why certain decisions were made and how a given component of our network evolved. They are also a good place to ask questions and report bugs.
