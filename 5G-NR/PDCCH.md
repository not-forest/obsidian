> **Physical Downlink Control Channel** - carries **DCI** information downlink. May not span the whole **BW**. Supports device specific **beamforming**. Mapped to a specific **CORESET**. Occupies **1,2,4,8 or 16* CCEs**.
>  Configurations:
> 	- in which **CORESET** exists;
> 	- allocated **period of occurance** (so it is a period when **PDCCH** occurs in n **CORESETs**);
> 	- start **CCE** (on which **CCE** it starts. usually after the first one);
> 	- amount of **CCEs** (how many contiguous **CCEs** it spans to);
>
> **CORESET (Control Resource Sets)** - Special **group of resource blocks**, which are dedicated to **PDCCH** transmission. They signal where device **may** receive **PDCCH** (but not only). Those locations are further restricted by **search spaces**. May not span the whole bandwidth as always.
>  Configurations:
> 	- amount of allocated symbols (at which **OFDM** symbol **CORESET** is seen);
> 	- amount of allocated slots (in which slot they are allocated);
> 	- allocated **period of occurrence** (so it is a period when sequence of **CORESETs** occur each n slots);
> 	- duration (in symbols);
> 	- amount of allocatred **PRBs**;

## Interleaved **CCE-to-REG** mapping

**Contigues physical resources** may not correspond to **contiguous bits in PDCCH**, they can be remapped, with **bundles** of different sizes.

## Search Spaces

> **Search Spaces** - **restrict** blind search of **CORESETs**, because monitoring all of them is **too expensive**. those search spaces are **also formed in CCEs**, which contain information about **candidates to look at**. It also contains information about **size** of such candidates and their **types**: **device specific** (**PDSCH, ...**) and **common** (**SI**, ...)



