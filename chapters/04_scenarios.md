This section illustrates how the MuMo dataspace architecture is used in practice by museum professionals to analyze, share, and contextualize environmental monitoring data.

## Scenario 1: Analyzing Environmental Conditions Over Time

The primary use of the advanced dashboard is to support museum staff in assessing the long-term “health” of collection objects by analyzing environmental conditions over time. Users interact with the system through a web-based dashboard that allows them to filter and combine data based on:

* location (group),
* sensor or node,
* type of measurement (e.g., temperature, humidity),
* time constraints.

Using these filters, users can construct queries that follow an artwork throughout its lifecycle. For example, a curator can analyze how environmental conditions evolved while an object was stored in one room, then exhibited in another, and later placed in temporary storage. Because sensor configuration changes are published as versioned semantic descriptions, the system can correctly associate observations with their deployment context at each point in time.

A key practical benefit of the Linked Data Event Streams (LDES) publication model is that **data filtering occurs before retrieval**. Rather than fetching all historical measurements and filtering client-side, the dashboard retrieves only the relevant fragments based on semantic relations and temporal constraints. For instance, when analyzing conditions in a specific year, only the corresponding fragments are accessed, avoiding unnecessary data transfer and improving responsiveness.

This incremental and selective access is essential for long-running monitoring installations, where datasets grow continuously and may span multiple years.


## Scenario 2: Cross-Institutional Access During Loans

A second, critical scenario concerns the monitoring of artworks during loans between museums. Lending institutions typically require access to environmental data from the borrowing museum to ensure that conservation conditions meet agreed standards, while borrowing institutions must retain control over their broader monitoring infrastructure.

In MuMo, this scenario is supported through **group-based access control aligned with Solid identities**. For a loan, the borrowing museum creates a dedicated group in the legacy dashboard and associates the relevant sensors with that group. Access to this group is then granted to specific Web-based identifiers belonging to the lending institution.

Because access control is enforced at the level of published data fragments, external users can authenticate using their own WebIDs and access only the data streams corresponding to the loan group. No centralized user management or data replication is required. Once the loan period ends, access can be revoked by removing the external WebIDs from the group.

This approach enables temporary, fine-grained sharing of monitoring data across institutional boundaries while remaining manageable for museum staff and compatible with existing workflows.


## Scenario 3: Integrating Multiple Data Sources

In addition to supporting analysis within a single monitoring deployment, the advanced dashboard demonstrates the ability to **combine data from multiple independent MuMo data sources**. Each MuMo deployment publishes its monitoring data and sensor descriptions independently, yet follows the same semantic representation and event-based publication model.

In practice, this allows users to access and analyze data originating from different museum setups within a single interface. For example, a user may compare environmental conditions across multiple exhibition spaces or institutions, provided they have the appropriate access rights. Because sensor metadata and observations are published as Linked Data Event Streams, the dashboard can discover available sensors, determine authorization, and incrementally retrieve data from multiple sources without requiring centralized aggregation.

Beyond this demonstrated functionality, the same mechanisms also enable the **conceptual integration of external data sources** that are not part of the MuMo project, such as weather station measurements. Since both sensor metadata and observations are modeled using shared semantic standards, incorporating additional event streams would not require changes to the underlying architecture. While such external integrations have not yet been deployed, they directly informed the design of the system and illustrate how the dataspace approach supports extensibility and reuse.

