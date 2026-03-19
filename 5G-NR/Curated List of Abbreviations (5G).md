#### Global
- **[[5G-NR]]** - 5th Generation New Radio
- **3GPP** - Third Generation Partnership Project
- **LTE** - Long-Term Evolution (*4G older technology*)
- **RAT** - Radio Access Technology
- **RAN** - Radio Access Network
- **TRP** - Transmission Reception Point
- **UE** - User Equipment (*Any device with access to mobile network in cellular systems*)
- **gNB** - next generation Node B (*Base stations in 5G networks*)
- **BW** - Bandwidth (*Range of frequencies available for transmitting a signal*)
- **BWP** - Bandwidth Parts (*Portion of total carrier bandwidth in 5G*)
- **SCS** - Subcarrier Spacing (*Frequency distance between two neighbor subcarriers*)
- **OOBE** - Out-Of-Band Emission
- **ISI** - Inter Symbol Interference
- **CRC** - Cyclic Redundancy Check (*Just a regular CRC (24-bits). Per channel.*)
- **HARQ** - Hybrid Automatic Repeat Request (*Error control method that uses forward error correction + automatic repeat request.*)
- **MIMO** - Multiple-Input Multiple-Output (*Matrix-like antenna technology*)
- **MU-MIMO** - Multi-User MIMO
- **CoMP** - Coordinated Multi-Point (*multiple cells coordinate their transmission and receptions to improve signal quality*)
- **CIR** - Channel Impulse Response
- **PAPR** - Peak-to-Average Power Ratio
- **PA** - Power Amplifier
- **SI** - System Information (*Common information that tells **UE** how o operate in the cell.*)
- **MCS** - Modulation and Coding Scheme (*decides the modulation type and coding rate*)
- **MCS** - Mobile Communication System
- **FRMCS** - Future Railway Mobile Communication System
- **TPC** - Transmit Power Control (***gNB** controls how much transmit power **UE** must use when sending: **PUSCH, PUCCH, SRS, PRACH**)
- **RNTI** - Radio Network Temporary Identifier (*identifier that **gNB** uses to address **UE** on physical channel.*)
- **TA** - Timing Advance (*command sent by **gNB** to "delay" the **UE** so that it's **UL** transmission is aligned with **gNB***)
- **NF** - Network Function
- **CORESET** - Control Resource Sets (***OFDM** resources where **PDCCH** is transmitted*)
- **CQI** - Channel Quality Indicator (*Allows making decision about beamforming and scheduling*)
- **SR** - Scheduling Request (*Allows **UE** to ask for scheduling*)
- **FH** - Frequency Hopping (*Technique where carrier frequency changes over time. Reduces interference, better for security*)
- **MCT** - Minimum Codeword Transform (*Minimum Hamming distance of a code*)
- **SFN** - System Frame Number
- **PMI** - Precoding Matrix Indicator (*Precoding matrix index, reported index, that tells **gNB** about **beamforming***)
- **5GC** - 5G Core
- **5GCN** - 5G Core Network
- **BBU** - Base Band Unit (*Used in O-RAN in case of 4G*)
- **IQ** - In-phase Quadrature (*Time domain digital signal. Result of **IFFT** from **OFDM***)
- **RRM** - Radio Resource Measurements
- **RSRP** - Reference Signal Received Power
- **RSRQ** - Reference Signal Received Quality
- **SNR** - Signal to Noise Ratio
- **SINR** - Signal to Interference plus Noise Ratio
- **BER** - Bit Error Rate
- **BLER** - Block Error Rate
- **DTX** - Discontinuous Transmission (*Mechanism where transmitter stops transmitting some OFDM symbols intentionally to save power, reduce interference, etc.*)
- **DRX** - Discontinuous Reception (*Mechanism where receiver stops receiving some OFDM symbols intentionally to save power, reduce interference, etc.*)
- **C-RNTI** - Cell Radio-Network Temporary Identifier
- **SUL** - Supplementary Uplink (*Additional associated **UL** channel, which works differently than carrier aggregation. Usually located on lower frequency bands, allowing for better data rates on "bad conditions". For example at the edge of the cell, where higher frequencies lead to huge data losses*)
- **SUD** - Supplementary Downlink (*Not defined specifically, but can be created by carrier-aggregation, since the specification allows more **DL** carriers than **UL**, some of them can be used as a **SUD** carriers. Common usage is: combination of **paired** and **unpaired** spectra aggregation, to increase capacity and data rates*)
- **SFI** - Slot Format Indicator (*Mechanism that signals current uplink-downlink allocation to a group of devices monitoring **DCI**. It says about the type of slot-format*)

- **AWGN** - Additive White Gaussian Noise

- **[[OFDM]]** - Orthogonal Frequency Division Multiplexing (*modulation technique to send data over orthogonal subcarriers in parallel*)
- **CP-OFDM** - OFDM with Cyclic Prefix (***OFDM** with **CP** appended on each symbol at the start to prevent inter symbol interference.*)
- **SC-OFDM** - Single Carrier OFDM (*Obtained in PUSCH chain during transform precoding stage.*)
- **DCI** - Downlink Control Information (*Information to control transfer sent from **gNB** to **UE***)
- **UCI** - Uplink Control Information (*Information to control transfer sent from **UE** to **gNB***)
- **RRC** - Radio Resource Control (*protocol layer that controls connection between **gNB** and **UE** and it's states.*)

- **[[SSB]], SS Block** - Synchronization Signal Block (*Special transmission sent by **gNB** to **UE** for synchronization purposes, detection and basic system info.)

- **BBI** - Base Band Infrastructure
- **BBAP** - Base Band Air Partitioning (*Part of L1 Lower section, which receives transfer from L1 Upper and instructs **BBSC** to transmit/receive/process data*)\
- **BBSC** - Base Band Sector Carrier (*Transforms between frequency-domain channel data and per-antenna time-domain **IQ** sample streams*)

- **CBB** - Concurrency Building Blocks (*Model programming framework for cross-platform interface definitions*)
- **EMCA** - Ericsson Many Core Architecture (*Proprietary architecture model*)
- **LCEP** - Logical Connection Endpoint
- **LDM** - Local Data Memory
- **MTD** - Measurement Test Debug
- **AxC** - Antenna Carrier (*Combination of every antenna and every carrier combination*)
- **PLMN ID** - Public Land Mobile Network Identifier (**uniquely identifies a mobile network operator)
- **MCC** - Mobile Country Code (*3 digits*)
- **MNC** - Mobile Network Code (*2 - 3 digits*)
- **S-NSSAI** - Single Network Slice Selection Assistance Information (*Identifies 5g network slice*)
- **GBR** - Guaranteed Bit Rate (*One of QoS defined in 3GPP-TS 23.501*)

#### Blocks
- **[[MIB]]** - Master Information Block (**Contains system bandwidth info, subcarrier spacing, system frame number, control resource configuration.**)
- **SIB** - System Information Block
- **CRB** - Common Resource Block (*Provides common frequency reference for all channels and signals in the system.)
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
	- **[[DMRS]]** - Demodulation RS (*allows to estimate the channel for demodulation of **PDSCH** or **PUSCH***)
	- **PTRS** - Phase Tracking RS (*allows to correct phase noise: **PDSCH** phase tracking*)
	- **TRS** - Tracking Reference Signal (*Not the same as **PTRS***)
	- **CSI-RS** - Channel State Information RS (*Channel quality measurements and feedback*)
	- **SRS** - Sounding RS (*uplink reference signal from **UE** to **gNB***)
- **PSS** - Primary Synchronization Signal (*Allows to detect the cell, provides symbol timing*)
- **SSS** - Secondary Synchronization Signal (*Helps determine the Physical Cell ID, provides frame timing, indicates duplex mode and other info.*)

- **NZP CSI-RS** - Non-Zero Power CSI-RS
- **ZP CSI-RS** - Zero Power CSI-RS (*Tells information about what locations shall guaranteed be zero.*)
#### Channels
- **[[PDSCH]]** - Physical Downlink Shared Channel (*Carries user data **gNB** to **UE**.*)
- **[[PDCCH]]** - Physical Downlink Control Channel (*Carries control info downlink*)
- **[[PBCH]]** - Physical Broadcast Channel. (*Carries **MIB***)

- **[[PUSCH]]** - Physical Uplink Shared Channel (*Carries user data from **UE** to **gNB***)
- **[[PUCCH]]** - Physical Uplink Control Channel (*Carries control info uplink*)
- **PRACH** - Physical Random Access Channel (*Used for initial access*)