The Museum Monitoring (MuMo) project was a three-year cultural heritage project\footnote{https://www.vlaanderen.be/cjm/nl/cultuur/cultureel-erfgoed/subsidies-cultureel-erfgoed/projectsubsidies-cultureel-erfgoed/internationale-landelijke-en-bovenlokale-cultureel-erfgoedprojecten}, funded by the Flemish Government from 2022 to 2025.
Its applied research objective was to develop both open‑hardware monitoring devices and a dedicated data space to support museums in the long‑term tracking of environmental conditions surrounding collection objects.

<!-- TODO: include descriptions of the relevant companies involved, what the stakeholders were, etc. -->

<!-- BDM: ❗ I think structure-wise this section feels weird: you didn't state you were going to discuss the history of the project, but then you suddenly do.
First, clearly state the intention of this MuMo project: extend a proof-of-concept to support cross-institution data sharing (so your current section 2.3 and 2.4).
Then, you can start adding.
Second, describe the architecture of the proof-of-concept (current 2.1 and 2.2).
Third, identify the gaps to reach your goal: semantic model, event stream publishing, access control.
Then you have a basis for section 3: "these are the components we introduced to fix gaps A and B, needed to fulfill requirements 1 and 2 and 3" -->

<!-- Many museums—especially smaller institutions—lack continuous insight into parameters such as temperature, humidity, or light exposure, despite these being critical for conservation and often contractually relevant during object loans. -->
<!-- BDM: you said above in the introduction, why repeat yourself? -->

## Operational Setting

MuMo has been deployed in real museum environments and the sensors were placed near artworks or storage locations and continuously measured environmental parameters.
Due to the physical and organizational constraints of museum spaces, the system had to function with minimal intervention once deployed. 
To accommodate this requirement, custom ultra-low-power sensing hardware was developed, designed  to operate for approximately one year without recharging.

Measurements captured by the MuMo monitoring devices were transmitted via a LoRaWAN signal to off‑the‑shelf gateways and routed through The Things Network, where they were then ingested into an existing (legacy) monitoring dashboard\footnote{https://www.thethingsnetwork.org/docs/lorawan/architecture/}.
This dashboard became the primary operational interface for museum staff and therefore strongly shaped how data could be accessed, interpreted, and shared. 


## Legacy Dashboard Constraints

The existing dashboard provided:

* User and group management, including recursively defined groups
* Node management corresponding to deployed sensors
* Basic visualization through simple time-series graphs
* Configure alerts and notification when measured values cross a certain threshold.
* Export data ranges to CSV

Access control was **group-based and coarse-grained**,
<!-- BDM: I'm not sure what you mean by coarse-grained, and at this point it's not clear why that's important -->
sufficient for internal monitoring within a single institution but not designed for cross-institutional collaboration. Importantly, the dashboard could not be replaced or fundamentally re-engineered within the scope of the project, requiring MuMo to operate within these constraints.
<!-- BDM: BOOOOO that's not a good reason. You can perfectly turn that around as an advantage instead of a constraint:

> Given the user group's familiarity with the original dashboard during the proof-of-concept phase,
we decided to reuse its UI where possible. -->

<!-- BDM: I'm gonna stop reviewing this section as I think you need to rework this, cfr my comment with the ❗ above -->

## Cross-Institutional Access and Loans

A central real-world use case was **the monitoring of artworks during loans between museums**. Lending institutions often require insight into the environmental conditions under which an object is kept while on loan, without being granted broader access to the borrowing museum’s infrastructure or internal data.

In practice, this requirement translates into:

* access limited to a subset of sensors,
* bounded by the duration of the loan,
* manageable by non-technical museum staff.

Although often described as “fine-grained access control,” the actual operational need is **group-level authorization**: sensors associated with a specific loan can be grouped, and access to that group can be granted temporarily to another institution.

## Requirements for Data Sharing

These scenarios impose several practical requirements:

* Data must be shareable across **institutional boundaries**.
* Access must respect existing group-based authorization practices.
* Users must be able to access data originating from multiple museum setups.
* Identity management cannot assume a single central authority.

These requirements motivated an architecture in which monitoring data could be published, discovered, and accessed across organizational boundaries, while remaining compatible with legacy systems and established museum workflows.

