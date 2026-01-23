The in-use scenarios presented above highlight how specific architectural and modeling decisions shaped the practical use of MuMo in museum monitoring contexts. Rather than evaluating individual technologies in isolation, this section reflects on how these choices interacted with real-world constraints and practices.

## Solid as an Institutional Boundary Mechanism

Across all scenarios, Solid played a central role in enabling data sharing without centralization. By treating Solid Pods as **institution-level data endpoints** rather than user-centric storage, MuMo aligned naturally with museum governance structures. Institutions retain control over their monitoring data while still enabling external access when required.

This was particularly evident in the loan scenario (Scenario 2), where Solid identities (WebIDs) allowed users from different institutions to authenticate without relying on a shared user database. Access could be granted and revoked by modifying group membership, supporting temporary collaborations without introducing new identity management workflows.

**Lesson learned:** Solid is most effective in this context when used to represent **organizational boundaries and responsibilities**, rather than as a personal data store.

## Linked Data Event Streams for Scalable Analysis

The use of Linked Data Event Streams proved essential for handling the continuous and growing nature of monitoring data. In the analysis scenario (Scenario 1), LDES enabled the dashboard to retrieve only the relevant subsets of data based on semantic relations and temporal constraints, avoiding the need to fetch complete datasets and filter client-side.

Lesson learned: The combination of LDES and Solid is particularly effective because fragmentation simultaneously serves performance and governance needs. Fragment trees enable clients to prune irrelevant subtrees for a given query, while Solid access control can be enforced on the same subtree boundaries. This allows selective cross-institutional access without requiring providers to implement bespoke query endpoints or replicate data into centralized stores.

This incremental access model also facilitated multi-source analysis (Scenario 3), where data from multiple independent MuMo deployments could be consumed and combined without requiring centralized aggregation or bespoke query endpoints.

**Lesson learned:** Event-based publication is particularly well suited for long-running Digital Humanities data collection, where datasets evolve continuously and selective access is more important than expressive querying.

## Group-Based Access Control as a Deliberate Design Choice

MuMo deliberately adopts **group-level access control**, even though finer-grained authorization is technically feasible within the chosen architecture. The use of Linked Data Event Streams combined with a hierarchical fragmentation strategy makes it possible to enforce access constraints at different levels of granularity, such as individual days or, with minor adaptations to the publication pipeline, per measurement type.

In practice, these options were not activated. The legacy dashboard that remains authoritative for configuration and access management does not provide mechanisms to express such fine-grained permissions. As a result, only those authorization concepts that are meaningful and manageable within existing museum workflows were reflected in the generated access control configurations.

This decision was particularly evident in the loan scenario, where group-level access proved sufficient to grant lending institutions visibility into relevant monitoring data without exposing unrelated information. Introducing finer-grained access control would have increased technical complexity without corresponding benefits for end users.

**Lesson learned:** In applied Digital Humanities settings, the appropriate granularity of access control is determined less by technical capability than by the expressive power of existing organizational tools and practices. Designing for feasible access control is often more valuable than designing for maximal access control.

## Semantic Modeling as an Enabler of Integration

Semantic representations based on shared observation models enabled MuMo to separate **data production** from **data consumption**. Sensor descriptions, deployment context, and observations could be published independently, versioned over time, and interpreted consistently across systems.

This separation was critical in Scenario 1, where sensor relocations needed to be reflected correctly in longitudinal analyses, and in Scenario 3, where data from multiple sources could be combined as long as they adhered to the same semantic structures.

**Lesson learned:** The value of semantic modeling in practice lies less in expressiveness and more in its ability to support evolution, reuse, and alignment across independently managed systems.

## Dataspace Integration at the Point of Use

Finally, the combination of Solid, LDES, semantic modeling, and client-side aggregation reflects a broader dataspace principle: **integration happens at the point of use**, not through centralized infrastructure.

Similar architectural patterns can be observed in other domain-specific data space initiatives, such as the Flanders Smart Data Space, where semantic standardization and Linked Data Event Streams are combined to support decentralized data publication across organizational boundaries [@VSDS2025].

More broadly, European data space initiatives emphasize federated trust, identity, and governance mechanisms to enable cross-organizational data exchange while preserving sovereignty, aligning with the boundary-oriented role Solid plays in MuMo [@idsa2023ram4; @gaia-x].

Rather than enforcing a single global schema or repository, MuMo enables institutions to publish data independently and allows consumers to integrate only what they need, when they need it. This approach proved compatible with legacy systems and institutional autonomy, both of which are common in Digital Humanities settings.

**Lesson learned:** Dataspace architectures are particularly well suited to DH environments where data is distributed, governance is decentralized, and collaboration is episodic.

