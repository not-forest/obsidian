Current note is based on 3GPP-TS 28.552 2025-12. May have to be updated after the release of newer versions.

![[3GPP-TS-28.552-2025-12.pdf]]

# Scope

This note specifies performance measurements for 5G networks based on the above specification. It concludes the most important topics of the document, including network slicing and OM counters. This note is only related to L1 (PHY).
## Performance indicators

> **Performance indicators** - aggregated performance-related data over a group of **NF**s obtained via specific performance management systems. Usually is provided in form of **subcounters** or **filters** as so:
> \<familyName>.\<measurementName>.\<Subcounter> 
> \<familyName>.\<measurementName>.\<Subcounter1>.<..>.\<SubcounterN>
#### Examples
- no Subcounter: DRB.PacketLossRateUI
- one Subcounter: RRC.ConnEstabAtt.Cause | MM.HoPrepInterReqMLB.ResOpt
- two Subcounters: MM.HoExeInterFailMLB.UeCtxtRelCmd.Cause

> **Filters** - used when performance measurement is required for one or more specific criteria:
> \<familyName>.\<measurementName>_\<Filter1>...

#### Examples
- no Filters: DRB.PdcpF1DelayDl 
- single Filter with single value:DRB.PdcpF1DelayDl_QOS2 
- single Filter with multiple values: DRB.PdcpF1DelayDl_QOS1|3-9 
- single Filter with aggregated values: DRB.PdcpF1DelayDl_QOS[2-5]

## Radio Resource Utilization

> **DL total PRB Usage** - percentage **%** of usage og **Physical Resource Blocks (PRBs)** on the **DL** for any purpose. Usually split into subcounters per:
> - **PLMN ID** - if **gNB** serves multiple operators;
> - **S-NSSAI** - in **5G** network slicing (one per **eMBB, URLLC, mMTC**);
> - **QoS** - **Non-GBR, GBR, Delay-critical GBR**;
> ![[Pasted image 20260313153305.png]]
> It is a single integer value from **0 to 100**. The measurement name has the form **RRU.PrbDl**, which indicates the **DL PRB** Usage for all traffic, or optionally **RRU.PrbDl.PLMN**, where the **PLMN** identifies the **PLMN ID**, or optionally **RRU.PrbDl.SNSSAI**, where the **SNSSAI** identifies the **S-NSSAI**, or optionally **RRU.PrbDl.SNSSAI.ResType**, where the **ResType** identifies the resource type of 5G QoS characteristics, or optionally **RRU.PrbDl_UEType**, where the UE type refers to allowed values of **uECellBarredAccess** of TS 28.541 clause 4.4.1.
> 
> **Valid for packet switched traffic**. Used to monitor the load of the radio physical layer.

> **UL total PRB Usage - percentage **%** of usage og **Physical Resource Blocks (PRBs)** on the **UL** for any purpose. Really the same as above, but for **UL**..

> **Distribution of DL Total PRB Usage** - distribution of samples with **total usage** in **%** on the downlink with different ranges. Useful to understand if **cell is under high load or not**. Usually split into subcounters per:
> - **PLMN ID**
> - **S-NSSAI**
> - **QoS**
> Distribution of total **PRB** usage is calculated in **time-frequency domain only**. Depending on the value of  the sample, the counter is increased. Number of samples during one measurement is defined by **vendor**.
> Defined as a set of integers (numbers of samples) with **DL** total **PRB** % usage in range represented by that bin:
> - **RRU.PrbTotDlDist.Bin**, which Bin indicates the distribution of DL PRB Usage for all traffic which is vendor specific;
> - **RRU.PrbTotDlDist.PLMN**, where PLMN identifies the PLMN ID,
> - **RRU.PrbTotDlDist.QoS**, where the QoS identifies the target quality of service class
> - **RRU.PrbTotDlDist.SNSSAI**, where SNSSAI identifies the S-NSSAI.

> **Distribution of UL Total PRB Usage** - distribution of samples with **total usage** in **%** on the uplink with different ranges. The same as above, but for **UL**..