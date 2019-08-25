---
title: "Mesh Design"
---

NYC Mesh is designed and run as a mesh network.  As a mesh, various nodes connect to each other in a non-hierarchical way, with traffic flowing in either direction, and rerouting traffic as nodes fail.

As with all mesh networks, we must balance between becoming too much of a "star" topology vs a "mesh" topology.  
Neither is fully practical -- Not literally every node next to each other can all connect to each other, nor can we sustain unlimited nodes connecting to one rooftop.  

## Design
We propose a design to practically cover our city ( New York City ) which features many tall buildings, regions of short buildings, multiple islands, and a dense urban population. We also want to be able to take advantage of free resources and natural features as they become available.  

In this design, we propose:

 * A number of community-operated sites which will be in good high location to support the mesh backbone. ( Sometimes called high-sites. )
 * Rooftop sites that connect to each other and to one or more hub-nodes.
 * Two mesh layers:
    - One mesh network between all supernode / hub nodes. This mesh is "the full view" and can "express" you between any two neighborhoods.
    - A rooftop-to-rooftop mesh network within neighborhoods.
 * The in-neighborhood meshes will collect all local routes and present them to the hubs.  
 * Hubs will present all routes from other neighborhoods to each other and to other neighborhoods.

## Example Diagram
![nycmesh-hubsandhoods.png](/img/nycmesh-hubsandhoods.png)


## Mesh argument
A number of people have argued for/against this approach, suggesting this is not a valid mesh layout.
While it's true that this is not a traditional "by-the-book" mesh network, it seems mesh communities are all about trying out new things.  

Technically we could have used one mesh standard across the entire network, however, a few concerns led us the other direction:

  * Some longer running mesh networks have problems moving to newer protocols once too many nodes are deployed. We wanted to avoid this problem by creating smaller interconnected meshes.
  * We had difficulting finding cheap and available quality routers to continue building the mesh. Additionally, open firmware project were undergoing internal shifts. Using standard / multiple protocols we can leverage off-the-shelf routers with multiple radios and high speeds; and mix with Libre hardware when available.
  * We wanted to support experimentation with multiple protocols in different neighborhoods and interconnectivity to other mesh projects.


**Our design is not anti-mesh, but rather embraces the fullness of hardware diversity and interconnectivity.**
