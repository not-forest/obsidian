> **Fronthaul** - transport link between **DU** and **RU**. Carries **IQ samples**, **CP** signaling, timing and message management. Requires ultra-low latency, ultra-low jitter and high **BW**. Supports **[[eCPRI]]** and **Open FH** protocols.
> 
![[Pasted image 20260306142736.png]]

> **CU-Plane (Control/User Plane)** - plane where data flows between **DU** and **RU**, linking **DU (High PHY) and **RU (Low PHY)**. Uses **IEEE 1914.3 (Radio over Ethernet Standard)**. Can communicate through **UDP/IP**. Used to transport **IQ data**, sending control information for **scheduling and link adaptation**.
> **S-Plane (Synchronization Plane** - Synchronizing clocks between **DU** and **RU** ensuring proper timing for transmission. 
> **M-Plane (Management Plane)** - deals with configuration, monitoring and fault management for both **DU** and **RU**. Uses **NETCONF** over **HTTPS**

In 7.2x split, interface is categorized further into two options: **CAT-A** and **CAT-B**. There **CAT-A** includes precoding, while another one shifts precoding and beamorming responsibilities to **RU**.

![[Pasted image 20260311103735.png]]

- **Category A (Cat A)**
	- **Processing Split:** DU performs precoding, RU mainly handles RF functions.
	- **Use Case**: Suitable for small-scale deployments, up to 8 digital antenna ports.
	- **Advantage**: Centralized control allows for flexible coordination and network-wide optimizations.
	- **Limitation**: Requires more fronthaul capacity, making it less efficient for high-density MIMO setups.

- **Category B (Cat B)**
	- **Processing Split**: RU performs precoding and beamforming, DU handles high-PHY and MAC functions.
	- **Use Case:** Ideal for M-MIMO (more than 8 antenna ports) and high-density urban deployments.
	- **Advantage**: Less fronthaul bandwidth is needed, and real-time beamforming improves efficiency.
	- **Limitation**: Distributes processing to RU, increasing its complexity and cost.

### Problems with beamforming in **RU**
- **Loss of Channel Information** - **DU** does not generate beamforming, so it does not provide beamforming weights based on **CSI-RS**. Only reduced set of **IQ** data streams are sent to **RU**. This provides to less accurate beamforming, limited scheduling optimizations and weaker anti-interference methods.
- **Processing Delays** - Additional transfer latency produces delays in calculations on **RU**, which can degrade performance in quick environments
![[Pasted image 20260311113610.png]]

## CAT-B ULPI-A/B

To fix issues related to **RU** computing in **CAT-B**, two additional interfaces were added:
- **CAT-B ULPI-A**
	- Equalizer function placed in the RU
	- Reduces fronthaul bitrate by transmitting only user data layers between RU and DU
	- Maintains a clear separation of responsibilities between O-RU and O-DU
	- Enables multi-vendor interoperability as RU and DU functions are well-defined
	- Improves uplink spectral efficiency, allowing better utilization of fronthaul resources

- **CAT-B ULPI-B**
	- Equalizer function placed in the DU
	- Channel estimation must be performed in both O-RU and O-DU, requiring precise synchronization
	- More challenging for multi-vendor interoperability, as different vendors may implement channel estimation differently
	- Can potentially allow more centralized processing but at the cost of increased fronthaul bitrate

![[Pasted image 20260311113753.png]]

## Protocols in **DU-RU** Interface
- **enchanced Common Public Radio Interface ([[eCPRI]])** - transporting **IQ** data in **fronthaul**;
- **O-RAN CUS-Plane (Control & User Plane) Protocol** - defining fronthaul communication managing beamforming weights, timings, scheduling, IQ data over **eCPRI**;
- **O-RAN M-Plane (Management Plane) Protocol** - configuring and managing **RU** remotely based on **NETCONF/YANG**;
- **Precision Time Protocol (PTP, IEEE-1588)/ Synchronous Ethernet (SyncE)** - used to synchronize **DU** and **RU** for proper beamforming and scheduling. **TDD** synchronization. ![[Pasted image 20260311140513.png]]
- **Transport Protocols: Ethernet, UDP/IP?** - **eCPRI** packets can be encapsulated over **UDP/IP** and sent via **Ethernet**.

![[Pasted image 20260311141758.png]]
