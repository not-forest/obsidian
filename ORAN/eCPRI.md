> **Common Public Radio Interface (CPRI)** - communication medium between **DU** and **RU**, with publicly available standarzied architecture API. The **eCPRI** is used for **LTE and 5G**. Supports **up to 25 Gbps** data rates and low latency. Removes **vendor lock-ins** but leaves some room for proprietary internal implementations.

![[Pasted image 20260311090113.png]]

|             |                             |                                                                                           |                                         |            |         |        |
| ----------- | --------------------------- | ----------------------------------------------------------------------------------------- | --------------------------------------- | ---------- | ------- | ------ |
| Option      | Bit Rate<br><br>(Mbits/sec) | Line Coding                                                                               | Bit Rate Calculation<br><br>(Mbits/sec) | Electrical | Optical |        |
| Short Range | Long Range                  |                                                                                           |                                         |            |         |        |
| Option 1    | 614.4                       | [8B/10B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#8B_10B)   | 1 x 491.52 x 10/8                       | E.6        | OS.6    | OL.6   |
| Option 2    | 1,228.8                     | [8B/10B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#8B_10B)   | 2 x 491.52 x 10/8                       | E.12       | OS.12   | OL.12  |
| Option 3    | 2,457.6                     | [8B/10B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#8B_10B)   | 4 x 491.52 x 10/8                       | E.24       | OS.24   | OL.24  |
| Option 4    | 3,072.0                     | [8B/10B](http://www.sharetechnote.com/html/Communication_Digital_Encoding.html#8B_10B)    | 5 x 491.52 x 10/8                       | E.30       | OS.30   | OL.30  |
| Option 5    | 4,915.2                     | [8B/10B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#8B_10B)   | 8 x 491.52 x 10/8                       | E.48       | OS.48   | OL.48  |
| Option 6    | 6,144.0                     | [8B/10B](http://www.sharetechnote.com/html/Communication_Digital_Encoding.html#8B_10B)    | 10 x 491.52 x 10/8                      | E.60       | OS.60   | OL.60  |
| Option 7    | 9,830.4                     | [8B/10B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#8B_10B)   | 16 x 491.52 x 10/8                      | E.79       | N/A     | N/A    |
| Option 7A   | 8,110.08                    | [64B/66B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#64B_66B) | 16 x 491.52 x 64/66                     | E.96       | OS.96   | OL.96  |
| Option 8    | 10,137.6                    | [64B/66B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#64B_66B) | 20 x 491.52 x 64/66                     | E.99       | OS.99   | OL.99  |
| Option 9    | 12,165.12                   | [64B/66B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#64B_66B) | 24 x 491.52 x 64/66                     | E.119      | OS.119  | OL.119 |
| Option 10   | 24,330.24                   | [64B/66B](https://www.sharetechnote.com/html/Communication_Digital_Encoding.html#64B_66B) | 48 x 491.52 x 64/66                     | E.238      | OS.238  | OL.238 |
## CPRI Frame structure

![[Pasted image 20260311091202.png]]
![[Pasted image 20260311091504.png]]

Smallest units are called **basic frames**, while 256 of such frames form the **hyper frame**. Here *W* is word number, while *Y* is byte number. Even though word numbers do not depend on anything, byte numbers on the other hand change based on used **CPRI Option** (bitrate)
![[Pasted image 20260311091703.png]]
![[Pasted image 20260311091715.png]]

## eCPRI Architecture
![[Pasted image 20260311092556.png]]

Newer version with better data rates. Must be implemented since regular **CPRI** was still too *vendor specific* and newer cersion **PHY/MAC** layer is based on ethernet. Supports better compression and decompression of data reducing bandwidth and lowering the latency.

![[Pasted image 20260311093000.png]]
![[Pasted image 20260311093252.png]]

## eCPRI Header and Frame structure

![[Pasted image 20260311093600.png]]
![[Pasted image 20260311093626.png]]
## eCPRI over O-RAN

**O-RAN** provides further stardarization of **DU-RU** communication across the **fronthaul** built upon *ethernet* with **CPRI** header. The header supports the efficient transmission of **C-Plane** control instructions, such as scheduling and beamforming commands, while facilitating the high-bandwidth delivery of **U-Plane IQ** data, with optional *IP/UDP* encapsulation enhancing interoperability and flexibility. 

This well-defined header structure not only ensures low-latency and reliable data exchange but also aligns with **O-RAN**’s commitment to scalability, vendor neutrality, and support for diverse functional splits like **Cat-A** and **Cat-B** in open radio access networks. The below structure is valid of any section type.

![[Pasted image 20260311094028.png]]

### ecpriVersion (eCPRI protocol revision)

This parameter indicates the eCPRI protocol version. This parameter is part of the eCPRI common header.
- Value range: {0001b=eCPRI version 1.0, 1.1, 1.2 and 2.0, where the interpretation of the eCPRI message shall follow the eCPRI specification versions up to 2.0; 0000b and 0010b-1111b=Reserved for future eCPRI protocol revisions}.
- Type: unsigned integer.
- Field length: 4 bits.
- Default Value: 0001b (eCPRI version 1.0, 1.1, 1.2 and 2.0).

### ecpriReserved (eCPRI reserved)

This parameter is reserved for eCPRI future use. This parameter is part of the eCPRI common header.
- Value range: {001b-111b=Reserved}.
- Type: unsigned integer.
- Field length: 3 bits.
- Default Value: 000b (reserved fields should always be set to all zeros).

### ecpriConcatenation (eCPRI concatenation indicator)

This parameter indicates when eCPRI concatenation is in use (allowing multiple eCPRI messages in a single Ethernet payload). This parameter is part of the eCPRI common header.
- Value range: {0b=No concatenation, 1b=Concatenation}.
- Type: binary bit.
- Field length: 1 bit.
- Default Value: 0b (no concatenation).

### ecpriMessage (eCPRI message type)

This parameter indicates the type of service conveyed by the message type. This parameter is part of the eCPRI common header. In the present document, only values "0000 0000b" and "0000 0010b" and "0000 0101b" are used.
- Value range:
- 0000 0000b = IQ data message
- 0000 0010b = Real-time control data message
- 0000 0101b = transport network delay measurement message (see clause 4.4.4.4 for full message format)
- other values not recognized within the present document.

- Type: unsigned integer.
- Field length: 8 bits.
- Valid Values: 0x0 (U-Plane data) or 0x2 (C-Plane data) or 0x5 (network delay measurement messages).

### ecpriPayload (eCPRI payload size)

This parameter is the size in bytes of the payload part of the corresponding eCPRI message. It does not include any padding bytes following the eCPRI message. The maximum supported payload size is 2^16-1, but the actual size may be further limited by the maximum payload size of the underlying transport network. This parameter is part of the eCPRI common header.
- Value range: {0000 0000 0000 0000b-1111 1111 1111 1111b}.
- Type: unsigned integer.
- Field length: 16 bits.

### ecpriRtcid / ecpriPcid (real time control data / IQ data transfer message series identifier)

The ecpriRtcid and ecpriPcid, functions as eAxC identifiers (eAxC_ID). eAxC ID uniquely identify C-Plane and U-Plane data flows between the O-DU and O-RU in an O-RAN setup. eAxC extends the CPRI AxC concept to support multiple bands and component carriers. An eAxC_ID can handle mixed numerologies if supported via M-Plane, allowing a single ID for diverse channels like PRACH, or require unique IDs per numerology if not supported, with uniqueness enforced within an O-RU’s endpoints of the same direction. The O-DU may reuse eAxC_IDs across O-RUs, but M-Plane ensures only configured interfaces transfer messages, and some O-RUs limit independent sequence checking for DL and UL under the same eAxC_ID, necessitating distinct IDs or shared sequencing for compatibility, while configurable sequence checking can be disabled via M-Plane, affecting fragmentation and error reporting.
- **Definition & Purpose**

- eAxC_ID (Extended Antenna-Carrier ID) is used to identify C-Plane (ecpriRtcid) and U-Plane (ecpriPcid) data flows.
- It is similar to CPRI's AxC (Antenna-Carrier) value, extended to support multiple bands and component carriers.
- Multiple O-DU processors can contribute to a single eAxC_ID.

- **Handling Mixed Numerologies**

- An endpoint may support mixed numerologies, indicated via M-Plane parameters.
- Section Type 3 messages are used to select numerologies (frameStructure) from the capability list.
- A single eAxC_ID may be shared among different numerologies (frameStructure, cpLength, timeOffset, freqOffset) and PRACH.
- If an endpoint does not support mixed numerologies, it assigns a unique eAxC_ID to each numerology.

- **O-RU Endpoint & Fronthaul Interfaces**

- The eAxC_ID assigned to an O-RU’s endpoint must be unique within the O-RU for the same direction (Tx or Rx).
- An O-RU endpoint may be associated with multiple physical and virtual fronthaul interfaces (Ethernet ports and VLANs).
- However, a single eAxC_ID cannot be used for different endpoints.
- The O-RU design restricts which interfaces can be used for C-Plane and U-Plane messages, enforced via M-Plane configuration.

- **eAxC_ID Assignment in O-DU and O-RU**

- The O-DU may use the same eAxC_ID for different O-RUs.
- However, eAxC_IDs within an O-RU must be unique for the same direction.
- eAxC_IDs assigned to one FHM (Fronthaul Manager) must be unique in the same direction.

- **eAxC_ID is specific to**:

- eCPRI Message Type = 2 (C-Plane)
- eCPRI Message Type = 0 (U-Plane)

- **One eAxC contains only one spatial stream at a time, meaning:**

- One beam per subcarrier at any given time.
- If precoding is performed in the O-RU, each eAxC contains one layer at a time.
- Exception:

- In Tx Diversity (TxD, LTE TM2), a single eAxC (one ecpriRtcid and ecpriPcid) represents all TxD layers.

- **Limitations & Compatibility Considerations**

- Some O-RUs do not support independent sequence checkers for:

- C-Plane messages describing U-Plane DL
- C-Plane messages describing U-Plane UL

- This limitation is signaled via M-Plane
- If the O-RU or O-DU only supports older M-Plane versions, interoperability must be ensured manually through off-line discussions.

- **Interoperability Strategies for Sequence Checkers**

- To avoid sequence checker issues, O-DUs should:

- Use different eAxC_IDs for U-Plane DL and U-Plane UL.
- Use a shared sequence generator for both DL and UL messages.

- **Sequence Number Checking & Configuration**

- Some O-DUs do not support sequence number generation or checking.
- The O-RU may expose an M-Plane feature called SEQ-ID-CHECKING-CONFIGURABLE.
- If supported, the O-DU can request the O-RU to disable sequence number checking by setting seq-id-checking-disabled = true.
- When sequence checking is disabled:

- RX_SEQID_ERR and RX_SEQID_ERR_C counters are not updated.
- Radio transport layer fragmentation (Clause 5.5.3) is not possible.

- **Network Operator Considerations**

- If an O-RU does not support SEQ-ID-CHECKING-CONFIGURABLE, network operators using such O-RUs must ensure:

- O-DUs can interoperate with O-RUs using non-standardized solutions.
- This may require manual configuration or off-line discussions.

- **eAxC_ID Subfields and Bit Allocation**

- eAxC_ID Composition

- DU_Port_ID[4 bits]  – Identifies processing units at the O-DU (e.g., baseband cards).
- BandSector_ID[4 bits]  – Aggregated cell identifier distinguishing bands and sectors.
- CC_ID[4 bits]  – Identifies Component Carriers.
- RU_Port_ID[ bits]  – Represents logical flows such as:

- Data layers or spatial streams.
- Separate numerologies (e.g., PRACH).
- Signaling channels with special antenna assignments (e.g., SRS).

- Bit Allocation and Configuration

- The assignment of DU_Port_ID, BandSector_ID, CC_ID, and RU_Port_ID is controlled by O-DU via the M-Plane.
- The O-RU does not need to interpret bit-level allocation within these fields.
- The bitwidth of each subfield is flexible and set via M-Plane messaging.
- The Service Management and Orchestration (SMO) function ensures:

- Proper assignment of bitwidths.
- Full 16-bit utilization (including padding if needed).

- Key Properties

- Dynamic Field Allocation: The M-Plane dynamically configures each subfield size based on network needs.
- Scalability: Allows different O-RUs to optimize bit usage for different deployments.
- Value Range: {0000 0000 0000 0000b - 1111 1111 1111 1111b} (16-bit full range).

### ecpriSeqid (message identifier)

The ecpriSeqid provides unique identification and ordering across two levels for data exchange between the O-DU and O-RU in an O-RAN setup. The first level, the Sequence ID, occupies the first octet and increments independently for U-Plane (DL and UL) and C-Plane (DL and UL) message streams within each eAxC, ensuring proper sequencing and reordering of messages, while the second level, the Subsequence ID, uses the second octet to manage radio-transport-level fragmentation of U-Plane messages, featuring a 7-bit Subsequence counter and an E-bit to mark the last fragment. C-Plane messages do not support fragmentation, setting the Subsequence ID to zero with the E-bit to one, whereas application-layer fragmentation offers an alternative by keeping messages within payload limits, also setting Subsequence ID to zero and E-bit to one. The Sequence ID is uniquely generated by the fronthaul transmitter (O-DU or O-RU) per eAxC, with independent generators for C-Plane DL and UL, though some O-RUs may lack independent sequence checkers, prompting O-DUs to use a shared sequence generator for interoperability within the same eAxC_ID when needed.

- **Purpose & Function**

- Provides unique message identification and ordering at two levels:

- Sequence ID – Ensures message ordering within an eAxC message stream.
- Subsequence ID – Handles fragmentation and reordering when messages are split across multiple packets.

- **Sequence ID**

- First octet of the ecpriSeqid parameter.
- Manages ordering of messages independently for each U-Plane and C-Plane direction:

- U-Plane eAxC DL
- U-Plane eAxC UL
- C-Plane eAxC DL
- C-Plane eAxC UL

- Increments and wraps independently for each stream.
- Used to:

- Verify that all messages are received.
- Reorder messages that arrive out of sequence.

- **Subsequence ID**

- Second octet of ecpriSeqid.
- Used when radio-transport fragmentation occurs (eCPRI or IEEE-1914.3).
- Structure:

- 7-bit Subsequence Counter – Increments from zero for each fragment.
- 1-bit E-bit (End Indicator):

- Set to "0" for all fragments except the last one.
- Set to "1" for the final fragment in a sequence.

- C-Plane messages do not allow fragmentation, so:

- Subsequence ID = 0
- E-bit = 1

- **Fragmentation Methods**

- Radio-Transport-Level Fragmentation:

	- Splits large messages into multiple fragments when message size exceeds protocol limits.
	- Uses Subsequence ID for tracking and reordering fragments.

- Application-Layer Fragmentation:

	- The application ensures transport messages fit within payload size.
	- If used, Subsequence ID is always "0", and E-bit is "1".

- **Key Implications**

	- (a) Sequence ID is unique per eAxC:  Different eAxC_IDs generate independent Sequence IDs.
	- (b) Sequence ID is generated by the fronthaul interface transmitter: Can be in either the O-DU or O-RU.
	- (c) Independent sequence generators for C-Plane messages: A C-Plane message for U-Plane DL has a separate sequence generator from a C-Plane message for U-Plane UL.

- **O-RU Compatibility Considerations**

- Some O-RUs do not support independent sequence checkers for:

- C-Plane messages describing U-Plane DL and UL within the same eAxC_ID.

- To interoperate with such O-RUs, O-DUs can:

- Use separate eAxC_IDs for U-Plane DL and U-Plane UL.
- Use a shared sequence generator for both.

## C-Plane Transport Frame

![[Pasted image 20260311100024.png]]

| Section Type                                                                                                                                                                                                          | Target Scenario                                         | Remarks                                                                                                                                                                                                                                                                                                                                                                            |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 0                                                                                                                                                                                                                     | Unused Resource Blocks or symbols in Downlink or Uplink | Indicates to the O-RU that certain Resource Blocks or symbols will not be used (idle periods, guard periods). Likewise, there are no associated U-Plane messages containing IQ data for this Section Type. The purpose is to inform the O-RU that transmissions may be halted during the specified idle interval for e.g. power-savings or to provide an interval for calibration. |
| 1                                                                                                                                                                                                                     | Most DL/UL radio channels (NOTE)                        | Here "most" refers to channels not requiring time or frequency offsets such as are needed for mixed-numerology channels.                                                                                                                                                                                                                                                           |
| 2                                                                                                                                                                                                                     | Reserved for future use                                 |                                                                                                                                                                                                                                                                                                                                                                                    |
| 3                                                                                                                                                                                                                     | PRACH and mixed-numerology channels (NOTE)              | Channels requiring time or frequency offsets or different-than-nominal SCS values.                                                                                                                                                                                                                                                                                                 |
| 4                                                                                                                                                                                                                     | Slot Configuration Control                              | Slot configuration for multiple eAxC_IDs with one or multiple Section Type 4 configuration commands.                                                                                                                                                                                                                                                                               |
| 5                                                                                                                                                                                                                     | UE scheduling information (ueld assignment to section)  | Provides scheduling information for uelds.                                                                                                                                                                                                                                                                                                                                         |
| 6                                                                                                                                                                                                                     | Channel information                                     | Sends UE-specific channel information from the O-DU to the O-RU.                                                                                                                                                                                                                                                                                                                   |
| 7                                                                                                                                                                                                                     | LAA                                                     | Messages communicated between O-DU and the O-RU in both directions to configure LBT for PDSCH/DRS transmission and to report the LBT outcome.                                                                                                                                                                                                                                      |
| 8                                                                                                                                                                                                                     | ACK/NACK Feedback                                       | Sent from the O-RU to the O-DU, providing ACK/NACK feedback for section descriptions in C-Plane messages.                                                                                                                                                                                                                                                                          |
| 9-255                                                                                                                                                                                                                 | Reserved for future use                                 |                                                                                                                                                                                                                                                                                                                                                                                    |
| **NOTE:** When PRACH has the same numerology as other UL channels, Section Type 1 can alternatively be used by O-DU for PRACH signaling. In this case, O-RU is not expected to perform any PRACH specific processing. |                                                         |                                                                                                                                                                                                                                                                                                                                                                                    |
## U-Plane Transport Frame

![[Pasted image 20260311100100.png]]

|Section Type|Target Scenario|Remarks|
|---|---|---|
|0|Idle or Guard Periods|No U-Plane messages are associated with this section type.|
|1|Most Downlink and Uplink Physical Radio Channels|**Common Header Fields:** dataDirection (1 bit), payloadVersion (3 bits), filterIndex (4 bits), frameId (8 bits), subframeId (4 bits), slotID (6 bits), symbolId (6 bits).  <br>**Section Header Fields:** sectionID (12 bits), rb (1 bit), symInc (1 bit), startPrbu (10 bits), numPrbu (8 bits), udCompHdr (8 bits), reserved (1 byte), udCompLen (16 bits), sReSMask1 (12 bits), sReSMask2 (12 bits).  <br>**PRB Fields:** udCompParam (0, 8, or 16 bits), iSample (1-16 bits), qSample (1-16 bits).|
|3|PRACH and Mixed-Numerology Channels|Uses same timing header, section header, and PRB fields as Section Type 1.|
|4|Slot Level Configuration|No U-Plane messages are associated with this section type.|
|5|UE Scheduling Information|Uses same timing header, section header, and PRB fields as Section Type 1.|
|6|Channel Information for Specific UE ID|No U-Plane messages are associated with this section type.|
|7|Listen-Before-Talk (LBT) Procedure|No U-Plane messages are associated with this section type.|
|8|ACK/NACK Feedback and Wake-up Ready Indication|No U-Plane messages are associated with this section type.|