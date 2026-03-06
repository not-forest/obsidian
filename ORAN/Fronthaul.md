> **Fronthaul** - transport link between **DU** and **RU**. Carries **IQ samples**, **CP** signaling, timing and message management. Requires ultra-low latency, ultra-low jitter and high **BW**.
![[Pasted image 20260306142736.png]]

> **CU-Plane (Control/User Plane)** - plane where data flows between **DU** and **RU**, linking **DU (High PHY) and **RU (Low PHY)**. Uses **IEEE 1914.3 (Radio over Ethernet Standard)**. Can communicate through **UDP/IP**. Used to transport **IQ data**, sending control information for **scheduling and link adaptation**.
> **S-Plane (Synchronization Plane** - Synchronizing clocks between **DU** and **RU** ensuring proper timing for transmission. 
> **M-Plane (Management Plane)** - deals with configuration, monitoring and fault management for both **DU** and **RU**. Uses **NETCONF** over **HTTPS**