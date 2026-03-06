> **Channel Sounding** - process in which the transmitter transmits **known RSs** allowing the receiver to measure the channel's characteristics (frequency response, delay spread, ...). **5G-NR** relies havily on **beamforming** to proper communication, therefore a lot of data must be included to allow proper beamforming.

Channel-related information can be obtained in two possible ways depending on what is used:
- **TDD** - both receiver and transmitter **can use the same frequency** to communicate, the downlink frequency can be estimated based on this.
- **FDD (also can work for TDD)* - both **cannot use the same frequency**, therefore information has to be estimated from another side and sent.
For both cases, reference signals are used.

## Downlink Sounding

> **Channel State Information Reference Signal (CSI-RS)** - used for **DL** sounding. Allows for interference estimation and multi-point transmission (**CoMP**). Limited to a bandwidth part. Supports for up to **32** antenna ports.
> Configurations:
> 	- **density** (1 or 1/2 - transmitted every **RB** or every 2 **RB**. Can also be 3 for **TRS** but only **single antenna port**)
> 	- scheduling:
> 		- **periodic** - transmitted every N slots;
> 		- **semipersistent** - the same as periodic, but **can be switched on and off**;
> 		- **aperiodic** - triggered only by **DCI** when required;
> 	- **zero-power type** - **guarantees** that nothing has to be sent in specific places on frequency-time domain. All non-zero data in those locations must be interpreted as interference result then. By default we would rather expect **NZP** type.

## UE Channel Estimation

**UE** does not send a whole channel estimate, but rather a set of **precoding matrix indexes** that provide the best **beamforming**. Those indexes are selected from **codebook** of matrixes defined in the standard. 
- **Codebook Type 1** - smaller, cheaper to send. Single user only usually;
- **Codebook Type 2** - more extensive. Useful for **MU-MIMO**;

## CSI-RS Reporting on UL

| Configuration          | Periodic Reporting | Semi-Persistent Reporting                | Aperiodic CSI Reporting |
| ---------------------- | ------------------ | ---------------------------------------- | ----------------------- |
| Periodic CSI-RS        | **PUCCH**          | **PUCCH** or **DCI** triggered **PUSCH** | **PUSCH**               |
| Semi-Persistent CSI-RS |                    | **PUCCH** or **DCI** triggered **PUSCH** | **PUSCH**               |
| Aperiodic CSI-RS       |                    |                                          | **PUSCH**               |

## Uplink Sounding

> **Sounding Reference Signal (SRS)** - sent by **UE** itself. Sent over by 1, 2 or 4 antenna port and 1, 2 or 4 **OFDM** symbols. Comb structure by 2 or 4 combs. Can be anywhere between **1 ... 272 RBs**.
> Configurations:
> - **I offset**
> - number of symbols
> - comb structure coefficient

> **Comb Structure** - frequency-domain pattern, where reference signals ocur every n-th subcarrier, and the gaps are filled for data.


