- **O-RAN** - Open RAN
- **VNF** - Virtualized Network Function
- **RU** - Radio Unit (*Part of RAN that handles everything closer to **RF** domain.*)
- **DU** - Distributed Unit (*Handles lower **MAC** and lower **PHY** processing tasks)
- **CU** - Central Unit
- **RRU** - Remote Radio Unit
- **RIC** - RAN Intelligent Controller
- **CU-CP** - Central Unit - Control Plane
- **CU-UP** - Central Unit - User Plane
- **Near RT RIC and Non-RT RIC** - Near real-time and not-realtime RIC equivalents
- **SMO** - Service Management and Orchestration Framework (*Responsible for RAN domain management*)
- **F-CAPS** - File, Communication, Accounting, Performance, Security
- **O-Cloud** - Open Cloud (*Clound infrastructure in **O-RAN** that provides compute, storage and network resources.*)
- **AAL** - Acceleration Abstraction Layer (*Hides **O-Cloud** related accelerations behind an open interface*)
- **xAPP** - Any Application (*Designed to be run on **Near-RT RIC***)
- **rAPP** - RAN Application (*Designed to be run on **Non-RT RIC***)
- **EI** - Enrichment Information (*Contextual data supplied with **xAPPs, rAPPs** to improve analytics, optimization and decision making in **RAN***)
- **eCPRI** - enhanced Common Public Radio Interface

- **C-Plane** - Control Plane (*Control data*)
- **U-Plane** - User Plane (*IQ Samples*)
- **S-Plane** - Sync Plane (*Synchronization data*)
- **M-Plane** - Management Plane

- **WG4** - Working Group 4 (*Specifies **O-RAN** working group that defines **Fronthaul** interface, it's planes, timing, transport and **L1** split details.*)

- **IEEE 1914.3** - Radio over Ethernet Standard
### Intefaces 3GPP
- **X2-c and X2-u** - 3GPP Interfaces (****LTE** intefaces connecting different types of base stations for control and user data*)
- **NG-c and NG-u** - 3GPP Interfaces (****5G** intefaces connecting **gNBs** to 5G core network.*)
- **Xn-c and Xn-u** - 3GPP Interfaces (****5G** intefaces connecting different types of base stations for control and user data*)
### Interfaces O-RAN
- **FH** - Interface Fronthaul (*Interface between **SMO** and **RU** and **RU** and **DU***)
- **A1** - Interface A1 (*Interface between Non-RT and Near-RT RICs for **RAN optimizations***)
- **O1** - Interface O1 (*Interface between **SMO** and **VNF** for **F-CAPS** support*)
- **O2** - Interface O2 (*Interface between **SMO** and **O-Cloud**)
- **E1** - Interface E1 (*Connets **CU-CP** to **CU-UP***)
- **E2** - Interface E2 (*Connets **Near-RT RIC to **CU-CP, CU-UP, DU, gNB***)
- **F1-c and F1-u** - Interface F1 (*Connects **CU-CP** to **DU** for control and user plane data*)

- **R1** - Interface R1 (*Internal **Non-RT RIC** interface that provides **API** to **rAPPs***)