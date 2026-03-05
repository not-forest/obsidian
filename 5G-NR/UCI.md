> **Uplink Control Information (UCI)** - limited compared to **DCI**. Includes **ACK/NAK**, **CQI (Channel Quality Indicators)** and **SR (Scheduling Request)**. May mix those in any way as needed. Carried on a **PUCCH** channel, but can also be transmitted on **PUSCH** if it is scheduled by **gNB**.

## Formats

| **PUCCH** format | Length in **OFDM** symbols | Number of bits | Modulation     | Description                                                                                     |
| ---------------- | -------------------------- | -------------- | -------------- | ----------------------------------------------------------------------------------------------- |
| Format0          | 1 - 2                      | <= 2           | N/A            | For **HARQ** or **SR**                                                                          |
| Format1          | 4 - 14                     | <= 2           | BPSK/QPSK      | Same as 0 but for **longer transmission**. Support **FH (Frequency Hopping)**                   |
| Format2          | 1 - 2                      | > 2            | QPSK           | Several **HARQs** or **HARQ + CSI (+SR)**                                                       |
| Format3          | 4 - 14                     | > 2            | pi/2-BPSK/QPSK | Same as 2 but longer transmission. Support **FH (Frequency Hopping)**. Largest capacity of all. |
| Format4          | 4 - 14                     | > 2            | pi/2-BPSK/QPSK | Same as 3 with code multiplexing (several **UEs**)                                              |
