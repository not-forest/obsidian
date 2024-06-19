This note describes the idea behind an `Open Game Pad` project.
## Presumptions

The idea is to create a minimal working, low-budget, Open-Source game-pad that could be used as a reference for more high-level builds. The pad is using a most standard game-pad reference layout, however an Xbox-like layout variety is available in PCBs folder.

![[Pasted image 20240602210504.png]]
## Diagram

Below is a simple diagram of hardware logic behind this system. The ATtiny85 AVR family micro-controller is being used as a small, low-cost micro-controller, which is enough for the use case. 

The rest of the pins must be multiplexed by software. That lives us with 3 pins for 18 buttons, because two pin must be used for D+,D- in USB communication.

![[Open Game Pad Canvas.canvas|Open Game Pad Canvas]]
## Components

- 1x - ATtiny85
- 1x - Any ATtiny programmer
- 2x - [COM-09032 (Joystick)](https://www.snapeda.com/parts/COM-09032/SparkFun%20Electronics/view-part/)
- 1x - [CD54/74HC/T161/3 Any one of four counters.](https://www.ti.com/lit/ds/symlink/cd74hc161.pdf?ts=1717626691960&ref_url=https%253A%252F%252Fwww.google.com%252F)
- 1x - [MM74C923 20-key Encoder](https://ece-classes.usc.edu/ee459/library/datasheets/MM74C922.pdf)
- 1x - [74HC165 Shift Register](https://www.ti.com/lit/ds/symlink/sn74hc165.pdf?ts=1717669869661&ref_url=https%253A%252F%252Fwww.google.com%252F)
- 16x - SPST Tact switches

## Hardware

The micro-controller only offers 6 available pins for general use, two of which will be used for USB communication. PB2 has to be used for D+ line of USB connector because V-USB library requires an interrupt pin for proper work of the protocol and PB2 is also a INT0 pin.


## Software

TODO!

Links:
- [[Open Game Pad README]]
- [[Open Game Pad Canvas.canvas|Open Game Pad Canvas]]