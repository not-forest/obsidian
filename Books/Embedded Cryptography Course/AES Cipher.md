> **Advanced Encryption Standard (AES)** - is a trusted encryption algorithm developed by the National Institute of Standards and Technology.
## Most Important Features:
- AES is a **block cipher**;
- Based on size of key in bits, there are *AES-128, AES-192, AES-256* variants;
- Always encrypts data in **blocks of 128 bits** each.

Each block will be encrypted by the same algorithm that consists of **N** rounds, where **N** depends on the **key size** and their relation is shown below:

| N (Number of Rounds) | Key Size (bits) |
| -------------------- | --------------- |
| 10                   | 128             |
| 12                   | 192             |
| 14                   | 256             |
Each round obtains its own **Round Key** derived from the initial input key *k*. Each round will use a key, which is different by value, until the message is encrypted with *N* rounds.:

![[Pasted image 20251128174423.png]]

AES considers each 128-bit input block as a **4x4 byte matrix** in **column-major** arrangement:
$$
	\begin{bmatrix}
		m0 & m4 & m8 & m12 \\
		m1 & m5 & m9 & m13 \\
		m2 & m6 & m10 & m14 \\
		m3 & m7 & m11 & m15 \\
	\end{bmatrix}
$$
Algorithm consists of four different operations on the above matrixes, where last round do not use *mixColumns*:
- *subBytes* - each bytes is substituted by another byte via a lookup table called **S-Box**;
- *shiftRows* - Shifts rows predefined (hardcoded) numbers of times; 
- *mixColumns* (skipped in last round) - Mixes columns;
- *addRoundKey* - block is **XOR**ed  with the corresponding round key. At this step only, the data from previous step is not considered as a block, but just as a linear array of values.

