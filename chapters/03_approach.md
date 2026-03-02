# System and Approach Overview

MuMo supports cross-institutional environmental monitoring without replacing the monitoring infrastructure museums already operate. Instead, it adds a semantic publication and governance layer that enables decentralized access and controlled sharing of monitoring data across institutions. Concretely, MuMo (i) represents monitoring data and its evolving context semantically, (ii) publishes append-only time series as incrementally consumable event streams, and (iii) enforces sharing decisions using Solid-based identity and authorization mechanisms. 

To keep the architecture readable and avoid repeating the same rationale in multiple places, this chapter is organized as a stack: Data model, Publication layer, Governance layer, and Operationalization (components and end-to-end request flow).

## Data model and semantic representation

Environmental monitoring data is only useful if it remains interpretable over long periods, including across sensor redeployments and organizational boundaries. MuMo therefore transforms the information already managed in the legacy dashboard into a semantic representation: both environmental observations (e.g., temperature, humidity, light exposure) and sensor configuration metadata (e.g., group membership and location). 

### Modeling sensors and observations

MuMo builds on established models for describing sensors and observations, most notably the W3C Semantic Sensor Network ontology (SSN/SOSA) [@compton2012ssn; @ssn-sosa]. SSN/SOSA is particularly suitable because it separates (i) the sensor, (ii) the observation, and (iii) the feature of interest being observed. This allows MuMo to represent sensor redeployment and contextual change (e.g., a sensor moved to a different space) without rewriting historical observations that were produced under earlier conditions. 

MuMo instantiates these concepts using OSLO vocabularies [@oslo2016], which profile and reuse international semantic standards for cross-organizational data exchange. 

### Representing changing context as configuration events

Monitoring data exhibits two different dynamics:

* Observations evolve continuously and are typically appended over time.
* Configuration context evolves discretely when sensors are moved or reconfigured.

MuMo makes this distinction explicit by publishing configuration metadata as a versioned event stream, allowing consumers to reconstruct which context applied when an observation was produced. 

Group membership and location are encoded explicitly in this configuration stream. This is not merely descriptive metadata: it enables downstream systems to interpret observations correctly and consistently apply sharing rules that are expressed in terms museum staff already use (groups representing rooms, objects, loan packages, etc.). 

## Publication layer: Linked Data Event Streams

Museum monitoring datasets are long-running and append-only in practice: measurements accumulate, and retroactive correction is rare. MuMo therefore publishes monitoring data using Linked Data Event Streams (LDES) [@semic_support_centre; @vanlancker2021ldes]. 

### Incremental access to evolving datasets

LDES supports interoperable publication of evolving datasets in a way that enables replication and synchronization across organizational boundaries without requiring a centralized query service. 

An LDES publication is typically organized as a fragment tree: events are partitioned into smaller resources (fragments), and fragments link to related fragments through machine-interpretable relations in the Linked Data representation. Consumers navigate these relations to reach the relevant parts of the dataset without scanning the full stream. 

This supports three key consumption modes for monitoring data:

* retrieving historical data incrementally,
* staying synchronized with newly produced events, and
* avoiding repeated reliance on centralized query endpoints. 

### Fragmentation as a design lever

A central design choice in LDES is the fragmentation strategy: how events are grouped into fragments. MuMo uses fragmentation not only as a performance mechanism, but as a way to reflect how museums work with monitoring data and how sharing is scoped in practice. 

In MuMo, observations are fragmented along the operational dimensions that curators and technicians naturally use: group, sensor, and time. Concretely, observations are published under a hierarchy of the form:

> `group-x / sensor-x / year / month / day`

This keeps fragments small and stable over time (e.g., daily fragments do not grow indefinitely), while retaining a navigable structure that allows clients to focus on the relevant group, sensors, and time window. 

This publication model proved particularly suitable in cross-institutional settings because it allows consumers to process only the data they are authorized to access, without requiring providers to expose tailored query endpoints. 

Prior work also demonstrates that LDES event sources can be stored and consumed within the Solid ecosystem, supporting the compatibility of event-stream publication with Solid-based access control. [@slabbinck2023linked] 

## Governance layer: Solid-based decentralized sharing

Cross-institution collaboration (especially loans) requires selective, revocable access across organizational boundaries, while museums remain unwilling to relinquish operational control over their monitoring infrastructures. 

MuMo addresses this by combining decentralized publication with Solid-based identity and authorization. Solid provides a framework in which storage, identity, and access control are decoupled from specific applications, enabling the same published resources to be reused by multiple clients without funneling all access through a centralized service [@solidprotocol2022; @solid_24; @solid_25]. 

### Institutional endpoints and delegated access

