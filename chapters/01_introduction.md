<!-- Museums increasingly rely on digital infrastructures to support the conservation, documentation, and circulation of cultural heritage objects. -->
<!-- BDM: Above is true but boring. Your beginning can be much stronger by removing that first sentence and directy state below --> 
In cultural heritage, environmental parameters such as temperature, humidity, and light exposure directly affect the preservation of artworks [@laborda2022concept].
<!-- Conservation practice increasingly frames environmental control in terms of risk management and tolerable fluctuation ranges rather than a single “ideal” climate, reinforcing the operational importance of continuous monitoring and traceable reporting [@michalski2007ideal]. -->
<!-- BDM: I integrated instead of stating it a bit redundantly  -->
Thus, museums increasingly require digital infrastructures for long-term environmental monitoring and traceable reporting [@laborda2022concept][@michalski2007ideal].
<!-- Such environment monitoring is often even contractually regulated, particularly in the context of inter-museum loans. As a result, monitoring data must not only be collected reliably, but also interpreted, analyzed, and—under specific conditions—shared across institutional boundaries. -->
<!-- BDM: I removed the load parts because that comes later -->

A wide range of sensing technologies for environmental monitoring already exists and is actively used in museum practice, including data loggers and long-running wireless sensor network (WSN) deployments in museum buildings [@rodriguez2010integrating]. However, these systems typically operate as stand-alone solutions, tightly coupled to proprietary (and legacy) dashboards or local infrastructures [@Monitoring2025]. As a consequence, monitoring data remains siloed: it is difficult to combine measurements across installations [@CIDOC2024], to align them with other data sources, or to selectively share specific sets of measurements with external partners through access control mechanisms.
This fragmentation limits the analytical value of the data and complicates reporting and thus collaboration between institutions.
<!-- At the same time, museums operate within strong organizational and governance constraints: institutional autonomy must be preserved, technical solutions must remain manageable by non-technical staff, and existing systems cannot easily be replaced. -->

<!-- These challenges are exacerbated by the realities of museum infrastructures. -->
<!-- Monitoring systems are often embedded in long-lived legacy dashboards that were designed for local use, provide limited access control mechanisms, and do not support cross-institutional data reuse. -->
<!-- At the same time, museums operate within strong organizational and governance constraints: institutional autonomy must be preserved, technical solutions must remain manageable by non-technical staff, and existing systems cannot easily be replaced. -->
<!-- BDM: I don't see the point of this above paragraph: it reads redundant. Instead, I integrated the wording with the paragraph above -->
<!-- BDM: But even when integrating, I don't see the point of the last sentence of this paragraph -->

The limitations of siloed monitoring become particularly visible in inter-museum loan scenarios:
a lending museum lends a particular cultural heritage object for a specific period of time to another borrowing museum.
In this scenario, borrowing museums are typically contractually obliged to give the lending institution access to the borrowing museum's environmental data, but only for a specific subset of sensors and a limited time period, relevant to the loan.
As a result, monitoring data must not only be collected reliably, but also interpreted, analyzed, and—under specific conditions—shared across institutional boundaries.
Existing practices often rely on ad-hoc data exports or manual reporting, leading to delays, duplication, and reduced transparency in conservation oversight.

Recent work has similarly highlighted how the increasing digitization of museum collections exposes structural limitations in legacy monitoring and documentation infrastructures, particularly with respect to long-term traceability, institutional accountability, and resilience against security incidents [@ross2024digital].

This paper reports on MuMo (Museum Monitoring), a three-year applied research project that explored how dataspace principles can be applied to environmental monitoring in real museum settings, namely prioritizing incremental integration, heterogeneous sources, and governance [@franklin2005databases; @halevy2006principles].
<!-- BDM: for me it's unclear what arguments those references back -->
Rather than proposing new sensing technologies or replacing existing platforms, MuMo focused on breaking down data silos by integrating semantic technologies, decentralized data publication, and access control mechanisms with existing systems and workflows.

This paper makes three contributions: (1) an in-use account of deploying dataspace principles for environmental monitoring in museums, (2) a concrete architectural integration of semantic modeling, event-based publication, and decentralized governance with legacy systems, and (3) empirically grounded lessons on aligning access control and data sharing mechanisms with institutional practice.

After describing the X in Section Y, we [...]
<!-- BDM: TODO -->

