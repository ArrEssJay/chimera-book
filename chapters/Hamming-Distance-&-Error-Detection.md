---
layout: chapter
title: "Hamming-Distance-&-Error-Detection"
chapter: 30
permalink: /chapters/hamming-distance-&-error-detection/
---

# Hamming Distance & Error Detection

\[\[Home\]\] **Coding Theory**
\[\[Forward-Error-Correction-(FEC)\]\]
\[\[Block-Codes-(Hamming,-BCH,-Reed-Solomon)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Hamming distance is like counting spelling differences between
words---the more letters that differ, the easier it is to detect
typos!**

**The idea - How different are two words?**

Compare these: - `CAT` vs `CAR`
\$\rightarrow\$ **1 letter different**
\$\rightarrow\$ Hamming distance = 1 - `CAT` vs
`DOG` \$\rightarrow\$ **3 letters different**
\$\rightarrow\$ Hamming distance = 3 - `HELLO` vs
`HELLO` \$\rightarrow\$ **0 letters
different** \$\rightarrow\$ Hamming distance = 0

**Why this matters for error detection**:

**Problem**: Radio noise flips bits
(0\$\rightarrow\$1 or 1\$\rightarrow\$0)

**Solution**: Use codewords that are far apart! - Valid codewords:
`00000`, `11111` (distance = 5) - Received: `00100`
(1 bit flipped) - Decoder: “Closer to `00000` than
`11111`? Must have been `00000`!”

**Rule of thumb**: - **Distance 2**: Can **detect** 1
error (knows something's wrong) - **Distance 3**:
Can **correct** 1 error (fixes it automatically) - **Distance
5**: Can **correct** 2 errors OR **detect** 4 errors

**Real-world example - ISBN numbers**: - Book ISBNs have built-in
Hamming distance - Typo in one digit? System detects it! - Typo in two
digits? Usually detected! - This is why Amazon catches typos when you
enter an ISBN

**Everyday examples**: - **Credit card numbers**: Luhn
algorithm (distance-based error detection) - **QR codes**: Large
Hamming distance = works even with damage - **Your WiFi**: Uses
codes with distance 3-5 to auto-correct bit errors

**Fun fact**: Hamming codes (invented in 1950) are why computer RAM
can automatically detect/correct errors---cosmic rays flip bits,
Hamming distance catches them!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Hamming distance** measures how many **bit positions
differ** between two codewords.

**Definition**: For binary strings $`x`$ and $`y`$:

``` math
d_H(x, y) = \text{number of positions where } x_i \neq y_i
```

**Example**: - $`x = 10110`$ - $`y = 10011`$ - $`d_H(x, y) = 2`$
(differ in positions 3 and 4)

**Significance**: Determines **error detection** and
**correction capability** of a code.

<div class="center">

------------------------------------------------------------------------

</div>

## Minimum Distance

**Code** $`C`$ = Set of valid codewords

**Minimum distance** $`d_{\min}`$:

``` math
d_{\min} = \min_{x,y \in C, x \neq y} d_H(x, y)
```

**Key property**: $`d_{\min}`$ determines code's
error-handling capability

<div class="center">

------------------------------------------------------------------------

</div>

### Error Detection Capability

**Theorem**: A code with minimum distance $`d_{\min}`$ can
**detect** up to:

``` math
t_{\text{detect}} = d_{\min} - 1 \text{ errors}
```

**Why**: To detect $`t`$ errors, codewords must differ in
\$\geq\$ $`t+1`$ positions

<div class="center">

------------------------------------------------------------------------

</div>

### Error Correction Capability

**Theorem**: A code with minimum distance $`d_{\min}`$ can
**correct** up to:

``` math
t_{\text{correct}} = \left\lfloor \frac{d_{\min} - 1}{2} \right\rfloor \text{ errors}
```

**Why**: Need “space” around each codeword to uniquely decode

<div class="center">

------------------------------------------------------------------------

</div>

### Combined Detection & Correction

**Can simultaneously**: - Correct $`t`$ errors - Detect $`t + s`$
errors

**Requirement**:

``` math
d_{\min} \geq 2t + s + 1
```

**Example**: $`d_{\min} = 7`$ - Correct 2 errors, detect 2 more
(2\$\times\$2 + 2 + 1 = 7) - Or correct 3 errors (no
detection beyond that)

<div class="center">

------------------------------------------------------------------------

</div>

## Examples

### Simple Parity Code

**Codewords**: Add 1 parity bit to make total 1's
even

**Example (3-bit data)**: - 000 \$\rightarrow\$
000**0** (0 ones, even) - 001 \$\rightarrow\$
001**1** (2 ones, even) - 010 \$\rightarrow\$
010**1** (2 ones, even) - 011 \$\rightarrow\$
011**0** (2 ones, even) - \ldots{}

**Minimum distance**: $`d_{\min} = 2`$ - Any two codewords differ
in \$\geq\$2 positions

**Capability**: - Detect: $`2 - 1 = 1`$ error - Correct:
$`\lfloor(2-1)/2\rfloor = 0`$ errors (none)

<div class="center">

------------------------------------------------------------------------

</div>

### Repetition Code (3-bit)

**Encoding**: Repeat each bit 3 times - 0
\$\rightarrow\$ 000 - 1 \$\rightarrow\$ 111

**Minimum distance**: $`d_{\min} = 3`$ - 000 and 111 differ in all
3 positions

**Capability**: - Detect: $`3 - 1 = 2`$ errors - Correct:
$`\lfloor(3-1)/2\rfloor = 1`$ error

**Example error correction**: - Received: 0**1**0 (1 error) -
Nearest codeword: 000 \$\rightarrow\$ Decode as 0

<div class="center">

------------------------------------------------------------------------

</div>

### Hamming(7,4) Code

**Parameters**: - 7 bits total (4 data + 3 parity) -
$`d_{\min} = 3`$

**Capability**: - Correct 1 error - Detect 2 errors

**Efficiency**: Rate = 4/7 = 0.57 (57% data, 43% overhead)

<div class="center">

------------------------------------------------------------------------

</div>

## Hamming Weight

**Hamming weight** $`w_H(x)`$ = Number of 1's in
$`x`$

**Relationship to distance**:

``` math
d_H(x, y) = w_H(x \oplus y)
```

Where $`\oplus`$ = XOR (exclusive OR)

**Example**: - $`x = 10110`$ - $`y = 10011`$ -
$`x \oplus y = 00101`$ (weight = 2) - $`d_H(x, y) = 2`$

<div class="center">

------------------------------------------------------------------------

</div>

### Linear Codes

**For linear codes**: $`d_{\min}`$ = minimum non-zero codeword
weight

**Why**: $`d_H(x, y) = w_H(x \oplus y)`$, and $`x \oplus y`$ is
also a codeword (closure property)

**Simplification**: Only need to check weights, not all pairs!

<div class="center">

------------------------------------------------------------------------

</div>

## Error Detection Methods

### 1. Single Parity Check

**Add 1 bit** to make total 1's even (or odd)

**Even parity**:

``` math
p = d_1 \oplus d_2 \oplus \cdots \oplus d_k
```

**Properties**: - $`d_{\min} = 2`$ - Detects all single-bit errors
- Detects all odd-number errors - **Cannot detect even-number
errors** (2, 4, 6, \ldots{})

**Use case**: Memory (SIMM, DIMM) basic protection

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Two-Dimensional Parity

**Arrange data in matrix**, add parity for rows and columns:

    d11  d12  d13  | p1  (row parity)
    d21  d22  d23  | p2
    d31  d32  d33  | p3
    -----------------
     c1   c2   c3  | pc  (col parity, overall)

**Properties**: - Detect all 1, 2, 3-bit errors - Correct
single-bit error (row \$\cap\$ column identifies position)
- Some 4+ bit error patterns undetected

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Cyclic Redundancy Check (CRC)

**Polynomial-based** error detection

**Idea**: Treat message as polynomial, divide by generator
$`g(x)`$, append remainder

**Example (CRC-8)**: - Generator: $`g(x) = x^8 + x^2 + x + 1`$ -
8-bit checksum

**Properties**: - Detect all single-bit errors - Detect all
double-bit errors - Detect all odd-number errors (if $`g(x)`$ has
$`(x+1)`$ factor) - Detect all burst errors \$\leq\$
degree of $`g(x)`$

**Common CRCs**: - **CRC-16**: Modbus, USB - **CRC-32**:
Ethernet, ZIP, PNG - **CRC-CCITT**: Bluetooth, X.25

<div class="center">

------------------------------------------------------------------------

</div>

### 4. Checksum

**Simple sum** of data bytes (with wraparound)

**Example (16-bit)**:

``` math
\text{Checksum} = \left(-\sum_{i} \text{data}_i\right) \bmod 2^{16}
```

**Properties**: - Fast to compute - Weaker than CRC
(doesn't catch all bit reorderings)

**Use case**: TCP, UDP, IP headers

<div class="center">

------------------------------------------------------------------------

</div>

## Error Correction Principles

### Maximum Likelihood Decoding

**Receive** $`r`$ (possibly corrupted)

**Decode to codeword** $`\hat{c}`$ that maximizes $`P(c | r)`$

**For AWGN channel**: Minimum Euclidean distance

**For BSC** (binary symmetric channel): Minimum Hamming distance

``` math
\hat{c} = \arg\min_{c \in C} d_H(r, c)
```

<div class="center">

------------------------------------------------------------------------

</div>

### Syndrome Decoding

**For linear codes**:

**Syndrome**: $`s = r \cdot H^T`$

Where: - $`r`$ = Received word - $`H`$ = Parity-check matrix

**Property**: $`s = 0`$ iff $`r`$ is valid codeword

**Error pattern** identified by syndrome lookup table

<div class="center">

------------------------------------------------------------------------

</div>

### Bounded Distance Decoding

**Decode successfully if** $`d_H(r, c) \leq t`$

Where $`t = \lfloor (d_{\min} - 1)/2 \rfloor`$

**If** $`d_H(r, c) > t`$ **for all** $`c`$: -
**Erasure**: Declare decoding failure (more honest) -
**Guess**: Pick nearest (may introduce errors)

<div class="center">

------------------------------------------------------------------------

</div>

## Coding Bounds

### Hamming Bound (Sphere-Packing Bound)

**Volume** of Hamming sphere (radius $`t`$):

``` math
V(t) = \sum_{i=0}^{t} \binom{n}{i}
```

**Hamming bound**: For $`(n, k)`$ code correcting $`t`$ errors:

``` math
2^k \cdot V(t) \leq 2^n
```

**Or**:

``` math
2^{n-k} \geq \sum_{i=0}^{t} \binom{n}{i}
```

**Interpretation**: Need \$\geq\$ this many parity
bits

<div class="center">

------------------------------------------------------------------------

</div>

### Perfect Codes

**Code is perfect** if Hamming bound is met with equality

**Examples**: - Hamming codes (single-error correcting) - Golay
code (23, 12, 7) - Repetition codes (trivial)

**Property**: Every received word is within distance $`t`$ of
exactly one codeword (no “wasted” space)

<div class="center">

------------------------------------------------------------------------

</div>

### Singleton Bound

``` math
d_{\min} \leq n - k + 1
```

**Codes meeting this**: **Maximum Distance Separable (MDS)**

**Examples**: Reed-Solomon codes (meet Singleton bound)

<div class="center">

------------------------------------------------------------------------

</div>

### Gilbert-Varshamov Bound

**Existence bound**: Guarantees codes exist with certain
$`d_{\min}`$

``` math
\sum_{i=0}^{d-2} \binom{n-1}{i} < 2^{n-k}
```

**Interpretation**: “Good” codes exist, even if we
don't know how to construct them

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Error Detection

### Memory (ECC RAM)

**Single Error Correction, Double Error Detection (SECDED)**: -
Hamming code with extra parity bit - $`d_{\min} = 4`$ - Correct 1 bit,
detect 2 bits

**Example**: 64-bit data - Hamming: 7 parity bits (for 1-bit
correction) - +1 bit for double detection \$\rightarrow\$
8 bits total - (64, 72) SECDED code

<div class="center">

------------------------------------------------------------------------

</div>

### Storage (Hard Drives, SSDs)

**Reed-Solomon codes**: - Detect/correct burst errors - Used in
RAID, CDs, DVDs, QR codes

**Example**: CD - RS(32, 28, 5) over $`\mathrm{GF}(2^8)`$ - Can
correct 2 symbol errors (16 bits)

<div class="center">

------------------------------------------------------------------------

</div>

### Networking

**CRC-32** (Ethernet): - Detects all burst errors
\$\leq\$32 bits - Detects 99.9999% of longer bursts

**TCP checksum**: - 16-bit sum (weak) - Mainly detects random
errors, not malicious

<div class="center">

------------------------------------------------------------------------

</div>

### Spacecraft

**Concatenated codes**: - Inner: Convolutional or LDPC (correct
frequent errors) - Outer: Reed-Solomon (correct burst errors)

**Example**: Voyager - (7, 1/2) convolutional + RS(255, 223) -
$`d_{\min} = 33`$ (outer code) - Can correct 16 symbol errors

<div class="center">

------------------------------------------------------------------------

</div>

## Burst Error Detection

**Burst error**: Consecutive bits corrupted

**Length $`b`$ burst**: Errors span $`b`$ consecutive bits

<div class="center">

------------------------------------------------------------------------

</div>

### Fire Codes

**Designed for burst errors**

**Parameters**: $`(n, k)`$ code detecting bursts
\$\leq\$ $`b`$

**Requirement**: $`n - k \geq b`$

**Generator polynomial**: Special structure

<div class="center">

------------------------------------------------------------------------

</div>

### Interleaving

**Spread codeword symbols** across time/space

**Example (depth 5)**:

    Original:
    C1: a1 a2 a3 a4
    C2: b1 b2 b3 b4
    C3: c1 c2 c3 c4
    C4: d1 d2 d3 d4
    C5: e1 e2 e3 e4

    Transmitted:
    a1 b1 c1 d1 e1 | a2 b2 c2 d2 e2 | a3 b3 c3 d3 e3 | ...

    If burst corrupts 5 bits:
    a1 b1 c1 d1 e1  (all corrupted)
             
    Each codeword sees only 1 error  All correctable!

**Use case**: CDs (scratch protection), wireless (fading)

<div class="center">

------------------------------------------------------------------------

</div>

## Distance Spectrum

**Weight distribution** $`A_i`$ = Number of codewords with weight
$`i`$

**Notation**: $`\{A_0, A_1, A_2, \ldots, A_n\}`$

**Example**: Hamming(7,4) - $`A_0 = 1`$ (all-zeros) - $`A_3 = 7`$
(weight 3) - $`A_4 = 7`$ (weight 4) - $`A_7 = 1`$ (all-ones)

**Use**: Calculate average error probability

<div class="center">

------------------------------------------------------------------------

</div>

### Union Bound on Error Probability

``` math
P_e \leq \sum_{i=d_{\min}}^{n} A_i \cdot P(\text{decode } c_i \text{ as another codeword})
```

**Tight at high SNR**

<div class="center">

------------------------------------------------------------------------

</div>

## Soft-Decision Metrics

**Hard decision**: Received bit \$\rightarrow\$ 0 or
1 (threshold)

**Soft decision**: Keep analog value (confidence)

**Soft Hamming distance** (Euclidean):

``` math
d_{\text{soft}}(r, c) = \sum_{i=1}^{n} (r_i - c_i)^2
```

Where $`r_i \in \mathbb{R}`$ (e.g., LLRs)

**Benefit**: ~2-3 dB coding gain

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table

| Error Type                | Detection Method | Overhead | Capability          |
|:--------------------------|:-----------------|:---------|:--------------------|
| **Single bit**            | Parity           | 1 bit    | Detect only         |
| **1-2 bits**              | Hamming(7,4)     | 43%      | Correct 1, detect 2 |
| **Burst \$\leq\$32 bits** | CRC-32           | 32 bits  | Detect              
                                                           only                 |
| **Random errors**         | Reed-Solomon     | 10-20%   | Correct + detect    |
| **Deep space**            | Concatenated     | 50%+     | Very robust         |

<div class="center">

------------------------------------------------------------------------

</div>

## Code Comparison

| Code                 | (n, k)     | $`d_{\min}`$ | Correct | Detect | Rate        |
|:---------------------|:-----------|:-------------|:--------|:-------|:------------|
| **Parity**           | (n, n-1)   | 2            | 0       | 1      | 0.875 (n=8) |
| **Rep(3)**           | (3, 1)     | 3            | 1       | 2      | 0.33        |
| **Hamming(7,4)**     | (7, 4)     | 3            | 1       | 2      | 0.57        |
| **Extended Hamming** | (8, 4)     | 4            | 1       | 3      | 0.50        |
| **Golay(23,12)**     | (23, 12)   | 7            | 3       | 6      | 0.52        |
| **RS(255,223)**      | (255, 223) | 33           | 16      | 32     | 0.875       |

<div class="center">

------------------------------------------------------------------------

</div>

## Python Example: Hamming Distance

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Forward-Error-Correction-(FEC)\]\]**: Using redundancy
  for correction

- **\[\[Block-Codes-(Hamming,-BCH,-Reed-Solomon)\]\]**:
  Specific code constructions

- **\[\[Convolutional-Codes-&-Viterbi-Decoding\]\]**:
  Sequential error correction

- **\[\[LDPC-Codes\]\]**: Modern capacity-approaching codes

- **\[\[Bit-Error-Rate-(BER)\]\]**: Performance metric

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Hamming distance $`d_H(x,y)`$ counts
differing bit positions.** Minimum distance $`d_{\min}`$ determines
error-handling capability: detect $`d_{\min}-1`$ errors, correct
$`\lfloor(d_{\min}-1)/2\rfloor`$ errors. Single parity ($`d_{\min}=2`$)
detects 1 error. Hamming codes ($`d_{\min}=3`$) correct 1 error.
Reed-Solomon ($`d_{\min}=33`$) corrects 16 symbol errors. CRC detects
burst errors efficiently. Interleaving converts burst errors to
scattered errors. Soft-decision decoding gains ~2 dB over
hard decision. Trade-off: Larger $`d_{\min}`$ requires more redundancy
(lower code rate).

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