In MuMo, Solid Pods act as institutional data endpoints rather than user-centric storage. The practical effect is that a museum can publish monitoring resources as long-lived datasets under its governance, while granting external parties access only to the parts required for a collaboration (e.g., a loan group) and revoking that access afterward. 

MuMo’s emphasis is operational: enabling decentralized publication and enforceable access control aligned with existing workflows. This differs from approaches that focus primarily on cryptographic immutability via attestation and private ledgers [@ross2024digital]. 

### Authorization model: group-based sharing as an operational advantage

MuMo mirrors the group-based authorization model already present in the legacy dashboard: access is granted at the level of sensor groups rather than individual observations. 

This is an advantage in museum practice. Loan scenarios typically require a partner to access all monitoring data relevant to a particular object/location over a period, while keeping the rest of the monitoring infrastructure private. Fine-grained authorization can be expressive, but prior work highlights that it introduces substantial configuration and usability complexity in operational settings, especially for non-technical users [@hu2014guide]. 


Group-level permissions are therefore sufficient and manageable, avoiding administrative overhead that would undermine adoption. 

### Policy-aligned fragmentation (LDES + Solid together)

Solid authorization mechanisms such as Web Access Control (WAC) enforce access rules over resources and their representations [@solidprotocol2022; @wac]. 

Because LDES allows the publisher to decide how events are partitioned into resources (fragments), MuMo chooses a fragmentation strategy that makes the group the first-class boundary: the group subtree becomes the unit of sharing. 

In the deployed system, authentication affects the first level of the hierarchy: users gain access to the subtree corresponding to a group, which implicitly grants access to all sensors and time slices within that group. 

The same structure also makes it explicit that finer-grained authorization would be technically possible (e.g., sensor-level or time-range-level restrictions), but MuMo does not activate those options to remain aligned with what museum staff can practically configure in the authoritative dashboard. 

## Operationalization: components and request flow


Figure \ref{fig:deploy-overview} shows how MuMo bridges the legacy monitoring dashboard with Solid-based identity and authorization at runtime. The key operational principle is that the dashboard remains the authoritative interface for staff, while its group-based decisions are reflected into Solid-side enforcement. 

![Figure 1: deployment overview](Components.drawio.svg){#fig:deploy-overview width=80%}

### Runtime components

A MuMo dataspace consists of four main components.

**Component 1 — PHP dashboard (admin & group management).**\
The dashboard is the control plane where administrators manage groups and group hierarchies (including recursive nesting), user-to-group assignments, and cross-institution sharing by granting group access to WebIDs. WebIDs may originate from the deployment’s local Solid IdP or an external provider such as Inrupt; in the dashboard they function as stable identifiers for granting/revoking group access. 

**Component 2 — Solid Pod hosting LDES resources (data plane).**\
The Solid Pod hosts the published resources (including the LDES fragment tree) and enforces WAC authorization before serving protected resources. Requests are interpreted in terms of which protected subtree (group/sensor/time path) is being accessed and whether the requester’s authenticated WebID is authorized. 

**Component 3 — ACL generator (policy materialization service).**\
The ACL generator bridges the dashboard’s group model with Solid’s resource-level authorization. It receives synchronized configuration (WebID → groups and the group hierarchy) and materializes WAC ACL documents on demand. Operationally, its function is: given a request targeting a particular group, return the effective ACL representation for that scope. This avoids manual ACL maintenance and keeps the Solid-side authorization view consistent with the dashboard configuration. 

**Component 4 — Solid Identity Provider (IdP).**\
The Solid IdP authenticates WebIDs under the local deployment’s authority. MuMo does not require a centralized identity authority: when a user presents a WebID from another IdP, authentication can occur against that remote IdP as well, consistent with standard Solid/OIDC behavior. 

### End-to-end request flow

1. Admin configuration (control path): an administrator updates group membership in the PHP dashboard by associating WebIDs with groups and maintaining the group hierarchy. 
2. Sync to policy service: these settings are synchronized to the ACL generator as (WebID → groups) plus the group hierarchy. 
3. User data request (data path): a client requests an LDES resource from the Solid Pod. 
4. ACL resolution: before serving the resource, the Solid Pod determines which ACL scope applies (which group subtree is being accessed) and consults the ACL generator for the effective ACL. 
5. Authentication + authorization: the Solid Pod validates identity via the relevant IdP (local or remote) and evaluates whether the authenticated WebID is granted access by the generated ACL. 
6. Response: if authorized, the Solid Pod serves the requested LDES resource; otherwise it denies access. 


### Decentralized consumption and aggregation

Because each MuMo deployment publishes data independently, consumers may need to combine data from multiple sources. MuMo supports this through a client-side dashboard that retrieves sensor descriptions first, determines the user’s authorized scope, and then incrementally consumes only the relevant observation streams. This avoids centralized aggregation while still enabling a unified user experience, consistent with the principle that integration occurs at the point of use.

