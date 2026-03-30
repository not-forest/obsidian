
> **Numerology** - numerology is defined by **sub-carrier spacing (SCS)** and **CP** overhead. In LTE there is only one **SCS** of 15kHz, while **5G-NR** defines multiple of them.
> Any numerology **can be used independently of the frequency band**, although it is assumed not to use **low SCS** at **high carrier frequencies**
> Numerology is based on exponentially scalable sub-carrier spacing $\delta F = 2^\mu \times 15kHz$, with $\mu$ = {0, 1, 2, 4} for **PSS, SSS and PBCH** and {0, 1, 2, 3} for **other** channels.
> Normal **CP** is supported for all **SCS**, while the **Extended CP** is only supported for $\mu=2$

> **Physical Resource Block (PRB)** - 12 consecutive sub-carriers form a **PRB**, with up to **275 PRBs** supported on a carrier.
> **Resource Element (RE)** - defined as **one subcarrier** and one **OFDM symbol**

## 5G-NR Frame Features
- **10 ms** frames;
- **10 subframe** per frame (1 ms.);
- **variable number of slots** per subframe;
- **14 OFDM symbols** per slot;
- **variable number of OFDM symbols** per subframes;

| Slot Configuration 0             |      |      |      |       |        |
| -------------------------------- | ---- | ---- | ---- | ----- | ------ |
| Subcarrier Spacing [kHz]         | 15   | 30   | 60   | 120   | 240    |
| Symbol duration (no **CP**) [us] | 66,7 | 33,3 | 16,6 | 8,33  | 4,17   |
| Nominal max BW [MHz]             | 49,5 | 99   | 198  | 396   | 397,4  |
| Minimal scheduling interval [ms] | 1    | 0,5  | 0,25 | 0,125 | 0,0625 |

| Subcarrier Spacing [kHz] | Symbols/slot | Slots/frame | Slots/subframe |
| ------------------------ | ------------ | ----------- | -------------- |
| 15                       | 14           | 10          | 1              |
| 30                       | 14           | 20          | 2              |
| 60                       | 14           | 40          | 4              |
| 120                      | 14           | 80          | 8              |
| 240                      | 14           | 160         | 16             |
![[Pasted image 20260325141336.png]]

| Subcarrier Spacing [kHz] | Frequency        |                        |
| ------------------------ | ---------------- | ---------------------- |
| 15                       | **FR1**          |                        |
| 30                       | **FR1**          |                        |
| 60                       | **FR1**, **FR2** |                        |
| 120                      | **FR2**          |                        |
| 240                      | N/A              | **SSB** only. No data. |

## Numerology in Details Simulation

![[Pasted image 20260325141429.png]]
![[Pasted image 20260325141440.png]]
![[Pasted image 20260325141447.png]]
![[Pasted image 20260325141500.png]]
![[Pasted image 20260325141506.png]]
![[Pasted image 20260325141511.png]]

## Symbol Alignment

No matter the spacing the system is aligned due to the fact that the specification defines the **CP** length in a way, that all subcarrier spacing will cause proper alignment.

![[Pasted image 20260303163632.png]]

## Carrier

> **Carrier** - electromagnetic wave that carries **information**, which is provided by **modulation**. Has it's own **center frequency**.
> **Total Carrier** - entire allocated **frequency block** used by the operator. Not just one carrier but a band of frequencies centered around a frequency.

Example:  
If center frequency = 3.5 GHz  
Total BW = 100 MHz  
→ Frequencies used ≈ 3.45 GHz to 3.55 GHz

> **Subcarrier** - narrower carriers from the splitted total bandwidth. Used in systems with **OFDM**.
> **SCS (Subcarrier Spacing)** - frequency distance between two neighbor subcarriers.

Carrier is characterized by:
- **SCS**;
- number of resource blocks;
- starting resource;
- corresponds to a resource grid;

## Resource Grid

**5G-NR** supports multiple numerologies, so there is a multiple resource grids (one **RG** for each numerology and carrier):
- resource grid is defined as *one subframe* in time domain and *full carrier bandwidth* in the frequency domain;
- there are **set of resource grids one per DL and one per UL**;
- there is **one resource grid for a given antenna port, subcarrier spacing configuration and transmission direction**;

![[Pasted image 20260330134553.png]]

