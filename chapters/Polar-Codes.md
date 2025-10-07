---
layout: chapter
title: "Polar-Codes"
chapter: 47
permalink: /chapters/polar-codes/
---

# Polar Codes

\[\[Home\]\] **Coding Theory**
\[\[Turbo-Codes\]\] \[\[LDPC-Codes\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Polar codes are the newest champion of error
correction---the first codes with mathematical PROOF they reach the
theoretical limit. That's why 5G uses them!**

**What makes them special**: - **First provably optimal
codes**: Math proof they're perfect! - **Channel
polarization**: Clever trick that splits channel into good/bad parts -
**Simpler than LDPC**: Easier to implement in hardware - **5G
standard**: Chosen for 5G control channels!

**The discovery - Recent breakthrough**: - **2008**: Erdal
Ar\i{}kan (Turkish professor) invents polar codes -
**2016**: Adopted by 5G standard (Huawei championed them) -
**Today**: In every 5G phone for control signaling

**The magic trick - Channel polarization**:

Imagine you have a noisy channel: - Some bits get through clean (lucky!)
- Some bits get corrupted (unlucky!) - But you don't
know which is which!

**Polar code solution**: 1. Use clever math to “sort” the channel
2. Some sub-channels become PERFECT (polarized to good) 3. Others become
USELESS (polarized to bad) 4. Send data on perfect channels, known
patterns on bad ones 5. Receiver uses known patterns to decode data!

**Simple analogy - Sorting students**: - 100 students with mixed
abilities - Polar coding: Group them by strength - Put hard problems to
strong students (they'll succeed) - Put easy problems to
weak students (they'll succeed too!) - Result: Maximum
overall success!

**Comparison with other codes**: - **Turbo codes**: Amazing,
but complex, no optimality proof - **LDPC codes**: Near-optimal,
but no explicit proof - **Polar codes**: PROVEN optimal, simpler
structure!

**Where they're used**: - **5G control
channels**: Polar codes for critical signaling - LDPC for data (better at
high rates) - Polar for control (better at low rates) -
**Research**: Future standards, deep space, quantum

**Why 5G chose them**: - **Low latency**: Fast decoding for
control messages - **Flexible**: Work at any code rate -
**Simple**: Easier to implement in 5G chips - **Proven
optimal**: Mathematical guarantee!

**Performance**: - **Shannon limit**: Theoretical best -
**Polar codes**: Proven to reach limit as block size
\$\rightarrow\$ \$\infty\$ -
**Practical**: Within 0.8-1.5 dB of limit at reasonable block sizes
- Comparable to LDPC, but with optimality proof!

**The debate**: - **Huawei pushed Polar**: They hold many
patents - **Qualcomm pushed LDPC**: They have LDPC expertise -
**5G compromise**: Polar for control, LDPC for data - Both sides
win!

**Fun fact**: Polar codes are the only error-correcting codes with
a mathematical proof that they achieve Shannon's
theoretical limit. Every other code (even LDPC) is “just” really good
in practice without the theoretical guarantee!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Polar codes** are the **first provably capacity-achieving
codes** with explicit construction.

**Discovery**: Erdal Ar\i{}kan (2008) - Major
theoretical breakthrough

**Key property**: **Channel polarization** - Split channel
into perfect + useless subchannels

**Performance**: 0.8-1.5 dB from Shannon limit (rate 1/2, block
length 1024+)

**Applications**: **5G NR control channels** (eMBB, URLLC),
future satellite, IoT

<div class="center">

------------------------------------------------------------------------

</div>

## Channel Polarization

**Fundamental idea**: Recursive channel combining + splitting

**Input**: N uses of channel W with capacity I(W)

**Output**: N synthesized channels $`W_i`$, each with capacity
I($`W_i`$)

**Polarization**: As N \$\rightarrow\$
\$\infty\$: - Some channels \$\rightarrow\$
I($`W_i`$) \$\rightarrow\$ 1 (perfect, **noiseless**)
- Others \$\rightarrow\$ I($`W_i`$)
\$\rightarrow\$ 0 (useless, **pure noise**)

**Strategy**: Transmit data on good channels, freeze bad channels
(set to 0)

<div class="center">

------------------------------------------------------------------------

</div>

### Simple Example (N=2)

**Base transformation**:

    u ----> y
          |
    u ---+--> y

**Channel combining**: $`y_1 = u_1 \oplus u_2`$, $`y_2 = u_2`$

**After decoding**: - **Channel for $`u_1`$**: Worse than W
(joint decoding, less reliable) - **Channel for $`u_2`$**: Better
than W (uses $`u_1`$ as side info)

**Result**: Two channels split---one better, one worse
(polarization starts!)

<div class="center">

------------------------------------------------------------------------

</div>

## Polar Transform

**N = 2\textsuperscript{n}** (power of 2)

**Encoding**: $`\mathbf{x} = \mathbf{u} G_N`$

Where: - $`\mathbf{u}`$ = $`(u_1, u_2, \ldots, u_N)`$ (information +
frozen bits) - $`G_N`$ = Polar generator matrix - $`\mathbf{x}`$ =
Transmitted codeword

<div class="center">

------------------------------------------------------------------------

</div>

### Generator Matrix

**Base matrix** (N=2):

``` math
G_2 = \begin{bmatrix} 1 & 0 \\ 1 & 1 \end{bmatrix}
```

**Recursive construction**:

``` math
G_N = \begin{bmatrix} G_{N/2} & G_{N/2} \\ 0 & G_{N/2} \end{bmatrix}
```

**Example** (N=4):

``` math
G_4 = \begin{bmatrix}
1 & 0 & 0 & 0 \\
1 & 1 & 0 & 0 \\
1 & 0 & 1 & 0 \\
1 & 1 & 1 & 1
\end{bmatrix}
```

**Example** (N=8):

``` math
G_8 = G_2 \otimes G_2 \otimes G_2 = \begin{bmatrix}
1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
1 & 1 & 0 & 0 & 0 & 0 & 0 & 0 \\
1 & 0 & 1 & 0 & 0 & 0 & 0 & 0 \\
\vdots & & & \ddots & & & & \\
1 & 1 & 1 & 1 & 1 & 1 & 1 & 1
\end{bmatrix}
```

**Kronecker product**: $`G_N = G_2^{\otimes n}`$ for $`N = 2^n`$

<div class="center">

------------------------------------------------------------------------

</div>

## Code Construction

**Steps**:

1.  **Choose N** (block length, power of 2)

2.  **Compute channel reliabilities**: $`Z(W_i)`$ or $`I(W_i)`$ for
    $`i = 1, \ldots, N`$

3.  **Select K best channels** (highest reliability)

4.  **Information set** $`\mathcal{A}`$: Indices of K best channels

5.  **Frozen set** $`\mathcal{A}^c`$: Remaining N-K indices (set to
    0)

**Code rate**: $`R = K/N`$

<div class="center">

------------------------------------------------------------------------

</div>

### Channel Reliability Metrics

**Bhattacharyya parameter** $`Z(W)`$:

``` math
Z(W) = \sum_{y} \sqrt{W(y|0) \cdot W(y|1)}
```

**Mutual information** $`I(W)`$:

``` math
I(W) = \sum_{y} \sum_{x \in \{0,1\}} W(y|x) \log_2\frac{W(y|x)}{\sum_{x'} W(y|x')}
```

**Properties**: - $`Z(W) \in [0, 1]`$: Lower is better -
$`I(W) \in [0, 1]`$: Higher is better - Perfect channel: $`Z = 0`$,
$`I = 1`$ - Useless channel: $`Z = 1`$, $`I = 0`$

<div class="center">

------------------------------------------------------------------------

</div>

### Density Evolution

**Compute reliabilities recursively**:

**Channel combining** (worse):

``` math
Z(W^-) \approx 2Z(W) - Z(W)^2
```

**Channel splitting** (better):

``` math
Z(W^+) \approx Z(W)^2
```

**Starting point**: Binary symmetric channel (BSC) with crossover
probability $`\epsilon`$

``` math
Z_0 = 2\sqrt{\epsilon(1-\epsilon)}
```

**Recursion**: Apply transformations $`n`$ times for $`N = 2^n`$
channels

<div class="center">

------------------------------------------------------------------------

</div>

## Encoding

**Input**: - Data bits: $`\mathbf{d} = [d_1, d_2, \ldots, d_K]`$ -
Information set: $`\mathcal{A} = \{i_1, i_2, \ldots, i_K\}`$

**Set vector** $`\mathbf{u}`$:

``` math
u_i = \begin{cases}
d_j & \text{if } i = i_j \in \mathcal{A} \\
0 & \text{if } i \in \mathcal{A}^c
\end{cases}
```

**Encode**:

``` math
\mathbf{x} = \mathbf{u} G_N
```

**Complexity**: $`O(N \log N)`$ using FFT-like butterfly structure

<div class="center">

------------------------------------------------------------------------

</div>

### Example (N=8, K=4)

**Information set**: $`\mathcal{A} = \{4, 6, 7, 8\}`$ (best 4
channels)

**Frozen set**: $`\mathcal{A}^c = \{1, 2, 3, 5\}`$ (worst 4
channels)

**Data**: $`\mathbf{d} = [1, 0, 1, 1]`$

**Vector** $`\mathbf{u}`$:

``` math
\mathbf{u} = [0, 0, 0, 1, 0, 0, 1, 1]
```

(Frozen bits at positions 1,2,3,5 set to 0)

**Codeword**:
$`\mathbf{x} = \mathbf{u} G_8 = [0, 0, 0, 1, 0, 0, 1, 0]`$

<div class="center">

------------------------------------------------------------------------

</div>

## Successive Cancellation (SC) Decoding

**Optimal** for polarized channels (as N
\$\rightarrow\$ \$\infty\$)

**Idea**: Decode bits sequentially, use previous decisions as side
info

<div class="center">

------------------------------------------------------------------------

</div>

### Algorithm

**Receive**: $`\mathbf{y} = [y_1, y_2, \ldots, y_N]`$ (soft values
or LLRs)

**For** $`i = 1`$ to $`N`$:

1.  **If** $`i \in \mathcal{A}^c`$ (frozen): Set $`\hat{u}_i = 0`$

2.  **If** $`i \in \mathcal{A}`$ (information):

    - Compute LLR:
      $`L_i = \log\frac{P(u_i=0|\mathbf{y}, \hat{u}_1^{i-1})}{P(u_i=1|\mathbf{y}, \hat{u}_1^{i-1})}`$

    - Decide: $`\hat{u}_i = 0`$ if $`L_i > 0`$, else $`\hat{u}_i = 1`$

**Recursive computation** (tree structure):

                [y, y, y, y]
                       |
             +---------+---------+
             |                   |
        [yy, yy]        [y, y]
             |                   |
          (decode u)        (decode u)

**Complexity**: $`O(N \log N)`$

<div class="center">

------------------------------------------------------------------------

</div>

### LLR Recursion

**Left child** (channel combining, worse):

``` math
L_i^{(s)} = 2 \tanh^{-1}\left(\tanh\left(\frac{L_{2i-1}^{(s+1)}}{2}\right) \cdot \tanh\left(\frac{L_{2i}^{(s+1)}}{2}\right)\right)
```

**Right child** (channel splitting, better):

``` math
L_i^{(s)} = L_{2i}^{(s+1)} + (1 - 2\hat{u}_{2i-1}^{(s)}) L_{2i-1}^{(s+1)}
```

**Where**: $`s`$ = Stage index (0 to $`\log_2 N`$)

<div class="center">

------------------------------------------------------------------------

</div>

## SC List (SCL) Decoding

**Problem**: SC is suboptimal for finite N

**Solution**: Keep **L candidate paths** (like Viterbi)

**SCL Algorithm**:

1.  Start with single path (all frozen bits = 0)

2.  At each information bit:

    - Branch each path (try 0 and 1)

    - Compute path metrics

    - **Keep L best paths** (prune others)

3.  Select best final path

**List size** L = 2, 4, 8, 16, 32

**Performance**: SCL-32 \$\approx\$ ML performance
(near-optimal)

<div class="center">

------------------------------------------------------------------------

</div>

### Path Metric

**Log-likelihood** for path:

``` math
\text{PM} = \sum_{i=1}^{N} \log P(y_i | x_i)
```

**Update**: Add branch metric for each decision

**Complexity**: $`O(L \cdot N \log N)`$

**Example**: L=8, N=1024 \$\rightarrow\$
~8\$\times\$ SC complexity

<div class="center">

------------------------------------------------------------------------

</div>

## CRC-Aided Polar (CA-Polar)

**Problem**: SCL doesn't know which path is correct

**Solution**: Append **CRC** to data before encoding

**Decoding**: 1. SCL decoding produces L candidate paths 2. Check
CRC for each path 3. **Select path with valid CRC**

**CRC length**: 8-24 bits (11-bit CRC typical for 5G)

**Performance**: CA-SCL-8 \$\approx\$ Turbo/LDPC
(practical systems)

<div class="center">

------------------------------------------------------------------------

</div>

### 5G NR Implementation

**Control channels**: Use CA-Polar

**Parameters**: - Block length: N = 512, 1024 (adaptable) - Code
rate: 1/12 to 1/2 (puncturing/shortening) - CRC: 11-bit or 16-bit - List
size: L = 8

**Advantage**: Low latency (no iterations), good short-block
performance

<div class="center">

------------------------------------------------------------------------

</div>

## Rate Matching

**5G supports flexible rates**: Puncturing, shortening, repetition

<div class="center">

------------------------------------------------------------------------

</div>

### Puncturing

**Transmit fewer bits** than N \$\rightarrow\$ Higher
rate

**Method**: Don't transmit first $`P`$ bits (known
frozen bits)

**Example**: N=512, K=256, puncture 128 - Transmit 384 bits -
Effective rate: 256/384 = 2/3

<div class="center">

------------------------------------------------------------------------

</div>

### Shortening

**Transmit fewer bits**, freeze last bits

**Method**: Set last $`S`$ input bits to 0 (frozen),
don't transmit corresponding outputs

**Example**: N=512, K=200, shorten 112 - Effective N = 400 -
Transmit 400 bits - Rate: 200/400 = 1/2

<div class="center">

------------------------------------------------------------------------

</div>

### Repetition

**Transmit more bits** \$\rightarrow\$ Lower rate,
more reliability

**Method**: Repeat some output bits

**Example**: N=256, K=64, repeat 256 - Transmit 512 bits -
Effective rate: 64/512 = 1/8

<div class="center">

------------------------------------------------------------------------

</div>

## Performance Analysis

### BER vs Eb/N0

**Typical performance** (rate 1/2, N=1024, CA-SCL-8):

| Eb/N0 (dB) | Uncoded | SC | SCL-8 | CA-SCL-8 | Shannon Limit |
|:---|:---|:---|:---|:---|:---|
|  | 0.08 | 0.02 | 0.005 | 0.003 | 0 (capacity) |
| 1.0 | 0.02 | 0.005 | 8\$\times\$10\textsuperscript{-}\textsuperscript{4} | 5\$\times\$10\textsuperscript{-}\textsuperscript{4} | \- |
| 1.5 | 0.01 | 2\$\times\$10\textsuperscript{-}\textsuperscript{3} | 10\textsuperscript{-}\textsuperscript{5} | 10\textsuperscript{-}\textsuperscript{6} | Gap \$\approx\$ 0.9 dB |
| 2.0 | 5\$\times\$10\textsuperscript{-}\textsuperscript{3} | 5\$\times\$10\textsuperscript{-}\textsuperscript{4} | 10\textsuperscript{-}\textsuperscript{7} | 10\textsuperscript{-}\textsuperscript{8} | \- |

**Gap to Shannon**: 0.8-1.5 dB (CA-SCL-32, N \$\geq\$
1024)

<div class="center">

------------------------------------------------------------------------

</div>

### Finite-Length Performance

**Short blocks** (N \< 512): Polar competitive with
Turbo/LDPC

**Long blocks** (N \> 2048): Polar slightly behind LDPC

| Block Length | Code             | Eb/N0 @ 10^-5 | Gap to Shannon |
|:-------------|:-----------------|:--------------|:---------------|
| **128**      | Polar (SCL-8)    | 2.5 dB        | +2.0 dB        |
| **512**      | Polar (CA-SCL-8) | 1.5 dB        | +1.2 dB        |
| **1024**     | Polar (CA-SCL-8) | 1.2 dB        | +0.9 dB        |
| **2048**     | LDPC             | 0.8 dB        | +0.5 dB        |

**Polar advantage**: Better short-block performance, lower latency

<div class="center">

------------------------------------------------------------------------

</div>

## Complexity Comparison

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Aspect</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Polar (SC)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Polar (SCL-8)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Turbo</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>LDPC</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Encoding</strong></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em>log <em>N</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em>log <em>N</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em>)</span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Decoding</strong></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em>log <em>N</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(8<em>N</em>log <em>N</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em> ⋅ <em>I</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em> ⋅ <em>I</em>)</span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Latency</strong></td>
<td style="text-align: left;">Low</td>
<td style="text-align: left;">Low</td>
<td style="text-align: left;">High (iterations)</td>
<td style="text-align: left;">Moderate</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Memory</strong></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em>log <em>N</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(8<em>N</em>log <em>N</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em>)</span></td>
<td style="text-align: left;"><span class="math inline"><em>O</em>(<em>N</em>)</span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Parallelism</strong></td>
<td style="text-align: left;">Sequential</td>
<td style="text-align: left;">Sequential</td>
<td style="text-align: left;">Parallel decoders</td>
<td style="text-align: left;">Highly parallel</td>
</tr>
</tbody>
</table>

**Polar trade-off**: Low latency but harder to parallelize
(sequential decoding)

<div class="center">

------------------------------------------------------------------------

</div>

## Advantages of Polar Codes

1.  **Provably capacity-achieving**: Theoretical guarantee

2.  **Low latency**: No iterations (SC/SCL)

3.  **Short-block performance**: Good for N = 128-1024

4.  **Systematic construction**: Explicit, no search (unlike LDPC)

5.  **Flexible rate matching**: Puncture/shorten easily

6.  **5G standardized**: Future-proof

<div class="center">

------------------------------------------------------------------------

</div>

## Disadvantages of Polar Codes

1.  **Sequential decoding**: Hard to parallelize (vs LDPC)

2.  **List decoder complexity**: SCL-8/32 needed for good performance

3.  **Power-of-2 block lengths**: N =
    2\textsuperscript{n} (though can shorten)

4.  **Slightly behind LDPC**: Long blocks (N \> 2048)

5.  **CRC overhead**: CA-Polar needs 11-24 bit CRC

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Applications

### 1. 5G NR Control Channels

**eMBB** (Enhanced Mobile Broadband): - DCI (Downlink Control
Information) - UCI (Uplink Control Information) - Block lengths: 12-1706
bits (shortened from N=512, 1024)

**URLLC** (Ultra-Reliable Low-Latency): - Short blocks (40-200
bits) - Low latency (\<1 ms) - CA-Polar with CRC-11

**mMTC** (Massive Machine-Type): Future use

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Future Satellite

**Low Earth Orbit (LEO)**: Short latency, bursty traffic - Polar
codes fit well (low-latency decoding) - Adaptive rate matching (varying
link quality)

<div class="center">

------------------------------------------------------------------------

</div>

### 3. IoT (Internet of Things)

**NB-IoT**: Narrowband, low power - Short blocks (100-500 bits) -
Polar candidate for uplink control

<div class="center">

------------------------------------------------------------------------

</div>

## Code Construction Algorithms

### 1. Density Evolution (DE)

**Compute** $`Z(W_i)`$ or $`I(W_i)`$ for each subchannel

**Complexity**: $`O(N \log N)`$ preprocessing

**Accuracy**: Exact as N \$\rightarrow\$
\$\infty\$

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Gaussian Approximation (GA)

**Approximate** subchannel distributions as Gaussian

**Mean**: $`\mu_i`$, **Variance**: $`\sigma_i^2`$

**Update rules** (simplified):

``` math
\mu^- = \mu^2 / 2, \quad \mu^+ = 2\mu - \mu^2 / 2
```

**Complexity**: $`O(N)`$ (faster than DE)

**Accuracy**: Good for practical SNR

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Monte Carlo

**Simulate** SC decoding, count errors for each bit position

**Select K positions** with lowest error rate

**Complexity**: High (simulation-based)

**Accuracy**: Best for specific channel/SNR

<div class="center">

------------------------------------------------------------------------

</div>

## Python Example: Polar Encoder

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

**Note**: SC/SCL decoding is complex (~200+ lines).
Use libraries like `sionna` (TensorFlow) or custom MATLAB for
research.

<div class="center">

------------------------------------------------------------------------

</div>

## Design Guidelines

### Choose Polar Codes When:

1.  **5G NR** control channels (standardized)

2.  **Short blocks** (100-1000 bits) with low latency

3.  **Flexible rate matching** needed (puncture/shorten)

4.  **Low-latency** critical (\< 1 ms)

5.  **Systematic construction** preferred (no random search)

### Avoid Polar Codes If:

1.  **Long blocks** (\> 2048 bits)
    \$\rightarrow\$ LDPC better

2.  **Highest throughput** needed \$\rightarrow\$ LDPC
    more parallelizable

3.  **No CRC available** \$\rightarrow\$ CA-Polar needs
    CRC for good performance

4.  **Legacy systems** \$\rightarrow\$ Turbo/LDPC
    already deployed

<div class="center">

------------------------------------------------------------------------

</div>

## Comparison Summary

| Code              | Year      | Gap to Shannon | Latency  | Parallelism | Standard      |
|:------------------|:----------|:---------------|:---------|:------------|:--------------|
| **Convolutional** | 1955      | 6 dB           | Low      | Sequential  | GPS, WiFi     |
| **Turbo**         | 1993      | 0.5 dB         | High     | Moderate    | 3G, 4G        |
| **LDPC**          | 1960/1996 | 0.3 dB         | Moderate | High        | 5G data, WiFi 
                                                                           6              |
| **Polar**         | 2008      | 0.8 dB         | Low      | Sequential  | **5G          
                                                                           control**      |

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Turbo-Codes\]\]**: Iterative near-capacity codes

- **\[\[LDPC-Codes\]\]**: Modern capacity-approaching codes

- **\[\[Convolutional-Codes-&-Viterbi-Decoding\]\]**:
  Classical FEC

- **\[\[Forward-Error-Correction-(FEC)\]\]**: General FEC
  overview

- **\[\[Shannon's-Channel-Capacity-Theorem\]\]**:
  Theoretical limit

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Polar codes are the first provably
capacity-achieving codes with explicit construction.** Channel
polarization splits N channel uses into perfect + useless subchannels.
Transmit data on good channels (information set $`\mathcal{A}`$), freeze
bad channels. SC decoding: sequential, $`O(N \log N)`$ complexity. SCL
decoding with CRC (CA-Polar) achieves near-optimal performance. 5G NR
uses CA-Polar for control channels (low latency, good short-block
performance). Gap to Shannon: 0.8-1.5 dB (CA-SCL-8, N=1024). Advantages:
Low latency, short-block performance, systematic construction.
Disadvantages: Sequential (hard to parallelize), slightly behind LDPC
for long blocks. Generator matrix $`G_N = G_2^{\otimes n}`$ (Kronecker
product). 2008 discovery by Ar\i{}kan---major
theoretical milestone!

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
