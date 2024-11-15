> Signal processing is used to transform or manipulate analog or digital signals. DSP is a more mature technology of manipulating signals than a regular analog systems, due to insensitivity to change in temperature, aging, or component tolerance, low cost and ease of use.

## Digital Signal Processing Applications

| Area                | DSP Algorithm                                                                                                                               |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| General-purpose     | Filtering, detection and correlation, estimation and Fourier transform                                                                      |
| Speech Processing   | Coding and decoding, encryption and decryption, speech recognition, synthesis, speaker identification, echo cancellation                    |
| Audio Processing    | Hi-Fi encoding and decoding, noise cancellation, audio equalization, ambient acoustics emulation, audio mixing and editing, sound synthesis |
| Image Processing    | Compression and decompression, rotation, transformation, recognition, pre- and post-processing                                              |
| Information Systems | Voice mail, modulators/demodulators, LAN, wireless signals processing                                                                       |
| Control             | Servo control, disk control, engine control, navigation, vibration control, stabilization, robotics                                         |
| Instrumentation     | Beamforming, waveform generation, radar and sonar                                                                                           |
## Typical DSP Application

![[Pasted image 20241115124933.png]]

1. Analog signal is feed through an analog anti aliasing filter, whose stopband starts at hald the sampling freqency $f_s$.
2. ADC converts the sampled signal to a byte-stream.
3. DSP system performs the required processing algorithm.
4. DAC converts the signal back to analog if needed.

## DSP Technology Requirements
- High throughput of processed data
- Reduction in size, device cost, board test costs
- Fast approximation implementations

> Field Programmable Logic (FPL) - class of devices defined as programmable devices containing repeated fields of small logic and elements.
## Classification by Granularity

> Granularity - granularity of a device can be thought as an effort required to complete the wiring between the processing blocks (routing channels).

In general three classes can be found:
- Fine Granularity (Pilkington or "sea of gates" architecture);
- Medium granularity (FGPA - Field Programmable Gate Array);
- Large granularity (CPLD - Complex Programmable Logic Devices);

# Classification of VLSI circuits

![[Pasted image 20241115131954.png]]

![[Pasted image 20241115130246.png]]

### Fine Granularity Devices

First licensed by Plessey and later Motorola, being supplied by Pilkington Semiconductor. Logic cell consisted of a single NAND gate and a latch. → For programmable architectures it is really unpleasant to performs so much wiring for even simpler designs.

### Medium Granularity Devices

FPGA devices are in this class. Usually implemented with dedicated multiplexer (MPX) logic and small input tables
![[Pasted image 20241115131325.png]]

### Large Granularity Devices

Complex programmable logic devices (CPLD) are defined by combining Simple Programmable Logic Devices (SPLDs) between the routing channels.
![[Pasted image 20241115131505.png]]

# FPL Technology Comparison
![[Pasted image 20241115131737.png]]
![[Pasted image 20241115131849.png]]

![[Pasted image 20241115132255.png]]
![[Pasted image 20241115132343.png]]

> Logic Array Block (LAB) - an array of different FPL blocks like LUTs, PLLs/Clocks, Embedded multiplexers, RAM memory, etc.

![[Pasted image 20241115132657.png]]

## Timing Estimates

Sometimes it is needed to calculate timings data from the output design. An example for 32-bit Adder:
![[Pasted image 20241115133143.png]]

### Typical Registered Performance and resource data for Cyclone 2 EP2C35F672C6:
![[Pasted image 20241115133253.png]]

## Power Dissipation

> Power dissipation - power dissipation can be a critical in mobile applications which are not powered from the stable power source.

1. Static power dissipation ($I_{standby}$).
2. Dynamic (logic, multiplier, RAM, LUT, PLL, clocks, I/O) power dissipation ($I_{active}$).

