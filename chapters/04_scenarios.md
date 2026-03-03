# In-Use Scenarios

This section illustrates how the MuMo dataspace architecture is used in practice by museum professionals to analyze, share, and contextualize environmental monitoring data.

## Scenario 1: Analyzing Environmental Conditions Over Time

The primary use of the advanced dashboard is to support museum staff in assessing the long-term “health” of collection objects by analyzing environmental conditions over time. Users interact with the system through a web-based dashboard that allows them to filter and combine data based on:

* location (group),
* sensor or node,
* type of measurement (e.g., temperature, humidity),
* time constraints.

Using these filters, users can construct queries that follow an artwork throughout its lifecycle. For example, a conservator can analyze how environmental conditions evolved while an object was stored in one room, then exhibited in another, and later placed in temporary storage. Because changing the sensor configuration (or metadata) results in a new versioned semantic descriptions, the system can correctly associate observations with their deployment context at each point in time.

A key practical benefit of the Linked Data Event Streams (LDES) publication model is that **data filtering occurs before retrieval**. Rather than fetching all historical measurements and filtering client-side, the dashboard retrieves only the relevant fragments based on semantic relations and temporal constraints. For instance, when analyzing conditions in a specific year, only the corresponding fragments are accessed, avoiding unnecessary data transfer and improving responsiveness.

This is enabled by the fact that the event stream is published as a semantically linked fragment tree. For a given query, the dashboard can follow only those fragment relations that match the selected group, sensor, and time window, and prune all other subtrees.
This makes selective data access a navigation problem rather than a centralized query problem, which fits cross-institutional settings where providers should not have to expose custom query endpoints.
Instead of retrieving all fragments in Figure \ref{fig:ldes}, the client filters on each level, thus only retrieving fragments along the path to the desired data.
This keeps retrieval lightweight even as the overall monitoring history keeps growing.


## Scenario 2: Cross-Institutional Access During Loans

A second, critical scenario concerns the monitoring of artworks during loans between museums. Lending institutions typically require access to environmental data from the borrowing museum to ensure that conservation conditions meet agreed standards, while borrowing institutions must retain control over their broader monitoring infrastructure.

In MuMo, this scenario is supported through **group-based access control aligned with Solid identities**. For a loan, the borrowing museum creates a dedicated group in the legacy dashboard and associates the relevant sensors with that group. Access to this group is then granted to specific Web-based identifiers belonging to the lending institution.

Because access control is enforced at the level of published data fragments, external users can authenticate using their own WebIDs and access only the data streams corresponding to the loan group. No centralized user management or data replication is required. Once the loan period ends, sensors should be taken out of the group, so new data is not shared.

This approach enables temporary, fine-grained sharing of monitoring data across institutional boundaries while remaining manageable for museum staff and compatible with existing workflows.


## Scenario 3: Integrating Multiple Decentralized Data Sources

In addition to supporting analysis within a single monitoring deployment, the advanced dashboard demonstrates the ability to **combine data from multiple independent MuMo data sources**. Each MuMo deployment publishes its monitoring data and sensor descriptions independently, yet follows the same semantic representation and event-based publication model.

In practice, this allows users to access and analyze data originating from different museum setups within a single interface. For example, a user may compare environmental conditions across multiple exhibition spaces or institutions, provided they have the appropriate access rights. Because sensor metadata and observations are published as LDES, the dashboard can discover available sensors, determine authorization, and incrementally retrieve data from multiple sources without requiring centralized aggregation.

Beyond this demonstrated functionality, the same mechanisms also enable the **conceptual integration of external data sources** that are not part of the MuMo project, such as weather station measurements. Since both sensor metadata and observations are modeled using shared semantic standards, incorporating additional event streams would not require changes to the underlying architecture. While such external integrations have not yet been deployed, they directly informed the design of the system and illustrate how the dataspace approach supports extensibility and reuse.


## Generalizing beyond monitoring systems

The scenarios above emphasize environmental monitoring data, but the broader takeaway is about interoperability between contextual datasets. Today, MuMo can derive rich analyses because it combines observations with time-aware context from the monitoring infrastructure itself (e.g., when a sensor was deployed where, and for which period). However, museums already maintain other structured context—most notably about artworks, locations, and movements—in collection management systems and repositories, such as Omeka-S or digital repository services such as D-RaaS [@draas2023].

If this object-centric information could be combined with MuMo’s sensor and observation streams in an interoperable way, MuMo would become substantially more powerful. Queries could then be expressed directly in conservatorial terms—e.g., “show me a graph of the temperature experienced by this artwork”—because the system could follow links from an object to its associated locations and time windows, and from there build queries to retrieve to the relevant measurements.

At present, the necessary datasets often exist, but they are not interoperable: a conservator can typically assemble such answers only by manually aligning exports from the CMS/repository with monitoring data. MuMo’s approach highlights that making these contextual links available in a structured, time-aware form would shift this effort from ad-hoc manual integration to repeatable, queryable reuse at the point of use, without requiring museums to replace their existing collection management infrastructure. 

