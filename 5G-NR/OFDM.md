> **OFDM Orthogonal Frequency Division Multiplexing** - method to send data by **splitting high-rate stream into many slower substreams**. Each substream modulates a **subcarrier**. 
> 
> Each subcarrier is **orthogonal** so no interference happen if they overlap in frequency.
> 
> Used in both **UL** and **DL** in **5G-NR**. Only in **DL** in **LTE**.

> **CP-OFDM OFDM with Cycle Prefix** - copy of the end of the **OFDM** symbol added at the start. Eliminates **ISI (Inter Symbol Interference)** caused in **multipath**.

> **F-OFDM** - Filtered OFDM to reduce **OOBE (Out-Of-Band Emissions)**


| Slot Configuration 0             |      |      |      |       |        |
| -------------------------------- | ---- | ---- | ---- | ----- | ------ |
| Subcarrier Spacing [kHz]         | 15   | 30   | 60   | 120   | 240    |
| Symbol duration (no **CP**) [us] | 66,7 | 33,3 | 16,6 | 8,33  | 4,17   |
| Nominal max BW [MHz]             | 49,5 | 99   | 198  | 396   | 397,4  |
| Minimal scheduling interval [ms] | 1    | 0,5  | 0,25 | 0,125 | 0,0625 |
