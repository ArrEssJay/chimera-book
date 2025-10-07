---
layout: chapter
title: "Convolutional-Codes-&-Viterbi-Decoding"
chapter: 21
permalink: /chapters/convolutional-codes-&-viterbi-decoding/
---

# Convolutional Codes & Viterbi Decoding

\[\[Home\]\] **Coding Theory**
\[\[Block-Codes-(Hamming,-BCH,-Reed-Solomon)\]\]
\[\[Turbo-Codes\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Convolutional codes + Viterbi decoding is like having a GPS that
considers your entire journey to figure out where you really
are---even if some GPS samples are noisy!**

**The Problem**: - Noise corrupts transmitted bits: some 0s become
1s, some 1s become 0s - How do you figure out what was actually sent?

**The Convolutional Code Solution - Add memory**: 1. Instead of
encoding each bit independently, the encoder “remembers” previous bits
2. Each output bit depends on current + past few input bits 3. This
creates patterns---if one bit gets corrupted, the pattern breaks and
decoder notices!

**The GPS Analogy**: - **Bad GPS**: Each position reading is
independent - Get noisy reading? Can't tell if
it's wrong! - **Smart GPS**: Considers your speed,
direction, previous positions - Get noisy reading that says you
teleported 5 miles? “That's impossible, ignore it!”

**Viterbi Decoding - Find the most likely path**: - Looks at entire
received sequence - Considers all possible paths the data could have
taken - Picks the path that best matches what was received (even with
errors!)

**Real-world example - Space probes**: - **Voyager
spacecraft**: 15+ billion miles away, incredibly noisy signal - Uses
convolutional code with Viterbi decoding - Can correct errors even when
30-40% of bits are corrupted! - This is why we still get photos from
interstellar space!

**Everyday uses**: - **WiFi**: 802.11a/g use convolutional
codes - **Satellite TV**: DVB-S uses convolutional + Viterbi -
**GSM (2G)**: Your old cell phone used this - **GPS signals**:
Navigation satellites use convolutional codes

**Why it works**: - Pattern-based: Errors break patterns, decoder
spots them - Context-aware: Uses past data to correct current data -
Optimal: Viterbi finds the single best answer (mathematically proven!)

**Trade-off**: More memory = better error correction BUT more
complex decoder. Most systems use 3-7 bits of memory (called
“constraint length”).

**Fun fact**: Andrew Viterbi invented this algorithm in 1967 for
deep space communications---then co-founded Qualcomm, making
billions from the algorithm used in every cell phone!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Convolutional codes** encode data **continuously** (not in
fixed blocks).

**Key difference from block codes**: - **Block codes**: Encode
$`k`$ bits \$\rightarrow\$ $`n`$ bits independently -
**Convolutional codes**: Output depends on current +
**previous** input bits (memory)

**Applications**: Satellite (DVB, GPS), WiFi, LTE, deep space
(Voyager, Mars)

**Advantages**: - Excellent performance with soft-decision decoding
- Low latency (streaming) - Viterbi algorithm (optimal ML decoding)

<div class="center">

------------------------------------------------------------------------

</div>

## Basic Concepts

### Constraint Length (K)

**Constraint length** $`K`$ = Number of input bits affecting output

**Memory**: $`m = K - 1`$ (number of shift register stages)

**Example**: $`K = 3`$ - Current bit + 2 previous bits
\$\rightarrow\$ 3 total

<div class="center">

------------------------------------------------------------------------

</div>

### Code Rate (r)

**Rate** $`r = k/n`$: - $`k`$ = Input bits per time step - $`n`$ =
Output bits per time step

**Common rates**: - **r = 1/2**: 1 bit in
\$\rightarrow\$ 2 bits out - **r = 1/3**: 1 bit in
\$\rightarrow\$ 3 bits out - **r = 2/3**: 2 bits in
\$\rightarrow\$ 3 bits out (punctured)

<div class="center">

------------------------------------------------------------------------

</div>

### Encoder Structure

**Shift register** + **modulo-2 adders** (XOR gates)

**Example (r=1/2, K=3)**:

    Input -->  [ ]--[ ]--[ ]  (3-stage shift register)
                 |    |    |
                 v    v    v
                [XOR1]  [XOR2]
                  |      |
                  v      v
               Output1 Output2

**Connections**: Define which register stages feed which XORs

<div class="center">

------------------------------------------------------------------------

</div>

## Convolutional Encoder Example

### NASA Standard (r=1/2, K=7)

**Used in**: Voyager, Cassini, Mars rovers

**Generator polynomials** (octal notation): -
$`g_1 = 171_8 = 1111001_2`$ - $`g_2 = 133_8 = 1011011_2`$

**Structure**:

    Input -->  [D0]--[D1]--[D2]--[D3]--[D4]--[D5]--[D6]
                |     |     |     |     |     |     |
                v     v     v     v     v     v     v
               [   XOR (g1: 1111001)   ] --> Output Y1
               [   XOR (g2: 1011011)   ] --> Output Y2

**Where**: D0 = current input, D1-D6 = previous 6 inputs

<div class="center">

------------------------------------------------------------------------

</div>

### Encoding Example

**Input**: 101

**Initial state**: All zeros \[000000\]

| Time     | Input    | State    | Y1       | Y2       | Output   |
|:---------|:---------|:---------|:---------|:---------|:---------|
|          | 1        | 100000   | 1        | 1        | 11       |
| 1        | 0        | 010000   | 1        | 0        | 10       |
| 2        | 1        | 101000   | 0        | 1        | 01       |
| (flush)  | 0        | 010100   | 0        | 0        | 00       |
| (flush)  | 0        | 001010   | 1        | 1        | 11       |
| \ldots{} | \ldots{} | \ldots{} | \ldots{} | \ldots{} | \ldots{} |

**Output**: 11 10 01 00 11 \ldots{} (12 bits for 3
input bits + flush)

<div class="center">

------------------------------------------------------------------------

</div>

## State Diagram

**States**: All possible shift register contents

**For K=3**: $`2^{K-1} = 2^2 = 4`$ states - State 00, State 01,
State 10, State 11

**Transitions**: Input bit determines next state

**Example (r=1/2, K=3, g1=111, g2=101)**:

    State diagram:

       00 --0/00--> 00
        |  --1/11--> 10
        
       01 --0/11--> 00
        |  --1/00--> 10
        
       10 --0/10--> 01
        |  --1/01--> 11
        
       11 --0/01--> 01
        |  --1/10--> 11

**Notation**: Input/Output (e.g., “1/11” = input 1 produces
output 11)

<div class="center">

------------------------------------------------------------------------

</div>

## Trellis Diagram

**Trellis**: State diagram **unrolled in time**

**Example (K=3, 4 time steps)**:

    Time:   0       1       2       3       4
    State
     00  ----------------------------
           \     |\     |\     |\     |\
            \    | \    | \    | \    | \
     01      ---+------+------+------+---
             |   |\ |   |\ |   |\ |   |\ |
     10      ---+-\----+-\----+-\----+-\-
              \  | \ \  | \ \  | \ \  | \ \
               \ |  \ \ |  \ \ |  \ \ |  \ \
     11         ----------------------------

    Legend:
    Solid line = Input 0
    Dashed line = Input 1
    Each branch labeled with output bits

**Path through trellis** = Encoded sequence

**Decoding**: Find most likely path (Viterbi algorithm)

<div class="center">

------------------------------------------------------------------------

</div>

## Viterbi Algorithm

**Optimal maximum-likelihood (ML) decoding** for convolutional
codes

**Idea**: Find path through trellis with **minimum distance**
to received sequence

**Complexity**: $`O(2^{K-1} \cdot L)`$ where $`L`$ = sequence
length

**Practical**: Efficient for $`K \leq 9`$

<div class="center">

------------------------------------------------------------------------

</div>

### Algorithm Steps

1.  **Initialize**: Start at state 00 (or all states if unknown)

2.  **For each time step**:

    - For each state, compute metrics for incoming branches

    - Select **survivor path** (minimum metric)

    - Store survivor and metric

3.  **Traceback**: From best final state, follow survivor paths
    backward

4.  **Output**: Decoded bit sequence

<div class="center">

------------------------------------------------------------------------

</div>

### Branch Metrics

**Hard-decision** (Hamming distance):

``` math
\text{metric} = \sum_{i=1}^{n} (r_i \oplus c_i)
```

Where: - $`r_i`$ = Received bit (0 or 1) - $`c_i`$ = Expected output bit
for branch

**Soft-decision** (Euclidean distance):

``` math
\text{metric} = \sum_{i=1}^{n} (r_i - c_i)^2
```

Where $`r_i \in \mathbb{R}`$ (e.g., LLR from demodulator)

**Benefit**: Soft-decision gains ~2 dB over
hard-decision

<div class="center">

------------------------------------------------------------------------

</div>

### Path Metric

**Cumulative metric** for path to state $`s`$ at time $`t`$:

``` math
PM_t(s) = PM_{t-1}(s') + BM_t(s' \to s)
```

Where: - $`PM_{t-1}(s')`$ = Path metric to previous state -
$`BM_t(s' \to s)`$ = Branch metric for transition

**Survivor path**: Path with minimum $`PM_t(s)`$

<div class="center">

------------------------------------------------------------------------

</div>

### Example (Hard-Decision)

**Code**: r=1/2, K=3 (4 states)

**Received**: 11 10 01 11 00

**Assume**: Start state 00, end state 00

**Time 0**: Initialize all states (PM = \$\infty\$
except state 00)

**Time 1**: Input unknown, received 11 - Branch
00\$\rightarrow\$00 (output 00): Hamming distance = 2 -
Branch 00\$\rightarrow\$10 (output 11): Hamming distance =
0 - Update: PM(00) = 2, PM(10) = 0

**Continue** for all time steps\ldots{}

**Final**: Traceback from state with minimum PM

<div class="center">

------------------------------------------------------------------------

</div>

## Free Distance

**Free distance** $`d_{\text{free}}`$: Minimum Hamming distance
between **any two distinct paths** in the trellis

**Determines**: Error correction capability

``` math
t_{\text{correct}} = \left\lfloor \frac{d_{\text{free}} - 1}{2} \right\rfloor
```

<div class="center">

------------------------------------------------------------------------

</div>

### Example Free Distances

| Code               | K   | Rate | $`d_{\text{free}}`$ | $`t`$ |
|:-------------------|:----|:-----|:--------------------|:------|
| (5, 1/2)           | 3   | 1/2  | 5                   | 2     |
| (171, 133)         | 7   | 1/2  | 10                  | 4     |
| (561, 753)         | 9   | 1/2  | 12                  | 5     |
| (1167, 1375, 1545) | 9   | 1/3  | 18                  | 8     |

**Pattern**: Larger $`K`$ \$\rightarrow\$ Higher
$`d_{\text{free}}`$ \$\rightarrow\$ Better correction

**Trade-off**: Larger $`K`$ \$\rightarrow\$ More
states \$\rightarrow\$ Higher complexity

<div class="center">

------------------------------------------------------------------------

</div>

## Performance Analysis

### Bit Error Rate (BER)

**Approximate BER** (BPSK over AWGN, hard-decision):

``` math
P_b \approx \sum_{d=d_{\text{free}}}^{\infty} \beta_d \cdot Q\left(\sqrt{2 d R \frac{E_b}{N_0}}\right)
```

Where: - $`\beta_d`$ = Number of bit errors at distance $`d`$ (from
transfer function) - $`R`$ = Code rate - $`Q(x)`$ = Tail probability of
Gaussian

**At high SNR**: Dominated by $`d_{\text{free}}`$ term

<div class="center">

------------------------------------------------------------------------

</div>

### Coding Gain

**Coding gain** (compared to uncoded BPSK):

``` math
G_c = 10 \log_{10}(R \cdot d_{\text{free}}) \quad \text{dB}
```

**Example**: (171, 133), K=7, r=1/2, $`d_{\text{free}}=10`$

``` math
G_c = 10 \log_{10}(0.5 \times 10) = 10 \log_{10}(5) = 7.0 \text{ dB}
```

**With soft-decision**: Add ~2 dB
\$\rightarrow\$ Total gain \$\approx\$ 9 dB

<div class="center">

------------------------------------------------------------------------

</div>

### Example Performance (NASA K=7)

| Eb/N0 (dB) | Uncoded BPSK | Conv (hard) | Conv (soft) |
|:---|:---|:---|:---|
|  | 2.4\$\times\$10\textsuperscript{-}\textsuperscript{2} | 7\$\times\$10\textsuperscript{-}\textsuperscript{3} | 2\$\times\$10\textsuperscript{-}\textsuperscript{3} |
| 4 | 1.2\$\times\$10\textsuperscript{-}\textsuperscript{3} | 3\$\times\$10\textsuperscript{-}\textsuperscript{4} | 5\$\times\$10\textsuperscript{-}\textsuperscript{5} |
| 6 | 2.4\$\times\$10\textsuperscript{-}\textsuperscript{5} | 2\$\times\$10\textsuperscript{-}\textsuperscript{6} | 1\$\times\$10\textsuperscript{-}\textsuperscript{7} |
| 8 | 1.9\$\times\$10\textsuperscript{-}\textsuperscript{7} | 5\$\times\$10\textsuperscript{-}\textsuperscript{9} | 5\$\times\$10\textsuperscript{-}\textsuperscript{1}\textsuperscript{0} |

**Soft-decision gain**: ~2 dB at BER $`10^{-5}`$

<div class="center">

------------------------------------------------------------------------

</div>

## Puncturing

**Puncturing**: Delete some output bits to **increase code
rate**

**Example**: r=1/2 \$\rightarrow\$ r=2/3 (delete
every 3rd bit)

**Puncturing pattern**: Matrix specifying which bits to keep

<div class="center">

------------------------------------------------------------------------

</div>

### Example: Rate 2/3 from Rate 1/2

**Original**: 1 input \$\rightarrow\$ 2 outputs (Y1,
Y2)

**Punctured (2 periods)**:

| Period | Input | Y1  | Y2  | Transmitted |
|:-------|:------|:----|:----|:------------|
|        | bit 1 |     |     | Y1, Y2      |
| 2      | bit 2 |     |     | Y1 only     |

**Result**: 2 inputs \$\rightarrow\$ 3 outputs (rate
2/3)

**Puncturing matrix**:

``` math
P = \begin{bmatrix} 1 & 1 \\ 1 & 0 \end{bmatrix}
```

**1** = transmit, **0** = delete

<div class="center">

------------------------------------------------------------------------

</div>

### Common Punctured Rates

**From r=1/2 base code**:

| Target Rate | Puncturing Period | Complexity |
|:------------|:------------------|:-----------|
| **2/3**     | 2                 | Low        |
| **3/4**     | 3                 | Low        |
| **4/5**     | 4                 | Low        |
| **5/6**     | 5                 | Moderate   |
| **7/8**     | 7                 | Moderate   |

**Used in**: WiFi (802.11a/g), LTE, DVB

<div class="center">

------------------------------------------------------------------------

</div>

## Tail-Biting

**Problem**: Standard encoding requires **flushing** (adds
$`K-1`$ zero bits)

**Overhead**: $`(K-1)/L`$ for message length $`L`$

<div class="center">

------------------------------------------------------------------------

</div>

### Tail-Biting Solution

**Start encoder in non-zero state** such that ending state =
starting state

**Result**: No flush bits needed (circular encoding)

**Decoding**: Try all $`2^{K-1}`$ starting states, pick best

**Benefit**: No overhead (useful for short packets)

**Used in**: LTE control channels

<div class="center">

------------------------------------------------------------------------

</div>

## Recursive Systematic Convolutional (RSC)

**Recursive**: Output fed back to input

**Systematic**: One output = input (uncoded)

**Structure**:

            +--------<---------+
            |                  |
    Input ->+--[Encoder]--+----+--> Output (systematic)
                          |
                          +-------> Output (parity)

**Advantage**: Better for **Turbo codes** (interleaver gain)

**Used in**: Turbo codes, LTE Turbo codes

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Applications

### 1. Deep Space (Voyager)

**Code**: (171, 133), K=7, r=1/2

**Eb/N0**: ~1 dB (extremely weak signal)

**BER**: $`5 \times 10^{-3}`$ (after Viterbi)

**Outer code**: RS(255,223) corrects residual errors

**Final BER**: \< $`10^{-10}`$

<div class="center">

------------------------------------------------------------------------

</div>

### 2. WiFi (802.11a/g)

**Base code**: K=7, r=1/2

**Punctured rates**: 1/2, 2/3, 3/4

**Combined with**: OFDM (64-QAM subcarriers)

**Example (54 Mbps mode)**: - 64-QAM (6 bits/symbol) - Rate 3/4
convolutional code - Effective: 4.5 bits/symbol/subcarrier

<div class="center">

------------------------------------------------------------------------

</div>

### 3. LTE (Before Turbo)

**Early 3G**: Used convolutional codes

**Parameters**: K=9, r=1/3

**Puncturing**: Adaptive (1/2, 2/3, 3/4, 5/6) based on channel

**Replaced by**: Turbo codes in LTE (better performance)

<div class="center">

------------------------------------------------------------------------

</div>

### 4. GPS L1 C/A

**Code**: K=7, r=1/2 (similar to NASA standard)

**Navigation message**: 50 bps

**After encoding**: 100 sps

**Combined with**: BPSK, CDMA spreading (1.023 Mcps)

<div class="center">

------------------------------------------------------------------------

</div>

### 5. DVB-S (Satellite TV)

**Inner code**: K=7, r=1/2, punctured to 2/3, 3/4, 5/6, 7/8

**Outer code**: RS(204,188)

**Concatenation**: Convolutional handles random errors, RS handles
bursts

**Result**: Robust satellite link (rain fade, interference)

<div class="center">

------------------------------------------------------------------------

</div>

## Viterbi Decoder Implementation

### Computational Complexity

**Per time step**: - $`2^K`$ branch metric computations -
$`2^{K-1}`$ add-compare-select (ACS) operations

**Memory**: Store $`2^{K-1}`$ survivor paths (length
\$\approx\$ 5K)

<div class="center">

------------------------------------------------------------------------

</div>

### Traceback Depth

**Typical**: $`5K`$ to $`7K`$ (5-7 times constraint length)

**Example**: K=7 \$\rightarrow\$ Traceback 35-50
steps

**Trade-off**: Longer traceback \$\rightarrow\$
Better decisions, more memory/latency

<div class="center">

------------------------------------------------------------------------

</div>

### Fixed-Point vs Floating-Point

**Fixed-point**: 6-8 bits sufficient for metrics (quantization)

**Benefit**: Faster, less power (embedded systems)

**Performance loss**: Negligible (\<0.1 dB)

<div class="center">

------------------------------------------------------------------------

</div>

## Python Example: Simple Viterbi (K=3)

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

**Output**:

    Original data: [1, 0, 1, 1, 0]
    Encoded: [1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1]
    Received (1 error): [1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1]
    Decoded: [1, 0, 1, 1, 0]
    Match: True

<div class="center">

------------------------------------------------------------------------

</div>

## Comparison: Block vs Convolutional

| Property          | Block Codes          | Convolutional Codes      |
|:------------------|:---------------------|:-------------------------|
| **Encoding**      | Fixed blocks         | Continuous stream        |
| **Memory**        | None (memoryless)    | Yes (shift register)     |
| **Decoding**      | Algebraic (syndrome) | Viterbi (trellis search) |
| **Latency**       | Block delay          | Traceback depth (~5K)    |
| **Soft-decision** | Possible (LLRs)      | Natural (Viterbi)        |
| **Best use**      | Burst errors (RS)    | Random errors (AWGN)     |

<div class="center">

------------------------------------------------------------------------

</div>

## Design Guidelines

**Choose K**: - **K=3-5**: Low complexity, embedded systems -
**K=7**: Standard (NASA, WiFi), good performance - **K=9**:
Better performance, higher complexity

**Choose rate**: - **1/2**: Strong coding (deep space) -
**1/3**: Very strong (low SNR) - **2/3, 3/4**: High throughput
(punctured)

**Soft-decision**: Always use if demodulator provides LLRs (+2 dB
free gain!)

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Block-Codes-(Hamming,-BCH,-Reed-Solomon)\]\]**:
  Alternative FEC approach

- **\[\[Turbo-Codes\]\]**: Concatenated convolutional codes
  (next-gen)

- **\[\[LDPC-Codes\]\]**: Modern capacity-approaching codes

- **\[\[Forward-Error-Correction-(FEC)\]\]**: General FEC
  overview

- **\[\[Bit-Error-Rate-(BER)\]\]**: Performance metric

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Convolutional codes use memory (shift
register + XOR) for continuous encoding.** Constraint length $`K`$
determines states ($`2^{K-1}`$) and performance ($`d_{\text{free}}`$
increases with $`K`$). Viterbi algorithm performs optimal ML decoding
via trellis search. Soft-decision Viterbi gains ~2 dB over
hard-decision. Puncturing increases code rate (1/2
\$\rightarrow\$ 2/3, 3/4). NASA standard (171, 133) K=7,
$`d_{\text{free}}=10`$, ~7 dB coding gain. Used in
Voyager, GPS, WiFi, DVB. Turbo codes (parallel concatenated
convolutional) achieve near-Shannon performance. Trade-off: Larger $`K`$
= better correction but higher complexity.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
