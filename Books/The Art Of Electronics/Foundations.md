## 1.1 Introduction

> *Integrated Circuit (IC)* - A set of electrical components integrated into one piece.

## 1.2 Voltage, Current and Resistance

#### Voltage:

> *Voltage [V, E]* - The voltage between two points is the cost in energy (work done) required to move a unit of positive charge from the more negative point (lower potential) to more positive point (higher potential).

> Voltage is also known as: Potential Difference, *EMF* - Electromotive Force.

> *Volt* - unit of voltage. Usually in volts, kilovolts, millivolts or microvolts.

#### Work:

> Joule (J) - is a work done in moving a coulomb (C) of charge through a potential difference of 1 V.
> Coulomb (C) - is a unit of electric charge and it is equals the charge of approximately 6 * 10$^{18}$ electrons.

#### Current

> Current [I] - is a rate of flow in electric charge past a point. The unit of measure is ampere/amp [A], usually in amperes, milli-amperes, micro-ampires, nano-amperes and even pico-amperes.

A current of one amp is equal to a flow of one coulomb of charge per second.

#### Current Flow.

'By convention it is considered current in a circuit to flow from a more positive point to a more negative point, even though the actual electron flow in the oposite direction'.

> Voltage at a point - voltage between a point and GND.

#### Connection

> Kirchhoff's Current Law (KCL) - The sum of currents into a point (node) in a circuit equals the sum of the currents out.
> Kirchhoff's Voltage Law (KVL) - Things hooked in parallel have the same voltage across them. The sum of the voltage drops around any closed circuit is zero.

> The power [P] - power (energy per unit time) consumed by a circuit:
> 			P = V*I
> The unit of power is watt [W], which is a joule per second [1W = 1J/s].

#### Prefixes:

![[Pasted image 20240701200236.png]]
#### Resistance and Resistors:

![[Pasted image 20240701195433.png]]_Resistors and their Types_:
- Wirewound Ceramic Power Resistors;
- Wirewound Power Resistors;
- Carbon Compositions Resistors;
- Surface-mount (SMD) reisistors (2010, 1206, 0805, 0603, 0402 metric);
- Surface-resistor array (6, 8, 10 pins.);

> Ohm's Law - current flowing through a metallic conductor is proportional to the voltage across it:
> 		I = U/R

'Roughly speaking resistors are used to convert a voltage to a current, and vice versa.'

#### Resistors in series and parallel

1. The resistance of two resistors in series is a sum of them (larger resistor):
			 $R = R1 + R2$
2. The resistance of two resistors in parallel is (smaller resistor):
			 $R = \frac{R1 * R2}{R1 + R2} = \frac{1}{\frac{1}{R1}+\frac{1}{R2}}$

#### Extra

