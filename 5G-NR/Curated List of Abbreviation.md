#### Global
- **[[5G-NR]]** - 5th Generation New Radio
- **3GPP** - Third Generation Partnership Project
- **LTE** - Long-Term Evolution (*4G older technology*)
- **RAT** - Radio Access Technology
- **RAN** - Radio Access Network
- **UE** - User Equipment (*Any device with access to mobile network in cellular systems*)
- **gNB** - next generation Node B (*Base station in 5G networks*)
- **BW** - Bandwidth (*Range of frequencies available for transmitting a signal*)
- **BWP** - Bandwidth Parts (*Portion of total carrier bandwidth in 5G*)
- **SCS** - Subcarrier Spacing (*Frequency distance between two neighbor subcarriers*)
- **OOBE** - Out-Of-Band Emission
- **ISI** - Inter Symbol Interference
- **CRC** - Cyclic Redundancy Check (*Just a regular CRC (24-bits). Per channel.*)
- **HARQ** - Hybrid Automatic Repeat Request (*Error control method that uses forward error correction + automatic repeat request.*)
- **MIMO** - Multiple-Input Multiple-Output (*Matrix-like antenna technology*)

- **[[OFDM]]** - Orthogonal Frequency Division Multiplexing (**)
- **CP-OFDM** - OFDM with Cyclic Prefix (**)
- **DCI** - Downlink Control Information
- **RRC** - Radio Resource Control

- **SSB, SS Block** - Synchronization Signal Block (*Special transmission sent by **gNB** to **UE** for synchronization purposes, detection and basic system info.)

#### Blocks
- **MIB** - Master Information Block (**Contains system bandwidth info, subcarrier spacing, system frame number, control resource configuration.**)
- **SIB** - System Information Block
- **TB** - Transport Block
- **CB** - Code Block (*Smaller blocks of splitted Transport Blocks*)

- **VRB** - Virtual Resource Block (*Logical grouping of subcarriers after frequency domain processing*)
- **PRB** - Physical Resource Block (*Smallest allocation unit in frequency-time grid, that **gNB** can assign to **UE** (12 subcarriers * 14 OFDM symbols)*)
#### Duplexing
- **FDD** - Frequency Division Duplex (*Duplexing method that separate frequency bands for UL and DL*)
- **TDD** - Time Division Duplex (*Duplexing method that uses same frequency for both UL and DL, but separated in time slots.*)

#### Encoding
- **LDPC** - Low-Density Parity-Check Coding (*Adds redundancy to correct errors at the receiver.*)

#### Signals
- **RS** - Reference Signal (*Sent by **gNB** so **UE** can estimate radio channel, perform equalization, measure signal quality*). Cell specific RS is not present in 5G.
	- **DMRS** - Demodulation RS
	- **PTRS** - Phase Tracking RS
	- **CSI-RS** - Channel State Information RS
	- **SRS** - Sounding RS
- **PSS** - Primary Synchronization Signal (*Allows to detect the cell, provides symbol timing*)
- **SSS** - Secondary Synchronization Signal (*Helps determine the Physical Cell ID, provides frame timing, indicates duplex mode and other info.*)
#### Channels
- **[[PDSCH]]** - Physical Downlink Shared Channel (*Carries user data **gNB** to **UE**.*)
- **PDCCH** - Physical Downlink Control Channel (*Carries control info uplink*)
- **PBCH** - Physical Broadcast Channel. (*Carries **MIB***)

- **PUSCH** - Physical Uplink Shared Channel (*Carries user data from **UE** to **gNB***)
- **PUCCH** - Physical Uplink Control Channel (*Carries control info uplink*)
- **PRACH** - Physical Random Access Channel (*Used for initial access*)