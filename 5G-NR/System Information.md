> **System Information (SI)** - in **NR** consists of **MIB** and a number of **SIB**s, which are divided into **Minimum SI** and **Other SI**
> **Minimum SI** - carries basic information required for initial access and for acquiring any other **SI**. Consists of **MIB + SIB1**. Any **UE** to be allowed on a cell, it must have acquired the contents of **Minumum SI** from that cell.
> **Other SI** - all other **SIB**s not broadcasted in **Minimum SI**. This information is broadcasted only when **explicitly requested by UE**s

More information: [How LTE Stuff Works?: 5G NR: System Information](https://howltestuffworks.blogspot.com/2019/10/5g-nr-system-information.html)
## Summary

| SIB Type | SIB Contents                                                                                                                                                                                                                                                                                                                                         |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [[MIB]]  | **SFN**, cricical information for the reception of **SIB1**, cell barred flag, intra frequency reselection flag, etc.                                                                                                                                                                                                                                |
| [[SIB1]] | Cell selection information, **PLMN** list, cell ID, tracking area code, RAN area code, cell reserved flag, connetion establishment failure control information, **SI** scheduling information, serving cell's common **UL/DL** configuration, **SUL** configuration, **SSB** scheduling information, cell-specific **TDD UL/DL** configuration, etc. |
| [[SIB2]] | Cell re-selection information, mainly related to the serving cell.                                                                                                                                                                                                                                                                                   |
| [[SIB3]] | Information about the serving frequency and intra-frequency neighboring cells relevant for cell re-selection                                                                                                                                                                                                                                         |
| [[SIB4]] | Information about other NR frequencies and intra-frequency neighboring cells relevant for cell re-selection                                                                                                                                                                                                                                          |
| [[SIB5]] | Information about **E-UTRA** frequencies and **E-UTRA** neighboring cells relevant for cell re-selection                                                                                                                                                                                                                                             |
| [[SIB6]] | **ETWS** primary notification                                                                                                                                                                                                                                                                                                                        |
| [[SIB7]] | **ETWS** secondary notification                                                                                                                                                                                                                                                                                                                      |
| [[SIB8]] | **CMAS** warning notification                                                                                                                                                                                                                                                                                                                        |
| [[SIB9]] | Information related to **GPS** time and **Coordinated Universal Time (UTC)**                                                                                                                                                                                                                                                                         |

## Acquisition

![[Pasted image 20260407113650.png]]

For acquiring an **SI** message, **UE** shall determine start of **SI window** (radio frame and slot number) for the concerned **SI** message as follows:
1. For required **SI** message, determine the number *n* which corresponds to the order of entry in the list of **SI** messages configured by **schedulingInfoList** within **si-SchedulingInfo** in **SIB1**;
2. Determine the integer value *x* such that **x = (n - 1) * w**, where w is the **si-WindowLength;
3. The start **SFN** of the **SI** window determined by **SFN mod T = FLOOR(x/N)**, where **T** is the **si-Periodicity** of the concerned **SI** message and **N** is the number of slots in a radio frame.
4. The starting slot of the **SI window** in the **SFN** is given by **x mod N**;

![[Pasted image 20260407114246.png]]

- **UE** validates the obtained **SIB** by comparing parameters such as **PLMN-Identity** included in the **PLMN-IdentityInfoList**, the **systemInformationAreaID** and the **valueTag**. If received and stored parameters are identical, **UE** considers the stored **SIB**s as valid for the cell.
- **UE** shall delete any stored version of a **SIB** after **3 hours** from the moment it was successfully confirmed as valid.
- Cell specific **SIB**s are only applicable within a cell that provides the **SIB**;
- Area specific **SIB**s are applicable within the are referred to as **SI** area, which consists of one or several cells and is identified by **SI Area ID** (**systemInformationAreaID**);

## SI Change Indication and PWS Notification

Like in **LTE**, **SI Modification and indication** procedure is done via **modification period**, which is defined by **SFN** values, for which **SFN mod m = 0**, where **m** is the number of radio frames comprising the modification period. It is configurable by **SIB1** via **modificationPeriodCoeff**.

![[Pasted image 20260407115228.png]]

- **UE** applies previous **SI**s until applying updated **SI**s after receiving a change notification after **modification period**.
- **UE** receives indications about **SI modifications** and/or **PWS (Public Warning System)** notifications using **Short Message** transmitted with **P-RNTI** over **DCI**. **DCI 1_0** scrambled with **P-RNTI** is used for this purpose:

|   |   |
|---|---|
|**Bit**|**Short Message**|
|Bit 1 (MSB)|**systemInfoModification**   <br>If set to 1: indication of a BCCH modification other than SIB6, SIB7 and SIB8|
|Bit 2|**etwsAndCmasIndication**   <br>If set to 1: indication of an ETWS primary and/or secondary notification and/or a CMAS notification|
|Bit 3-8|Not used in 3GPP release 15.6 version, and shall be ignored by UE if received|
- if **ETWS/CMAS** notification is received, the **UE** should immediately re-acquire **SIB1** and based on scheduling information - **SIB6/7/8**;

`The PHY layer imposes a limit to the maximum size a SIB can take. The maximum SIB1 size is 2976 bits. If UE cannot determine the full contents of the minimum SI of a cell by receiving from that cell, the UE shall consider that cell as barred.`