> Conductance - the current through a device of conductance G bridging a voltage V is then given by I = GV (Ohm's Law), where conductance is: G = 1/R [S]. Unit of conductance is siemens/mho.
## #Exercise1_1

> You have a 5k resistor and a 10k resistor. What is their combined resistance (a) in series and (b) in parallel.

By using formulas from above we can acquire the results:

$$
R_{series} = R_1 + R_2 = 5k + 10k = 15k [Ohms]
$$
$$
R_{parallel} = \frac{R_1 * R_2}{R_1 + R_2} = \frac{5k * 10k}{5k + 10k} = \frac{50k}{15k} = 3.3k [Ohms]
$$
## #Exercise1_2 

> If you place a 1 ohm resistor across a 12 volt car battery, how much power will it dissipate?

Power is defined as: P = IV, meanwhile from Ohm's law we get:
I = V/R, therefore P = V$^2$/R = 12$^2$/1 = 144 [W].

## #Exercise1_3

Prove the formulas for series and parallel resistors.

To prove the formulas we will base on two Kirchhoff's law and Ohm's law. 

#### Series
Lets say we have two resistors putted in series:

	P0 -----[ R1 ]----- P1 -----[ R2 ]----- P2

From Kirchhoff's current law: I = const. The voltages between points P0,P1 and P1,P2 are defined as so:
$$
V1 = R1*I, V2 = R2*I => V1 + V2 = R1*I + R2*I => V = (R1 + R2)*I => V = RI
$$

Where V is a voltage between P0, P2 and R is a full resistance of two resistors putted in series. By dividing U and I from both sides we are left with: R = R1 + R2

#### Parallel
From Kirchhoff's voltage law V = const for resistors which are hooked in parallel.

		  ------[ R1 ]------
	P0----                  -----P1
		  ------[ R2 ]------

Therefore:
$$
V = R1*I1 = R2*I2 => I1 = \frac{V}{R1}; I2 = \frac{V}{R2}
$$
From Kirchhoff's current law (again) the current flowing in point P1, must be the sum of all current flowing out from the R1 and R2, therefore:
$$
I1 + I2 = \frac{V}{R1} + \frac{V}{R2} = \frac{V*R1 * V*R2}{R1 + R2}=>
$$
$$
=> I1 + I2 = V*\frac{R1*R2}{R1+R2} => I = \frac{V}{R}
$$
By dividing U and I from both sides, we are left with:
$$
R = \frac{R1*R2}{R1+R2}
$$
## #Exercise1_4

> Show that several resistors in parallel have resistance:
$$
R = \frac{1}{\frac{1}{R_1} + \frac{1}{R_2} + \frac{1}{R_3} + ...}
$$

If any two resistors in parallel have resistance:
$$
$R = \frac{1}{\frac{1}{R1}+\frac{1}{R2}}$
$$
then n resistors will add n conductance together under the division line. In other words since parallel resistance will give us a smaller resistance, then this rule must apply for any n resistor.

## #Exercise1_5
> Show that it is not possible to exceed the power rating of a 1/4 watt resistor of resistance greater than 1K, no matter how you connect it, in a circuit operation from a 15 volt battery.

The power dissipated by a resistor is P = IV or P = V$^2$/R. With 1K resistor the value would be:
$$
P = \frac{15^2 V}{1000 Ohms} = \frac{225}{1000} = 1/4. [W]
$$
Therefore each resistor that is >=1K will give a smaller amount of Watts.

#### Input and Output

> Voltage Divider - a simple circuit containing two resistors that is used to divide voltages between two known points. Adjustable based on values of those resistors.
> 
![[Pasted image 20240706191522.png]]![[Pasted image 20240706191543.png]]

When nothing is connected to $V_{out}$ the current in a circuit is:
$$
I = \frac{V_{in}}{R_1 + R_2}
$$
For R$_2$:
$$
	V_{out} = IR_2 = \frac{R_2}{R_1 + R_2}*V_{in}
$$
## 1.2.4 Voltage sources and Current sources
![[Pasted image 20240706192916.png]]
## 1.2.5 Thevenin equivalent circuit
![[Pasted image 20240706193111.png]]

> Thevenin's Theorem - any two-terminal network of resistors and voltage sources is equivalent to a single resistor R in series with a single voltage source V.
> Northon's Theorem - states the same, but about a network of current sources and resistors in parallel.

The $V_{th}$ is the open-circuit voltage of the Thevenin equivalent circuitl so if the two circuits behave identically, it must laso be the open-circuit voltage of the given circuit:
$$
V_{th} = V(open\space circuit)
$$
$$
R_{th} = \frac{V (open\space circuit)}{I (open\space circuit)}
$$


![[Pasted image 20240707194725.png]]

> Multimeters (obsolete) - tool for measuring voltage, current and resistance. Have slow response time.
> Voltage Burden - few tenths of volt drop that must be tolerated when using a current-measuring meter.

## #Exercise1_7
> What will a 20 KOhms/V meter read, on its 1 V scale, when attached to a 1 V source with an internal resistance of 10K? What will it read when attached to a 10K-10K voltage divider driven by a "stiff" (zero source resistance) 1 V source?
#### Scenario 1: Meter Attached to a 1 V Source with Internal Resistance of 10K

- **Given:**
  - Voltage source: 1 V
  - Internal resistance of source: 10 kΩ
  - Meter sensitivity: 20 kΩ/V
  - Scale used: 1 V

- **Analysis:**
  - The meter reads 20 kΩ/V, expecting to measure voltage and convert it to resistance.
  - **Total Resistance Seen by the Meter:**
$$
R_{total} \approx \frac{20\text{ kΩ} \cdot 10\text{ kΩ}}{20\text{ kΩ} + 10\text{ kΩ}} \approx 6.67\text{ kΩ}
$$
  - **Voltage Across the Meter:**
$$
    V_{meter} \approx 1\text{ V} \cdot \frac{20\text{ kΩ}}{6.67\text{ kΩ} + 10\text{ kΩ}} \approx 1.2\text{ V}
$$
 Since the scale is 1 V, the meter will likely read overrange or its maximum value due to the voltage divider effect.
#### Scenario 2: Meter Attached to a 10K-10K Voltage Divider Driven by a "Stiff" 1 V Source

- **Given:**
  - Voltage source: 1 V (stiff, zero source resistance)
  - Meter sensitivity: 20 kΩ/V
  - Voltage divider: 10 kΩ resistors each

- **Analysis:**
  - The meter reads 20 kΩ/V, expecting to measure voltage and convert it to resistance.
  - **Voltage Divider Output:**
$$
    V_{out} = \frac{R_2}{R_1 + R_2} \cdot V_{source} = \frac{10\text{ kΩ}}{10\text{ kΩ} + 10\text{ kΩ}} \cdot 1\text{ V} = 0.5\text{ V}
$$
  - **Meter Reading:**
$$
    R_{meter} = 20\text{ kΩ/V} \cdot 0.5\text{ V} = 10\text{ kΩ}
$$
The meter will read **10 kΩ** when connected to the 10 kΩ-10 kΩ voltage divider driven by the stiff 1 V source.

## #Exercise1_8 

> A 50 μA meter movement has an internal resis- tance of 5k. What shunt resistance is needed to convert it to a 0–1 A meter? What series resistance will convert it to a 0–10 V meter?
#### Part 1: Shunt Resistance for 0-1 A Meter

- **Given:**
  - Meter sensitivity: 50 μA full scale
  - Internal resistance of meter: 5 kΩ
  - Desired full scale current: 1 A
  
- **Shunt Resistance Calculation:**
To convert the meter to read up to 1 A:
$$
R_{shunt} \approx 0.25 \text{ Ω}
$$
#### Part 2: Series Resistance for 0-10 V Meter

- **Given:**
  - Meter sensitivity: 50 μA full scale
  - Internal resistance of meter: 5 kΩ
  - Desired full scale voltage: 10 V
  
- **Series Resistance Calculation:**
To convert the meter to read up to 10 V:
$$
 R_{series} \approx 195 \text{ kΩ}
$$
##  #Exercise1_9

> The very high internal resistance of digital multi- meters, in their voltage-measuring ranges, can be used to measure extremely low currents (even though the DMM may not offer a low current range explicitly). Suppose, for example, you want to measure the small current that flows through a 1000 MΩ “leakage” resistance (that term is used to describe a small cur- rent that ideally should be absent entirely, for example through the insulation of an underground cable). You have available a standard DMM, whose 2 V dc range has 10 MΩ internal resistance, and you have available a dc source of +10 V. How can you use what you’ve got to measure accurately the leakage resistance?

To measure the small current through a 1000 MΩ leakage resistance using a DMM with a 2 V DC range and 10 MΩ internal resistance:

1. **Setup:**
   - Connect the 1000 MΩ resistance between the +10 V DC source and the red probe of the DMM.
   - Connect the black probe of the DMM to the - terminal of the +10 V DC source.

2. **Measurement:**
   - Set the DMM to the 2 V DC range and measure the voltage drop across the 1000 MΩ resistance.

3. **Calculation:**
   - Calculate the current $I$ using 
$$
   I = \frac{V_{DMM}}{1000 \text{ MΩ}} 
$$
   where $V_{DMM}$ is the voltage measured by the DMM.

#### Equivalent Source Resistance and Circuit Loading.
![[Pasted image 20240707204136.png]]

> Stiff Voltage Source - voltage source, which voltage does not bend under a load.

The equivalence is also applied to: batteries, voltage dividers, oscillators, amplifiers, and sensing devices. Overall it is necessary to strive to make $R_{load} >> R_{internal}$, because a high-resistance load has little attenuating effect on the source.
![[Pasted image 20240707210158.png]]
