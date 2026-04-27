---
marp: true
theme: default
paginate: true
footer: 'SemDH 2026 · Dubrovnik · Arthur Vercruysse et al.'
style: |
  :root {
    --color-background: #ffffff;
    --color-foreground: #1a1a2e;
    --color-highlight: #16213e;
    --color-dimmed: #555;
    font-family: 'Segoe UI', 'Helvetica Neue', sans-serif;
  }
  section {
    background: #ffffff;
    color: #1a1a2e;
    padding: 48px 56px;
  }
  section.title {
    background: #16213e;
    color: #ffffff;
    justify-content: flex-start;
  }
  section.title h1 {
    font-size: 1.8em;
    line-height: 1.3;
    color: #ffffff;
    border: none;
  }
  section.title p, section.title ul {
    color: #c8d6e5;
    font-size: 0.9em;
  }
  section.section-header {
    background: #0f3460;
    color: #ffffff;
    justify-content: center;
  }
  section.section-header h1 {
    color: #ffffff;
    font-size: 2em;
    border: none;
  }
  section.section-header p {
    color: #a8c8e8;
    font-size: 1em;
  }
  h1 {
    color: #0f3460;
    font-size: 1.4em;
    border-bottom: 3px solid #e94560;
    padding-bottom: 8px;
    margin-bottom: 20px;
  }
  h2 {
    color: #0f3460;
    font-size: 1.1em;
  }
  strong {
    color: #e94560;
  }
  code {
    background: #f0f4f8;
    border-radius: 4px;
    padding: 1px 4px;
    font-size: 0.85em;
    color: #0f3460;
  }
  pre {
    background: #1a1a2e;
    border-radius: 8px;
    padding: 16px;
  }
  pre code {
    background: transparent;
    color: #a8c8e8;
    font-size: 0.78em;
  }
  ul li {
    margin-bottom: 6px;
  }
  .columns {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 32px;
  }
  blockquote {
    border-left: 4px solid #e94560;
    background: #f8f9ff;
    padding: 12px 20px;
    font-style: italic;
    color: #444;
    margin: 16px 0;
  }
  table {
    margin: auto;
    border-collapse: collapse;
    font-size: 0.85em;
  }
  th {
    background: #0f3460;
    color: white;
    padding: 8px 12px;
  }
  td {
    padding: 7px 12px;
    border-bottom: 1px solid #dde;
  }
  tr:nth-child(even) td { background: #f4f6ff; }
  footer {
    font-size: 0.65em;
    color: #999;
  }
  .timeline {
    display: flex;
    align-items: stretch;
    justify-content: space-between;
    position: relative;
    margin: 32px 0 16px;
    padding-top: 48px;
  }
  .timeline::before {
    content: '';
    position: absolute;
    top: 30px;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(to right, #16213e, #e94560);
  }
  .tl-event {
    display: flex;
    flex-direction: column;
    align-items: center;
    flex: 1;
    position: relative;
  }
  .tl-label-top {
    font-size: 0.62em;
    color: #333;
    text-align: center;
    margin-bottom: 6px;
    min-height: 2.8em;
    flex-grow: 1;
    display: flex;
    align-items: flex-start;
    line-height: 1.3;
  }
  .tl-dot {
    width: 14px;
    height: 14px;
    border-radius: 50%;
    background: #e94560;
    border: 3px solid #fff;
    box-shadow: 0 0 0 2px #e94560;
    z-index: 1;
    flex-shrink: 0;
  }
  .tl-dot.v1 { background: #0f3460; box-shadow: 0 0 0 2px #0f3460; }
  .tl-dot.v2 { background: #e94560; box-shadow: 0 0 0 2px #e94560; }
  .tl-year {
    font-size: 0.75em;
    font-weight: bold;
    color: #0f3460;
    margin-top: 6px;
  }
  .tl-label-bottom {
    font-size: 0.62em;
    color: #555;
    text-align: center;
    margin-top: 4px;
    line-height: 1.3;
  }
  .tl-badge {
    display: inline-block;
    font-size: 0.55em;
    background: #0f3460;
    color: white;
    border-radius: 3px;
    padding: 1px 5px;
    margin-top: 3px;
  }
  .tl-badge.red { background: #e94560; }
---

<!-- _class: title -->

# Museum Monitoring: an Environmental Monitoring Dataspace Using The Things Network, Solid, and LDES

**Arthur Vercruysse¹ · Ben De Meester¹ · Julián Rojas¹ · Dieter Suls²**

¹ IDLab, Ghent University – imec &nbsp;·&nbsp; ² Fashion Museum Antwerp (MoMu)

SemDH 2026 · ESWC · May 10, 2026 · Dubrovnik, Croatia

<!-- 
Welcome. This talk reports on MuMo — Museum Monitoring — a three-year applied research project funded by the Flemish Government. The project explored how dataspace principles can make environmental monitoring data in museums more reusable and shareable, without forcing museums to replace the tools they already depend on.
-->

---

# Museums monitor their collections

Temperature · Relative humidity · Light exposure

**But the data stays trapped in vendor dashboards**

- Siloed per installation
- Proprietary formats
- Cross-institution sharing = manual exports

<!-- 
Museums invest significantly in environmental monitoring to preserve cultural heritage objects — paintings, textiles, historical artifacts. The parameters that matter are temperature, relative humidity, and light exposure, all of which directly affect long-term preservation. The problem is that the systems capturing this data are typically tightly coupled to proprietary vendor dashboards. The data is siloed: it's difficult to combine measurements across installations, to align monitoring data with external partners, or to selectively share a well-scoped subset under enforceable access control.
-->

---

# The loan scenario

> **Museum A lends a painting to Museum B**

- Museum A must verify conservation conditions at Museum B
- Museum B cannot expose its full monitoring infrastructure
- Today: ad-hoc exports, emails, delays

<!-- 
The loan scenario is our running example throughout this talk because it's the ultimate stress test for these limitations. When Museum A lends a painting to Museum B, the lending institution needs trustworthy, timely access to environmental data at the borrowing site. At the same time, Museum B is typically unwilling — and shouldn't need — to expose its full internal monitoring landscape. In practice this leads to ad-hoc CSV exports, manual reporting, delays, and reduced transparency.
-->

---

# Three monitoring needs

| Need | |
|------|-|
| **Operational oversight** | Near-continuous readings, alerts |
| **Long-term documentation** | Historical exposure across locations |
| **Selective collaboration** | Scoped, revocable sharing for loans |

<!-- 
MuMo is motivated by three concrete monitoring needs. First, staff need near-continuous operational oversight — time-series views and alerts when conditions leave acceptable ranges. Second, museums need long-term documentation of exposure conditions, so they can reconstruct how an object's environment evolved across locations and organizations throughout its lifecycle. Third, when multiple parties are involved — most notably during loans — access must be manageable and bounded: limited to a specific subset of sensors, a defined time window, and the involved organizations only.
-->

---

# Operational oversight


<div class="columns">
<div>

![height:380px](Mona-Lisa.png)

</div>
<div>

**Stable conditions** — all sensors within range

- Temperature: 19 °C
- Relative humidity: 52%
- Light: 45 lux

</div>
</div>

<style scoped>
    p:has(img) { text-align: center; }

</style>

---

# A window is left open

<div class="columns">
<div >

![height:380px](Mona-Lisa-Sad.png)

</div>
<div>

**Alert: Humidity spike detected**

- Relative humidity: **78%** (limit: 65%)
- Sensor: Node 7 — Loan Room B

</div>
</div>

<style scoped>
    p:has(img) { text-align: center; }
</style>
---

# Window closed — conditions restored

<div class="columns">
<div>

![height:380px](Mona-Lisa-Happy.png)

</div>
<div>

**Resolved: back to normal**

- Relative humidity: 55%
- Response time: 12 minutes

</div>
</div>

<style scoped>
    p:has(img) { text-align: center; }
</style>
---

# Research questions

**RQ1** — How can existing monitoring infrastructure be extended to publish sensor data in a **semantically described, interoperable** way — without replacing it?

**RQ2** — How can institutions share data **selectively and revocably** across organizational boundaries, without a shared user directory or centralized governance?

**RQ3** — What do we learn from **three years of operational deployment** in a real museum context?

<!-- 
These needs translate into three research questions. RQ1 asks how dataspace principles can be applied to extend — not replace — existing museum monitoring infrastructure for semantically described, interoperable data publication. RQ2 asks how selective and revocable cross-institutional data sharing can be realized without requiring a shared user directory or centralized identity management. RQ3 asks what practical lessons emerge from actually deploying such an architecture in operational museum settings over multiple years.
-->

---

# MuMo: Project Timeline

<div class="timeline">
  <div class="tl-event">
    <div class="tl-label-top">MoMu identifies problem</div>
    <div class="tl-dot v1"></div>
    <div class="tl-year">2019</div>
  </div>
  <div class="tl-event">
    <div class="tl-label-top">PoC: Raspberry Pi<br>+ PHP dashboard</div>
    <div class="tl-dot v1"></div>
    <div class="tl-year">2020–21</div>
  </div>
  <div class="tl-event">
    <div class="tl-label-top">Funding secured</div>
    <div class="tl-dot v2"></div>
    <div class="tl-year">2022–23</div>
  </div>
  <div class="tl-event">
    <div class="tl-label-top">Production hardware<br>&amp; dataspace</div>
    <div class="tl-dot v2"></div>
    <div class="tl-year">2025</div>
  </div>
  <div class="tl-event">
    <div class="tl-label-top">System in operational use</div>
    <div class="tl-dot v2"></div>
    <div class="tl-year">2026</div>
  </div>
</div>

**Design principle: extend, don't replace**

<!-- 
The project started in 2019 when the Fashion Museum Antwerp — MoMu — identified the problem and built a first LoRaWAN prototype. A funded proof-of-concept followed in 2020-21, producing a working Raspberry Pi setup with a PHP dashboard. MuMo v2, the work we're reporting on today, began in 2022 with Flemish Government funding and has been in operational use since 2026. A key design decision throughout: MuMo v2 deliberately extends the existing dashboard rather than replacing it. Museums already depend on established workflows that are difficult to change in day-to-day practice.
-->

---

<!-- _class: section-header -->

# System Architecture

Data Model · LDES · Solid

---

# Five components

| Need | Component(s) |
|------|-------------|
| **Operational oversight** | PHP Dashboard |
| **Long-term documentation** | Web pages (HTTP) · Investigating Dashboard |
| **Selective collaboration** | Authentication · Access Control |

Web pages structured for machine navigation. Authentication without a shared user directory. Changes stay in sync with the dashboard.

<!-- 
MuMo consists of five runtime components. The PHP dashboard remains the primary operational interface — staff configure sensors, inspect readings, and manage access through it, just as they did before. The Solid Pod hosts the LDES-structured observation data that clients can consume. The ACL Generator is the bridge component: it watches the dashboard's group configuration and materializes Web Access Control policies on demand. The Solid Identity Provider issues WebIDs, and can accept external ones too. Finally, the investigating dashboard is a separate client-side application for longitudinal analysis and cross-source queries.
-->

---

# Data model: two streams

**RDF** throughout — reusing **SSN/SOSA** (W3C)

| Stream | Rate | Content |
|--------|------|---------|
| **Observations** | Fast, append-only | Sensor readings |
| **Sensor metadata** | Slow, versioned | Location, group, config |

SSN/SOSA separates *sensor* · *observation* · *feature of interest* — sensor moves don't invalidate past observations

<!-- 
MuMo uses RDF as the underlying data model, grounded in two established standards. OSLO Sensoren en Bemonstering is a Flemish governmental application profile maintained by Digitaal Vlaanderen for interoperable cross-organizational exchange. It reuses the W3C SSN/SOSA ontology, which is particularly well suited here because it cleanly separates the sensor, the observation, and the feature of interest being observed. This means a sensor can be moved to a new room without rewriting historical observations — the versioned sensor metadata records when the context changed, and consumers join on sensor URI and time to reconstruct the full context of any observation. The two streams have very different dynamics: observations are fast-moving and append-only, while sensor metadata changes slowly and is versioned as events.
-->

---

# What is LDES?

In MuMo, LDES provides the **web pages** for long-term documentation.

**Linked Data Event Streams** — append-only log, published as a **navigable tree of pages**

- Each page = a subset of events + **typed links** to child pages
- Clients traverse the tree; stable pages are cached
- **No query endpoint needed** — any HTTP client works

<!-- 
LDES is a specification for publishing continuously growing datasets as linked, navigable fragments rather than as a monolithic download or a SPARQL endpoint. The publisher divides events into pages — fragments — and each fragment exposes typed links to related fragments using the TREE specification. A client starts at the root and follows links to narrow down to the data it needs. Stable historical pages can be cached aggressively. The key property is that no custom query endpoint is required: the filtering happens through navigation, client-side.
-->

---

# TREE: navigating to the right data


Each link states **what data lives beneath it**

Clients read the label and **skip entire subtrees** that cannot match — no full scan needed


![](./LDES.png)

> Navigation replaces querying — no custom API needed

<style scoped>
    p:has(img) { text-align: center; }
</style>

--- 

# LDES in MuMo

```
/
└── /group-x              ← location / loan package
    └── /sensor-x         ← sensor
        └── /2025         ← year
            └── /03       ← month
                └── /15   ← bounded daily page
```

Query *"loan group, sensor 7, March 2025"* → **5 hops**, no full scan

<!-- 
In MuMo, observations are fragmented along the three dimensions that museum staff naturally use: group (location or loan package), sensor, and time. The hierarchy goes group → sensor → year → month → day. Daily pages stay bounded in size as new days are simply added as new leaves. For the loan scenario, Museum B publishes the borrowed painting's monitoring data under a dedicated loan group. Museum A's client navigates directly to that group's subtree and retrieves only the relevant observations — typically just a few hops, regardless of how large the total dataset is.
-->

---

# What is Solid?

In MuMo, Solid provides **authentication and access control** — with WAC — for selective collaboration.

Decouples **storage · identity · access control** from applications

| Concept | What it is |
|---------|-----------|
| **Solid Pod** | HTTP server you control; data as linked resources |
| **WebID** | A URL that identifies a person or institution |
| **WAC** | RDF-based access control files, co-located with resources |

MuMo uses Pods as **institution-level endpoints**, not user storage

<!-- 
Solid is a W3C specification — originally designed for decentralized social applications — that separates three concerns that are usually bundled together. A Solid Pod is just an HTTP server that stores data as linked resources and enforces access control. A WebID is a URL that globally identifies an agent — a person, a software agent, or in MuMo's case, an institution. WAC — Web Access Control — places RDF-based ACL files next to the resources they protect. Any application that has authorization can read the Pod, regardless of which application created the data. MuMo repurposes this: instead of personal storage, Pods act as institutional data endpoints. The Pod represents the museum.
-->

---

<!-- _class: section-header -->

# The System in Action

A longitudinal monitoring query across a museum loan

---

# Building the query

**Scenario**: an artwork moves from *faro-mini-003* (home institution) to *faro-01* (loan site) around April 19.

The query is an **OR of two AND-groups** — one per leg of the object's journey:

- **Top group**: faro-01 nodes · after April 19
- **Bottom group**: faro-mini-003 · April 12 – 19

Only matching **LDES tree branches** are traversed — irrelevant fragments are never fetched.

> A **collection management system** already records object movements and dates. This query could be auto-generated from those records.

---

# Two independent institutions, one view

<div style="display: flex; justify-content: space-around; align-items: center; margin-top: 32px; gap: 16px;">

<div style="border: 2px solid #0f3460; border-radius: 10px; padding: 16px 24px; text-align: center; min-width: 180px;">
<div style="font-weight: bold; color: #0f3460; margin-bottom: 6px;">faro-mini-003</div>
<div style="font-size: 0.8em; color: #555; margin-bottom: 8px;">Home institution</div>
<div style="background: #f0f4f8; border-radius: 6px; padding: 6px 12px; font-size: 0.8em;">
Solid Pod<br><span style="color: #e94560;">LDES stream</span>
</div>
</div>

<div style="text-align: center; flex: 1;">
<div style="font-size: 0.75em; color: #555; margin-bottom: 8px;">authenticated queries</div>
<div style="background: #e94560; color: white; padding: 10px 24px; border-radius: 8px; display: inline-block; font-size: 0.9em; font-weight: bold;">Investigating<br>Dashboard</div>
<div style="font-size: 0.75em; color: #555; margin-top: 8px;">no shared infrastructure</div>
</div>

<div style="border: 2px solid #0f3460; border-radius: 10px; padding: 16px 24px; text-align: center; min-width: 180px;">
<div style="font-weight: bold; color: #0f3460; margin-bottom: 6px;">faro-01</div>
<div style="font-size: 0.8em; color: #555; margin-bottom: 8px;">Loan site</div>
<div style="background: #f0f4f8; border-radius: 6px; padding: 6px 12px; font-size: 0.8em;">
Solid Pod<br><span style="color: #e94560;">LDES stream</span>
</div>
</div>

</div>

<div style="text-align: center; margin-top: 20px; font-size: 0.85em; color: #555; font-style: italic;">
Each institution serves its own data — the dashboard combines them client-side
</div>

---

# Faro: a fleet of MuMo loggers

**Faro** — Flemish support centre for cultural heritage

- Owns a fleet of MuMo loggers, lent to museums to trial the system or supplement existing infrastructure
- Each borrowing museum gets its own Solid Pod endpoint
- Museums can query across Faro's Pod and their own in a single view

The demo uses data from the Faro Pod — the same query interface works across any number of independent deployments.

---

# Building the query


![height:480px](images/query.png)

<style scoped>
p { text-align: center; }
</style>

<!-- 
This is the investigating dashboard's query builder. A conservator wants to trace environmental conditions across an artwork's full loan period. The artwork was at faro-mini-003 from April 12 to 19, then moved to the faro-01 deployment from April 19 onward.

The query captures exactly that: two AND-groups combined with OR. The top group selects the faro-01 nodes for the period after April 19. The bottom group selects faro-mini-003 for the week before. Together they reconstruct the continuous exposure history across two independent institutions.

Importantly, this query does not have to be built by hand. A collection management system — the tool museums use to track object locations and movements — already holds exactly this information: which object was where, and when. Integrating the investigating dashboard with the CMS would allow the query to be generated automatically from the object's movement history, making this kind of cross-institution longitudinal analysis a routine operation.
-->

---

# Results: data fetched live from LDES


![height:480px](images/graphs.png)

<style scoped>
p { text-align: center; }
</style>

--- 
# Results: data fetched live from LDES


![height:540px](images/graphs_2.png)

<style scoped>
p { text-align: center; }
</style>

--- 

# Results: data fetched live from LDES

<div class="columns">
<div>

**8 568 observations** from `mumo.faro.be`  
6 sensor types · 2 nodes · no central warehouse

Each museum's **Solid Pod** serves its own data — no replication, no shared infrastructure

</div>
<div>

- **Red** — faro-mini-003 (home, Apr 13 – 19)
- **Orange** — faro-01/faro-001 (loan site, Apr 20 – 23)
- Handoff ~Apr 19 visible across all streams
- Temperature & humidity comparable → conditions within acceptable range throughout the loan

</div>
</div>

<!-- 
The dashboard follows only the LDES tree links that match the query — irrelevant branches are pruned before fetching. The result: 8568 observations from mumo.faro.be, plotted across six sensor types. Red lines are faro-mini-003 (home institution, April 13–19), orange are faro-01/faro-001 (loan site, April 20–23).

The cross-over around April 19 is directly visible: percentcharged and voltage reflect the different hardware at each site, lux shows the different lighting conditions. Temperature and humidity remain comparable throughout, giving the conservator confidence that conditions stayed within acceptable ranges across both institutions.

No data was copied or aggregated centrally. Each museum's Solid Pod serves its own observations. The investigating dashboard authenticates with both, navigates their respective LDES trees using the query constraints, and presents a unified view. The shared semantic model — SSN/SOSA throughout — is what makes this integration possible without a shared data warehouse or custom API.
-->

---

<!-- _class: section-header -->

# Tradeoffs and Conclusion

---

# Tradeoffs

> So this fixes everything?

Not quite — it's slow.

> Why is it slow?

Access control requires many fragments, and each fragment needs authentication. 

> So just cache the fragments?

While this *would* drastically improve the LDES performance, we cannot.
Authorization defeats HTTP caching entirely.

<!-- 
Two real limitations. First, access control expressivity is hard-bounded by the TREE fragmentation strategy: you can only grant access at boundaries that exist in the tree, so hour-level access requires hour-level fragments. Second, and relatedly, every fragment request must be authenticated, which prevents HTTP caches from serving stable historical pages — the thing that normally makes LDES fast. These aren't independent: finer fragments means more uncached authenticated round-trips. The caching issue is a known open problem in the LDES ecosystem, not something MuMo introduced. A solution there — e.g. capability tokens or signed fragment URLs — would fix the performance penalty automatically.
-->

---

# Conclusion

- **RQ1** — LDES + SSN/SOSA extend the existing dashboard for interoperable, semantically described publication — **without replacing** any operational tooling
- **RQ2** — Solid Pods + WAC enable scoped, revocable cross-institutional sharing **without** a shared user directory or centralized identity provider
- **RQ3** — Group-level access and client-side integration proved sufficient in practice; **operational feasibility matters more than maximum technical flexibility**

**Future work:** auto-generating queries from collection management systems; linking object location history directly to sensor streams

<!-- 
To summarize. MuMo demonstrates that dataspace principles can be deployed incrementally alongside legacy systems. LDES and semantic modeling answer RQ1 by extending the existing dashboard for interoperable publication. Solid-based governance answers RQ2 by enabling selective, revocable cross-institutional sharing without centralized identity. The lessons learned — group-level access control, client-side integration, institutional pods — answer RQ3 by showing that practical, operationally feasible design choices can be both sufficient and easier to sustain than more technically ambitious alternatives. Future work will explore integrating external data sources such as collection management systems, which would enable object-centric queries across institutional boundaries.
-->

---

<!-- _class: title -->

# Thank You

Arthur Vercruysse · Ben De Meester · Julián Rojas · Dieter Suls

Project: https://faro.be/project/museum-monitoring-tool

Investigating dashboard: https://museummonitoring.github.io/graphs/

*Questions?*
