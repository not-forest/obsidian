> **Downlink Control Information (DCI)** - contains control information to **schedule PDSCH, PUSCH**. Carried in **PDCCH** channel. Holds information about time/frequency (to find where the data for user is), modulation, coding scheme, HARQ related data, antenna ports and number of layers, **CSI** request. Must be decoded by **UE** before obtaining **DL** data and transmit **UL** data.

## Formats

> **Fallback Format** - less flexible scheduling, **smaller control overhead**, limited functionality. Avoids uncertainties (e.g. during **RRC** reconfiguration)

Multiple **DCI** formats are defined to meet different needs of different sizes:

| **PDCCH** format | Description                                                                               | Is fallback?    |
| ---------------- | ----------------------------------------------------------------------------------------- | --------------- |
| Format0_0        | Scheduling **PUSCH** in one cell.                                                         | fallback format |
| Format0_1        | Scheduling **PUSCH** in one cell.                                                         |                 |
| Format1_0        | Scheduling **PDSCH** in one cell.                                                         | fallback format |
| Format1_1        | Scheduling **PDSCH** in one cell.                                                         |                 |
| Format2_0        | Notify a group of **UEs** of the **slot format**                                          |                 |
| Format2_1        | Notify a group of **UEs** resources where they may assume no transmission for the **UE**. |                 |
| Format2_2        | **TPC** commands for **PUCCH** and **PUSCH** channels                                     |                 |
| Format2_3        | **TPC** commands for **SRS** transmissions.                                               |                 |

### DCI Format 0_0

Used for **UL** resource allocation (scheduling grants) for **PUSCH**, and it is a fallback **DCI** format. The below format defines information transmitted with it, and those bits are scrambled with: **C-RNTI, CS-RNTI, MCS-C-RNTI or TC-RNTI**

![[Pasted image 20260327144833.png]]

**Note1**: The **time domain resource assignment** network indication the **entry** to choose from **PUSCH time domain allocation table**, which can be:
- default **PUSCH** time domain allocation based on **Table 6.1.2.1.1-2 in 38.214**;
- **RRC** configured using **IE PUSCH-TimeDomainResourceAllocationList** within **PUSCH-Config**;

**Note2**: If **New Data Indicator (NDI)** value is toggled as compared to previous transmission for the same **HARQ** process, a new transmission is triggered, else, a re-transmission is triggered.

For the case of **configured grant (PDCCH DCI 0_0/0_1 scrambled with CS-RNTI)**, if **NDI** value is toggled, re-transmission is still triggered.

**Note3**: **Transmit Power Control (TPC)** command in **DCI 0_0/0_1** are used to control **PUSCH** transmit power. It's purpose is to **maintain sufficient energy-per-bit**, which is driven by the **QoS** requirement of certain service, at the same time ensuring that the interference is at the acceptable level.

The mapping of 2 **TPC** bits to actual power adjustments are defined in the below table:
![[Pasted image 20260327145719.png]]

**Note4**: This bit is reserved when **TC-C-RNTI** is used for scrambling and the corresponding **PUSCH** is always on the same **UL** carrier as the previous transmission of the same **TB**.

### DCI Format 0_1

Used for **UL** resource allocation (scheduling grants) for **PUSCH**. The below format defines information transmitted with it, and those bits are scrambled with: **C-RNTI, CS-RNTI, MCS-C-RNTI, TC-RNTI or SP-CSI-RNTI**

![[Pasted image 20260327150044.png]]

**Note1**: This bit is 0 only if **UE** is not configured with **SUL** or it is configured with **SUL**, but only carrier transmitting **PUCCH** in the cell is configured for **PUSCH** transmission. Otherwise it will always stay set at 1.

**Note2**: Indicates the **BWP** in which the current **frequency resources** provided by this **DCI** are located. It takes **0, 1 or 2** depending upon the number of **UL BWP**s configured by the **RRC**, excluding the initial **UL BWP**. **UE** can ignore this bit if it does not support active **BWP** change via **DCI**.

**Note3**: The **time domain resource assignment** network indication the **entry** to choose from **PUSCH time domain allocation table**, which can be:
- default **PUSCH** time domain allocation based on **Table 6.1.2.1.1-2 in 38.214**;
- **RRC** configured using **IE PUSCH-TimeDomainResourceAllocationList** within **PUSCH-Config**;

Here **L** corresponds to the number of entries in the higher layer parameter *pusch-TimeDomainAllocationList*, if the higher layer parameter is configured, otherwise a number of entries in the default table.

