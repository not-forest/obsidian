### 1.1 Introduction

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