To derive a **RG** the following configuration parameters shall be known:
- **carrierBandwidth** - defines the width of the corresponding carrier in **number of PRB**s, which can be from **1 to 275**;
- **offsetToCarrier** - defines the starting position for subcarrier spacing configuration. Basically, this field provides offset in frequency domain between *lowest subcarrier of common RB 0 (**Point A**)* and the *lowest usable subcarrier on this carrier in number of PRB*s;

This information is either transmitted by **gNB** in **SIB1** or configured via dedicated **RRC** signaling.

|   |   |   |   |   |   |
|---|---|---|---|---|---|
|µ|SCS (kHz)|Number of OFDM symbols per Slot<br><br>N_symbslot_|Number of slots per frame<br><br>N_slotframe, µ_|Number of slots per subframe<br><br>N_slotsubframe, µ_|Number of symbols per subframe<br><br>N_symbsubframe, µ_|
|0|15|14|10|1|14|
|1|30|14|20|2|28|
|2|60|14|40|4|56|
|3|120|14|80|8|112|
|4|240|14|160|16|224|
## Resource Blocks

> **RE (Resource Element)** - smallest physical resource (1 subcarrier/1 OFDM sym.).
> **RB (Resource Block)** - **12 subcarriers** in frequency domain only. There is no assosiated time duration of a resource block.

Unlike **LTE**, **NR** defines the **RB** only in frequency domain, allowing for a lot of flexibility in the time domain.

|   |   |   |
|---|---|---|
|µ|SCS|Bandwidth per RB = 12 x SCS|
|0|15 kHz|180 kHz|
|1|30 kHz|360 kHz|
|2|60 kHz|720 kHz|
|3|120 kHz|1440 kHz|
|4|240 kHz|2880 kHz|

> **Bandwidth Adaptation (BA)** - allows the **NR** carrier to support multiple numerologies across the carrier bandwidth, by configuring **BWP**s. Different **UE**s may be configured with different **BWP**s based on the need and their capability. Therefore there must be a common reference point from which the relative position of a **BWP** can be determined (**Point A**)
> 
> **Point A** - serves as common reference point of **Resource Block Grids (RBG)**. For all subcarrier spacings, the lowest subcarrier of **Common RB#0** is referred to as **Point A**.

After decoding **SSB**, the **UE** doesn't automatically know the starting **PRB** of the **BWP**. It needs to determine the position of **Point A** using one of the following parameters:
- **offsetToPointA** - represents frequency offset between **Point A** and the lowest subcarrier of the **CRB**, which **overlaps with the start of the SSB**. It is provided as part of **SIB1**;
- **absoluteFrequencyPointA** - represents absolute frequency location of **Point A**. Is is provided as part of **SIB1** (not true for **UL** with **TDD** - the same value provided for **DL** must be used. In case of **FDD** or **SUL**, the network separately configures this fields)

## Common Resource Blocks

> **Common Resource Block (CRB)** - **RB**s numbered from 0 and upwards in the frequency domain for each **SCS** configuration, where **CRB#0** holds **Point A** in the lower subcarrier, and all other **CRB**s are aligned with **Point A**.

![[Pasted image 20260330140616.png]]

The relation between **CRB number** in frequency domain and **RE (k,l)** is given by:
$$
n_{CRB} = floor(k \div 12)
$$

The *k* is defined relative to **Point A**, such that *k = 0* corresponds to the subcarrier centered around **Point A**.

## Physical Resource Blocks

> **Physical Resource Block (PRB)** - **RB**s used for actual transmission/reception. A set of **PRB**s form a **BWP**.

![[Pasted image 20260330141048.png]]

## Virtual Resource Blocks

> **Virtual Resource Block (VRB)** - resource allocation for **PUSCH/PDSCH** using **PDCCH** is provided in terms of **VRB**s. They are then mapped onto **PRB**s

## Bandwidth Parts

> **BWP (Bandwidth Parts)** - Portion of total carrier bandwidth. They are used so that devices **don't have to receive the full BW**. Therefore it also decreases the **energy consumption**.
> 
> One **UI** can be configured only up to **4 bandwidth parts**. Only one of them are **active at a time**. **UE** is not expected receive data outside of active bandwidth part. In case of **SUL** there can be up to **4** additional **UL BWP**s on the **SUL** carrier.

