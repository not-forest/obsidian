**RA** Procedure from **MAC** layer perspective based on [How LTE Stuff Works?: 5G NR: Random Access Procedure](https://howltestuffworks.blogspot.com/2019/09/5g-nr-random-access-procedure.html)
## Forms

Two distinct forms are defined:
- **Contention Based Random Access (CBRA)** - **UE** randomly selects **RA** preamble from pool of preambles shared with other **UE**s in the cell. If multiple **UE**s select/transmit same preamble (**Msg1**), all those **UE**s decode same **Msg2** content and transmit **Msg3** on the same **UL** time/frequency resources. In the next step (**Msg4**), the network resolves the contention.
- **Contention-Free Random Access (CFRA)** - **UE** uses a dedicated preamble provided by the network specifically to this **UE** via **RRC** signaling or **PDCCH** order.

![[Pasted image 20260325143146.png]]

**RA** procedure is initiated by **gNB**, by **UE**'s **MAC** entity itself or by **RRC**. It is triggered by number of events:
-    Initial access from **RRC_IDLE (CBRA)**
-    **RRC** Connection Re-establishment procedure (**CBRA**)
-    **DL** data arrival during **RRC_CONNECTED** when **UL** synchronization status is "non-synchronized" i.e., Out-of-Sync **(CBRA or CFRA)**
-    **UL** data arrival during **RRC_CONNECTED** when **UL** synchronization status is "non-synchronized" i.e., Out-of-Sync **(CBRA)**
-    **UL** data arrival during **RRC_CONNECTED** when there are no **PUCCH** resources for **SR** available **(CBRA)**
-    **SR** failure **(CBRA)**
-    Request by **RRC** upon synchronous reconfiguration (e.g. handover) **(CBRA or CFRA)**
-    Transition from **RRC_INACTIVE (CBRA)**
-    To establish time alignment for a secondary **TAG** **(CBRA or CFRA)**
-    Request for On-demand System Information **(CBRA or CFRA)**
-    Beam failure recovery **(CBRA or CFRA)**


