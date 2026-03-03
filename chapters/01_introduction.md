# Introduction & Motivation

In cultural heritage institutions, environmental parameters such as temperature, relative humidity, and light exposure directly influence the long-term preservation of collection objects [@laborda2022concept].
Museums therefore invest in digital infrastructures for continuous environmental monitoring and traceable reporting [@laborda2022concept;@michalski2007ideal].

A wide range of sensing technologies is already used in practice, including data loggers and long-running wireless sensor network deployments in museum buildings [@rodriguez2010integrating]. Yet these systems typically remain tightly coupled to proprietary (and often legacy) dashboards or local infrastructures [@Monitoring2025]. As a consequence, monitoring data is frequently siloed: it is difficult to combine measurements across installations, to align monitoring data with other institutional sources, or to selectively share a well-scoped subset of measurements with external partners under enforceable access control. This fragmentation reduces the analytical and documentary value of monitoring data and makes cross-organizational reuse unnecessarily costly.

This paper reports on MuMo (Museum Monitoring)\footnote{\url{https://faro.be/project/museum-monitoring-tool}}, a three-year applied research project\footnote{\url{https://www.vlaanderen.be/cjm/nl/cultuur/cultureel-erfgoed/subsidies-cultureel-erfgoed/projectsubsidies-cultureel-erfgoed/internationale-landelijke-en-bovenlokale-cultureel-erfgoedprojecten}}, funded by the Flemish Government, that investigates how museum environmental monitoring can be made more reusable, interoperable, and selectively shareable across organizational boundaries—without forcing museums to replace their day-to-day operational tooling. 
The project included both hardware/firmware and a software dataspace layer; this paper focuses on the software and dataspace aspects.

MuMo is motivated by monitoring needs that can be summarized as three usage modes:

* Operational oversight
    Staff need near-continuous insight into readings, time-series views, and alerts when conditions leave acceptable ranges.
* Long-term documentation
    Museums need access to historical exposure conditions over extended periods, so they can reconstruct how an object’s environment evolved across locations and throughout its lifecycle.
* Selective collaboration and sharing
    When multiple parties are involved—most notably during loans—access must be manageable and bounded [@hu2014guide]. Practically, this means permissions that can be limited by (i) a subset of sensors/rooms, (ii) a defined time window, and (iii) the involved organizations. 

The loan scenario is a key stress test. Loan agreements frequently include environmental constraints\footnote{\url{https://collectionstrust.org.uk/wp-content/uploads/2017/11/Loans-out-lending-objects.pdf}, p11}, and the lending institution needs trustworthy insight into the conditions experienced by an object while it is hosted elsewhere. At the same time, the borrowing institution is typically unable—and often unwilling—to expose its full internal monitoring landscape. In practice, this leads to ad-hoc exports and manual reporting, introducing delays, duplicate effort, and reduced transparency [@halevy2006principles;@franklin2005databases].

This paper makes three contributions: (1) an in-use account of deploying dataspace principles for environmental monitoring in museums, (2) a concrete architectural integration of semantic modeling, event-based publication, and decentralized governance with legacy systems, and (3) empirically grounded lessons on aligning access control and data sharing mechanisms with institutional practice. 

After describing the project context in Section 2, we present MuMo’s architecture and approach in Section 3, and illustrate its use in practice through in-use scenarios in Section 4, before discussing lessons learned and implications for the Digital Humanities community.
