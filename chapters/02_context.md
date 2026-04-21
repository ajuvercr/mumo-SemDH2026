# Background and Design Constraints {#sec:context}

To avoid ambiguity, we use MuMo v1 for the earlier prototype and MuMo v2 for the work presented in this paper. Unless stated otherwise, “MuMo” refers to MuMo v2.

MuMo v1 originated from the observation that environmental monitoring data in museums is difficult to access and reuse outside vendor dashboards. Monitoring equipment is often expensive and relies on proprietary, black-box devices that produce data locked to a single vendor platform—neither interoperable nor easily exchanged with other systems, and therefore underused for strategic purposes. To demonstrate that this could be done differently, the Fashion Museum Antwerp built an initial in-house prototype in 2019 using LoRaWAN shields, an Arduino, and a Raspberry Pi.
Based on the prototype’s demonstrated potential, the museum and the University of Antwerp applied for funding to extend the work.

The project evolved through several phases: an initial prototype phase (2019), in which the Fashion Museum Antwerp identified the problem and built a first working prototype; a funded PoC phase (MuMo v1, 2020–2021), in which MoMu and the University of Antwerp developed a proof-of-concept monitoring setup using open-source hardware and a PHP dashboard under an ‘Innovative Project’ grant from the Flemish Government; and a funded development phase (MuMo v2, 2022–2025), a three-phase ‘Cultural Heritage Project’ also funded by the Flemish Government, in which the system was extended with custom hardware and a dataspace-oriented software layer before being put into operational use in 2026. \autoref{fig:timeline} gives an overview of these phases.

\begin{figure}[h]
\centering
\begin{tikzpicture}[
  dot/.style={circle, inner sep=2.5pt},
  lbl/.style={font=\small, align=center, text width=2.8cm}
]

% Timeline arrow
\draw[->, thick] (-0.3,0) -- (11.5,0);

% 2019 (above) — problem identified + prototype
\draw[gray!60] (0,0) -- (0,1.5);
\filldraw[fill=gray!50, draw=gray!70] (0,0) circle (3pt);
\node[lbl, above] at (0,1.5) {\textbf{2019}\\MoMu identifies\\problem; builds\\LoRaWAN prototype};

% 2020-21 (below) — MuMo v1 PoC
\draw[gray!60] (2,0) -- (2,-1.5);
\filldraw[fill=gray!50, draw=gray!70] (2,0) circle (3pt);
\node[lbl, below] at (2,-1.5) {\textbf{2020--21}\\MuMo~v1 PoC\\(Raspberry Pi + PHP dashboard)};

% 2022 (above) — MuMo v2 Phase 1 funding
\draw[teal!70] (4,0) -- (4,1.5);
\filldraw[fill=teal!60, draw=teal!80] (4,0) circle (3pt);
\node[lbl, above] at (4,1.5) {\textbf{2022}\\MuMo~v2 Ph.\,1\\funding secured};

% 2023 (below) — Phase 1: hardware + datamodel
\draw[teal!70] (5.5,0) -- (5.5,-1.5);
\filldraw[fill=teal!60, draw=teal!80] (5.5,0) circle (3pt);
\node[lbl, below] at (5.5,-1.5) {\textbf{2023}\\Ph.\,1: custom\\hardware \& datamodel};

% 2024 (above) — Phase 2: field trials + dataspace prototype
\draw[teal!70] (7,0) -- (7,1.5);
\filldraw[fill=teal!60, draw=teal!80] (7,0) circle (3pt);
\node[lbl, above] at (7,1.5) {\textbf{2022--24}\\Ph.\,2: field trials~\&\\dataspace prototype};

% 2025 (below) — Phase 3: production
\draw[teal!70] (8.5,0) -- (8.5,-1.5);
\filldraw[fill=teal!60, draw=teal!80] (8.5,0) circle (3pt);
\node[lbl, below] at (8.5,-1.5) {\textbf{2025}\\Ph.\,3: production\\hardware \& dataspace};

% 2026 (above) — operational
\draw[green!50!black] (10,0) -- (10,1.5);
\filldraw[fill=green!50!black, draw=green!60!black] (10,0) circle (3pt);
\node[lbl, above] at (10,1.5) {\textbf{2026}\\System in\\operational use};

% Phase labels along the axis
\draw[gray!50, decorate, decoration={brace, amplitude=4pt, mirror}]
  (-0.1,-0.25) -- (2.6,-0.25)
  node[midway, below=6pt, font=\footnotesize\color{gray}] {MuMo~v1};
\draw[teal!50, decorate, decoration={brace, amplitude=4pt, mirror}]
  (3.9,-0.25) -- (10.1,-0.25)
  node[midway, below=6pt, font=\footnotesize\color{teal!80!black}] {MuMo~v2};

\end{tikzpicture}
\caption{MuMo project timeline.}
\label{fig:timeline}
\end{figure}

## Starting point: MuMo v1

MuMo v2 starts from MuMo v1, which already supported core operational monitoring: ingestion and persistence of sensor readings, time-series visualization, alerting, and basic export functionality. MuMo v1’s dashboard also supported user and group management aligned with museum workflows, enabling staff to manage access within an institution in terms of responsibilities and spaces.
In practice, these groups reflect a nested location hierarchy: from the museum or site level down to individual rooms and storage areas, and—when needed—even to fine-grained containers such as cabinets, shelves, or specific boxes.

At the same time, MuMo v1 made visible the limitations that motivated MuMo v2’s focus: data remained largely bound to a single dashboard instance, exports were the primary sharing mechanism, and interoperability and cross-institution governance were not first-class concerns.

## Scope: extending rather than replacing existing systems

MuMo v2 is explicitly not a “rip-and-replace” effort. Museums already depend on established dashboards and workflows that are difficult to change in day-to-day practice. Consequently, MuMo v2 keeps a dashboard-centric workflow as the primary operational interface for staff—where sensors are configured, readings are inspected, and alerts are handled—while adding a complementary data layer aimed at long-term reuse and cross-institution sharing. 

This design stance reflects practical constraints in museum IT: successful changes must remain compatible with institutional autonomy, limited technical staffing, and long-running deployments. MuMo v2 therefore preserves the operational loop (“measure → view → react”) while enabling monitoring data to be reused and selectively shared beyond a single dashboard when needed. 

## What MuMo v2 adds: new hardware and a dataspace-oriented layer

Building on this baseline, MuMo v2 upgrades both the sensing infrastructure and the data layer. On the hardware side, it replaces the Raspberry Pi/Wi-Fi setup with custom low-power sensors designed for long battery life (at least x months on a single charge) and LoRaWAN-based uplink communication\footnote{\url{https://www.thethingsnetwork.org/docs/lorawan/architecture/}}. 
LoRaWAN is used for device-to-gateway transmission (low power, limited payload), after which a powered gateway bridges measurements to the internet.

Measurements captured by the MuMo v2 devices are transmitted to off-the-shelf gateways and routed through The Things Network before being ingested into the existing monitoring dashboard. On the software side, MuMo v2 adds the capabilities needed for reuse and selective sharing: (i) semantic representation of monitoring data, (ii) incremental/event-based publication, and (iii) an authorization approach that can operate across institutional boundaries while remaining administratively feasible for museum staff.

Overall, MuMo v2 is shaped by the need to support long-running monitoring data while enabling selective, revocable sharing across organizations—without disrupting the existing operational setup.

