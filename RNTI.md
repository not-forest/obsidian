> **Radio Network Temporary Identifier RNTI** - used to differentiate/identify a connected mode **UE** in the cell, a specific radio **channel**, a group of **UEs** in case of **paging**, and a lot more (there are many types of **RNTI** of each topic).\

More information: [How LTE Stuff Works?: RNTIs in 5G NR](https://howltestuffworks.blogspot.com/2019/09/rntis-in-5g-nr.html)
## Types of RNTI

![[Pasted image 20260325150127.png]]

Except for **I-RNTI**, the length of each is **2 bytes (16-bits)**, and used to **scramble CRC** bits before they are attached to the corresponding transmission (**UL/DL**). Most of them are mapped to a certain channel, and have corresponding **DCI** format:

![[Pasted image 20260325150447.png]]

> **Paging RNTI** - used by **UE**s for the reception of paging in the downlink. It can also be used to inform **UE** about **SI** Modifications and/or **ETWS/CMAS** notifications using "Short Messages", transmitted with this **P-RNTI** over **DCI**. Both **paging and "short" messages** are sent over **PDCCH** directly.
>  
> It is a **common RNTI**, which means that it is not allocated by **UE**, and it has a standard value of: 65534 (0xFFFE).
> 
> This **RNTI** uses **DCI Format 1_0**.

> **System Information RNTI** - used for indication of **broadcast** and **system information** in the **DL**.. It is a **common RNTI** and has a standard value of: 65535 (0xFFFF). This **RNTI** uses **DCI Format 1_0**.
> 
> The **UE** shall receive the **PDCCH** scrambled with **SI-RNTI** in the **PDCCH** monitoring occasion(s) for **SI** message acquisition, from the start of the _SI-window_ and continue until the end of the _SI-window_ or until the SI message was received. If the SI message was not received by the end of the _SI-window_, repeat reception at the next _SI-window_ occasion for the concerned SI message in the current modification period.

> **Random Access RNTI** - used to identify the **Random Access Responce (RAR)** in the **DL**.. This **RNTI** uses **DCI Format 1_0**. **gNB** generates **RAR**s as a response to the **Random Access Preamble** transmitted by the **UE**(s).
> 
> **RA-RNTI** is calculated based on:
$$
 RA_-RNTI = 1 + s_{id} + 14 \times t_{id} + 14 \times 80 \times f_{id} + 14 \times 80 \times 8 \times ul_{carrier-id}
$$
> where:
> - **s_id** is the index of the first OFDM symbol of the specified PRACH (0 <= s_id < 14)
> - **t_id** is the index of the first slot of the specified PRACH in a system frame (0 <= t_id < 80)
> - **f_id** is the index of the specified PRACH in the frequency domain (0 <= f_id < 8)
> - **ul_carrier_id** is the UL carrier used for Msg1 transmission (0 for NUL and 1 for SUL carrier)
> It unambiguously identifies which time-frequency resource was utilized by the **UE** to transmit the **RA** preamble. Mapped to **PDSCH**

