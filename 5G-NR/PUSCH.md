>**PUSCH (Physical Downlink Shared Channel)** - Carries user data **UE**. to **gNB** Can also carry **SIB (System Information Block)**. Limited to **4 layers** and **single codeword**.

Encoding:
- **CRC** - detect errors in entire **TB**. Appended before segmentation
- **CB** Segmentation and **CB-CRC** - splits **TB** to many **CBs** and appends local CRC per **CB**. Improves **HARQ**.
- **LDPC** - Low-Density Parity-Check coding adds redundancy to correct errors at the receiver. Each **CB** independently. Outputs coded bits.
- Rate matching - adjusts amount of coded bits to **fit the available physical resources**.
- **CB** concatenation - all **CBs** are concatenated into one bit stream

## Physical Layer Downlink Transmition Chain

> **Scrambling** - randomizes coded bits to remove patterns. This is made to **decrease interference** (removing long streams of just '0's or '1's). Done bitwise with **pseudo-random** sequence (similar to stream ciphers but pseudo random).
> Output: scrambled bitstream.
> 
> **Modulation** - converts scrambled bits into **complex symbols** for transmission:
> 	- pi/2 - BPSK (1 bit/symbol, rotated) - **only when Transform Precoding is used.**
> 	- QPSK (2 bit/symbol)
> 	- 16QAM (4 bit/symbol)
> 	- 64QAM (6 bit/symbol)
> 	- 256QAM (8 bit/symbol)
> Output: Complex constellation symbols
> 
> **Layer Mapping** - prepares symbols for **MIMO (Multiple-Input Multiple-Output)** multi-antenna transmission. Symbols can be mapped to layers, where each layer gets part of data. **Maximum of 4 layers**.
> 
> **Transform Precoding (optinal)** - uses **DFT** to turn **OFDM** modulation into **SC-OFDM**. Upling supports both regular and single carrier **OFDM**. When **SC-OFDM** is used, the overall **PAPR** decreases, which increases battery life of **low power UE**.
> 
> **Precoding** - maps **layers to antenna ports**:
> 	- **Non-codebook based** - **UE** determines precoding matrix based on **downlink** measurements based on **CSI-RS**.
> 	- **Codebook based** - **UE** gets precoding matrix from **gNB**.
> 
> **Multi-Antenna Precoding** - prepares each layer for transmission on multiple antennas. Uses **precoding matrices** to:
> 	- Focus energy toward the **UE** (**Beamforming**) when **one layer** mapped to **multiple antennas**;
> 	- Allow multiple layers without interference when **multiple layers** are mapped between **multiple antennas** (**Spacial Multiplexing**);
>  Output: One symbol per antenna.
>  **Controlled by:** **DCI (Downlink Control Information)**
> 
>  **Resource Mapping** - maps each symbol onto **time-frequency grid (OFDM symbols (time) * subcarriers (frequency))**. First mapped to **virtual resource blocks (VRB)**, then to **physical resource blocks (PRB)**.
>  Output: Resource grid.
>  **Controlled by:** **RRC (Radio Resource Control)**

> **Non-codebook Based Precoding**:
> - Precoding matrix is determined from **CSI-RS** on downlink;
> - **UE** must apply precoding matrix to **SRS**
> - **gNB** selects subset of beamforming vectors;
> - **UE** applies this subset to **PUSCH** transmission.
> **Codebook Based Precoding**:
> - **gNB** determines precoding matrix based on: **TDD** (downlink measurements) OR **SRS** (uplink measurements);
> - Sends this matrix to **UE**.