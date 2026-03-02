---
title: "Museum Monitoring: an environmental monitoring dataspace using The Things Network, Solid, and LDES"
abstract: |
    Museums increasingly deploy environmental monitoring systems (e.g., data loggers and sensor networks) to support preservation of cultural heritage objects.
    However, monitoring data is often captured and accessed through proprietary vendor software, which makes reuse, integration, and controlled cross-institution sharing difficult—particularly in object loan scenarios.
    This paper reports on MuMo (Museum Monitoring), a three-year applied research project that explored how dataspace principles can be applied to environmental monitoring in real museum settings.
    Rather than replacing existing systems, MuMo extends a legacy monitoring dashboard with semantic data modeling, Linked Data Event Streams, and Solid-compliant data access management.
    We present the system design, where environmental monitoring data is semantically described and published with access controlled fragments as a stream.
    The semantic links between these fragments allow clients to prune irrelevant branches while providers can restrict access at natural boundaries (e.g., per location or sensor).
    Further, we describe how MuMo is used in practice through a set of in-use scenarios,
    where the system enables (1) decentralized data publication for longitudinal analysis of environmental conditions, (2) selective cross-institutional data sharing during object loans, and (3) client-side data integration and aggregation across independent deployments.
    In practice, this dataspace-oriented deployment reveals design trade-offs while preserving institutional autonomy: museums control their data and authorization policies end-to-end, supporting trusted data sharing across organizational boundaries.
    The deployed system and its insights are thus relevant to a broad range of (Digital Humanities) projects that involve long-running data integration under distributed governance.
keywords:
    - Digital Humanities
    - Dataspaces
    - Solid
    - LDES
    - Museum Monitoring
authors:
  - name: "Arthur Vercruysse"
    affils: [1]
    orcid: "0000-0002-0877-7063"
    email: "arthur.vercruysse@ugent.be"
    cormark: 1
    fnmark: 1

  - name: "Ben De Meester"
    affils: [1]
    orcid: "0000-0001-7116-9338"
    email: "ben.demeester@ugent.be"
    fnmark: 1

  - name: "Julian Rojas"
    affils: [1]
    orcid: "0000-0002-9421-8566"
    email: "JulianAndres.RojasMelendez@UGent.be"
    fnmark: 1

  - name: "Dieter Suls"
    affils: [2]
    orcid: "0000-0002-9421-8566"
    email: "dieter.suls@momu.be"
    fnmark: 1

addresses:
  - id: 1
    text: "Ghent University - IMEC, "
  - id: 2
    text: "Fashion Museum Antwerp, Nationalestraat 28, 2000 Antwerpen"

cortext:
  - id: 1
    text: "Corresponding author."
fntext:
  - id: 1
    text: "These authors contributed equally."
---


<!--
* What problem in Semantic Digital Humanities are you addressing?
* Why existing approaches were insufficient in practice
* Who the actual users are (e.g., historians, archivists, philologists)

Key signal: This problem emerged from real DH work, not theory.
-->

!include chapters/01_introduction.md


<!--
This section is crucial and often underdeveloped in weak submissions.

You should explain:

* The institutional or project context (archives, research projects, collaborations)
* The data (corpora, annotations, metadata, editions, etc.)
* Constraints:
  * legacy formats,
  * limited technical skills,
  * evolving research questions.

Reviewers want to see that your semantic solution responds to messy reality.
-->

!include chapters/02_context.md


<!--
Describe the system as used, not as architecturally ideal.

Include:
* Core technologies (RDF, OWL, SKOS, SHACL, SPARQL, etc.)
* Modeling choices and why they were made
* Any simplifications, compromises, or deviations from “best practice”

Diagrams help here, but are not mandatory.
-->

!include chapters/03_approach.md



<!--
This is what differentiates an in-use paper from a demo or system paper.

You should describe:

* Concrete workflows:
    * “A scholar annotates X”
    * “A curator validates Y”
    * “A researcher queries Z”
* How often it is used
* By whom
* For what purpose

Narrative-style descriptions are welcome and expected.
-->

!include chapters/04_scenarios.md



<!--
This is often the most valued section.

Discuss honestly:
* What worked surprisingly well
* What failed or was harder than expected
* Where semantic technologies helped or didn’t
* Usability issues
* Modeling pain points
* Adoption barriers

Negative results are not a problem—lack of reflection is.
-->

!include chapters/05_lessons.md



<!--
Tie your experience back to SemDH’s audience:
* What can other DH projects learn?
* Are there reusable patterns, vocabularies, workflows?
* What should tool builders or ontology designers take away?

This is where generalization, not evaluation, happens.
-->

!include chapters/06_impact.md

# Conclusion and Future Work

<!--
* Concrete next steps based on real use
* Not blue-sky research agendas
-->

!include chapters/07_conclusion.md

