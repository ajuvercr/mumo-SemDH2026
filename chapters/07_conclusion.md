# Conclusion and Future Work

This paper reported on MuMo (Museum Monitoring), a three-year applied research project that explored the use of dataspace principles for environmental monitoring in museum practice. By integrating semantic data publication, event-based access, and decentralized governance with existing monitoring infrastructure, MuMo addressed practical challenges related to long-running data collection, cross-institutional collaboration, and controlled data sharing.

A central outcome of the project is the demonstration that dataspace-oriented architectures can be deployed incrementally alongside legacy systems. Rather than requiring centralized platforms or uniform tooling, MuMo shows how interoperability and data reuse can be achieved while preserving institutional autonomy and established workflows. The project further illustrates that design choices grounded in conservatorial practice—such as group-based access control—can be both sufficient in practice and easier to sustain than more fine-grained alternatives.

<!-- BDM: but you made an entire point in this paper was that that's OK, why come back to this and actually suggest that's not OK? I suggest to skip -->
<!-- Several limitations remain. Access control is currently restricted to group-level permissions, reflecting the expressive capabilities of the legacy dashboard rather than technical constraints of the dataspace architecture. Future work could explore finer-grained authorization mechanisms, such as temporal or measurement-level access, should corresponding user requirements arise. -->
<!-- BDM: currently, historical fragmentations are fixed, right? can I create a new group that recombines some historical sensor data (e.g. create a new group that gives all temperature measurements across 5 objects in 5 different rooms in 2023, because that's interesting for some research) -->
In addition, while the system supports aggregation across multiple MuMo deployments, integrating external data sources beyond the project has not yet been explored in deployed settings.

In conclusion, MuMo provides an in-use perspective on how Solid-based data governance, Linked Data Event Streams, and lightweight semantic modeling can support practical Digital Humanities workflows. The project highlights the value of aligning technical architectures with organizational realities and contributes concrete lessons for the design of interoperable, sustainable DH data infrastructures.

