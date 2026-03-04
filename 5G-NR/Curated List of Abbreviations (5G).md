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
- **CIR** - Channel Impulse Response
- **PAPR** - Peak-to-Average Power Ratio
- **PA** - Power Amplifier
- **[[DCI]]** - Downlink Control Information
- **MCS** - Modulation and Coding Scheme (*decides the modulation type and coding rate*)
- **TPC** - Transmit Power Control (***gNB** controls how much transmit power **UE** must use when sending: **PUSCH, PUCCH, SRS, PRACH**)
- **RNTI** - Radio Network Temporary Identifier (*identifier that **gNB** uses to address **UE** on physical channel.*)
- **TA** - Timing Advance (*command sent by **gNB** to "delay" the **UE** so that it's **UL** transmission is aligned with **gNB***)

- **[[OFDM]]** - Orthogonal Frequency Division Multiplexing (*modulation technique to send data over orthogonal subcarriers in parallel*)
- **CP-OFDM** - OFDM with Cyclic Prefix (***OFDM** with **CP** appended on each symbol at the start to prevent inter symbol interference.*)
- **SC-OFDM** - Single Carrier OFDM (*Obtained in PUSCH chain during transform precoding stage.*)
- **DCI** - Downlink Control Information (*Information to control transfer sent from **gNB** to **UE***)
- **RRC** - Radio Resource Control (*protocol layer that controls connection between **gNB** and **UE** and it's states.*)

- **SSB, SS Block** - Synchronization Signal Block (*Special transmission sent by **gNB** to **UE** for synchronization purposes, detection and basic system info.)

#### Blocks
- **MIB** - Master Information Block (**Contains system bandwidth info, subcarrier spacing, system frame number, control resource configuration.**)
- **SIB** - System Information Block
- **TB** - Transport Block
- **CB** - Code Block (*Smaller blocks of splitted Transport Blocks*)

- **VRB** - Virtual Resource Block (*Logical grouping of subcarriers after frequency domain processing*)
- **PRB** - Physical Resource Block (*Smallest allocation unit in frequency-time grid, that **gNB** can assign to **UE** (12 subcarriers * 14 OFDM symbols)*)

- **RB** - Resource Block
- **REG** - Resource Element Group (*1 **RB**/1 symbol*)
- **CCE** - Control Channel Element (*6 **REGs***)
#### Duplexing
- **FDD** - Frequency Division Duplex (*Duplexing method that separate frequency bands for UL and DL*)
- **TDD** - Time Division Duplex (*Duplexing method that uses same frequency for both UL and DL, but separated in time slots.*)

#### Encoding
- **LDPC** - Low-Density Parity-Check Coding (*Adds redundancy to correct errors at the receiver.*)

#### Signals
- **RS** - Reference Signal (*Sent by **gNB** so **UE** can estimate radio channel, perform equalization, measure signal quality*). Cell specific RS is not present in 5G.
	- **DMRS** - Demodulation RS (*allows to estimate the channel for demodulation of **PDSCH** or **PUSCH***)
	- **PTRS** - Phase Tracking RS (*allows to correct phase noise*)
	- **CSI-RS** - Channel State Information RS (*Channel quality measurements and feedback*)
	- **SRS** - Sounding RS (*uplink reference signal from **UE** to **gNB***)
- **PSS** - Primary Synchronization Signal (*Allows to detect the cell, provides symbol timing*)
- **SSS** - Secondary Synchronization Signal (*Helps determine the Physical Cell ID, provides frame timing, indicates duplex mode and other info.*)
#### Channels
- **[[PDSCH]]** - Physical Downlink Shared Channel (*Carries user data **gNB** to **UE**.*)
- **PDCCH** - Physical Downlink Control Channel (*Carries control info downlink*)
- **PBCH** - Physical Broadcast Channel. (*Carries **MIB***)

- **[[PUSCH]]** - Physical Uplink Shared Channel (*Carries user data from **UE** to **gNB***)
- **PUCCH** - Physical Uplink Control Channel (*Carries control info uplink*)
- **PRACH** - Physical Random Access Channel (*Used for initial access*)