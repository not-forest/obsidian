> **Beam Forming** - is a must-have technique in microwave management in **5G-NR** due to the fact that we are obliged to use **MIMO** antennas with very high frequency range, therefore **omnidirectional** antennas or antennas with **large angles** are impossible to use on long distances.
> Since beams are very thin, an additional amount of effort must be put to form this beam properly to **point at the UE**.

For deeper [info]([5G | ShareTechnote](https://www.sharetechnote.com/html/5G/5G_Phy_BeamManagement.html#NR_Beam_Management_in_a_Nutshell))

![[Pasted image 20260306115840.png]]

## Beam Management when no information about **UEs**

Main way to find **UEs** is to *scan* the area with beam by transmitting it to a specific direction at a specific time, changing angle a little to find the **UE**. (**beam sweeping**)
![[Pasted image 20260306120357.png]]

### When transmitting
- **gNB** - figures out the direction based on the signal quality obtained from **SRS** signal obtained from **UE**. It is compared with **multiple beams** and the best quality is chosen.
- **UE** - figures out the direction based on signal quality obtained from **CSI-RS** or **SSB**. Just like **gNB**, it compares a lot of beams and choses the best quality one.
For more information on sounding [[Channel Sounding & Estimation]]
### When receiving
Beamforming on receive side means **tune it's receiver to some direction**, so it rather "catches" the beam. Both must do the following before receiving further information from each other.
- **gNB** - obtains information where to "look" in the form of **CSI-RS report** from **UE**;
- **UE** - obtains this information from **gNB** based on the measurement of **SRS**;

![[Pasted image 20260306120723.png]]

## Initial Beam Detection

**gNB** transmits a sequence of beams with **SSB** in different directions and **UE** detects the best quality one and sends **PRACH** to the location which is mapped to a specific **SSB** beam ID. Below processes P1, P2 and P3 describes that:

| Process | Functionality                  | Description                                                                                                                                                                                                                                                                                                 |
| ------- | ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| P1      | Beam Selection                 | gNB sweeps TRP beam, and UE sweeps UE beam and select a best one(best TRP beam measured by the best UE beam) and report it to gNB                                                                                                                                                                           |
| P2      | Beam Refinement for **gNB Tx** | gNB refine beam(e.g, sweeping narrower beam over narrower range) and UE detects the best one and report it to gNB                                                                                                                                                                                           |
| P3      | Beam Refinement for **UE Rx**  | gNB fixes a beam(transmit the same beam repeatedly) and UE refines its reciever beam. It sets the [Spatial Filter](https://www.sharetechnote.com/html/Handbook_LTE_BeamForming.html#High_Level_view_of_BeamForming_Implementation) on reciever antenna array. This is used only when UE support beamforming |


![[Pasted image 20260306122505.png]]
![[Pasted image 20260306123602.png]]
![[Pasted image 20260306123655.png]]

