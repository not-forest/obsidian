> **Cell Search** - procedure for **UE** to acquire time and frequency synchronization with a cell and to detect the **Physical Layer Cell ID (PCI)** of the cell. **NR** uses synchronization signals and **PBCH** to derive necessary information required to access the cell.
> 
> Synchronization signals can also e used by the **UE** for **RSRP** and **RSRQ** measurements.

> **Physical-layer Cell Identity (PCI)** - **NR** defines *1008* unique **PCI**s, each divided into *336* unique **PCI groups** and each group consisting of three different identities.
> 
> **PCI** of the cell can be calculated using:
$$
N_{ID}^{Cell}=3 * N_{ID}^{(1)} + N_{ID}^{(2)} 
$$
> **UE** derives **PCI group number (1)** from **SSS** and **Physical-layer Identity (2)** from **PSS**.

> **Primary Synchronization Signal (PSS)** - helps the **UE** to determine **physical-layer identity (2)** and synchronization up to periodicity of the **PSS**.
> 
> Generated using **BPSK** modulated **m-sequence** of length *127*.
> ![[Pasted image 20260401105159.png]]

Based on the **PCI** used in the cell, the basic length 127 **m-sequence** is cyclic shifted by 0, 43 or 8 steps, to generate the required (1 out of 3) **m-sequence**.