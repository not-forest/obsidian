> **Master Information Block (MIB)** - first system information decoded by the **UE** to obtain relevant information about the cell. 
> 
> **MIB** is mapped on **PBCH** and transmitted with a periodicity of **80 MS** and is repeated within the **80 ms**.
> 
> **MIB** provides the **UE** with parameters required to acquire **SIB1**, more specifically, information required for monitoring of **PDCCH** for scheduling **PDSCH** that carries **SIB1**.

## Information carried within **MIB**

**MIB** contents are the same and is transmitted over all **SSB**s within the **SS** burst set. Below is the all information carried by **MIB**:

![[Pasted image 20260401111105.png]]

![[Pasted image 20260401111215.png]]
![[Pasted image 20260401111237.png]]

- **System Frame Number (SFN)** - takes *10-bits* and ranges from 0 to 1023, where first **6 MSB bits** are part of **MIB** and the rest are conveyed in the **PBCH** transport block as part of channel coding.
- **subCarrierSpacingCommon (1-bit)** - Subcarrier spacing used for **SIB1**, **Msg-2/4** for initial access, paging and broadcast of **SI-messages**. For **FR1**: indicates either 15 kHz or 30 kHz (set/unset). For **FR2**: 60 kHz or 120 kHz.
- **SSB Subcarrier Offset (4-5 bits)** - frequency domain offset between **SSB** and the overall resource block grid in number of subcarriers. Only 4 LSB bits are carried by **MIB** parameter.
- **DRMS-TypeA-Position (1-bit)** - defines the position of first **DMRS** symbol for the first **PDSCH** and **PUSCH**. For both **UL/DL** the first **DRMS** symbol can be either be set to **3rd** or **2nd** position.
- **pdcch-ConfigSIB1 (byte)** - used to configure **CORESET#0** and search **space#0** (of the initial **BWP**), which is the most important information the **UE** should know in order for it to monitor for scheduing **PDCCH** of **SIB1**.
	- This **CORESET** configuration also **activates and provides the initial BWP in the DL**;
- **cellBarred (1-bit)** - indicates whether or not **UE**s in the cell are allowed to access the cell. (set - deny)
- **intraFreqReselection (1-bit)** - controls cell selection/reselection to intra-frequency cells when the highest ranked cell is barred (above bit)
- **SSB Index (0 OR 3 bits)** - Carried in **PBCH** payload, not in **MIB**. Index of the **SSB** within **SSB** burst set, which is important information for frame synchronization. The maximum candidate **SSB**s (Lmax) depend on carrier frequency:
	- **SSB Index for <6 GHz freq (Lmax=8)** - each one of **8 PBCH** scrambling sequences (7.3.3.1. 38.211) used for **PBCH** scrambling implicitly indicates 1-out-of-8 **SSB indices**. In this case additional 3-bits are not required to indicate the index;
	- **SSB Index for >6 GHz (Lmax=64)** - each one of **8 PBCH** scrambling sequences (7.3.3.1. 38.211) used for **PBCH** scrambling implicitly indicates 3-LSB bits of **SSB index**. To represent **64 SSB indices**, another 3-bits are required (MSB) and carrier in **PBCH** payload.
- **half-frame bit (1-bit)** - set to **'0'** if **SSB** is transmitted in the first half-frame of the 10 ms frame or set to **'1'** if in the second half-frame. For synchronization purposes.

More information there: [How LTE Stuff Works?: 5G NR: PBCH and Master Information Block (MIB)](https://howltestuffworks.blogspot.com/2019/10/5g-nr-pbch-and-master-information-block.html)