**Note4**: It takes 0 bits for **non-codebook** based transmissions or for **codebook** based transmissions for **single port antennas**. Otherwise if this field is present, the number of bits depends upon the number of **layers** and maximum **RRC** configured rank, which is configured by *maxRank** within the **IE PUSCH-Config**.

**Note5:** Used for triggering **aperiodic SRS** resource sets. When **SUL** is configured, additional bit is required for **non-SUL/SUL** indication (first bit)

**Note6**: If set - **UL-SCH** shall be transmitted on the **PUSCH**, or not otherwise when unset. **PUSCH** without **UL-SCH** could be useful if just **UCI** is being requested by network using this **DCI** (No user **UL** data).

### DCI Format 1_0

Used for allocating **DL** resources for **PDSCH**, and it is a fallback format. Can be scrambled with: **C-RNTI, CS-RNTI, MCS-C-RNTI or TC-RNTI**, which will set it into the following format:

![[Pasted image 20260327153816.png]]

If scrambled with **C-RNTI** for **PDCCH order** (**PDCCH** order is sent by **gNB** upon **DL** data arrival during **RRC_CONNECTED** when **UL** is **Out-of-Sync (OOS)**. When **UE** receives **PDCCH** order, it triggers a **random access procedure**):

![[Pasted image 20260327153959.png]]

If scrambled with **P-RNTI** for paging and notification for **SI** modifications **ETWS/CMAS** puposes, the following structure is used:

![[Pasted image 20260327154315.png]]

If scrambled with **SI-RNTI** for **broadcast of System Information (SI)**:

![[Pasted image 20260327154401.png]]

If scrambled with **RA-RNTI** for **Random Access Response (RAR)**:

![[Pasted image 20260327154621.png]]

**Note1**:  Short message field can be transmitted on **PDCCH** by using **P-RNTI** with or without associated *paging* message. Bit-1 (MSB) is **set**, indicating **System Information Modification** (other than **SIB6, SIB7, SIB8**). Bit-2 if **set**, indicates **ETWS** notification and/or **CMAS** notification. The rest of the bits are reserved.

**Note2**:  Indicates the entry to choose from **PDSCH** time domain table, which is either configured via **RRC** using **UE pdsch-TimeDomainAllocationList** or default table defined in **5.1.2.1.1 from 38.214**.

**Note3**:  If **New Data Indicator (NDI)** value is toggled as compared to previous transmission for the same **HARQ** process, a new transmission is triggered, else, a re-transmission is triggered.

For the case of **configured grant (PDCCH DCI 1_0/1_1 scrambled with CS-RNTI)**, if **NDI** value is toggled, re-transmission is still triggered.

**Note4**:  **Transmit Power Control (TPC)** command in **DCI 1_0/1_1** are used to control **PUCCH** transmit power. It's purpose is to **maintain sufficient energy-per-bit**, which is driven by the **QoS** requirement of certain service, at the same time ensuring that the interference is at the acceptable level.

The mapping of 2 **TPC** bits to actual power adjustments are defined in the below table:
![[Pasted image 20260330121223.png]]

**Note5**:  **PDSCH-to-HARQ** feedback timing infication - informs **UE** about the timing of **HARQ** feedback (in *slots*) relative to **PDSCH** reception. Field can be mapped to {1, 2, 3, 4, 5, 6, 7, 8}

For example, if the **UE** detects a **DCI 1_0** scheduling a **PDSCH** reception ending in slot _n_, the UE provides corresponding **HARQ-ACK** information in a **PUCCH** transmission within slot _n_+_k_, where _k_ is a number of slots as indicated by this field.

**Note6**:  **UL/SUL** indicator for **PRACH** - if the value **Random Access Preamble Index** is not all zeroes and if the **UE** is configured with **SUL**, this field indicates whether **PRACH** should be sent on **UL** or **SUL**, otherwise it is reserved.

**Note7**:  **SS/PBCH Index** - If the value of **Random Access Preamble Index** is not all zeroes, this field indicates the **SS/PBCH** that shall be used to determine the **RACH** occasion for the **PRACH** transmission, otherwise it is reserved.

**Note8**:  **PRACH Mask Index** - If the value of **Random Access Preamble Index** is not all zeroes, this field indicates the **RACH** occasion associated with the **SS/PBCH** indicated by **SS/PBCH Index** for the **PRACH** transmission, otherwise it is reserved.

### DCI Format 1_1

Used for allocating **DL** resources for **PDSCH**. Can only be scrambled with: **C-RNTI, CS-RNTI, MCS-C-RNTI**, which will set it into the following format (others are not supported):

