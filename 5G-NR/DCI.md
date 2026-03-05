> **Downlink Control Information (DCI)** - contains control information to **schedule PDSCH, PUSCH**. Carried in **PDCCH** channel. Holds information about time/frequency (to find where the data for user is), modulation, coding scheme, HARQ related data, antenna ports and number of layers, **CSI** request. Must be decoded by **UE** before obtaining **DL** data and transmit **UL** data.

## Formats

> **Fallback Format** - less flexible scheduling, **smaller control overhead**, limited functionality.

| **PDCCH** format | Description                                                                               | Is fallback?    |
| ---------------- | ----------------------------------------------------------------------------------------- | --------------- |
| Format0_0        | Scheduling **PUSCH** in one cell.                                                         | fallback format |
| Format0_1        | Scheduling **PUSCH** in one cell.                                                         |                 |
| Format1_0        | Scheduling **PDSCH** in one cell.                                                         | fallback format |
| Format1_1        | Scheduling **PDSCH** in one cell.                                                         |                 |
| Format2_0        | Notify a group of **UEs** of the **slot format**                                          |                 |
| Format2_1        | Notify a group of **UEs** resources where they may assume no transmission for the **UE**. |                 |
| Format2_2        | **TPC** commands for **PUCCH** and **PUSCH** channels                                     |                 |
| Format2_3        | **TPC** commands for **SRS** transmissions.                                               |                 |
## DCI Processing Chain

DCI processing chain:
- **CRC** - CRC scrambled with **RNTI**
- **Polar Encoding** - **forward error correction (FEC)** method that transforms (or _polarizes_) communication channels into:
	- **Very reliable sub‑channels**
	- **Very unreliable sub‑channels**
	Then:
	- The information bits are placed on the **good channels**
	- The frozen bits (known 0s) are placed on the **bad channels**
- **Rate Matching** - Rate matching - adjusts amount of coded bits to **fit the available physical resources**.

> **Scrambling** - randomizes coded bits to remove patterns. This is made to **decrease interference** (removing long streams of just '0's or '1's). Done bitwise with **pseudo-random** sequence (similar to stream ciphers but pseudo random).
> Output: scrambled bitstream.
> 
> **Modulation** - converts scrambled bits into **complex symbols** for transmission:
> 	- QPSK (2 bit/symbol)
> Output: Complex constellation symbols
> 
> **Resource Mapping** - maps each symbol onto **time-frequency grid (OFDM symbols (time) * subcarriers (frequency))**. First mapped to **virtual resource blocks (VRB)**, then to **physical resource blocks (PRB)**.
>  Output: Resource grid.

## PDCCH

> **Physical Downlink Control Channel (PDCCH)** - carries **DCI** information downlink. May not span the whole **BW**. Supports device specific **beamforming**. 
