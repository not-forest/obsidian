
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

> **BWP (Bandwidth Parts)** - Portion of total carrier bandwidth. They are used so that devices **don't have to receive the full BW**. Therefore it also decreases the **energy consumption**.
> One **UI** can be configured only up to **4 bandwidth parts**. Only one of them are **active at a time**. **UE** is not expected receive data outside of active bandwidth part.

> **RE (Resource Element)** - smallest physical resource (1 subcarrier/1 OFDM sym.).
> **RB (Resource Block)** - **12 subcarriers** in frequency domain only. There is no assosiated time duration of a resource block.