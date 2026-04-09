# Background and Design Constraints {#sec:context}

To avoid ambiguity, we use MuMo v1 for the earlier prototype and MuMo v2 for the work presented in this paper. Unless stated otherwise, “MuMo” refers to MuMo v2.

MuMo v1 originated from the observation that environmental monitoring data in museums is difficult to access and reuse outside vendor dashboards. To assess what could be achieved with modest resources, the Fashion Museum Antwerp built an initial prototype to collect measurements and visualize them in a lightweight dashboard.
This monitoring setup centered on a Raspberry Pi connected to a PHP dashboard over WiFi.
Based on the prototype’s demonstrated potential, the museum applied for funding to extend the work.

The project evolved through several phases: an initial prototype phase (MuMo v1, 2021–2022), in which the Fashion Museum Antwerp developed a proof-of-concept monitoring setup; a funded development phase (2023–2025), in which MuMo v2 extended this baseline with new hardware and a dataspace-oriented software layer; and a deployment and evaluation phase (2025–2026), in which the system was put into operational use across museum sites. \autoref{fig:timeline} gives an overview of these phases.

\begin{figure}[h]
\centering
\begin{tikzpicture}[
  dot/.style={circle, inner sep=2.5pt},
  lbl/.style={font=\small, align=center, text width=2.5cm}
]

% Timeline arrow
\draw[->, thick] (-0.3,0) -- (11.8,0);

% 2021 (above) — MuMo v1 phase
\draw[gray!60] (0,0) -- (0,1.5);
\filldraw[fill=gray!50, draw=gray!70] (0,0) circle (3pt);
\node[lbl, above] at (0,1.5) {\textbf{2021}\\Fashion Museum\\identifies problem};

% 2022 (below) — MuMo v1 phase
\draw[gray!60] (2,0) -- (2,-1.5);
\filldraw[fill=gray!50, draw=gray!70] (2,0) circle (3pt);
\node[lbl, below] at (2,-1.5) {\textbf{2022}\\MuMo~v1 PoC\\complete};

% 2023 (above) — MuMo v2 development
\draw[teal!70] (4,0) -- (4,1.5);
\filldraw[fill=teal!60, draw=teal!80] (4,0) circle (3pt);
\node[lbl, above] at (4,1.5) {\textbf{2023}\\Flemish Gov.\ funding\\secured};

% 2024 (below) — MuMo v2 development
\draw[teal!70] (6,0) -- (6,-1.5);
\filldraw[fill=teal!60, draw=teal!80] (6,0) circle (3pt);
\node[lbl, below] at (6,-1.5) {\textbf{2024}\\Custom hardware~\&\\dataspace prototype};

% 2025 (above) — MuMo v2 development
\draw[teal!70] (8,0) -- (8,1.5);
\filldraw[fill=teal!60, draw=teal!80] (8,0) circle (3pt);
\node[lbl, above] at (8,1.5) {\textbf{2025}\\Production hardware~\&\\dataspace};

% 2026 (below) — operational
\draw[green!50!black] (10,0) -- (10,-1.5);
\filldraw[fill=green!50!black, draw=green!60!black] (10,0) circle (3pt);
\node[lbl, below] at (10,-1.5) {\textbf{2026}\\System in\\operational use};

% Phase labels along the axis
\draw[gray!50, decorate, decoration={brace, amplitude=4pt, mirror}]
  (-0.1,-0.25) -- (2.1,-0.25)
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

