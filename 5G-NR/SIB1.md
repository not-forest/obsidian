> **Secondary Information Block 1 (SIB1)** - carries the most critical information required for the **UE** to access the cell. **SIB1** is cell-specific **SIB** and a part of **Minimum SI**.

For more information: [How LTE Stuff Works?: 5G NR: SIB1](https://howltestuffworks.blogspot.com/2019/10/5g-nr-system-information-block-1-sib1.html)
## Structure

| Field                     | Type                       |
| ------------------------- | -------------------------- |
| **_SIB1_**                |                            |
| _cellSelectionInfo_       |                            |
| _cellAccessRelatedInfo_   | CellAccessRelatedInfo      |
| _connEstFailureControl_   | ConnEstFailureControl      |
| _si-SchedulingInfo_       | SI-SchedulingInfo          |
| _servingCellConfigCommon_ | ServingCellConfigCommonSIB |
| _ims-EmergencySupport_    | ENUMERATED {true}          |
| _eCallOverIMS-Support_    | ENUMERATED {true}          |
| _ue-TimersAndConstants_   | UE-TimersAndConstants      |
| _uac-BarringInfo_         | UAC-BarringInfo            |
| _useFullResumeID_         | ENUMERATED {true}          |

> **cellSelectionInfo** - below table summarizes:

|                         |                 |                     |
| ----------------------- | --------------- | ------------------- |
| **_cellSelectionInfo_** |                 |                     |
| _q-RxLevMin_            | Q-RxLevMin      | INTEGER (-70 … -22) |
| _q-RxLevMinOffset_      | INTEGER (1 … 8) |                     |
| _q-RxLevMinSUL_         | Q-RxLevMin      | INTEGER (-70 … -22) |
| _q-QualMin_             | Q-QualMin       | INTEGER (-43 … -12) |
| _q-QualMinOffset_       | INTEGER (1 … 8) |                     |
> **Q-RxLevMin** - used to indicate the required "minimum received **RSRP** level" (in dBm) in the **NR** cell for cell selection and re-selection. **Actual value of $Q_{rxlevmin}$ = field value * 2 [dBm]*. (38.304)
> **q-RxLevMinOffset** - offset in **dB** that need to be added to the signaled (not actual) value of $Q_{rxlevmin}$. If this field is absent, the **UE** applies a default value of 0 dB. (38.304)
> **Q-RxLevMinSUL** - if **UE** supports **SUL** frequency for this cell, $Q_{rxlevmin}$ is obtained from this field. Actual value **$Q_{rxlevmin}$ = field value * 2 [dBm]**
> **Q-QualMin** - used to indicate the required "minimum received **RSRQ** level" (in dB) in the **NR** cell for cell selection and re-selection. If this field is absent, the **UE** applies the default value of **negative infinity** for $Q_{qualmin}$ which means that quality (**RSR1**) check will always pass irrespective of the received signal quality. (38.304)
> **q-QualMinOffset** - offset in **dB** that needs to be added to the signaled value of $Q_{qualmin}$. If this field is absent, the **UE** applies a default value of 0 dB. (38.304)

> **CellAccessRelatedInfo** - used to indicate cell access related information for the serving cell:

| Field                       | Type                              |
| --------------------------- | --------------------------------- |
| **_CellAccessRelatedInfo_** |                                   |
| _plmn-IdentityList_         | List of 1 to 12 PLMN-IdentityInfo |
| _cellReservedForOtherUse_   | ENUMERATED {true}                 |
