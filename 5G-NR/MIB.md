> **Master Information Block (MIB)** - first system information decoded by the **UE** to obtain relevant information about the cell. The **MIB** takes **8 frames** and have the following contents: 

| Cell Barred Flag              | Tells if devices are allowed in the cell or not                                                                                          |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| First **PDSCH DMRS** position | Time domain position (symbols) for first **DRMS** (Type-A)                                                                               |
| **SIB1** numerology           | **SIB1** subcarrier spacing                                                                                                              |
| **SIB1** configuration        | **SIB1** search space, **CORESET** and **PDCCH** parameters                                                                              |
| **CRB** grid offset           | Frequency domain offset between **SSB** and **CRB**. Allows the **UE** to understand where signals are located within the carrier **BW** |
| **SFN (System Frame Number)** | Counter that identifies radio frames in time in the cellular system 10-bit. Helps **UE** to be synchronized in time domain.              |
