# Observations and Lessons Learned {#sec:lessons}

The in-use scenarios presented above highlight how specific architectural and modeling decisions shaped the practical use of MuMo in museum monitoring contexts. Rather than evaluating individual technologies in isolation, this section reflects on how these choices interacted with real-world constraints and practices.

## Solid as an Institutional Boundary Mechanism

Across all scenarios, Solid played a central role in enabling data sharing without centralization. By treating Solid Pods as **institution-level data endpoints** rather than user-centric storage, MuMo aligned naturally with museum governance structures. Institutions retain control over their monitoring data while still enabling external access when required.

This was particularly evident in the loan scenario (Scenario 2), where Solid identities (WebIDs) allowed users from different institutions to authenticate without relying on a shared user database. Access could be granted and revoked by modifying group membership, supporting temporary collaborations without introducing new identity management workflows.

**Lesson learned:** Deploying Solid pods aligned with organizational boundaries and responsibilities enables effective data sharing without centralization.

## Linked Data Event Streams for Scalable Analysis

The use of Linked Data Event Streams proved essential for handling the continuous and growing nature of monitoring data. In the analysis scenario (Scenario 1), LDES enabled the dashboard to retrieve only the relevant data subtrees based on semantic relations and temporal constraints, avoiding the need to fetch complete datasets and filter client-side.

**Lesson learned:** Event-based publication is well suited for long-running Digital Humanities data collection, where datasets evolve continuously.

Meanwhile, Solid access control can be enforced on the same subtree constraints.
This combination of LDES and Solid allows selective cross-institutional access without requiring providers to implement bespoke query endpoints or replicate data into centralized stores.

**Lesson learned:** A fragmentation strategy that serves both performance needs (subtree filtering) and governance needs (selective access) makes for an effective combination of LDES and Solid in cases where selective access is more important than expressive querying.

This incremental access model also facilitated multi-source analysis (Scenario 3), where data from multiple independent MuMo deployments could be consumed and combined without requiring centralized aggregation.

## Group-Based Access Control as a Deliberate Design Choice

MuMo deliberately adopts **group-level access control**, even though finer-grained authorization is technically feasible within the chosen architecture. The use of Linked Data Event Streams combined with a hierarchical fragmentation strategy makes it possible to enforce access constraints at different levels of granularity, such as individual days or, with minor adaptations to the publication pipeline, per measurement type.

In practice, these options were not activated. The legacy dashboard that remains authoritative for configuration and access management does not provide mechanisms to express such fine-grained permissions. As a result, only those authorization concepts that are meaningful and manageable within existing museum workflows were reflected in the generated access control configurations.

This decision was particularly evident in the loan scenario, where group-level access proved sufficient to grant lending institutions visibility into relevant monitoring data without exposing unrelated information. Introducing finer-grained access control would have increased technical complexity without corresponding benefits for end users.
Designing for feasible access control proved more valuable than designing for maximal access control flexibility.

**Lesson learned:** In this applied Digital Humanities setting, the appropriate granularity of access control is determined less by technical capability than by the expressive power of existing organizational tools and practices.

## Semantic Modeling as an Enabler of Integration

A key benefit of grounding MuMo in Linked Data and Semantic Web standards—RDF, SSN/SOSA, LDES, and the TREE specification—is that the resulting data is self-describing and machine-interpretable by any standards-compliant client. Semantic representations based on shared observation models enabled MuMo to separate **data production** from **data consumption**. Data is produced with two datasets:  versioned sensor descriptions and observations (the actual data). These datasets are consumed together, resulting in the full picture for each observation.

This separation was critical in Scenario 1, where sensor relocations needed to be reflected correctly in longitudinal analyses, and in Scenario 3, where data from multiple sources could be combined as long as they adhered to the same semantic structures.

**Lesson learned:** Semantic models that inherently support independent evolution improve reuse across independently managed systems.

## Integration at the Point of Use: Client-Side vs. Server-Side

Finally, the combination of Solid, LDES, semantic modeling, and client-side aggregation reflects a broader dataspace principle: **integration happens at the point of use**, not through centralized infrastructure.

An alternative approach would be server-side integration, for example through a centralized SPARQL endpoint or a federated query service that aggregates data from multiple sources before presenting it to the client. While such approaches can offer richer query expressiveness, they introduce a single point of control (and failure), require participating institutions to expose query-compatible endpoints, and shift governance to whichever party operates the central service. In museum practice—where institutions insist on controlling their own data and collaborations are often temporary—server-side integration conflicts with the requirement for institutional autonomy.

MuMo’s client-side approach avoids these tensions: each institution publishes its data independently via LDES on its own Solid Pod, and consumers integrate only what they need, when they need it. The trade-off is that complex cross-source queries must be composed at the client, but for the monitoring use cases encountered in practice (time-series visualization, threshold checking, longitudinal comparison), this has proven sufficient.

**Lesson learned:** Point-of-use integration is a good fit for settings with independently published data under distributed governance, as it avoids the need for centralized infrastructure while remaining compatible with legacy systems and institutional autonomy, aligning with dataspace concepts.

