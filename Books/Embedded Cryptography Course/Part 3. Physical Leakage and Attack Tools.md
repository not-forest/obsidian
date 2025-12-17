Due to internal physical abilities of hardware, an **emission** of different types can differ based on **secret data** within the implementation. Such emission becomes a **side-channel** and can leak information.

## Power Consumption Emission

> **Dynamic Power Consumption** - fraction of the **total** power that is used due to **charge/discharge (switching)** events in CMOS logi circuits:
$$
P_{dyn} = P_{SC} + P_{switch}
$$
Where _Psc_ is the **short-circuit** (non-ideal effects in CMOS gates = **very small**) power and _Pswitch_ is the **switching power** (power needed for switching the state).

![[Screenshot_20251208_131621.jpg]]

#### Switching power

CMOS gate is composed of PMOS and NMOS networks, which are used to provide charging path either for _Vdd_ or _GND_. Only one network is working at time based on the input _Vin_ state, however during **switching**, since real signals have **finite rise and fall times** a short circuit appears between _Vdd_ and _GND_ causing the **short circuit current _isc_**.

![[IMGS/Screenshot_20251208_132740.jpg]]

#### Switching Power

Directly represents the **charge/discharge** events of the output capacitance _$C_L$_. When changing state **0 -> 1**, output capacitance is charged to **Vdd**. The current is **absorbed** from the power rail. When changing state **1 -> 0**, PMOS network offers a resistive path from the output note to ground, therefore causing additional power close to short-circuit one.

| Transition | Dynamic Power         | Static Power |
| ---------- | --------------------- | ------------ |
| 0 -> 0     | 0                     | $P_{static}$ |
| 0 -> 1     | $P_{SC}$              | $P_{static}$ |
| 1 -> 0     | $P_{SC} + P_{switch}$ | $P_{static}$ |
| 1 -> 1     | 0                     | $P_{static}$ |
> **Static Power** - static power consumtion of CMOS element. Unfortunately it is also data-dependent and leaks it via parasitic static currents, sub-threshold leakage, etc.

> **Leakage Power Analysis (LPA)** - class of **side-channel attacks**, where data is discovered on the basis of such static power leakage. **Secret data** is usually recovered via **linear algoithms** or **machine learning networks**. Sometimes this type of attacks are also referred to as **Attack Exploiting Static Power (AESP)**.

To measure **static power** the adversary must have an ability to **control the clock signal**;
### Electro-Magnetic Emissions

> **Electro-Magnetic Analysis (EMA)** - one of LPA side-channel analysis methodology to measure **variations** in the magnetic field surroundng an integrated circuit. Those analysis usually require **near-field** measurement equipment.

EMA offers some advantages compared to power-analysis, because current peaks are usually observed during **data transitions**. In general the following two statement are true for such analysis:
- it is possible to find relationship between **data transition** and changes in **magnetic field**;
- in many cases, this information also suggest additional information about the **location** where data transition occurs;

> **Optical Side-channel attack** - when MOS transistors is conducting, carriers gain kinetic energy due to the source-drain electric field, which is not uniform, and very intensive in the region **nearby drain**, where energy can be released as **photons** (more often in n-type transistors due to higher mobility of the electrons).

To extract this optical information, which is also **data-sensitive**, the adversary has to remove passive layers from the **back-side (better observable)** of the device chip. Just like EMA, it includes the *locality* feature of the observed leakage, however requires expensive photonic equipment (e.g. lasers and detectors). With femto-seconds lasers already being used it is easy to obtain data even on very **high MCU frequncies**.

> **Acoustic Side-channel attack** - type of side-channel attacks, where acoustic waves are the form of data leakage.

Very limited side-channel with **bad bandwidth (limited to range of 0 - 80 kHz)**. Example of such attack can be CPUs cooling fan, which is dependant of heavy operations.

## Measuring Side-Channel Power Attack

### Power Analysis Setup

To perform a **side-channel measurement setup** on a **DUT** device, we need to perform the following setup:
- **DUT** is monitored by a **probe**, which has the role to convert the **current** signal into a **voltage** signal;
- **Preamplifier** must increase it's magnitude, remove noise and improve electrical characteristics;
- **Digital Storage Oscilloscope (DSO)** samples and quiantizes analog voltage signal, converting into digital representation (it is very useful if it would be **triggered** and also send this data to some PC/laptop for further **parsing**).

The following problems may produce bad side-channel measurement:
- **impedance mismatch**;
- **saturation of analog front-ends**;
- **undersampling**;

![[Screenshot_20251217_223038.jpg]]

### Shunt Resistor

With **shunt resistor** technique, we measure voltage drop across a *tiny* resistor, using Ohm's law:
$$
v_{meas}(data, t) = -i(data, i) * R_{drop}
$$
Resistor shall have a tiny value, observable on the scope, yet not too high, so that DUT won't malfunction (brown reset). Here the off-chip filter is added to automatically remove unecessary noise from the measurement.

