**5G-NR (New Radio)** is the global standard for the air interface of **5th-generation (5G)** mobile networks, developed by the 3rd Generation Partnership Project (3GPP).

## Use Cases
- **eMBB** (enhansed Mobile Broadband) - high data rates.
- **mMTC** (massive Machine Type Communications) - large number of connections.
- **URLLC** (Ultra-Reliable and Low Latency Communications) - low latency.
## Requirements
- **support new use cases**;
- support for *fixed*, *mobile*, *wireless* and *satellite* access technology;
- support **large number** of connected devices;
- **1 ms latency**;
- **increased bandwidth efficiency**;
- **energy efficiency** and battery power **optimizations**;
- scalable and customizable networks;
## 5G vs LTE

|                      | LTE                                                                  | 5G                                                             |
| -------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------- |
| Use Cases            | **MBB** (Mobile Broadband), **MTC** (Machine Type Communications)    | **eMBB**, **mMTC**, **URLLC**                                  |
| Latency              | **~10 ms**                                                           | **< 1 ms**                                                     |
| Band                 | **< 6 GHz**                                                          | **< 60 GHz**                                                   |
| Bandwidth            | **< 20 MHz**                                                         | **< 100 MHz below 6 GHz Band**; **< 400 MHz above 6 GHz Band** |
| Subcarrier Spacing   | **Fixed** (15 KHz)                                                   | **Variable** (15 - 240 KHz)                                    |
| Frequency Allocation | **UE** (User Equipment) needs to decode the whole **BW** (Bandwidth) | Use of **BWP** (Bandwidth Parts)                               |
| "Always on" signals  | Used in: Cell specific **RS**, **PSS**, **SSS**, **PBCH**            | Avoided, except for: **SS Block**                              |

> **Carrier** - electromagnetic wave that carries **information**, which is provided by **modulation**. Has it's own **center frequency**.
> **Total Carrier** - entire allocated **frequency block** used by the operator. Not just one carrier but a band of frequencies centered around a frequency.
> **Subcarrier** - narrower carriers from the splitted total bandwidth. Used in systems with **OFDM**.
> **SCS (Subcarrier Spacing)** - frequency distance between two neighbor subcarriers.
## 5G Deployment Scenarios

| Scenario                                 | Frequency        | Bandwidth | Antenna Configuration |
| ---------------------------------------- | ---------------- | --------- | --------------------- |
| Rural                                    | 700 MHz          | 20 MHz    | 64                    |
| Extremely long distances                 | 700 MHz          | 40 MHz    |                       |
| mMTC                                     | 700 MHz, 2,1 GHz |           | 4                     |
| Dense urban, rural, high speed           | 4 GHz            | 200 MHz   | 256                   |
| Highway connected cars                   | 6 GHz            | 200 MHz   | 256                   |
| Dense urban, high speed, indoors hotspot | 30 GHz           | 1 GHz     | 256                   |
| High speed, indoors hotspot              | 70 GHz           | 1 GHz     | 256                   |

## Frequencies

Standard defines two **FR (Frequency Ranges):

| FR  | Frequency   | Duplex Mode         |
| --- | ----------- | ------------------- |
| FR1 | < 6 GHz     | **TDD** and **FDD** |
| FR2 | 23 - 53 GHz | **TDD**             |
5G-NR waveforms are **CP-OFDM**.

## Contents
#### Overall
- [[Curated List of Abbreviations (5G)]]
- [[Network Structure]]
- [[OFDM]]
#### PHY
- [[Frame Structure]]
- [[Propagation Model]]
- [[Power Control]]
- [[Beam Forming and Management]]
- [[Channel Sounding & Estimation]]
- [[PDCCH]]
- [[PDSCH]]
- [[PUSCH]]
- [[PUCCH]]
- [[PBCH]]
- [[MIMO]]
- [[DCI]]
- [[UCI]]
- [[DMRS]]
- [[SSB]]
- [[5G Performance Measurements (PHY)]]

## Knowledge Base

- [5G Explained Matlab](https://www.mathworks.com/videos/series/5g-explained.html)
- [ShareTechnote](https://www.sharetechnote.com/html/5G/Handbook_5G_Index.html)