## Number Systems

FPGAs allow a wide variety of computer arithmetic implementations for the desired DSP algorithms, because of the physical level programming architecture, which is much different from the digital signal processors (PDSPs), with the fixed multiply accumulator core.
![[Pasted image 20241115134633.png]]
## Unsigned Integer

The rangle is $[0,2^N-1]$ and represented as:
![[Pasted image 20241115135545.png]]
## Signed Magnitude

The MSB represents the sign, and the remaining N-1 bits the magnitude. 
![[Pasted image 20241115135716.png]]

## Two's Compliment (2C)
![[Pasted image 20241115135759.png]]

## One's Complement (1C)
![[Pasted image 20241115135933.png]]
## Diminished One System (D1)
![[Pasted image 20241115140117.png]]
## Bias System
![[Pasted image 20241115140220.png]]
![[Pasted image 20241115140234.png]]

# Unconventional Fixed-Point Numbers

Rarely used and not a standard, yet may be useful inside the certain part of the implementation

## Signed Digit Numbers (SD)

Useful in carry-free adders or multipliers with less complexity, because the effort of multiplication can typically be estimated through the number of nonzero elements, which can be reduced using SD numbers.
![[Pasted image 20241115141144.png]]

### Algorithm 2.4: Optimal CSD Coding
1. Starting with the LSB substitute all 1 sequences larger than two with 10 ... 0$\overline 1$. Also substitute 1011 with 110$\overline 1$;
2. Starting with the MSB, substitute 10$\overline 1$ with 011.