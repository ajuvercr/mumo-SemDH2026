## Dataspace Architecture Based on Solid

MuMo adopts a **dataspace-oriented architecture** based on Solid, a decentralized data platform designed to give data owners control over their data rather than centralizing it within applications [@solid_24; @solid_25; @solidprotocol2022]. Solid is explicitly designed as a decentralization framework in which data storage, identity, and access control are decoupled from individual applications, enabling data to be reused by multiple clients and actors without funneling all data through a centralized service.

This approach aligns with museum practice: institutions are unwilling to relinquish control over their monitoring infrastructure, yet must be able to selectively share data during collaborations such as object loans. Solid provides a conceptual and technical framework in which identity, authorization [@wac], and data location are decoupled from any single application, explicitly aiming to counter the concentration of data within centralized platforms by restoring data ownership to the producing parties.

While some recent research emphasizes cryptographic immutability and tamper resistance through tightly coupled sensor infrastructures, hardware-based attestation, and private distributed ledgers, MuMo instead prioritizes institutional autonomy and operational feasibility by enabling decentralized data publication and access control aligned with existing museum workflows [@ross2024digital].

In MuMo, Solid Pods act as **institutional data endpoints** rather than user-centric storage, enabling long-lived publication of monitoring data that remains independently governed.


## Continuous Data Publication with Linked Data Event Streams

Environmental monitoring produces **continuous, append-only data** that grows over time and is rarely modified retroactively. To reflect this, MuMo publishes monitoring data using **Linked Data Event Streams (LDES)** [@vanlancker2021ldes; @semic_support_centre].

LDES is increasingly adopted as a practical pattern for interoperable publication of evolving datasets, enabling replication and synchronization across organizational boundaries without centralized query services [@semic_support_centre].

Prior work has demonstrated the feasibility of storing and consuming LDES event sources within the Solid ecosystem, supporting the compatibility of event-stream publication with Solid-based access control [@slabbinck2023linked].

LDES enables consumers to:

* retrieve historical data incrementally,
* stay synchronized with newly produced observations,
* avoid repeated querying of centralized services.

This publication model proved particularly suitable in a cross-institutional setting, as it allows data consumers to process only the subsets of data they are authorized to access, without requiring the data provider to offer tailored query endpoints [@vanlancker2021ldes].


## Semantic Representation of Sensors and Observations

All data managed by the legacy dashboard is transformed into a semantic representation, including both **environmental observations** and **sensor configuration metadata**. This separation reflects two different kinds of change:

* observations evolve continuously over time,
* sensor configurations evolve discretely when sensors are moved or reconfigured.

The semantic representation builds on established models for describing sensors and observations, most notably the W3C Semantic Sensor Network ontology (SSN/SOSA) [@compton2012ssn;@ssn-sosa], which provides a shared conceptual framework for sensors, observations, and their relationships.

SSN/SOSA was selected in particular for its explicit separation between sensors, observations, and the features of interest being observed, enabling sensor redeployment and contextual change to be represented without altering historical observations [@compton2012ssn].

In MuMo, these concepts are instantiated using OSLO vocabularies [@oslo2016], a Flemish Linked Data standardization framework that profiles and reuses international semantic standards for cross-organizational data exchange.

Sensor metadata is therefore published as a **versioned event stream**, allowing consumers to reconstruct the context in which observations were produced. Group membership and location are encoded explicitly in the semantic descriptions, enabling downstream systems to reason about authorization and interpretation without consulting the legacy dashboard.


## Group-Based Access Control as a Practical Design Choice

Access control in MuMo deliberately mirrors the **group-based authorization model** already in use in the legacy dashboard. Rather than introducing fine-grained authorization at the level of individual observations, access is granted at the level of sensor groups.

At the Solid protocol level, this aligns with authorization mechanisms such as Web Access Control (WAC), which allow servers to enforce access rules on resources and their associated representations [@solidprotocol2022; @wac].

This choice was guided by museum practice: for loan scenarios, institutions require access to all monitoring data related to a specific object or location over a defined period.
Prior work on access control has repeatedly highlighted that fine-grained authorization models, while expressive, introduce significant configuration and usability complexity in operational settings, particularly for non-technical users [@hu2014guide].
Group-level access was therefore found to be both sufficient and manageable, avoiding complexity that would hinder adoption.

Authorization policies defined in the legacy system are reflected in access constraints on published data, allowing cross-institutional sharing without introducing a new access management interface.

Although the underlying fragmentation strategy and event-based publication model would technically allow finer-grained access control (e.g., at the level of individual days or measurement types), MuMo intentionally limits authorization to group-level permissions in order to remain aligned with the configuration mechanisms and functional requirements of the legacy dashboard.


## Decentralized Consumption and Aggregation

Because each MuMo deployment publishes its data independently, consumers may need to combine data from multiple sources. MuMo supports this through a client-side dashboard that retrieves sensor descriptions first, determines the user’s authorized scope, and then incrementally consumes the relevant observation streams.

This approach avoids centralized aggregation while still enabling a unified user experience, reinforcing the dataspace principle that **integration occurs at the point of use**.
