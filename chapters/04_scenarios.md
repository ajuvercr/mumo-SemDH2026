This section illustrates how the MuMo dataspace architecture is used in practice by museum professionals to analyze, share, and contextualize environmental monitoring data.

## Scenario 1: Analyzing Environmental Conditions Over Time

The primary use of the advanced dashboard is to support museum staff in assessing the long-term “health” of collection objects by analyzing environmental conditions over time. Users interact with the system through a web-based dashboard that allows them to filter and combine data based on:

* location (group),
* sensor or node,
* type of measurement (e.g., temperature, humidity),
* time constraints.

Using these filters, users can construct queries that follow an artwork throughout its lifecycle. For example, a curator can analyze how environmental conditions evolved while an object was stored in one room, then exhibited in another, and later placed in temporary storage. Because sensor configuration changes are published as versioned semantic descriptions, the system can correctly associate observations with their deployment context at each point in time.

A key practical benefit of the Linked Data Event Streams (LDES) publication model is that **data filtering occurs before retrieval**. Rather than fetching all historical measurements and filtering client-side, the dashboard retrieves only the relevant fragments based on semantic relations and temporal constraints. For instance, when analyzing conditions in a specific year, only the corresponding fragments are accessed, avoiding unnecessary data transfer and improving responsiveness.

This is enabled by the fact that the event stream is published as a semantically linked fragment tree. For a given query, the dashboard can follow only those fragment relations that match the selected group, sensor, and time window, and prune all other subtrees. This makes selective data access a navigation problem rather than a centralized query problem, which fits cross-institutional settings where providers should not have to expose custom query endpoints.

This incremental and selective access is essential for long-running monitoring installations, where datasets grow continuously and may span multiple years.


## Scenario 2: Cross-Institutional Access During Loans

A second, critical scenario concerns the monitoring of artworks during loans between museums. Lending institutions typically require access to environmental data from the borrowing museum to ensure that conservation conditions meet agreed standards, while borrowing institutions must retain control over their broader monitoring infrastructure.

In MuMo, this scenario is supported through **group-based access control aligned with Solid identities**. For a loan, the borrowing museum creates a dedicated group in the legacy dashboard and associates the relevant sensors with that group. Access to this group is then granted to specific Web-based identifiers belonging to the lending institution.

Because access control is enforced at the level of published data fragments, external users can authenticate using their own WebIDs and access only the data streams corresponding to the loan group. No centralized user management or data replication is required. Once the loan period ends, sensors should be taken out of the group, so new data is not shared.

This approach enables temporary, fine-grained sharing of monitoring data across institutional boundaries while remaining manageable for museum staff and compatible with existing workflows.


## Scenario 3: Integrating Multiple Data Sources

In addition to supporting analysis within a single monitoring deployment, the advanced dashboard demonstrates the ability to **combine data from multiple independent MuMo data sources**. Each MuMo deployment publishes its monitoring data and sensor descriptions independently, yet follows the same semantic representation and event-based publication model.

In practice, this allows users to access and analyze data originating from different museum setups within a single interface. For example, a user may compare environmental conditions across multiple exhibition spaces or institutions, provided they have the appropriate access rights. Because sensor metadata and observations are published as Linked Data Event Streams, the dashboard can discover available sensors, determine authorization, and incrementally retrieve data from multiple sources without requiring centralized aggregation.

Beyond this demonstrated functionality, the same mechanisms also enable the **conceptual integration of external data sources** that are not part of the MuMo project, such as weather station measurements. Since both sensor metadata and observations are modeled using shared semantic standards, incorporating additional event streams would not require changes to the underlying architecture. While such external integrations have not yet been deployed, they directly informed the design of the system and illustrate how the dataspace approach supports extensibility and reuse.


## Generalizing the scenarios beyond monitoring systems

While the scenarios above focus on environmental monitoring data, they also reveal a more general pattern regarding the role of contextual information in enabling downstream analysis.
They rely on contextual information such as temporal validity, object location, and sensor deployment. In MuMo, this information was obtained from the monitoring infrastructure and its associated configuration data. However, the underlying mechanism illustrated by these scenarios does not depend on the specific system from which such context originates.
In practice, museums already maintain similar forms of structured contextual information in a variety of collection management and repository systems, independent of environmental monitoring.

Contemporary collection management systems and digital repositories often manage object metadata, temporal associations, and organizational context, and may support structured export mechanisms. Examples include repository platforms such as Omeka-S or digital repository services such as D-RaaS [@draas2023].

When such contextual information is made available in a structured and time-aware form, it becomes possible to derive queries that are not explicitly supported by the originating CMS. Instead, these queries emerge from the combination of temporal relations, location changes, and object associations at the point of use.

MuMo demonstrates this principle in the domain of environmental monitoring, but the same mechanism can be applied more broadly to contextual data maintained by other institutional systems. This suggests that dataspace-oriented approaches can unlock additional analytical value from existing CMS infrastructures without requiring their replacement or redesign.

