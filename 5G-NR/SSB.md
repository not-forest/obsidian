> **Synchronization Signal Block (SSB)** - helps with synchronization part. Consists of **PSS**, **SSS**, **PBCH** and **DRMS** for **PBCH**. Always has a size of **4 OFDM / 240 subcarriers**. All of above are always sent together as a single block in **BCH**. Allows for initial steps in **beamforming**.

> **Primary Synchronization Signal (PSS)** - provides timing estimates and has **one of 3** possible sequences.
> **Secondary Synchronization Signal (SSS)** - provides **cell ID** (one of 1008) and has **one of 336** possible sequences.
> **Physical Broadcast Channel (PBCH)** - contains the **MIB** and includes basic information to take next step - to decode **SIB1**.

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
