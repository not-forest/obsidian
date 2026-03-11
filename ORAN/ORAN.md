> **Open RAN** - open source interfaces that allows creating open, swappable, software-defined and cloud native **RANs**. Defined and maintained by **O-RAN Alliance**. 
![[Pasted image 20260306132906.png]]
![[Pasted image 20260306132927.png]]
![[Pasted image 20260311120202.png]]

**O-RAN** specification splits the radio protocol stack into three key blocks interconnected with three open interfaces:
- **RRU** - Remote Radio Unit -> **Fronthaul** (**RF** + **Low PHY**)
- **DU** - Distributed Unit -> **Midhaul** (**High-PHY, MAC, RLC**)
- **CU** - Central Unit -> **Backhaul** (**PDCP, RRC**)

![[Pasted image 20260306150125.png]]
![[Pasted image 20260306152606.png]]
![[Pasted image 20260311114828.png]]
## Working Groups

**O-RAN** specification is split into working groups:

|                                                                              |                                                                                                              |
| ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| WG1: Use Cases and Overall Architecture Workgroup                            |                                                                                                              |
|                                                                              | O-RAN Architecture Description                                                                               |
|                                                                              | O-RAN Operations and Maintenance Architecture                                                                |
|                                                                              | O-RAN Operations and Maintenance Interface                                                                   |
|                                                                              | O-RAN Use Cases Detailed Specification                                                                       |
|                                                                              | O-RAN Use Cases Analysis Report                                                                              |
|                                                                              | O-RAN Slicing Architecture                                                                                   |
|                                                                              | O-RAN Study on O-RAN Slicing                                                                                 |
|                                                                              | O-RAN Information Model and Data Models Specification                                                        |
| WG2: The Non-Real-Time RAN Intelligent Controller and A1 Interface Workgroup |                                                                                                              |
|                                                                              | O-RAN Non-RT RIC Architecture                                                                                |
|                                                                              | O-RAN A1 interface: Type Definition                                                                          |
|                                                                              | O-RAN AI/ML Workflow Description and Requirements                                                            |
|                                                                              | O-RAN A1 interface: General Aspects and Principles                                                           |
|                                                                              | O-RAN A1 interface: Application Protocol                                                                     |
|                                                                              | O-RAN A1 interface: Transport Protocol                                                                       |
|                                                                              | O-RAN Non-RT RIC & A1 Interface: Use Cases and Requirements                                                  |
|                                                                              | O-RAN Non-RT RIC: Functional Architecture                                                                    |
| WG3: The Near-Real-Time RIC and E2 Interface Workgroup                       |                                                                                                              |
|                                                                              | O-RAN Near-RT RAN Intelligent Controller Near-RT RIC Architecture                                            |
|                                                                              | O-RAN Near-Real-time RAN Intelligent Controller Architecture & E2 General Aspects and Principles             |
|                                                                              | O-RAN Near-Real-time RAN Intelligent Controller, E2 Application Protocol                                     |
|                                                                              | O-RAN Near-Real-time RAN Intelligent Controller E2 Service Model                                             |
|                                                                              | O-RAN Near-Real-time RAN Intelligent Controller E2 Service Model (E2SM), RAN Function Network Interface (NI) |
|                                                                              | O-RAN Near-Real-time RAN Intelligent Controller E2 Service Model (E2SM) KPM                                  |
| WG4: The Open Fronthaul Interfaces Workgroup                                 |                                                                                                              |
|                                                                              | O-RAN Open Fronthaul Conformance Test Specification                                                          |
|                                                                              | O-RAN Fronthaul Cooperative Transport Interface Transport Control Plane Specification                        |
|                                                                              | O-RAN Fronthaul Interoperability Test Specification (IOT)                                                    |
|                                                                              | O-RAN Fronthaul Control, User and Synchronization Plane Specification                                        |
|                                                                              | O-RAN Management Plane Specification                                                                         |
|                                                                              | O-RAN Cooperative Transport Interface Transport Management Plane Specification                               |
| WG5: The Open F1/W1/E1/X2/Xn Interface Workgroup                             |                                                                                                              |
|                                                                              | O-RAN O1 Interface specification for O-CU-UP and O-CU-CP                                                     |
|                                                                              | O-RAN Interoperability Test Specification (IOT)                                                              |
|                                                                              | O-RAN Transport Specification                                                                                |
|                                                                              | O-RAN NR C-plane profile                                                                                     |
|                                                                              | O-RAN NR U-plane profile                                                                                     |
| WG6: The Cloudification and Orchestration Workgroup                          |                                                                                                              |
|                                                                              | O-RAN O-Cloud Notification API Specification for Event Consumers                                             |
|                                                                              | O-RAN O2ims Interface Specification                                                                          |
|                                                                              | O-RAN Acceleration Abstraction Layer FEC Profiles                                                            |
|                                                                              | O-RAN Acceleration Abstraction Layer General Aspects an Principles                                           |
|                                                                              | O-RAN Orchestration Use Cases and Requirements for O-RAN Virtualized RAN                                     |
|                                                                              | O-RAN O2 General Aspects and Principles Specification                                                        |
|                                                                              | O-RAN Cloud Platform Reference Design                                                                        |
|                                                                              | O-RAN Cloud Architecture and Deployment Scenarios for O-RAN Virtualized RAN                                  |
| WG7: The White-box Hardware Workgroup                                        |                                                                                                              |
|                                                                              | O-RAN Hardware Reference Design Specification for Indoor Pico Cell with Fronthaul Split Option 6             |
|                                                                              | O-RAN Hardware Reference Design Specification for Indoor Picocell FR1 with Split Architecture Option 7-2     |
|                                                                              | O-RAN Hardware Reference Design Specification for Indoor Picocell FR1 with Split Architecture Option 8       |
|                                                                              | O-RAN Indoor Picocell Hardware Architecture and Requirement (FR1 Only) Specification                         |
|                                                                              | O-RAN Deployment Scenarios and Base Station Classes                                                          |
|                                                                              | O-RAN Hardware Reference Design Specification for Outdoor Micro Cell with Split Architecture Option 7-2      |
|                                                                              | O-RAN Outdoor Micro Cell Hardware Architecture and Requirements (FR1) Specification                          |
|                                                                              | O-RAN Hardware Reference Design Specification for Fronthaul Gateway                                          |
|                                                                              | O-RAN Outdoor Macrocell Hardware Architecture and Requirements (FR1) Specification                           |
| WG8: Stack Reference Design Workgroup                                        |                                                                                                              |
|                                                                              | O-RAN Stack Interoperability Test Specification                                                              |
|                                                                              | O-RAN Base Station O-DU and O-CU Software Architecture and APIs                                              |
| WG9: Open X-haul Transport Workgroup                                         |                                                                                                              |
|                                                                              | O-RAN Xhaul Transport Testing                                                                                |
|                                                                              | O-RAN Synchronization Architecture and Solution Specification                                                |
|                                                                              | O-RAN Management interfaces for Transport Network Elements                                                   |
|                                                                              | O-RAN WDM-based Fronthaul Transport                                                                          |
|                                                                              | O-RAN Xhaul Packet Switched Architectures and Solutions                                                      |
| WG10: OAM Workgroup                                                          |                                                                                                              |
|                                                                              | O-RAN Operations and Maintenance Interface Specification                                                     |
|                                                                              | O-RAN Operations and Maintenance Architecture                                                                |

