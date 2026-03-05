> **Physical Uplink Control Channel** - carries **UCI** information downlink. May not span the whole **BW**.

## Coding

| **UCI** size | Channel Code     |
| ------------ | ---------------- |
| 1            | Repetition Code  |
| 2            | Simplex Code     |
| 3 - 11       | Reed Muller Code |
| >11          | Polar Code       |
> **Repetition Coding** - send the same bit **multiple times** to improve reliability. Receiver uses **majority voting** to decide on correct bit.
> 	*Pros* : very simple, good for noisy channels
> 	*Cons*: wastes **BW** (**Low Spectral Efficiency**), only for low data-rates
> **Simplex Code** - linear block code with high minimum distance. Detects a lot of errors with few parity bits.
> 	*Pros*: efficient error detection
> 	*Cons*: only one non-zero codeword per information bit.
> **Reed-Muller Code** - family of linear block codes based on **boolean functions**.
> 	*Pros*: good error correction, recursive and easy implemented in hardware.
> **Polar Code** - uses channel polarization to transform N copies into "good" and "bad" sub-channels
> 	*Pros*: low complexity encoding/decoding (especially with successive cancellations), excellent at short block lengths.

![[Screenshot 2026-03-05 103007.png]]

## Scheduling Requests (SR)

**UE** requests access to resources not yet scheduled for transmission. Done via **PUCCH** or **RACH**. then **gNB** sends the **DCI** so that **UE** can use parameters specified in it during **PUSCH** channel communication.

## CQI in UCI

Transmitted in response to **UCI**. Can be one-time, semi-periodic or periodic.

## ACK/NACK

Each block transmitted on **DL** must be acknowledged by **UI**, which determines if the block must be re-transmitted. When too many attempts have been made, the block is skipped.