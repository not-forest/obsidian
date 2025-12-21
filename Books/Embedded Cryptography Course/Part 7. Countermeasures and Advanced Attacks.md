To provide examples of countermeasures, a AES algorithm is used, specifically the sub-bytes stage in pseudo-code. The same philosophy could be used in other cryptographic algorithms as well:

```pseudo
for i = 0; i < 16; i++ do
	State[i/4][i%4] = S-Box[State[i/4][i%4]]
return State
```

![[Screenshot_20251221_180322.jpg]]

> **Misalignment of traces** - technique for reducing the effectiveness of side-channel attack by **missaligning traces**, therefore making it hard to select **points of interest** and reduce both **SNR** and **entropy** value.

### Random Initial Delay

> **Random Initial Delay Countermeasure** - uses **random initial delay** to break the alignment between **time samples** for each next **trace**.

```pseudo
r = rand()
wait(r)
for i = 0; i < 16; i++ do
	State[i/4][i%4] = S-Box[State[i/4][i%4]]
return State
```

Pros:
- Maximum value of **SNR** gets lower, as the countermeasure provides the same result as a poor sampling trigger of the attack;
- Mixes **informative** and **non-informative** points;
Cons:
- Windows of the **attack** gets **higher**, since we are increasing the amount of **informative points**;
- Execution time is **increased**;
Features:
- Required random number generator;
- Only **one** random number is required per execution;
#### Overall countermeasure efficiency is poor.

![[IMGS/Screenshot_20251221_181415.jpg]]

### Random Delay Interrupts

> **Random Delay Interrupts Countermeasure** - inserts **random delay interrupts** between **sensitive** operations. Those operations do not modify the internal state of the device (dummy operations: e.g. NOP)

```pseudo
for i = 0; i < 16; i++ do
	r = rand()
	for j = 0; j < r; j++ do
		NOP
	State[i/4][i%4] = S-Box[State[i/4][i%4]]
return State
```

Pros:
- Traces will be **very desynchronized** during execution;
Cons:
- Execution time is **increased** more than with initial delay;
Features:
- Requires random number generator;
- Requires **16** random generated numbers for *SubBytes* function;
#### Overall countermeasure efficiency is average.

![[IMGS/Screenshot_20251221_182122.jpg]]

### Shuffling Independent Operations

> **Operation Shuffling Countermeasure** - uses the fact that some **independent** operations can be executed in **random order**. By performing **random shuffling** are forcing the adversary to perform additional **brute-force** attacks on samples to predict which operation was used, which increases practical security a lot.

```pseudo
S = {0, 1, ..., 15}
shuffle(S)
for i = 0; i < 16; i++ do
	j = S[i]
	State[j/4][j%4] = S-Box[State[j/4][j%4]]
return State
```

Pros:
- General pattern of **traces** remain identical, so it is harder than using DSP algorithms to *realign* missaligned samples;
- **Impossible** to know which **operation** is being performed;
- Increases the amount of **traces needed to perform an attack** by the amount of **shuffled operations**;
Cons:
- For small **amount of operations** it is easy to **brute-force** which operation was used;
- Slightly increases time of execution.
Features:
- Requires random numbers generator;
- Only requires **one** random shuffling of **N** operations;
#### Overall countermeasure efficiency depends on the amount of operatins.

![[IMGS/Screenshot_20251221_183918.jpg]]
### Masking

> **Masking Countermeasure** - technique to **mask** the relationship between **traces** and **security-related data**. This forces attack to combine **several points of interest**, therefore amplify the overall noise of each trace.

> **Secret Sharing** - technique of dividing a secret **x** into **d** shares, so that no information about the secret can be gain, if an attacker only observes **d - 1** shares.

> **Secret Boolean Sharing** - here secret is a number, which is separated into **d shares**, so that the following equation satisfies:
> 	x = x1 ^ x2 ^ ... ^ xd

```pseudo
for i = 0; i < 16; i++ do
	r = rand()
	x2 = State[i/4][i%4][1]
	for j = 0; j < 256; j++ do
		MS[j] = S-box[j ^ x2] ^ r
	State[i/4][i%4] = MS[State[i/4][i%4]]
	State[i/4][i%4] = r
return State
```

Pros:
- **Secret data** is never manipulated **directly**, therefore each side-channel leak is independent of the **secret data**;
- Very low cost of masking **(d - 1) random bytes** per table;
Cons:
- High cost of **random number generation** on large tables.
Features:
- Required random number generator;

### Best Countermeasure?

The best countermeasur is a combination of each, so that it will be hard for the adversary to create a proper attack algorithm. Recommended approach:
- Protect transformation by **masking** to increase the amount of traces needed to uncover the underlying **data-dependent** traces;
- Protect execution with **shuffling** to dissalign each individual trace, forcing the adversary to perform **additional brute-force attacks on indexes** (*Only if the amount of operations is big enough*);
- Protect execution with **random inserted interrupts** to dissalign each trace, forcing the adversary to use **additional DSP algorithm for realignment** (*Only if the amount of operations is too small for shuffling*);

