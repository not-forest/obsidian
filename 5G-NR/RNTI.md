> **Radio Network Temporary Identifier RNTI** - used to differentiate/identify a connected mode **UE** in the cell, a specific radio **channel**, a group of **UEs** in case of **paging**, and a lot more (there are many types of **RNTI** of each topic).\

More information: [How LTE Stuff Works?: RNTIs in 5G NR](https://howltestuffworks.blogspot.com/2019/09/rntis-in-5g-nr.html)
## Types of RNTI

![[Pasted image 20260325150127.png]]

Except for **I-RNTI**, the length of each is **2 bytes (16-bits)**, and used to **scramble CRC** bits before they are attached to the corresponding transmission (**UL/DL**). Most of them are mapped to a certain channel, and have corresponding **DCI** format:

![[Pasted image 20260325150447.png]]

> **Paging RNTI** - used by **UE**s for the reception of paging in the downlink. It can also be used to inform **UE** about **SI** Modifications and/or **ETWS/CMAS** notifications using "Short Messages", transmitted with this **P-RNTI** over **DCI**. Both **paging and "short" messages** are sent over **PDCCH** directly.
>  
> It is a **common RNTI**, which means that it is not allocated by **UE**, and it has a standard value of: 65534 (0xFFFE).
> 
> This **RNTI** uses **DCI Format 1_0**.

> **System Information RNTI** - used for indication of **broadcast** and **system information** in the **DL**.. It is a **common RNTI** and has a standard value of: 65535 (0xFFFF). This **RNTI** uses **DCI Format 1_0**.
> 
> The **UE** shall receive the **PDCCH** scrambled with **SI-RNTI** in the **PDCCH** monitoring occasion(s) for **SI** message acquisition, from the start of the _SI-window_ and continue until the end of the _SI-window_ or until the SI message was received. If the SI message was not received by the end of the _SI-window_, repeat reception at the next _SI-window_ occasion for the concerned SI message in the current modification period.

> **Random Access RNTI** - used to identify the **Random Access Responce (RAR)** in the **DL**.. This **RNTI** uses **DCI Format 1_0**. **gNB** generates **RAR**s as a response to the **Random Access Preamble** transmitted by the **UE**(s).
> 
> **RA-RNTI** is calculated based on:
$$
 RA_-RNTI = 1 + s_{id} + 14 \times t_{id} + 14 \times 80 \times f_{id} + 14 \times 80 \times 8 \times ul_{carrier-id}
$$
> where:
> - **s_id** is the index of the first OFDM symbol of the specified PRACH (0 <= s_id < 14)
> - **t_id** is the index of the first slot of the specified PRACH in a system frame (0 <= t_id < 80)
> - **f_id** is the index of the specified PRACH in the frequency domain (0 <= f_id < 8)
> - **ul_carrier_id** is the UL carrier used for Msg1 transmission (0 for NUL and 1 for SUL carrier)
> It unambiguously identifies which time-frequency resource was utilized by the **UE** to transmit the **RA** preamble. Mapped to **PDSCH**

> **Temporary C-RNTI** - used for scrambling of **Msg3** and it's retransmission in the **UL**.. with **DCI 0_0** In **DL** - **UE Contention Resolution Identity MAC Control Element** is send on **PDSCH** and scrambled with that **RNTI** with **DCI 1_0**.
> 
> It is later transoformed into **C-RNTI**, and **UE** will discard the **TC-RNTI** later. It's value can rango from 1 to 65519 (0x0001 to 0xFFEF).

> **Cell RNTI** - unique identifier used to identify **RRC Connection and scheduling**. Dedicated to a **particular UE**. Used by **gNB** to allocate **UE** with **UL** grants, **DL** assignments, **PDCCH** order, differentiate **UL** transmissions (e.g. **PUSCH**/**PUCCH**) of **one UE from others**. 
> 
> It can be understood as a "logical cell ID", however, while **gNB** assigns different **C-RNTI** values to different **UE**s, this is **NOT** true for **carrier aggregation**, where the same **C-RNTI** is applied to all serving cells.
> 
> Uses **DCI Format 0_0/0_1** on **UL** grants and **DCI Format 1_0/1_1** on **DL** assignments on **PDCCH**. It's value range from 1 to 65519 (0x0001 to 0xFFEF)

> **MCS-C-RNTI** - unique **UE** identification used for indicating and **alternative MCS table** for **PDSCH** and **PUSCH**.
> 
> **Modulation and Coding Scheme (MCS)** - used for scheduling data packets with **higher reliability** (e.g. for **URLCC**). For example **64QAM MCS** tables contains entries with lower spectral efficiency, which are introduced for both **DL/UL**. They can be configured either **semi-statically** or **dynamically**. Dynamic signaling of **MCS** tables are supported by configuring **UE** with **MCS-C-RNTI**.
> 
> For **DL**, if configured with **MCS-C-RNTI**, **UE** shall use **$I_{MCS}$** and **Table 5.1.3.1-3** from **TS 38.214** to determine the modulation order **$Q_m$** and target code rate $R$ used in **PUSCH** and **PDCCH**
> 
> For **UL**, if configured with **MCS-C-RNTI**, **UE** shall use **$I_{MCS}$** and **Table 5.1.3.1-3** from **TS 38.214** to determine the modulation order **$Q_m$** and target code rate $R$ used in **PDSCH** and **PDCCH**
> 
> It's value range from 1 to 65519 (0x0001 to 0xFFEF). **gNB** configures **UE** with **MCS-C-RNTI** via **RRC** configuration through **IE PhysicalCellGroupConfig**.

> **Configured Scheduling RNTI** - unique **UE** identification used for **Semi-Persistent Scheduling (SPS)** in the **DL** and configured grant in **UL**.. Activation and deactivation is done cia **PDCCH**, as well as retransmissions.
> 
> In **UL**, two types of configured grants are defined: **ConfiguredGrantType1** (**CS-RNTI** is only used for **re-transmissions** since **activation/deactivation** is done by **RRC** itself), **ConfiguredGrantType2** (all three **activation/decativation/retransmission**)
> 
> It's value range from 1 to 65519 (0x0001 to 0xFFEF). **gNB** configures **UE** with **CS-RNTI** via **RRC** configuration through **IE PhysicalCellGroupConfig**.

> **Semi-Persistent CSI RNTI** - used to activate/deactivate semi-persistent **CSI** reporting on **PUSCH**. It's value range from 1 to 65519 (0x0001 to 0xFFEF). **gNB** configures **UE** with **CS-RNTI** via **RRC** configuration through **IE PhysicalCellGroupConfig**.

> **Slot Format Indication RNTI** - used for the notification of slot format information over **PDCCH** and is generally assigned to a **group of UEs**. Uses **DCI 2_0** to dynamically change the slot format. Size of **DCI 2_0** is configurable by **RRC** layer up to **128 bits**.
> 
> It's value range from 1 to 65519 (0x0001 to 0xFFEF). **gNB** configures **UE** with **CS-RNTI** via **RRC** configuration through **IE SlotFormatIndicator**, which also carries information about the total **DCI** payload length, scrambled with **SFI-RNTI**.

> **Interruption RNTI** - used for the identification of **preemption** in the **DL**.. **gNB** can use it to preempt an ongoing **PDSCH** transmission to the **UE** with latency-critical transmission to another **UE**. It can also configure **UEs** to monitor interrupted transmissions using **INT-RNTI** on **PDCCH**.
> 
> If **UE** obtains interrupted transmission indication, it may assume that no useful information to that **UE** was carried by the **RE**, even if some of them were already scheduled to this **UE**.
> 
> It's value range from 1 to 65519 (0x0001 to 0xFFEF). Normally **gNB** assigns to a group of **UEs** using **IE DownlinkPreemption** within the **PDCCH-Config IE**.

> **TPC-PUCCH-RNTI** and **TPC-PUSCH-RNTI** - used for **PUSCH/PUCCH** power control via **DCI 2_2** format.
> 
> Both's value range from 1 to 65519 (0x0001 to 0xFFEF). **gNB** configures **UE** with **TPC-PUSCH/PUCCH-RNTI** via **RRC** configuration through **IE PhysicalCellGroupConfig**, which also carries information about the total **DCI** payload length, scrambled with **SFI-RNTI**.

> **TPC-STS-RNTI** - used for the identification to control power for **SRS** signals. It is useful for **UEs**, which don't have a link between **SRS** and **PUSCH** power control, either because of independent power control is desirable or the **UE** was configured with a serving cell without **PUSCH** or **PUCCH**.
> 
> It uses **DCI 2_3** for the transmission of a group of **TPC** commands for **SRS** transmission by one or more **UEs**. It's value range from 1 to 65519 (0x0001 to 0xFFEF). **gNB** configures the **UE** with **TPC-SRS-RNTI** using **IE PhysicalCellGroupConfig** via **RRC**.

> **Inactive RNTI** - used to identify the suspended **UE** context of a **UE** in **RRC_INACTIVE** state. It is being assigned to a specific **UE** that moves from **RRC_CONNECTED** to **RRC_INACTIVE** state with **SuspendConfig**. Network informs the **UE** in **SIB1** which **I-RNTI** to be used while resuming the connection: **fullI-RNTI** (if **useFullResumeID** is present in **SIB1**) or **shortI-RNTI**. Respectively, the **UE** sends **RRCResumeRequest1** or **RRCResumeRequest** while resuming the connection.
> 
> **fullI-RNTI** is a bit-string of length 40-bits while the **shortI-RNTI** is a bit-string of length 24-bits.