![[Pasted image 20260330131635.png]]

**Note1**: Indicates the **BWP** in which the current frequency resources are located. Takes values of {0, 1, 2} depending upon the number of **DL BWP**s configured by **RRC**, excluding the initial **DL BWP**. If **UE** does not support active **BWP** change via **DCI**, this field is ignored

**Note2**: Number of bits depends up on the size of **DL BWP** as well as the type of resource allocation configured by **RRC** within **IE PDSCH-Config**: **resourceAllocationType0**, **resourceAllocationType1**, **dynamicSwitch**.

**Note3**: Network indicates the entry to choose from **PDSCH** time domain allocation table. This table is either configured by **RRC** using **IE PDSCH-TimeDomainResourceAllocationList** or defaulting to table **6.1.2.1.1-2** from **38.214**.

Here **L** is the number of entries in the higher layer parameter **pdsch-TimeDomainAllocationList** if configured, otherwise **L** is the number of entries in the default table.

**Note4**: **VRB-toPRB Mapping** - this field is present only if resource allocation **Type0** is configured or if interleaved **VRB-to-PRB** mapping is not configured. If **Type1** is used, it would mean interleaved mapping when *set*, or non-interleaved when *clear*.

**Note5**: **Rate Maching Indicator** of values {0, 1, 2} according to higher level parameters **rateMatchPatternGroup1**, **rateMatchPatternGroup2**, where MSB is used to indicate **rateMatchPatternGroup1** and LSB - **rateMatchPatternGroup2**

**Note6**: Only present in case of **dynamic HARQ** codebook. If present, takes *4-bits* if more than one serving cell are configured in the downlink, else *2-bits*.

**Note7**: Used for triggering **aperiodic SRS** resource sets. When **SUL** is configured, additional bit is required for **non-SUL/SUL** indication (first bit)

### DCI Format 2_0

**DCI 2_0** is a **slot format indicator**, which is used to notify about slot format information. It is used to dynamically change slot format, and it is scrambled with **SFI-RNTI**. It carries the following information:
[SFI1, SFI2, ...., SFIn]

The size of **DCI 2_0** is configurable by **RRC** layer up to *128-bits*.

### DCI Format 2_1

**DCI 2_1** is used to notify about the **PRB**s and **OFDM** symbols, where **UE** may assume no transmission is intended for the **UE** for preemption purposes. It is scrambled with **INT-RNTI**. It carries the following information:
[PEI1, PEI2, ... PEIn]

The size of **DCI 2_1** is configurable by **RRC** layer up to *126-bits*, where each **Pre-emption Indication** is *14-bits*.

### DCI Format 2_3

**DCI 2_3** is used for transmission of a group of **TPC** commands for **SRS** transmissions by one or more **UE**s. Along with **TPC** command, an **SRS** request may also be transmitted. It is scrambled with **TPC-SRS-RNTI**. It carries the following information:
[BN1, BN2, ... BNn]

It is applicable for **UL** carriers of serving cells, where **UE** is not configured for **PUSCH/PUCCH** transmissions.
## DCI Processing Chain

DCI processing chain:
- **CRC** - CRC scrambled with **RNTI**
- **Polar Encoding** - **forward error correction (FEC)** method that transforms (or _polarizes_) communication channels into:
	- **Very reliable sub‑channels**
	- **Very unreliable sub‑channels**
	Then:
	- The information bits are placed on the **good channels**
	- The frozen bits (known 0s) are placed on the **bad channels**
- **Rate Matching** - Rate matching - adjusts amount of coded bits to **fit the available physical resources**.

> **Scrambling** - randomizes coded bits to remove patterns. This is made to **decrease interference** (removing long streams of just '0's or '1's). Done bitwise with **pseudo-random** sequence (similar to stream ciphers but pseudo random).
> Output: scrambled bitstream.
> 
> **Modulation** - converts scrambled bits into **complex symbols** for transmission:
> 	- QPSK (2 bit/symbol)
> Output: Complex constellation symbols
> 
> **Resource Mapping** - maps each symbol onto **time-frequency grid (OFDM symbols (time) * subcarriers (frequency))**. First mapped to **virtual resource blocks (VRB)**, then to **physical resource blocks (PRB)**.
>  Output: Resource grid.

## PDCCH

> **Physical Downlink Control Channel (PDCCH)** - carries **DCI** information downlink. May not span the whole **BW**. Supports device specific **beamforming**. 
