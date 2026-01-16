## Dataspace Architecture Based on Solid

MuMo adopts a **dataspace-oriented architecture** based on Solid principles, in which data remains under the control of the institution that produces it, while still being accessible across organizational boundaries. Rather than centralizing monitoring data, each MuMo deployment publishes its own data and defines access conditions under which external parties may consume it.

This approach aligns with museum practice: institutions are unwilling to relinquish control over their monitoring infrastructure, yet must be able to selectively share data during collaborations such as object loans. Solid provides a conceptual and technical framework in which identity, access control, and data location are decoupled from any single application.

In MuMo, Solid Pods act as **institutional data endpoints** rather than user-centric storage, enabling long-lived publication of monitoring data that remains independently governed.


## Continuous Data Publication with Linked Data Event Streams

Environmental monitoring produces **continuous, append-only data** that grows over time and is rarely modified retroactively. To reflect this, MuMo publishes monitoring data using **Linked Data Event Streams (LDES)**.

LDES enables consumers to:

* retrieve historical data incrementally,
* stay synchronized with newly produced observations,
* avoid repeated querying of centralized services.

This publication model proved particularly suitable in a cross-institutional setting, as it allows data consumers to process only the subsets of data they are authorized to access, without requiring the data provider to offer tailored query endpoints.


## Semantic Representation of Sensors and Observations

All data managed by the legacy dashboard is transformed into a semantic representation, including both **environmental observations** and **sensor configuration metadata**. This separation reflects two different kinds of change:

* observations evolve continuously over time,
* sensor configurations evolve discretely when sensors are moved or reconfigured.

Sensor metadata is therefore published as a **versioned event stream**, allowing consumers to reconstruct the context in which observations were produced. Group membership and location are encoded explicitly in the semantic descriptions, enabling downstream systems to reason about authorization and interpretation without consulting the legacy dashboard.


## Group-Based Access Control as a Practical Design Choice

Access control in MuMo deliberately mirrors the **group-based authorization model** already in use in the legacy dashboard. Rather than introducing fine-grained authorization at the level of individual observations, access is granted at the level of sensor groups.

This choice was guided by museum practice: for loan scenarios, institutions require access to all monitoring data related to a specific object or location over a defined period. Group-level access was therefore found to be both sufficient and manageable, avoiding complexity that would hinder adoption.

Authorization policies defined in the legacy system are reflected in access constraints on published data, allowing cross-institutional sharing without introducing a new access management interface.

Although the underlying fragmentation strategy and event-based publication model would technically allow finer-grained access control (e.g., at the level of individual days or measurement types), MuMo intentionally limits authorization to group-level permissions in order to remain aligned with the configuration mechanisms and functional requirements of the legacy dashboard.


## Decentralized Consumption and Aggregation

Because each MuMo deployment publishes its data independently, consumers may need to combine data from multiple sources. MuMo supports this through a client-side dashboard that retrieves sensor descriptions first, determines the user’s authorized scope, and then incrementally consumes the relevant observation streams.

This approach avoids centralized aggregation while still enabling a unified user experience, reinforcing the dataspace principle that **integration occurs at the point of use**.
