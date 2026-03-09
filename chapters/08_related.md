# Related work

Environmental monitoring is a well-established concern in museum practice, since temperature, humidity, and light exposure directly affect object preservation. Prior work has explored wireless and low-cost monitoring infrastructures for museums, showing the value of continuous sensing but largely focusing on local data capture and dashboard use rather than interoperable publication or cross-institutional sharing [@laborda2022concept; @rodriguez2010integrating].

A second line of related work concerns semantic sensor modeling. MuMo builds on OSLO and SSN/SOSA to represent sensors, observations, and their changing context in an interoperable way [@buyle2016oslo; @compton2012ssn; @ssn-sosa]. This is particularly relevant for museum monitoring, where sensors may be moved between rooms or reused in new configurations, while historical observations still need to remain interpretable.

For publishing continuously growing datasets, MuMo uses Linked Data Event Streams. Prior work has shown how LDES supports incremental publication and consumption of evolving linked datasets through navigable fragments [@vanlancker2021ldes; @slabbinck2023linked]. This fits environmental monitoring well, because observations are append-oriented and are often consumed only for a limited subset such as a specific sensor, group, or time window.

At the architectural level, MuMo is informed by dataspace research, which argues for incremental integration across independently managed sources rather than full upfront unification [@franklin2005databases; @halevy2006principles]. This is closely aligned with museum practice, where monitoring data is embedded in local systems and only occasionally needs to be shared across organizations. 

MuMo also relates to work on decentralized data governance through Solid, where storage, identity, and access control are decoupled from specific applications [@solid_24; @solid_25]. Combined with Web Access Control and LDES publication in Solid containers, this supports selective sharing without requiring centralized user management or custom query endpoints [@solidprotocol2022; @slabbinck2023linked].

Finally, prior work on authorization highlights that fine-grained access control can become complex to configure and manage in practice [@hu2014guide]. In that respect, MuMo’s contribution is not a new access control model, but an applied architecture that aligns publication structure and authorization boundaries with existing museum workflows.

Taken together, these strands provide the foundations for MuMo, but not their combined application in an operational museum monitoring setting with legacy dashboards, continuously growing observation data, and temporary cross-institutional access needs such as loans. The contribution of this paper is therefore primarily infrastructural and applied.
