> **Demodulation Reference Signal (DMRS)** - used for channel estimation and demodulation of physical channels. Appers only in **PDSCH** resource blocks. Needed for channel estimation for decoding **PDSCH**. Flexibly allocated within the **OFDM** grid and dont have to be decoded itself.
> Configuration:
> 	- placement (2rd or 3th symbol of the slot);
> 	- length (if more than 1, several **DMRS** are seen on **OFDM** axis);
> 	- number of symbol per slot (up to 4). **More frequent DMRS helps track fast channels**;
> 	- 

## Mapping Type
- **Type A** - first **DMRS** is seen in symbol **2 or 3** of the slot;
- **Type B** - first **DMRS** is the first symbol in the allocation. **PDSCH** is partially mapped to the slot.

## DMRS Type

Specifies **DRMS density**, impacts number of orthogonal occurrences:
- **Type 1** - much denser in frequency. Up to **4 orthogonal signals** for single symbol and up to **8** for double symbol.
- **Type 2** - supports larger number of orthogonal signals (more suitable for **MU-MIMO**). Up to **6 orthogonal signals** for single symbol and up to **12** for double symbol. 