## Implementation Options of Near-RT RIC
- **5G Only**
- **5G and 4G**
- **4G Only
![[Pasted image 20260306133039.png]]
![[Pasted image 20260306152423.png]]
## Reference Architecture

One can define the following major **O-RAN** building architecture blocks:
- **RF Frond End** - everything needed to turn digital **IQ** waveforms into actual radio waves **DL**, and vice-versa **UP**; 
- **Digital Front End** - bridge between analog **RF** and digital **PHY**: conversion to digital, filtering, etc.;
- **Low PHY** - **RU** implementation that handles **sample and symbol-level** data processing: channel estimation (**DRMS**), equalization, noise estimation, beamforming, etc.
- **Fronthaul/Transport** - Interface between **RU** and **DU** that carries **IQ** samples, control, beamforming data, timing information, etc.

![[Pasted image 20260306134117.png]]

### rAPP

**rAPP (RAN Application)** - applications that run on NonRT-RIC used to provide network optimizations, control loops etc:
- network planning, resource optimization, load balancing;
- integrated with AI/ML models for predictive analysis, anomaly detection, traffic forecasting;
- QoS;
- traffic steering (*Analyzes network traffic patterns and makes decision based on that history to route them better*);
- energy savings (*Analyzes historical data, traffic patterns and cell load to find ways to put certain network elements to sleep*);
- anomaly detection (*Find abnormal patterns and do actions accordingly*);
- long-term balancing (*Allocated resources in balance based on history information*);
- mobility optimization (*Predicts mobility by analyzing previous patterns*);
## DU & RU

> **Distributed Unit (DU)** - responsible of **High PHY**, **MAC** and **RLC** layers, focusing on tasks like scheduling, modulation, and data processing.
> **Radio Unit (RU)** - in charge of **RF** processing, **beamforming**, **Low PHY** functions, converting digital signals into radio waves.
## Contents:
- [[Curated List of Abbreviations (O-RAN)]]
- [[eCPRI]]
- [[Fronthaul]]