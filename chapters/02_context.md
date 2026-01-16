
The MuMo (Museum Monitoring) project was a three-year applied research project aimed at supporting museums in the long-term monitoring of environmental conditions around collection objects. Many museums—especially smaller institutions—lack continuous insight into parameters such as temperature, humidity, or light exposure, despite these being critical for conservation and often contractually relevant during object loans.

## Operational Setting

MuMo was deployed in real museum environments and focused on low-maintenance, long-running installations. Custom ultra-low-power sensing hardware was developed to operate for approximately one year without recharging. Sensors were placed near artworks or storage locations and continuously measured environmental parameters. Due to the physical and organizational constraints of museum spaces, the system had to function with minimal intervention once deployed.

Measurements were transmitted via The Things Network and ingested into an existing (legacy) monitoring dashboard. This dashboard became the primary operational interface for museum staff and therefore strongly shaped how data could be accessed, interpreted, and shared.

## Legacy Dashboard Constraints

The existing dashboard provided:

* User and group management, including recursively defined groups
* Node management corresponding to deployed sensors
* Basic visualization through simple time-series graphs

Access control was **group-based and coarse-grained**, sufficient for internal monitoring within a single institution but not designed for cross-institutional collaboration. Importantly, the dashboard could not be replaced or fundamentally re-engineered within the scope of the project, requiring MuMo to operate within these constraints.

## Cross-Institutional Access and Loans

A central real-world use case was **the monitoring of artworks during loans between museums**. Lending institutions often require insight into the environmental conditions under which an object is kept while on loan, without being granted broader access to the borrowing museum’s infrastructure or internal data.

In practice, this requirement translates into:

* access limited to a subset of sensors,
* bounded by the duration of the loan,
* manageable by non-technical museum staff.

Although often described as “fine-grained access control,” the actual operational need is **group-level authorization**: sensors associated with a specific loan can be grouped, and access to that group can be granted temporarily to another institution.

## Requirements for Data Sharing

These scenarios impose several practical requirements:

* Data must be shareable across **institutional boundaries**.
* Access must respect existing group-based authorization practices.
* Users must be able to access data originating from multiple museum setups.
* Identity management cannot assume a single central authority.

These requirements motivated an architecture in which monitoring data could be published, discovered, and accessed across organizational boundaries, while remaining compatible with legacy systems and established museum workflows.

