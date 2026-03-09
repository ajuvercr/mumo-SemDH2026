# Introduction & Motivation

In cultural heritage institutions, environmental parameters such as temperature, relative humidity, and light exposure directly influence the long-term preservation of collection objects [@laborda2022concept].
Museums therefore invest in digital infrastructures for continuous environmental monitoring and traceable reporting [@laborda2022concept;@michalski2007ideal].

A wide range of sensing technologies is already used in practice, including data loggers and long-running wireless sensor network deployments in museum buildings [@rodriguez2010integrating]. Yet these systems typically remain tightly coupled to proprietary (and often legacy) dashboards or local infrastructures [@Monitoring2025]. As a consequence, monitoring data is frequently siloed: it is difficult to combine measurements across installations, to align monitoring data with other institutional sources, or to selectively share a well-scoped subset of measurements with external partners under enforceable access control. This fragmentation reduces the analytical and documentary value of monitoring data and makes cross-organizational reuse unnecessarily costly.

This paper reports on MuMo (Museum Monitoring)\footnote{\url{https://faro.be/project/museum-monitoring-tool}}, a three-year applied research project\footnote{\url{https://www.vlaanderen.be/cjm/nl/cultuur/cultureel-erfgoed/subsidies-cultureel-erfgoed/projectsubsidies-cultureel-erfgoed/internationale-landelijke-en-bovenlokale-cultureel-erfgoedprojecten}}, funded by the Flemish Government, that investigates how museum environmental monitoring can be made more reusable, interoperable, and selectively shareable across organizational boundaries—without forcing museums to replace their day-to-day operational tooling. 
The project included both hardware/firmware and a software dataspace layer; this paper focuses on the software and dataspace aspects.

MuMo is motivated by the following monitoring needs:

1. Operational oversight\
    Staff need near-continuous insight into readings, time-series views, and alerts when conditions leave acceptable ranges.
2. Long-term documentation\
    Museums need access to historical exposure conditions over extended periods, so they can reconstruct how an object’s environment evolved across locations and organizations, and throughout its lifecycle.
3. Selective collaboration and sharing\
    When multiple parties are involved—most notably during loans—access must be manageable and bounded [@hu2014guide]. Practically, this means permissions that can be limited by (i) a subset of sensors/rooms, (ii) a defined time window, and (iii) the involved organizations. 

The loan scenario is a key stress test. Loan agreements frequently include environmental constraints\footnote{\url{https://collectionstrust.org.uk/wp-content/uploads/2017/11/Loans-out-lending-objects.pdf}, p11}, and the lending institution needs trustworthy insight into the conditions experienced by an object while it is hosted elsewhere. At the same time, the borrowing institution is typically unable—and often unwilling—to expose its full internal monitoring landscape. In practice, this leads to ad-hoc exports and manual reporting, introducing delays, duplicate effort, and reduced transparency [@halevy2006principles;@franklin2005databases].

<!-- BDM: I would skip the following, I don't see the added benefit of mixing in some sota here. should be a separate section -->
<!-- MuMo’s emphasis is operational: enabling decentralized publication and enforceable access control aligned with existing workflows. This differs from approaches that focus primarily on cryptographic immutability via attestation and private ledgers [@ross2024digital].  -->
<!-- BDM: so? group-based is still fine-grained, no? This feels like something that should be part of related work, no need to excuse yourself here.-->
<!-- Fine-grained authorization can be expressive, but prior work highlights that it introduces substantial configuration and usability complexity in operational settings, especially for non-technical users [@hu2014guide].  -->
<!-- BDM: I don't see the added value of this paragraph. Isn't this sota on a wrong location? -->
<!-- More broadly, European data space initiatives emphasize federated trust, identity, and governance mechanisms to enable cross-organizational data exchange while preserving sovereignty, aligning with the boundary-oriented role Solid plays in MuMo [@idsa2023ram4; @gaia-x]. -->
<!--
Similar architectural patterns can be observed in other domain-specific data space initiatives, such as the Flanders Smart Data Space, where semantic standardization and Linked Data Event Streams are combined to support decentralized data publication across organizational boundaries [@VSDS2025].
-->

This paper makes three contributions: (1) an in-use account of deploying dataspace principles for environmental monitoring in museums, (2) a concrete architectural integration of semantic modeling, event-based publication, and decentralized governance with legacy systems, and (3) empirically grounded lessons on aligning access control and data sharing mechanisms with institutional practice. 

After describing the project context in Section 2, we present MuMo’s architecture and approach, and implementation in Section 3 and section 4 respectively, and illustrate its use in practice through in-use scenarios in Section 5, before discussing lessons learned and implications for the Digital Humanities community in Section 6 and Section 7, respectively.
<!-- TODO add a Related work section -->
We conclude ins Section 8.
