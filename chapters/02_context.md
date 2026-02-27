MuMo v2 (2022–2025) is a three-year applied research project, funded by the Flemish Government, that investigates how museum environmental monitoring can be made more reusable, interoperable, and selectively shareable across organizational boundaries—without forcing museums to replace their day-to-day operational tooling. 

To avoid ambiguity with earlier work that used the same project name internally, we use the following terms throughout this paper:

* **MuMo v1** refers to a prior operational monitoring setup centered on a Raspberry Pi–based deployment and an associated dashboard.
* **MuMo v2** refers to the work presented here, which builds on MuMo v1 and contributes new hardware plus a dataspace-oriented data and governance layer.

## Background: why monitoring data becomes hard to reuse (and share)

Museums routinely track parameters such as temperature, relative humidity, and light exposure because these conditions influence long-term conservation [@michalski2007ideal;@laborda2022concept]. While many institutions already operate sensor networks or data loggers [@rodriguez2010integrating], the resulting datasets often remain confined to vendor-specific dashboards or local infrastructures. This “siloing” makes it hard to (i) combine datasets across buildings or time periods, (ii) align monitoring data with other institutional sources, and (iii) share only the relevant subset of measurements with external partners in a controlled, auditable way [@Monitoring2025].

A common real-world collaboration setting where selective sharing becomes essential is object loans. Loan agreements frequently include environmental constraints, and the lending institution needs trustworthy insight into the conditions experienced by an object while it is hosted elsewhere. At the same time, the borrowing institution is typically unable—and often unwilling—to expose its full internal monitoring landscape. In practice, this leads to ad-hoc exports and manual reporting, introducing delays, duplicate effort, and reduced transparency[@halevy2006principles;@franklin2005databases].

## Scope: extending rather than replacing existing systems

MuMo v2 is explicitly not a “rip-and-replace” effort. Museums already depend on established dashboards and workflows that are difficult to change in day-to-day practice. Consequently, MuMo v2 keeps a dashboard-centric workflow as the primary operational interface for staff—where sensors are configured, readings are inspected, and alerts are handled—while adding a complementary data layer aimed at long-term reuse and cross-institution sharing. 

This design stance reflects practical constraints in museum IT: successful changes must remain compatible with institutional autonomy, limited technical staffing, and long-running deployments. MuMo v2 therefore preserves the operational loop (“measure → view → react”) while enabling monitoring data to be reused and selectively shared beyond a single dashboard when needed. 

## Monitoring needs: three usage modes

MuMo v2 is driven by monitoring needs that are best understood as three usage modes:

* Operational oversight
    Staff need near-continuous insight into readings, time-series views, and alerts when conditions leave acceptable ranges.
* Long-term documentation
    Museums need access to historical exposure conditions over extended periods, so they can reconstruct how an object’s environment evolved across locations and throughout its lifecycle.
* Selective collaboration and sharing
    When multiple parties are involved—most notably during loans—access must be manageable and bounded [@hu2014guide]. Practically, this means permissions that can be limited by (i) a subset of sensors/rooms, (ii) a defined time window, and (iii) organizational boundary. 

The loan scenario is a key stress test: the lending museum should gain insight into precisely the monitoring data relevant to the loan, without receiving broad access to the borrowing museum’s internal monitoring infrastructure.

## Starting point: MuMo v1 (Raspberry Pi + dashboard)

MuMo v2 starts from MuMo v1, which already supported core operational monitoring: ingestion and persistence of sensor readings, time-series visualization, alerting, and basic export functionality. MuMo v1’s dashboard also supported user and group management aligned with museum workflows, enabling staff to manage access within an institution in terms of responsibilities and spaces.

At the same time, MuMo v1 made visible the limitations that motivated MuMo v2’s focus: data remained largely bound to a single dashboard instance, exports were the primary sharing mechanism, and interoperability and cross-institution governance were not first-class concerns.

## What MuMo v2 adds: new hardware and a dataspace-oriented layer

Building on this baseline, MuMo v2 advances both hardware and software while keeping dashboard-centric workflows intact. On the hardware side, the project develops custom ultra-low-power sensors designed for long battery life and integrates LoRaWAN-based transmission to support robust deployments. On the software side, MuMo v2 introduces the capabilities needed for reuse and selective sharing: (i) semantic representation of monitoring data, (ii) incremental/event-based publication, and (iii) an authorization approach that can operate across institutional boundaries while remaining administratively feasible for museum staff.

## Summary: context as a design constraint

In MuMo v2, the central context is the combination of (1) long-running, append-only monitoring data, (2) operational tooling that cannot be replaced, and (3) collaboration scenarios that require selective, revocable access across organizational boundaries. MuMo v2 is therefore shaped by a pragmatic objective: introduce interoperability and governance-aware sharing while preserving institutional autonomy and established workflows.
