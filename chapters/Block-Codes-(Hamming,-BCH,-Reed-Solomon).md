---
layout: chapter
title: "Block-Codes-(Hamming,-BCH,-Reed-Solomon)"
chapter: 16
permalink: /chapters/block-codes-(hamming,-bch,-reed-solomon)/
---

# Block Codes (Hamming, BCH, Reed-Solomon)

\[\[Home\]\] **Coding Theory**
\[\[Hamming-Distance-&-Error-Detection\]\]
\[\[Convolutional-Codes-&-Viterbi-Decoding\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Block codes are like adding sudoku-style clues to your
message---if some numbers get corrupted, you can solve for the
missing ones using the patterns!**

**The idea - Add smart redundancy**: 1. Take a block of data (e.g.,
4 bits: `1011`) 2. Add parity bits using math (e.g., 3 extra
bits: `010`) 3. Send the whole thing: `1011010` (7 bits
total) 4. Receiver checks if the math works out 5. If errors detected,
use the math to FIX them!

**Three famous block codes**:

**1. Hamming Code** (invented 1950): - **Use case**: Computer
RAM error correction - **Example**: (7,4) Hamming code - 4 data
bits + 3 parity bits = 7 total - Can fix any single bit error
automatically! - **Your computer**: Uses Hamming codes in ECC RAM

**2. BCH Code** (Bose-Chaudhuri-Hocquenghem): - **Use case**:
QR codes, flash memory, DVDs - **Power**: Can fix multiple errors
in a block - **Example**: QR code can work with 30% damaged! -
**Your phone**: Flash storage uses BCH to survive wear

**3. Reed-Solomon Code** (most powerful!): - **Use case**:
CDs, DVDs, Blu-ray, satellite TV, QR codes - **Power**: Can fix
burst errors (many consecutive bits) - **Example**: CD can have
2.5mm scratch and still play! - **Your life**: Every CD/DVD/QR code
you've used!

**How Reed-Solomon saves your music**: - **CD without
Reed-Solomon**: Tiny scratch = music skips - **CD with
Reed-Solomon**: Can fix 4000 consecutive bad bits! - This is why CDs
still play with scratches

**Real-world magic**:

**QR Code** (Reed-Solomon): - Generate QR code - Cover 30% with
sticker - Scan \$\rightarrow\$ STILL WORKS! - Reed-Solomon
fills in the missing parts!

**DVD scratch** (Reed-Solomon): - Scratch covers 2mm -
That's ~6000 bits corrupted -
Reed-Solomon: “I got this” - Movie plays perfectly

**The trade-off**: - **More redundancy** = fix more errors BUT
slower/less efficient - Hamming (7,4): 43% overhead, fixes 1 error -
Reed-Solomon (255,223): 14% overhead, fixes 16 errors!

**Block sizes**: - **Small blocks** (7 bits): Simple, fast,
low latency - **Large blocks** (255 bytes): Powerful, efficient,
but complex - **Huge blocks** (8192 bytes): Maximum power, used in
deep space!

**Fun fact**: The Voyager space probes (launched 1977) use
Reed-Solomon codes to transmit photos from interstellar space. With
signal so weak it's barely detectable, Reed-Solomon
error correction is the ONLY reason we can still see those stunning
images!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Block codes** encode fixed-length blocks of $`k`$ data symbols
into $`n`$ code symbols.

**Notation**: $`(n, k)`$ code - $`n`$ = Codeword length - $`k`$ =
Message length - $`n - k`$ = Redundancy (parity symbols)

**Code rate**: $`R = k/n`$ (fraction of data)

**Types**: 1. **Linear block codes**: Codewords form vector
space 2. **Cyclic codes**: Codewords are cyclic shifts of each
other 3. **Non-linear codes**: More complex (less common)

<div class="center">

------------------------------------------------------------------------

</div>

## Linear Block Codes

### Generator Matrix

**Encoding**: $`\mathbf{c} = \mathbf{d} \cdot G`$

Where: - $`\mathbf{d}`$ = Data vector (1\$\times\$k) -
$`G`$ = Generator matrix (k\$\times\$n) - $`\mathbf{c}`$ =
Codeword vector (1\$\times\$n)

**Systematic form**: $`G = [I_k | P]`$ - First $`k`$ bits = data
(unchanged) - Last $`n-k`$ bits = parity

<div class="center">

------------------------------------------------------------------------

</div>

### Parity-Check Matrix

**Matrix** $`H`$ ($`(n-k) \times n`$) such that:

``` math
\mathbf{c} \cdot H^T = \mathbf{0}
```

For all valid codewords $`\mathbf{c}`$

**Systematic form**: $`H = [-P^T | I_{n-k}]`$

<div class="center">

------------------------------------------------------------------------

</div>

### Syndrome Decoding

**Receive** $`\mathbf{r} = \mathbf{c} + \mathbf{e}`$ (error vector
$`\mathbf{e}`$)

**Syndrome**: $`\mathbf{s} = \mathbf{r} \cdot H^T`$

**Property**: $`\mathbf{s} = \mathbf{e} \cdot H^T`$ (independent of
codeword!)

**Decoding**: 1. Calculate syndrome $`\mathbf{s}`$ 2. Lookup error
pattern $`\mathbf{e}`$ from syndrome table 3. Correct:
$`\hat{\mathbf{c}} = \mathbf{r} - \mathbf{e}`$

<div class="center">

------------------------------------------------------------------------

</div>

## Hamming Codes

**Family**: $`(2^m - 1, 2^m - m - 1)`$ for $`m \geq 2`$

**Common examples**: - $`(7, 4)`$: 4 data, 3 parity - $`(15, 11)`$:
11 data, 4 parity - $`(31, 26)`$: 26 data, 5 parity

**Properties**: - $`d_{\min} = 3`$ - Correct 1 error - Detect 2
errors - **Perfect code** (meets Hamming bound)

<div class="center">

------------------------------------------------------------------------

</div>

### Hamming(7,4) Example

**Generator matrix** (systematic form):

``` math
G = \begin{bmatrix}
1 & 0 & 0 & 0 & 1 & 1 & 0 \\
0 & 1 & 0 & 0 & 1 & 0 & 1 \\
0 & 0 & 1 & 0 & 0 & 1 & 1 \\
0 & 0 & 0 & 1 & 1 & 1 & 1
\end{bmatrix}
```

**Parity-check matrix**:

``` math
H = \begin{bmatrix}
1 & 1 & 0 & 1 & 1 & 0 & 0 \\
1 & 0 & 1 & 1 & 0 & 1 & 0 \\
0 & 1 & 1 & 1 & 0 & 0 & 1
\end{bmatrix}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Encoding Example

**Data**: $`\mathbf{d} = [1, 0, 1, 1]`$

**Encode**:

``` math
\mathbf{c} = \mathbf{d} \cdot G = [1, 0, 1, 1, 0, 0, 1]
```

**Verification**: $`\mathbf{c} \cdot H^T = [0, 0, 0]^T`$

<div class="center">

------------------------------------------------------------------------

</div>

### Decoding Example

**Receive**: $`\mathbf{r} = [1, 0, 1, 0, 0, 0, 1]`$ (error in
position 4)

**Syndrome**:

``` math
\mathbf{s} = \mathbf{r} \cdot H^T = [1, 1, 1]^T = \text{column 4 of } H
```

**Interpretation**: Syndrome points to error position!

**Correct**: Flip bit 4 \$\rightarrow\$
$`\hat{\mathbf{c}} = [1, 0, 1, 1, 0, 0, 1]`$

<div class="center">

------------------------------------------------------------------------

</div>

### Extended Hamming Code

**Add 1 overall parity bit**: $`(2^m, 2^m - m - 1)`$

**Example**: Hamming(8,4) - $`d_{\min} = 4`$ - Correct 1 error -
Detect 3 errors (SECDED: Single Error Correction, Double Error
Detection)

**Use case**: ECC RAM

<div class="center">

------------------------------------------------------------------------

</div>

## BCH Codes

**Bose-Chaudhuri-Hocquenghem (BCH)**: Powerful cyclic codes

**Parameters**: $`(n, k, d_{\min})`$ over $`\mathrm{GF}(q)`$

**Key feature**: Can be designed for specific $`d_{\min}`$ (error
correction capability)

<div class="center">

------------------------------------------------------------------------

</div>

### BCH Code Properties

**Binary BCH**: $`q = 2`$

**Block length**: $`n = 2^m - 1`$

**Minimum distance**: $`d_{\min} \geq 2t + 1`$ (correct $`t`$
errors)

**Systematic**: First $`k`$ bits are data

**Decoding**: Berlekamp-Massey algorithm,
Peterson-Gorenstein-Zierler

<div class="center">

------------------------------------------------------------------------

</div>

### Common BCH Codes

| Code             | $`(n, k)`$ | $`t`$ | $`d_{\min}`$ | Rate |
|:-----------------|:-----------|:------|:-------------|:-----|
| **BCH(15,11)**   | (15, 11)   | 1     | 3            | 0.73 |
| **BCH(15,7)**    | (15, 7)    | 2     | 5            | 0.47 |
| **BCH(31,26)**   | (31, 26)   | 1     | 3            | 0.84 |
| **BCH(31,21)**   | (31, 21)   | 2     | 5            | 0.68 |
| **BCH(31,16)**   | (31, 16)   | 3     | 7            | 0.52 |
| **BCH(63,51)**   | (63, 51)   | 2     | 5            | 0.81 |
| **BCH(127,106)** | (127, 106) | 3     | 7            | 0.83 |

<div class="center">

------------------------------------------------------------------------

</div>

### BCH vs Hamming

**Hamming codes**: Special case of BCH ($`t = 1`$)

**BCH advantage**: Design for any $`t`$ (multiple error correction)

**Example**: BCH(31,16,7) - Corrects $`t = 3`$ errors -
Hamming(31,26,3) corrects only $`t = 1`$

<div class="center">

------------------------------------------------------------------------

</div>

## Reed-Solomon Codes

**Non-binary BCH codes** over $`\mathrm{GF}(2^m)`$ (Galois field)

**Symbol-based**: Operate on $`m`$-bit symbols (not individual
bits)

**Parameters**: RS$`(n, k)`$ over $`\mathrm{GF}(2^m)`$ -
$`n = 2^m - 1`$ symbols - $`k`$ = Data symbols - $`n - k = 2t`$ = Parity
symbols (correct $`t`$ symbol errors)

**Key property**: **Maximum Distance Separable (MDS)**

``` math
d_{\min} = n - k + 1
```

**Interpretation**: Optimal! Meets Singleton bound.

<div class="center">

------------------------------------------------------------------------

</div>

### RS Code Advantages

1.  **Burst error correction**: One symbol error = up to $`m`$ bit
    errors

2.  **Optimal distance**: MDS property

3.  **Well-understood decoding**: Berlekamp-Massey, Euclidean
    algorithm

4.  **Flexible**: Can shorten/puncture for different rates

<div class="center">

------------------------------------------------------------------------

</div>

### Common Reed-Solomon Codes

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Application</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Code</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p><span class="math inline"><em>m</em></span></p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p><span class="math inline">(<em>n</em>, <em>k</em>)</span></p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p><span class="math inline"><em>t</em></span></p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Overhead</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>CD/DVD</strong></td>
<td style="text-align: left;">RS(32,28)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">(255,251) shortened</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">%</td>
</tr>
<tr>
<td style="text-align: left;"><strong>QR Code</strong></td>
<td style="text-align: left;">RS(255,223)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">(255,223)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">%</td>
</tr>
<tr>
<td style="text-align: left;"><strong>DVB (satellite)</strong></td>
<td style="text-align: left;">RS(204,188)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">(255,239) shortened</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">%</td>
</tr>
<tr>
<td style="text-align: left;"><strong>RAID-6</strong></td>
<td style="text-align: left;">RS(n, n-2)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Variable</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">disks</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Voyager</strong></td>
<td style="text-align: left;">RS(255,223)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">(255,223)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">%</td>
</tr>
<tr>
<td style="text-align: left;"><strong>DSL (ADSL2+)</strong></td>
<td style="text-align: left;">RS(255,239)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">(255,239)</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">%</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

### Example: QR Code RS(255,223)

**Parameters**: - $`m = 8`$ (8-bit symbols = bytes) - $`n = 255`$
bytes - $`k = 223`$ bytes (data) - $`2t = 32`$ bytes (parity) - Correct
up to $`t = 16`$ byte errors

**Error burst**: If 128 consecutive bits corrupted (16 bytes),
fully correctable!

<div class="center">

------------------------------------------------------------------------

</div>

### RS Encoding

**Polynomial representation**:

**Data**: $`d_0, d_1, \ldots, d_{k-1}`$ (coefficients)

``` math
D(x) = d_0 + d_1 x + \cdots + d_{k-1} x^{k-1}
```

**Generator polynomial** (degree $`2t`$):

``` math
g(x) = \prod_{i=1}^{2t} (x - \alpha^i)
```

Where $`\alpha`$ = Primitive element of $`\mathrm{GF}(2^m)`$

**Codeword polynomial**: $`C(x) = x^{2t} D(x) + R(x)`$

Where $`R(x) = x^{2t} D(x) \mod g(x)`$ (remainder)

<div class="center">

------------------------------------------------------------------------

</div>

### RS Decoding

**Steps**: 1. **Syndrome calculation**: $`S_i = R(\alpha^i)`$
for $`i = 1, \ldots, 2t`$ 2. **Error locator polynomial**:
Berlekamp-Massey algorithm 3. **Error positions**: Chien search
(find roots) 4. **Error values**: Forney algorithm 5.
**Correction**: Subtract errors from received symbols

**Complexity**: $`O(t^2)`$ or $`O(t \log^2 t)`$ with FFT-based
methods

<div class="center">

------------------------------------------------------------------------

</div>

## Cyclic Codes

**Property**: If $`\mathbf{c} = [c_0, c_1, \ldots, c_{n-1}]`$ is a
codeword, so is any cyclic shift:

``` math
[c_{n-1}, c_0, c_1, \ldots, c_{n-2}]
```

**Advantages**: - Efficient encoding/decoding (shift registers) -
Algebraic structure (polynomials over $`\mathrm{GF}(q)`$)

**Examples**: Hamming codes, BCH codes, Reed-Solomon codes, CRC
codes

<div class="center">

------------------------------------------------------------------------

</div>

### Generator Polynomial

**Every cyclic code** defined by generator polynomial $`g(x)`$

**Degree**: $`\deg(g) = n - k`$

**Property**: $`g(x)`$ divides $`x^n - 1`$

**Encoding**: $`C(x) = D(x) \cdot g(x)`$ (non-systematic)

Or systematic: $`C(x) = x^{n-k} D(x) + [x^{n-k} D(x) \mod g(x)]`$

<div class="center">

------------------------------------------------------------------------

</div>

## Performance Analysis

### Error Correction Probability

**For random errors** (BSC with error probability $`p`$):

**Probability of correct decoding** (code correcting $`t`$ errors):

``` math
P_{\text{correct}} = \sum_{i=0}^{t} \binom{n}{i} p^i (1-p)^{n-i}
```

**Decoding failure** (more than $`t`$ errors):

``` math
P_{\text{fail}} = 1 - P_{\text{correct}}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Example: Hamming(7,4)

**Channel**: BSC with $`p = 10^{-3}`$

**Can correct $`t = 1`$ error**:

``` math
P_{\text{correct}} = (1-p)^7 + \binom{7}{1} p (1-p)^6 = 0.9997
```

**Block error rate**: $`P_{\text{fail}} = 0.0003`$

**Bit error rate** (after decoding):
$`\approx P_{\text{fail}}/7 = 4.3 \times 10^{-5}`$

**Improvement**: $`10^{-3} \to 4.3 \times 10^{-5}`$
(23\$\times\$ better!)

<div class="center">

------------------------------------------------------------------------

</div>

## Concatenated Codes

**Idea**: Use two codes in series

**Outer code**: Strong, complex (e.g., Reed-Solomon)

**Inner code**: Weaker, fast (e.g., convolutional, LDPC)

**Benefit**: Inner code reduces error rate for outer code

<div class="center">

------------------------------------------------------------------------

</div>

### Example: Voyager Mission

**Inner**: Convolutional code (rate 1/2) - Reduces raw BER from
$`5 \times 10^{-3}`$ to $`10^{-5}`$

**Outer**: RS(255,223) - Corrects 16 symbol errors - Final BER:
\< $`10^{-10}`$

**Total rate**: $`0.5 \times (223/255) = 0.437`$ (56% overhead)

<div class="center">

------------------------------------------------------------------------

</div>

## Shortened & Punctured Codes

### Shortened Codes

**Remove $`s`$ data symbols** (set to 0, don't
transmit)

**Example**: RS(255,223) \$\rightarrow\$ RS(204,188)
(DVB) - Set first 51 symbols to 0 - Transmit 204 symbols (188 data + 16
parity) - Same $`d_{\min}`$, same correction capability

<div class="center">

------------------------------------------------------------------------

</div>

### Punctured Codes

**Delete some parity bits** (increase code rate)

**Example**: BCH(31,21,5) \$\rightarrow\$
BCH(30,21,4) - Remove 1 parity bit - $`d_{\min}`$ reduces: 5
\$\rightarrow\$ 4 - Correct 2 errors
\$\rightarrow\$ 1 error

**Use case**: Fine-tune code rate for specific channel

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Implementations

### 1. Memory ECC

**ECC DIMM**: Uses Hamming SECDED (72 bits for 64-bit data)

**Chipkill**: RS code across multiple chips - Tolerate entire chip
failure (\$\times\$8 chip = 8-bit symbol error)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Storage (Hard Drives, SSDs)

**RAID-6**: Uses RS(n, n-2) - Tolerate 2 disk failures - Example:
10 disks (8 data + 2 parity)

**SSD error correction**: - BCH codes (10-60 bit correction per 1
KB page) - LDPC (modern SSDs, better performance)

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Optical Media

**CD (Compact Disc)**: - CIRC (Cross-Interleaved Reed-Solomon Code)
- Two RS codes with interleaving - RS(32,28,5) outer, RS(28,24,5) inner
- Tolerates 4000 consecutive error bits (~2.5mm scratch)

**DVD**: - RS(208,192,17) (correct 8 symbol errors) - Better than
CD

**Blu-ray**: - RS(216,192,25) or LDPC (more efficient)

<div class="center">

------------------------------------------------------------------------

</div>

### 4. QR Codes

**Four error correction levels**: - **Level L**: 7% recovery
(RS with $`t=2`$) - **Level M**: 15% recovery ($`t=5`$) -
**Level Q**: 25% recovery ($`t=8`$) - **Level H**: 30%
recovery ($`t=11`$)

**Example**: High-res QR code (Version 40) - 2953 bytes data + 688
bytes parity (Level H) - Can recover from 30% data loss (dirt, damage)

<div class="center">

------------------------------------------------------------------------

</div>

### 5. Satellite Communication

**DVB-S2** (Digital Video Broadcasting): - Outer: BCH(n, k) -
Inner: LDPC (rate 1/4 to 9/10) - Concatenation for robustness

<div class="center">

------------------------------------------------------------------------

</div>

## Python Example: RS(7,3) over GF(8)

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

**Note**: Full RS encoding/decoding requires polynomial operations
over GF---use libraries like `reedsolo` for production.

<div class="center">

------------------------------------------------------------------------

</div>

## Comparison Table

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Code Family</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p><span class="math inline"><em>d</em><sub>min</sub></span></p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Correction</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Decoding</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Best For</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Hamming</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">bit</td>
<td style="text-align: left;">Simple (syndrome)</td>
<td style="text-align: left;">RAM, simple
systems</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Extended Hamming</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">bit, detect 2</td>
<td style="text-align: left;">Simple</td>
<td style="text-align: left;">ECC RAM
(SECDED)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>BCH</strong></td>
<td style="text-align: left;"><span class="math inline">2<em>t</em> + 1</span></td>
<td style="text-align: left;"><span class="math inline"><em>t</em></span> bits</td>
<td style="text-align: left;">BM algorithm</td>
<td style="text-align: left;">Moderate errors</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Reed-Solomon</strong></td>
<td style="text-align: left;"><span class="math inline"><em>n</em> − <em>k</em> + 1</span></td>
<td style="text-align: left;"><span class="math inline"><em>t</em> = (<em>n</em> − <em>k</em>)/2</span> symbols</td>
<td style="text-align: left;">BM + Forney</td>
<td style="text-align: left;">Burst errors, storage</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Golay(23,12)</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">bits</td>
<td style="text-align: left;">Table lookup</td>
<td style="text-align: left;">Legacy (NASA)</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Design Trade-offs

**Code rate** (R) vs **Error correction** ($`t`$):

| Code         | Rate  | $`t`$ (bits) | Overhead | Complexity |
|:-------------|:------|:-------------|:---------|:-----------|
| Hamming(7,4) | 0.57  | 1            | 75%      | Very low   |
| BCH(31,16)   | 0.52  | 3            | 94%      | Moderate   |
| RS(255,223)  | 0.875 | 16 symbols   | 14%      | Moderate   |
| Golay(23,12) | 0.52  | 3            | 92%      | Low        |

**General rule**: Stronger correction \$\rightarrow\$
More overhead \$\rightarrow\$ Lower rate

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Hamming-Distance-&-Error-Detection\]\]**: Foundation
  for block codes

- **\[\[Convolutional-Codes-&-Viterbi-Decoding\]\]**:
  Sequential codes

- **\[\[LDPC-Codes\]\]**: Modern capacity-approaching codes

- **\[\[Forward-Error-Correction-(FEC)\]\]**: General FEC
  principles

- **\[\[Bit-Error-Rate-(BER)\]\]**: Performance metric

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Block codes encode $`k`$ data symbols
into $`n`$ code symbols.** Linear block codes use generator matrix $`G`$
for encoding, parity-check matrix $`H`$ for syndrome decoding.
**Hamming codes**: $`(2^m-1, 2^m-m-1, 3)`$ correct 1 bit error,
perfect codes. **BCH codes**: Cyclic codes designed for specific
$`t`$-error correction (Berlekamp-Massey decoding). **Reed-Solomon
codes**: Non-binary ($`\mathrm{GF}(2^m)`$), MDS property
($`d_{\min} = n-k+1`$), optimal for burst errors. RS used in CDs, DVDs,
QR codes, RAID, satellite. Concatenated codes (inner + outer) achieve
very low BER (e.g., Voyager \< $`10^{-10}`$). Trade-off: Higher
correction capability requires more parity (lower rate).

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
