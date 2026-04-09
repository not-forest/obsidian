> **Synchronization Signal Block (SSB)** - helps with synchronization part. Consists of **PSS**, **SSS**, **PBCH** and **DRMS** for **PBCH**. Always has a size of **4 OFDM / 240 subcarriers**. All of above are always sent together as a single block in **BCH**. Allows for initial steps in **beamforming**.

> **Primary Synchronization Signal (PSS)** - provides timing estimates and has **one of 3** possible sequences.
> **Secondary Synchronization Signal (SSS)** - provides **cell ID** (one of 1008) and has **one of 336** possible sequences.
> **Physical Broadcast Channel (PBCH)** - contains the **MIB** and includes basic information to take next step - to decode **SIB1**.

Below is a time-frequency structure of **SSB**. The **m-sequence** is of length *127* and is mapped on to *127* subcarriers:

![[Pasted image 20260401105302.png]]

- **PSS, SSS and PBCH** are always together in one **SSB** and followed in the same pattern format;
- each **SSB** occupies **4 OFDM** symbols in time domain and spread over **240 subcarriers (20 RBs)** in frequency domain.

## Frequency Domain

![[Pasted image 20260407103324.png]]

- location of **PBCH DMRS** depends upon **PCI** $v = N_{ID}^{cell} mod 4$.
- **synchronization raster indicates frequency positions of the SSB** that can be used by **UE** for system acquisition when explicit signalling of the **SSB** position is not present.

> **Synchronization Raster** - in **NR**, based on the frequency band, a set of possible frequency locations for **SSB** are defined, where **UE** only need to search for **SSB** on the raster.

- **synchronization raster and SCS** of the **SSB** are defined separately for each band (5.4.3. 38.104);

|   |   |   |
|---|---|---|
|**NR Operating Band(s)**|**SS Block**<br><br>**SCS**|**SS Block Bandwidth**<br><br>**(20 RBs = 240 SCs)**|
|n1, n2, n3, n5, n7, n8, n12, n20, n25, n28, n34, n38, n39, n40, n41, n50, n51, n66, n70, n71, n74, n75, and n76|15 kHz|3.6 MHz (= 240 * 15 kHz)|
|n5, n41, n66, n77, n78, and n79|30 kHz|7.2 MHz (= 240 * 30 kHz)|
|n257, n258, n260 and n261|120 kHz|28.8 MHz (= 240 * 120 kHz)|
|240 kHz|57.6 MHz (= 240 * 240 kHz)|

- **SSB** is not **RB** aligned with the resource block grid - network informs the **UE** about the exact frequency-domain (relative) position on the carrier via **MIB** and **SIB1**.
- the same **CP** length and **SCS** must be used for the **PSS, SSS, PBCH and PBCH DMRS**.
## Time Domain

- periodically transmitted with a periodicity of 5, 10, 20, 40, 80 or 160 ms;
- **longer SSB periodicities** -> better energy performance, **shorter** -> faster cell search;
- **UE** assumes a default periodicity of **20 ms** during initial cell search or idle mode mobility;

> **SS Burst Set** - set of **SSB**s used to enable **beam-sweeping** for **PSS/SSS and PBCH**, where each **SSB** potentially can be transmitted on a different beam. **SS-burst set** is always confined to a *5ms* window and is either located in the first or second half of 10ms radio frame.
> 
> Network sets **SSB** periodicity via **RRC** parameter **ssb-PeriodicityServingCell** which may take values {5, 10, 20, 40, 80, 160} [ms].

|   |   |
|---|---|
|**Carrier Frequency**|**Max. No. of Candidate SSBs** <br><br>**within SS Burst Set (****L****max****)**|
|fc ≤ 3 GHz*|4|
|3 GHz* < fc ≤ 6 GHz|8|
|fc > 6 GHz|64|
- within a 5ms half-frame, the starting **OFDM** symbol index for a candidate **SSB** within **SS burst set** depends upon **SCS** and carrier frequency/band (4.1. 38.213):

|   |   |   |   |   |
|---|---|---|---|---|
|**SCS**|**OFDM starting symbols of the candidate SSBs**|**f****c** **≤ 3 GHz*** <br><br>Lmax = 4|**3 GHz*** **< f****c** **≤ 6 GHz** <br><br>Lmax = 8|**f****c** **> 6 GHz** <br><br>**L****max** **= 4**|
|CaseA:<br><br> 15 kHz|{2,8} + 14n|n = 0,1   {2,8,16,22}|n = 0, 1, 2, 3   {2,8,16,22,30,36,<br><br>44,50}|NA|
|CaseB: <br><br> 30 kHz|{4,8,16,20} + 28n|n = 0    {4,8,16,20}|n = 0, 1   {4,8,16,20,32,36,<br><br>44,48}|NA|
|CaseC:<br><br> 30 kHz|{2,8} + 14n|n = 0, 1     {2,8,16,22}|n = 0, 1, 2, 3   {2,8,16,22,30,36,<br><br>44,50}|NA|
|CaseD:<br><br>   120 kHz|{4,8,16,20} + 28n|NA|NA|n=0,1,2,3,5,6,7,8,10,11,12,13,15,<br><br>16,17,18<br><br>{4,8,16,20 … 508,512,520,524}|
|CaseE:<br><br>   240 kHz|{8,12,16,20,32,36,40,44} + 56n|NA|NA|n=0,1,2,3,5,6,7,8<br><br>{8,12,16,20 … 480,484,488,492}|

- without **beam forming** the network can only transmit one **SSB** and hence there can only be one **SSB** starting position.
![[Pasted image 20260407104501.png]]

## Information about Active SSBs in SS Burst Set via SIB1

![[Pasted image 20260407104556.png]]

- network informs **UE**s about which **SSB**s are being transmitted using **ssb-PositionsInBurst** within **ServingCellConfigCommonSIB**;
- **inOneGroup** within **ssb-PositionBurst** informs the **UE** which **SSB**s are being transmitted (0 - not transmitted, 1 - transmitted). Interpretation of this field varies depending upon operating band:
	- $f_c$ <= 3 GHz - maximum number of **SSB**s within **SS Burst Set** equals to **4**, so **4 bits** are enough. **UE** ignored the 4 **MSB**s;
	- 3 GHz < $f_c$ <= 6 GHz - maximum number is **8**, so **8 bits** are enough;
	- $f_c$ > 6 GHz - **64**. For this case an additional group **groupPresence** is defined to indicate which groups are active. All **64 SSB**s are divided into **8 groups**. The below procedure must be used for parsing:

![[Pasted image 20260407105214.png]]

## **SSB** Numerology

**SSB** can apper in one sub-frame more times depending on **SCS**, and it's **burst** can also be adjusted, with **SSB Burst Periodicity** of: 5, 10, 20, 40*, 80* or 160* ms.
\* - may not be found by **UE**, but can be used for other purposes. 

|                         | **SCS** [kHz] | Max number of **SSBs** | Max number of **SSBs** | Max number of **SSBs** |
| ----------------------- | ------------- | ---------------------- | ---------------------- | ---------------------- |
| Carrier Frequency [GHz] |               | f_c < 3 GHz            | 3 GHz < f_c < 6 GHz    | 6 GHz < f_c            |
| Case A                  | 15            | 4                      | 8                      |                        |
| Case B                  | 30            | 4                      | 8                      |                        |
| Case C                  | 30            | 4                      | 8                      |                        |
| Case D                  | 120           |                        |                        | 64                     |
| Case E                  | 240           |                        |                        | 64                     |