![[Screenshot_20251217_224133.jpg]]
### Inductive Probe

Using an inductive coil as a current transformer where the input circuit (the line the adversary wants to probe) acts as a primary coil, and it's output (input of preamplifier for DSO) corresponds to a secondary coil.

Adversary's equipment is **galvanically isolated** from the **DUT**, however **small inductive parasitic current** still can be seen on line. It is practically negligible, ensuring a clean probing of the power consumtion. As a drawback, the adversary can only observe **higher frequencies**, since transformer cuts-off lower frequencies (**DC up to 100 kHz**). This also means that **static power consumtion** is impossible to read this way.

![[Screenshot_20251217_224154.jpg]]

## Leakage Modeling

Side-channel leakage is an output of **physical** phenomena occuring within the DUT. Usually some **mathematical models** are used to gain an understanding of **how that output correlates with input data**. Mathematical models rely on two hypotheses:
- Every time any data *Z* is used to perform any computation of *f(Z)* in the executed algorithm, this computation can leak and hense be measured. When data is **not processed** by the algorithm, it will not leak and hence not appear on side-channel;
- For any data *Z* being processed, the leakage can be written as a sum of a deterministic *f(Z)* + *N*, where N is a *random noise*. Usually gausiann models are used for noise.

### Hamming Weight Model

If we set an 8-bit register with zeroes, and then write a value of *0b10011100*, we assume according to previous section that this will produce some **energy (e)** due to **dynamic power leakage**. 

A perfect measurement output for this operation would therefore produce *4 * e*.

> **Hamming Weight** - function **HW(Z)** that **describes** the number of set bits of **Z**.

For the whole lekage the following formula can be used as a mathematical module:
$$
l = e * HW(Z) + N
$$

### Hamming Distance Model

Now consider a register which is not preloaded with zeroes, but rather have some previous value, for example *Z = 0b10011100*. When we set new value *Z' = 0b11000011* into the register, each modified bit imply some energy *e*. A perfect measurement of such leakage would therefore be *6 * e*.

> **Hamming Distance** - function **HD(Z, Z')** that **describes** the amount of **changed** bits when switching **Z -> Z'**. Note that this operation is also equal to: **HD(Z, Z') = HW(Z ^ Z').

For the whole lekage the following formula can be used as a mathematical module:
$$
l = e * HD(Z, Z^{'}) + N
$$
> **Weighted Sum of bits** - relaxed **HW** where we don't expect that every **bit** leaks the same energy **e**. Instead we consider that each bit will produce it's own energy based on it's significance.

> **Polynomial Model** - relaxing furthermore the **linear** assumption and consider **coupling** effects. Several bits modificated once at a time might consider some **nonliniar** effect.

### Noise

Gaussian noise (normal discribution) has been observed to be a very close mathematical module to real noises happening during the measurement, which occur during different physical phenomena within the device and unpredictable model error.

> **Signal to Noise Ratio (SNR)** - commonly used tool to estimate noise within the measured data **Z**.

![[Screenshot_20251217_232701.jpg]]

## Open-Source Side-Channel Measurement Boards

Special open-source digital boards based on FPGA for presise measurement is available on market:
- **ChipWhisperer** - developed by *NewAE* with different flavors *Nano, Lite, Pro*. Open-source python-based toolchain for learning about side-channel attacks and fault-injection attacks on embeded devices and validating their defence against them. **Particulary focuses on power analysis**.
- **LEIA** - developed by *H2Lab* and targeted toward **smart cards targets**. Open-hardware + open-source device for educational and evaluation purposes. Implements a **fully controllable ISO7816 stack.
- **Scaffold** - developed by *Ledger*, open-source and open-hardware motherboard for setting-up, instrument and test circuits. Python API is useto control this board with onchip FPGA for performing side-channel attacks.

## Open-source Attack Libraries

Below is a set of open-source side-channel attack libraries to perform manupulation of the traces, computation of SNRs, etc.:
- **Daredevil** - (C++) higher-order correlation power analysis [[https://github.com/SideChannelMarvels/Daredevil]];
- **Jlsca** - (Julia) huge variety of side-channel analysis and trace processing [[https://github.com/Riscure/Jlsca]];
- **Lascar** - (Python) big python library for side-channel analyses and trace-processing based on numba, numpy and scipy [[https://github.com/Ledger-Donjon/lascar]]
- **SCAlib** - focused on advanced side-channel attack called SASCAgraph [[https://scalib.readthedocs.io/en/latest/index.html]];
- **SCAred** - (Python + C extension) computation on lots of side-channel attacks and trace-processing based on cython, numba, numpy + scipy;

