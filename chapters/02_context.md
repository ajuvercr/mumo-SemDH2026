# Background and Design Constraints

To avoid ambiguity, we use MuMo v1 for the earlier prototype and MuMo v2 for the work presented in this paper. Unless stated otherwise, “MuMo” refers to MuMo v2.

MuMo v1 originated from the observation that environmental monitoring data in museums is difficult to access and reuse outside vendor dashboards. To assess what could be achieved with modest resources, the Fashion Museum Antwerp built an initial prototype to collect measurements and visualize them in a lightweight dashboard.
This monitoring setup centered on a Raspberry Pi connected to a PHP dashboard. 
Based on the prototype’s demonstrated potential, the museum applied for funding to extend the work.

## Starting point: MuMo v1

MuMo v2 starts from MuMo v1, which already supported core operational monitoring: ingestion and persistence of sensor readings, time-series visualization, alerting, and basic export functionality. MuMo v1’s dashboard also supported user and group management aligned with museum workflows, enabling staff to manage access within an institution in terms of responsibilities and spaces.
In practice, these groups reflect a nested location hierarchy: from the museum or site level down to individual rooms and storage areas, and—when needed—even to fine-grained containers such as cabinets, shelves, or specific boxes.

At the same time, MuMo v1 made visible the limitations that motivated MuMo v2’s focus: data remained largely bound to a single dashboard instance, exports were the primary sharing mechanism, and interoperability and cross-institution governance were not first-class concerns.

## Scope: extending rather than replacing existing systems

MuMo v2 is explicitly not a “rip-and-replace” effort. Museums already depend on established dashboards and workflows that are difficult to change in day-to-day practice. Consequently, MuMo v2 keeps a dashboard-centric workflow as the primary operational interface for staff—where sensors are configured, readings are inspected, and alerts are handled—while adding a complementary data layer aimed at long-term reuse and cross-institution sharing. 

This design stance reflects practical constraints in museum IT: successful changes must remain compatible with institutional autonomy, limited technical staffing, and long-running deployments. MuMo v2 therefore preserves the operational loop (“measure → view → react”) while enabling monitoring data to be reused and selectively shared beyond a single dashboard when needed. 

## What MuMo v2 adds: new hardware and a dataspace-oriented layer

Building on this baseline, MuMo v2 advances both hardware and software while keeping dashboard-centric workflows intact. On the hardware side, the project develops custom low-power sensors designed for long battery life (at least x months on a single charge) and integrates LoRaWAN-based transmission\footnote{\url{https://www.thethingsnetwork.org/docs/lorawan/architecture/}} to support robust deployments.
<!-- BDM: For above, clearly but shortly state what hardware changes were made: was it a more general v2 upgrade, or were there data-specific changes you needed to take into account? -->
<!-- BDM: Also, I don't think for the audience it's clear that LoraWan is, in 'low-power sensor -> gateway -> internet', the connection between the sensor and the gateway, and thus (i) is limited in scope (for reasons X Y Z, I think mostly for less power consumption) and (ii) requires the need for a (powered) gateway to bridge between the sensors and the internet -->
<!-- BDM: for below, it's not clear whether this is v2 (should be in present tense 'Measurements [...] are transmitted') or v1 (can be past tense); I don't think you need to make that distinction: you already established that v1 used a dashboard application. So all this LoraWan stuff is either eixsting (and should be part of the Starting Point section), or it's new (and should be explicitly stated what was changed, i.e., what was the previous interaction protocol? different than LoraWan?) -->
Measurements captured by the MuMo v2 monitoring devices were transmitted to off‑the‑shelf gateways and routed through The Things Network, where they were then ingested into an existing (legacy) monitoring dashboard. This dashboard became the primary operational interface for museum staff and therefore strongly shaped how data could be accessed, interpreted, and shared. 
On the software side, MuMo v2 introduces the capabilities needed for reuse and selective sharing: (i) semantic representation of monitoring data, (ii) incremental/event-based publication, and (iii) an authorization approach that can operate across institutional boundaries while remaining administratively feasible for museum staff.

## Summary: context as a design constraint

In MuMo v2, the central context is the combination of (1) long-running, append-only monitoring data, (2) operational tooling that cannot be replaced, and (3) collaboration scenarios that require selective, revocable access across organizational boundaries. MuMo v2 is therefore shaped by a pragmatic objective: introduce interoperability and governance-aware sharing while preserving institutional autonomy and established workflows.
<!-- BDM: I have the feeling the paragraph above says the same thing twice, I think you can rewrite this more succint  -->

