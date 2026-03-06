> **Open RAN** - open source interfaces that allows creating open, swappable, software-defined and cloud native **RANs**. Defined and maintained by **O-RAN Alliance**. 
![[Pasted image 20260306132906.png]]
![[Pasted image 20260306132927.png]]

## Implementation Options of Near-RT RIC
- **5G Only**
- **5G and 4G**
- **4G Only
![[Pasted image 20260306133039.png]]

## Reference Architecture

One can define the following major **O-RAN** building architecture blocks:
- **RF Frond End** - everything needed to turn digital **IQ** waveforms into actual radio waves **DL**, and vice-versa **UP**; 
- **Digital Front End** - bridge between analog **RF** and digital **PHY**: conversion to digital, filtering, etc.;
- **Low PHY** - **RU** implementation that handles **sample and symbol-level** data processing: channel estimation (**DRMS**), equalization, noise estimation, beamforming, etc.
- **Fronthaul/Transport** - Interface between **RU** and **DU** that carries **IQ** samples, control, beamforming data, timing information, etc.

![[Pasted image 20260306134117.png]]

