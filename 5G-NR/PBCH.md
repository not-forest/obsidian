> **Physical Broadcast Channel** - sent to all **UE** in a cell and contains information about **MIB**. Transmitted inside the **SSB** alongside with synchronization signals and **DRMS** for **PBCH**. This information alltogether allows **UE** to access the cell properly. The only channel that can work with **SCS** of 240 kHz.

## Processing Chain

> **Payload Generation** - generates a payload from **MIB**. It includes: part of **system frame number**, **SCS** information, **SSB** configuration and some other configuration bits related to cell.
> Output: 32-bit stream
> 
> **Scrambling** - randomizes coded bits to remove patterns. This is made to **decrease interference** (removing long streams of just '0's or '1's). Done bitwise with **pseudo-random** sequence (similar to stream ciphers but pseudo random).
> Output: scrambled bitstream.
> 
> **CRC** - detect errors in entire **TB**. 
> Output: scrambled bitstream + CRC.
> 
> **Interleaving + Polar encoding** - before coding, bits are **reordered** (interleaved) and then **forward error correction (FEC)** method that transforms (or _polarizes_) communication channels into:
	- **Very reliable sub‑channels**
	- **Very unreliable sub‑channels**
	Then:
	- The information bits are placed on the **good channels**
	- The frozen bits (known 0s) are placed on the **bad channels**
   Output: codeword
>
> **Rate Matching** - Rate matching - adjusts amount of coded bits to **fit the available physical resources**.
> Output: codeword
>
> **Scrambling** - again!?
> Output: scrambled bitstream.
> 
> **Modulation** - converts scrambled bits into **complex symbols** for transmission:
> 	- QPSK (2 bit/symbol)
> Output: Complex constellation symbols
> 
> **Resource Mapping** - maps each symbol onto **time-frequency grid (OFDM symbols (time) * subcarriers (frequency))**. First mapped to **virtual resource blocks (VRB)**, then to **physical resource blocks (PRB)**.
>  Output: Resource grid.

## MIB

The contents of **MIB** described here [[MIB]]. **MIB** is constant over each 8-frames, while the rest of **PBCH** content is not constant, so it is not a part of **MIB**.

## Other **PBCH** content

| **SSB** index   | **SSB** time domain index. Only applicable for **FR2**               |
| --------------- | -------------------------------------------------------------------- |
| Half Frame Bit  | is **SSB** located in the first half or the second half of the frame |
| **SFN** - 4 LSB | 4 LSB if **SFN                                                       |
| **CRC**         | 24-bit CRC                                                           |