To enable a reasonable **UE** battery consumption, only one **BWP** in the **DL** and one in the **UL** are active at a given moment of time on an active serving cell:
- active **BWP** defines **UE**s operating **BW** within the cell's operating **BW**;
- all other **BWP**s that the **UE** is configured with being deactivated;
- on deactivated **BWP**s, **UE** does not transmit or receive any data;
- for **TDD**, a **BWP-pair** (active **UL BWP** and active **DL BWP**) must have **the same center frequency**.

With **Bandwidth Adaptation (BA)**, the **UE** can:
- use narrower **BWP** for monitoring **control channels** and to receive **small/medium** amount of data or to save power;
- larger **BWP** (or even full carrier **BW**) can be used for large amounts of data to be scheduled;

![[Pasted image 20260330143702.png]]

More info [How LTE Stuff Works?: 5G NR: Bandwidth Part](https://howltestuffworks.blogspot.com/2019/11/5g-nr-bandwidth-part.html)
## Unused Resource Blocks

> **Unused Resource Block (URB)** - Some **RB**s are not used due to the fact that **guardbands** are needed at both edges of **RF carrier**, to meet **OOB** emission requirements.

Minimum guardband (in kHz) for each channel **BW** and **SCS** for **FR1**

|         |           |            |            |            |            |            |            |            |            |            |            |             |
| ------- | --------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ---------- | ----------- |
| **SCS** | **5 MHz** | **10 MHz** | **15 MHz** | **20 MHz** | **25 MHz** | **30 MHz** | **40 MHz** | **50 MHz** | **60 MHz** | **80 MHz** | **90 MHz** | **100 MHz** |
| 15 kHz  | 242.5     | 312.5      | 382.5      | 452.5      | 522.5      | 592.5      | 552.5      | 692.5      | NA         | NA         | NA         | NA          |
| 30 kHz  | 505       | 665        | 645        | 805        | 785        | 945        | 905        | 1045       | 825        | 925        | 885        | 845         |
| 60 kHz  | NA        | 1010       | 990        | 1330       | 1310       | 1290       | 1610       | 1570       | 1530       | 1450       | 1410       | 1370        |

Minimum guardband (in kHz) for each channel **BW** and **SCS** for **FR1**

|   |   |   |   |   |
|---|---|---|---|---|
|**SCS**|**50 MHz**|**100 MHz**|**200 MHz**|**400 MHz**|
|60 kHz|1210|2450|4390|NA|
|120 kHz|1900|2420|4900|9860|

#### Example

40 MHz chanel **BW**. From **38.101**, **SCS** of 15 kHz gives us 216 **RB**s, which should yield 108 **RB**s, when **SCS** 30 kHz is used? - but according to **38.101**, **SCS** of 30 kHz defines only 106 **RB**s, where two of them (first and last) are unused.

![[Pasted image 20260330142610.png]]

## Maximum **BW** in **NR**

The largest possible carrier **BW** in **NR** is limited to **275 RB**s of any **SCS**:

|         |                            |
| ------- | -------------------------- |
| SCS     | Max. per-carrier Bandwidth |
| FR1     | FR1                        |
| 15 kHz  | 50 MHz                     |
| 30 kHz  | 100 MHz                    |
| 60 kHz  | 100 MHz                    |
| FR2     | FR2                        |
| 60 kHz  | 200 MHz                    |
| 120 kHz | 400 MHz                    |

Maximum transmission **BW** configuration (in **RB**s) for **FR1**

|   |   |   |   |   |   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
|**SCS**|**5 MHz**|**10 MHz**|**15 MHz**|**20 MHz**|**25 MHz**|**30 MHz**|**40 MHz**|**50 MHz**|**60 MHz**|**80 MHz**|**90 MHz**|**100 MHz**|
|15 kHz|25|52|79|106|133|160|216|270|NA|NA|NA|NA|
|30 kHz|11|24|38|51|65|78|106|133|162|217|245|273|
|60 kHz|NA|11|18|24|31|38|51|65|79|107|121|135|

Maximum transmission **BW** configuration (in **RB**s) for **FR2**

|         |            |             |             |             |
| ------- | ---------- | ----------- | ----------- | ----------- |
| **SCS** | **50 MHz** | **100 MHz** | **200 MHz** | **400 MHz** |
| 60 kHz  | 66         | 132         | 264         | NA          |
| 120 kHz | 32         | 66          | 132         | 264         |
