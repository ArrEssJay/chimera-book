---
layout: chapter
title: "Turbo-Codes"
chapter: 66
permalink: /chapters/turbo-codes/
---

# Turbo Codes

\[\[Home\]\] **Coding Theory**
\[\[Convolutional-Codes-&-Viterbi-Decoding\]\]
\[\[LDPC-Codes\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Turbo codes are like having two spell-checkers that help each
other---when one is unsure, the other provides hints, and they
iterate back and forth until they agree. Revolutionary in 1993!**

**The breakthrough**: - **Before 1993**: Best codes were
~3 dB from theoretical limit - **Turbo codes
(1993)**: Got within 0.5 dB of Shannon limit! - **Impact**:
“Impossible” performance, shocked the world - **Today**: In 3G/4G
phones, deep space, satellites

**How they work - Two encoders help each other**:

**Step 1**: Encode data with TWO different convolutional encoders -
Encoder 1: Sees data in original order - Encoder 2: Sees data scrambled
(interleaved) - Send both encoded versions

**Step 2**: Receiver iteratively decodes - Decoder 1: “I think bit
5 is probably a 1\ldots{} 80% sure” - Decoder 2: “I
think bit 5 is definitely a 1\ldots{} 95% sure!” -
Decoder 1: “Oh! With that info, I'm now 98% sure!” -
They ping-pong back and forth ~5-10 iterations - Final
result: Near-perfect decoding!

**The magic - “Turbo” analogy**: - Like a turbo charger: Output
feeds back to improve input - Each decoder's output
improves the other's input - After several iterations,
converges to correct answer - Hence: “Turbo” codes!

**Real-world use**: - **3G (UMTS)**: Turbo codes for data
channels - **4G (LTE)**: Turbo codes (before LDPC in 5G) -
**Deep space**: Mars rovers use turbo codes - **Satellite
phones**: Iridium, Globalstar - **Military**: Tactical
communications

**Why “revolutionary” in 1993**: - Shannon's
limit (1948): Theoretical best = 0 dB Eb/N0 - Best codes before 1993:
~3 dB from limit - Turbo codes: 0.5-1 dB from limit! -
Engineers thought this was impossible!

**The famous 1993 paper**: - Presented at ICC '93
conference - Audience: Stunned silence, then standing ovation - “We
must have made a mistake” - initial reaction - Verified by others:
IT'S REAL! - Changed communication systems forever

**Comparison with other codes**: - **Convolutional +
Viterbi**: Simple, but ~5 dB from limit - **Turbo
codes**: 0.5-1 dB from limit, complex - **LDPC codes**: 0.5 dB from
limit, easier to implement - **Polar codes**: Proven optimal,
simpler structure

**Trade-offs**: - **Advantage**: Amazing performance,
near-Shannon limit - **Disadvantage**: Complex decoder, high
latency (iterations) - **Why 5G switched to LDPC/Polar**: Simpler,
lower latency

**The iterative decoding process**:

    Iteration 1: 60% confidence
    Iteration 2: 80% confidence
    Iteration 3: 95% confidence  
    Iteration 4: 99% confidence
    Iteration 5: 99.9% confidence  DONE!

**Fun fact**: The inventors (Berrou, Glavieux, Thitimajshima)
almost didn't publish because they thought
they'd made a mistake---the performance seemed too
good to be true. When they finally presented in 1993, it sparked a
revolution in error correction!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Turbo codes** achieve **near-Shannon-limit** performance
(within 0.5-1 dB of capacity).

**Key innovation**: **Parallel concatenation** of
convolutional codes with **iterative decoding**

**Discovery**: Berrou, Glavieux, and Thitimajshima (1993) -
Revolutionary breakthrough

**Performance**: BER $`10^{-5}`$ at Eb/N0 \$\approx\$
0.7 dB (rate 1/2, BPSK) - Only 0.5 dB from Shannon limit!

**Applications**: 3G/4G cellular (UMTS, LTE), deep space (Mars
rovers, New Horizons), DVB-RCS satellite

<div class="center">

------------------------------------------------------------------------

</div>

## Basic Structure

**Parallel Concatenated Convolutional Codes (PCCC)**:

                    +---> [RSC Encoder 1] ---> Parity 1
                    |
    Input data ---> | 
                    |
                    +---> [Interleaver] ---> [RSC Encoder 2] ---> Parity 2

**Components**: 1. **Two RSC encoders** (Recursive Systematic
Convolutional) 2. **Interleaver** (pseudo-random permutation) 3.
**Systematic output** (original data)

**Output**: Systematic bits + Parity1 + Parity2

<div class="center">

------------------------------------------------------------------------

</div>

## Recursive Systematic Convolutional (RSC) Encoder

**Why RSC?** Better iterative decoding than non-recursive

**Structure**:

            +--------<----------+
            |                   |
    Input ->--[Shift Register]---> Systematic output (same as input)
                |                |
                +--[XOR logic]---+--> Parity output

**Recursive**: Output fed back to input (creates infinite impulse
response)

**Systematic**: One output = input (uncoded)

<div class="center">

------------------------------------------------------------------------

</div>

### Example: RSC (37, 21) Octal

**Generator polynomials** (octal): - Feedback:
37\textsubscript{8} =
011111\textsubscript{2} - Feedforward:
21\textsubscript{8} =
010001\textsubscript{2}

**K = 5** (constraint length)

**Rate**: 1/2 (1 systematic + 1 parity per input bit)

<div class="center">

------------------------------------------------------------------------

</div>

## Interleaver

**Purpose**: Break correlation between encoder inputs

**Types**: 1. **Random interleaver**: Pseudo-random
permutation 2. **Block interleaver**: Write row-wise, read
column-wise 3. **S-random interleaver**: Constrained randomness (no
nearby indices)

**Length**: Typically 1000-10,000 bits (longer = better
performance)

<div class="center">

------------------------------------------------------------------------

</div>

### Why Interleaving Works

**Input sequence**: 11111 (low Hamming weight)

**Encoder 1**: Produces low-weight parity (correlated errors)

**After interleaver**: 10101 (scattered)

**Encoder 2**: Produces high-weight parity (uncorrelated)

**Result**: Combined code has high minimum distance
\$\rightarrow\$ Good error correction

<div class="center">

------------------------------------------------------------------------

</div>

### S-Random Interleaver

**Constraint**: Indices $`i`$ and $`j`$ separated by $`< S`$ in
input \$\rightarrow\$ Separated by $`\geq S`$ in output

**Example** (S=3): - If positions 0, 1, 2 are adjacent in input -
After interleaving: Must be \$\geq\$3 positions apart

**Benefit**: Prevents clustered low-weight codewords

<div class="center">

------------------------------------------------------------------------

</div>

## Encoding Process

**Input**: Data block $`\mathbf{d} = [d_1, d_2, \ldots, d_K]`$

**Steps**:

1.  **Encoder 1**: Encode $`\mathbf{d}`$
    \$\rightarrow\$ Parity1 $`\mathbf{p}_1`$

2.  **Interleave**: $`\mathbf{d}' = \pi(\mathbf{d})`$ (permutation)

3.  **Encoder 2**: Encode $`\mathbf{d}'`$
    \$\rightarrow\$ Parity2 $`\mathbf{p}_2`$

4.  **Transmit**: $`[\mathbf{d}, \mathbf{p}_1, \mathbf{p}_2]`$ (rate
    1/3)

**Or puncture** to rate 1/2: Transmit
$`[\mathbf{d}, \mathbf{p}_1^{(even)}, \mathbf{p}_2^{(odd)}]`$

<div class="center">

------------------------------------------------------------------------

</div>

### Rate Matching (Puncturing)

**Achieve flexible rates** by deleting parity bits:

**Example (rate 1/3 \$\rightarrow\$ rate 1/2)**:

| Time | Systematic | Parity1    | Parity2    | Transmitted     |
|:-----|:-----------|:-----------|:-----------|:----------------|
|      | $`d_1`$    | $`p_{11}`$ | $`p_{21}`$ | $`d_1, p_{11}`$ |
| 2    | $`d_2`$    | $`p_{12}`$ | $`p_{22}`$ | $`d_2, p_{22}`$ |
| 3    | $`d_3`$    | $`p_{13}`$ | $`p_{23}`$ | $`d_3, p_{13}`$ |

**Result**: 3 data + 3 parity = rate 1/2

<div class="center">

------------------------------------------------------------------------

</div>

## Iterative Decoding

**Key innovation**: Two decoders exchange **extrinsic
information**

**Algorithm**: BCJR (Bahl-Cocke-Jelinek-Raviv) or SOVA (Soft-Output
Viterbi)

<div class="center">

------------------------------------------------------------------------

</div>

### Decoder Structure

    Received  --> [SISO Decoder 1] <---> [Interleaver]   <---> [SISO Decoder 2]
    systematic         |                                             |
    + parity1          +------------------->  <--------------------+
                            (extrinsic info exchange)

**SISO**: Soft-In Soft-Out decoder (outputs LLRs, not hard
decisions)

**Iteration**: Decoders alternate, passing improved soft
information

<div class="center">

------------------------------------------------------------------------

</div>

### Log-Likelihood Ratios (LLR)

**LLR for bit** $`d_k`$:

``` math
L(d_k) = \log\frac{P(d_k = 0 | \text{received})}{P(d_k = 1 | \text{received})}
```

**Decomposition**:

``` math
L(d_k) = L_c(d_k) + L_a(d_k) + L_e(d_k)
```

Where: - $`L_c`$ = **Channel LLR** (from demodulator) - $`L_a`$ =
**A priori LLR** (from other decoder) - $`L_e`$ = **Extrinsic
LLR** (new information from this decoder)

<div class="center">

------------------------------------------------------------------------

</div>

### Iterative Decoding Steps

**Iteration $`i`$**:

1.  **Decoder 1**:

    - Input: $`L_c(\mathbf{d})`$, $`L_c(\mathbf{p}_1)`$,
      $`L_a^{(i)}(\mathbf{d})`$ (from Dec2)

    - Compute: $`L_e^{(i)}(\mathbf{d})`$ (extrinsic info)

    - Output: $`L_1^{(i)}(\mathbf{d}) = L_c + L_a + L_e`$

2.  **Interleave**:
    $`L_e^{(i)}(\mathbf{d}') = \pi(L_e^{(i)}(\mathbf{d}))`$

3.  **Decoder 2**:

    - Input: $`L_c(\mathbf{d}')`$, $`L_c(\mathbf{p}_2)`$,
      $`L_e^{(i)}(\mathbf{d}')`$ (from Dec1)

    - Compute: $`L_e^{(i)}(\mathbf{d}')`$ (extrinsic info)

    - Output: $`L_2^{(i)}(\mathbf{d}')`$

4.  **De-interleave**:
    $`L_a^{(i+1)}(\mathbf{d}) = \pi^{-1}(L_e^{(i)}(\mathbf{d}'))`$

5.  **Repeat** for $`N`$ iterations (typically 4-10)

6.  **Hard decision**:
    $`\hat{d}_k = \text{sign}(L_1^{(N)}(d_k) + L_2^{(N)}(d_k))`$

<div class="center">

------------------------------------------------------------------------

</div>

### Why Iterative Decoding Works

**Decoder 1**: Uses channel info + parity1
\$\rightarrow\$ Produces soft estimates

**Decoder 2**: Uses channel info + parity2 + **extrinsic from
Dec1** \$\rightarrow\$ Refines estimates

**Iteration**: Each decoder improves estimates using
other's extrinsic info

**Convergence**: LLRs \$\rightarrow\$ High magnitude
(high confidence) after ~4-10 iterations

**Analogy**: Two experts discussing a problem, each bringing unique
perspective

<div class="center">

------------------------------------------------------------------------

</div>

## BCJR Algorithm

**Bahl-Cocke-Jelinek-Raviv**: Optimal soft-output decoder (MAP)

**Computes**: A posteriori probability (APP) for each bit

**Recursions** (forward-backward):

**Forward** $`\alpha`$:

``` math
\alpha_k(s) = \sum_{s'} \alpha_{k-1}(s') \cdot \gamma_k(s', s)
```

**Backward** $`\beta`$:

``` math
\beta_{k-1}(s') = \sum_{s} \beta_k(s) \cdot \gamma_k(s', s)
```

**Branch metric** $`\gamma`$:

``` math
\gamma_k(s', s) = P(\text{transition } s' \to s | \text{received})
```

**LLR**:

``` math
L(d_k) = \log\frac{\sum_{(s',s): d_k=0} \alpha(s') \gamma(s',s) \beta(s)}{\sum_{(s',s): d_k=1} \alpha(s') \gamma(s',s) \beta(s)}
```

**Complexity**: $`O(2^{2K})`$ per bit (manageable for K
\$\leq\$ 7)

<div class="center">

------------------------------------------------------------------------

</div>

## Performance Analysis

### BER vs Eb/N0

**Typical performance** (rate 1/2, K=4, random interleaver, 10
iterations):

| Eb/N0 (dB) | Uncoded BPSK | Turbo Code | Shannon Limit |
|:---|:---|:---|:---|
|  | 0.27 | \- | 0 (capacity) |
| 0 | 0.08 | 0.01 | \- |
| 0.5 | 0.04 | 10\textsuperscript{-}\textsuperscript{3} | \- |
| 0.7 | 0.03 | 10\textsuperscript{-}\textsuperscript{5} | Gap = 0.5 dB |
| 1.0 | 0.02 | 10\textsuperscript{-}\textsuperscript{6} | \- |
| 2.0 | 5\$\times\$10\textsuperscript{-}\textsuperscript{3} | 10\textsuperscript{-}\textsuperscript{9} | \- |

**Waterfall region**: Sharp BER drop at ~0.5-1.0 dB

**Error floor**: BER flattens at
~10\textsuperscript{-}\textsuperscript{6}
to
10\textsuperscript{-}\textsuperscript{8}
(due to low-weight codewords)

<div class="center">

------------------------------------------------------------------------

</div>

### Convergence Analysis

**EXIT Charts** (Extrinsic Information Transfer):

**Plots**: Mutual information $`I_e`$ vs $`I_a`$ for each decoder

**Convergence**: If curves don't cross
\$\rightarrow\$ Decoders converge to low BER

**Tunnel opening**: Gap between curves
\$\rightarrow\$ Convergence speed

<div class="center">

------------------------------------------------------------------------

</div>

### Interleaver Length Effect

| Interleaver Size | BER @ 0.7 dB | Error Floor | Notes |
|:---|:---|:---|:---|
| **100 bits** | 10\textsuperscript{-}\textsuperscript{3} | 10\textsuperscript{-}\textsuperscript{4} | Poor (short) |
| **1,000 bits** | 10\textsuperscript{-}\textsuperscript{4} | 10\textsuperscript{-}\textsuperscript{6} | Moderate |
| **10,000 bits** | 10\textsuperscript{-}\textsuperscript{5} | 10\textsuperscript{-}\textsuperscript{8} | Good |
| **100,000 bits** | 10\textsuperscript{-}\textsuperscript{5} | 10\textsuperscript{-}\textsuperscript{1}\textsuperscript{0} | Excellent (high latency) |

**Trade-off**: Longer interleaver \$\rightarrow\$
Better performance, higher latency/memory

<div class="center">

------------------------------------------------------------------------

</div>

## Turbo Code Variants

### 1. Duo-Binary Turbo Codes

**Process 2 bits at a time**: $`(d_1, d_2)`$ jointly

**Advantage**: Better performance, lower error floor

**Used in**: DVB-RCS (satellite return channel)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Serial Concatenated Convolutional Codes (SCCC)

**Structure**: Inner encoder \$\rightarrow\$
Interleaver \$\rightarrow\$ Outer encoder (serial)

**Performance**: Lower error floor than PCCC

**Decoding**: Similar iterative structure

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Repeat-Accumulate (RA) Codes

**Simplified turbo code**:

    Input --> [Repeat r times] --> [Interleaver] --> [Accumulator] --> Output

**Accumulator**: Simple RSC with feedback polynomial 1/(1+D)

**Advantage**: Very simple encoder

**Performance**: Near-turbo with less complexity

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Implementations

### 1. 3G UMTS (WCDMA)

**Turbo code**: Rate 1/3, K=4 - Two RSC encoders (G=\[1,
13/15\]\textsubscript{8}) - Interleaver: Length 40-5114
bits - 8 iterations

**Channels**: Data (up to 2 Mbps)

**BER**:
10\textsuperscript{-}\textsuperscript{6}
@ Eb/N0 \$\approx\$ 1.5 dB

<div class="center">

------------------------------------------------------------------------

</div>

### 2. 4G LTE

**Turbo code**: Rate 1/3, K=4 - Two RSC encoders - QPP interleaver
(Quadratic Permutation Polynomial) - 6-8 iterations

**Data rates**: 1 Mbps - 100 Mbps (Cat 3), up to 1 Gbps (Cat 16)

**Block sizes**: 40-6144 bits

**Puncturing**: Adaptive (1/2, 2/3, 3/4, 5/6) based on MCS

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Deep Space (NASA/ESA)

**Mars Exploration Rovers**: Turbo code rate 1/6 - K=5 RSC encoders
- 65,536-bit interleaver - 15 iterations

**Performance**: BER \<
10\textsuperscript{-}\textsuperscript{8}
@ Eb/N0 \$\approx\$ 0 dB

**Data rate**: 128 kbps (from Mars surface)

<div class="center">

------------------------------------------------------------------------

</div>

### 4. DVB-RCS (Satellite Return)

**Duo-binary turbo code**: Rate 1/3 to 6/7 (punctured)

**Block sizes**: 48-1504 bits

**Iterations**: 6-8

**Application**: Interactive satellite broadband (uplink)

<div class="center">

------------------------------------------------------------------------

</div>

## Encoder Complexity

**Encoding**: Linear complexity $`O(K)`$ per bit

**Example**: K=4, rate 1/3 - 2 RSC encoders (4 states each) -
Interleaver (memory access) - **Total**: ~10-20
operations per bit

**Hardware**: Easy to implement (shift registers + XORs)

<div class="center">

------------------------------------------------------------------------

</div>

## Decoder Complexity

**BCJR per iteration**: - $`O(2^K)`$ states - $`O(K)`$ operations
per state - Total: $`O(K \cdot 2^K)`$ per bit

**Example**: K=4, 8 iterations - 16 states, ~50
operations per state per iteration - **Total**: ~6400
operations per bit

**SOVA alternative**: Lower complexity (~40% of
BCJR), 0.3 dB performance loss

<div class="center">

------------------------------------------------------------------------

</div>

### Optimization Techniques

1.  **Max-Log-MAP**: Approximation (replace sum with max)

    - Complexity: 50% reduction

    - Loss: ~0.3 dB

2.  **Sliding window**: Process trellis in windows (reduce memory)

3.  **Early termination**: Stop if LLRs exceed threshold (save
    iterations)

4.  **Radix-4**: Process 2 bits at a time (2\$\times\$
    throughput)

<div class="center">

------------------------------------------------------------------------

</div>

## Stopping Criteria

**Problem**: Fixed iteration count wastes power (good SNR needs
fewer iterations)

**Solution**: Early stopping

**Criteria**:

1.  **LLR magnitude**: $`|L(d_k)| > T`$ for all $`k`$ (high
    confidence)

2.  **Cross-entropy**: $`H(L^{(i)}, L^{(i-1)}) < \epsilon`$
    (convergence)

3.  **CRC check**: If CRC passes, stop (used in LTE)

**Benefit**: Average 3-5 iterations (vs 8 worst-case)
\$\rightarrow\$ 40% power savings

<div class="center">

------------------------------------------------------------------------

</div>

## Error Floor

**Error floor**: BER stops improving (flattens) at high SNR

**Cause**: Low-weight codewords (small $`d_{\text{free}}`$)

**Dominant**: Input sequences causing low-weight output in
**both** encoders

**Example**: Input weight 2, output weight 4
\$\rightarrow\$ $`d_{\text{free}} = 6`$ (poor)

<div class="center">

------------------------------------------------------------------------

</div>

### Mitigation Strategies

1.  **Interleaver design**: S-random, dithered (avoid bad patterns)

2.  **Longer interleaver**: Reduces probability of bad patterns

3.  **Increase K**: Larger constraint length
    \$\rightarrow\$ Higher $`d_{\text{free}}`$

4.  **Post-processing**: Outer code (e.g., CRC + retransmission)

**Typical floor**:
10\textsuperscript{-}\textsuperscript{6}
to
10\textsuperscript{-}\textsuperscript{8}
(acceptable for most applications)

<div class="center">

------------------------------------------------------------------------

</div>

## Comparison with Other Codes

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Code</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Eb/N0 @ 10^-5 (rate 1/2)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Gap to Shannon</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Complexity</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Latency</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Uncoded</strong></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">+11 dB</td>
<td style="text-align: left;">-</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Conv (K=7)</strong></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">+6 dB</td>
<td style="text-align: left;">Low</td>
<td style="text-align: left;">Low</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Turbo</strong></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">+0.5 dB</td>
<td style="text-align: left;">Moderate</td>
<td style="text-align: left;">Moderate</td>
</tr>
<tr>
<td style="text-align: left;"><strong>LDPC</strong></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">+0.3 dB</td>
<td style="text-align: left;">Moderate</td>
<td style="text-align: left;">Low</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Polar</strong></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">+0.8 dB</td>
<td style="text-align: left;">Low</td>
<td style="text-align: left;">Low</td>
</tr>
</tbody>
</table>

**Turbo advantages**: Near-Shannon, proven performance,
standardized

**Turbo disadvantages**: Latency (iterative), error floor

<div class="center">

------------------------------------------------------------------------

</div>

## Turbo vs LDPC

| Aspect | Turbo Codes | LDPC Codes |
|:---|:---|:---|
| **Eb/N0 @
10\textsuperscript{-}\textsuperscript{5}** | 0.7 dB | 0.5 dB |
| **Error floor** | 10\textsuperscript{-}\textsuperscript{7}
typical | 10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2}
possible |
| **Decoding latency** | High (iterations) | Lower (parallel) |
| **Complexity** | Moderate | Moderate |
| **Hardware** | Serial (trellis) | Parallel (graph) |
| **Standardization** | 3G, 4G LTE | 5G NR, WiFi 6, DVB-S2 |
| **Flexibility** | Puncturing | Structured graphs |

**Trend**: LDPC replacing Turbo in new standards (5G, WiFi 6,
802.11ax)

<div class="center">

------------------------------------------------------------------------

</div>

## Design Guidelines

### Choose Turbo Code When:

1.  **Near-capacity performance** critical (\< 1 dB from
    Shannon)

2.  **Moderate block sizes** (1000-10000 bits)

3.  **Latency acceptable** (iterative decoding OK)

4.  **Error floor
    10\textsuperscript{-}\textsuperscript{6}**
    sufficient

5.  **Existing hardware** (3G/4G infrastructure)

### Avoid Turbo Code If:

1.  **Ultra-low error floor** needed (\<
    10\textsuperscript{-}\textsuperscript{1}\textsuperscript{0})
    \$\rightarrow\$ Use LDPC

2.  **Low latency** critical \$\rightarrow\$ Use LDPC
    or Polar

3.  **Very short blocks** (\< 100 bits)
    \$\rightarrow\$ Use Polar or convolutional

4.  **New design** (future-proof) \$\rightarrow\$
    Consider LDPC (5G standard)

<div class="center">

------------------------------------------------------------------------

</div>

## Python Example: Simple Turbo Encoder

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

**Note**: Full iterative decoder (BCJR) is complex
(~200+ lines). Use libraries like `commpy` for
production.

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Convolutional-Codes-&-Viterbi-Decoding\]\]**: Building
  block for Turbo

- **\[\[LDPC-Codes\]\]**: Modern alternative (5G, WiFi 6)

- **\[\[Polar-Codes\]\]**: Another near-capacity code (5G
  control)

- **\[\[Forward-Error-Correction-(FEC)\]\]**: General FEC
  overview

- **\[\[Bit-Error-Rate-(BER)\]\]**: Performance metric

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Turbo codes achieve near-Shannon-limit
performance (0.5-1 dB gap) via parallel concatenated RSC encoders +
iterative decoding.** Two SISO decoders exchange extrinsic LLRs, refining
estimates over 4-10 iterations. Interleaver breaks correlation (critical
for performance). Used in 3G UMTS, 4G LTE, deep space (Mars rovers). BER
$`10^{-5}`$ @ Eb/N0 \$\approx\$ 0.7 dB (rate 1/2). Error
floor at $`10^{-6}`$ to $`10^{-8}`$ due to low-weight codewords. BCJR
algorithm provides optimal soft-output decoding. Longer interleaver
(10k+ bits) improves performance but increases latency. Being replaced
by LDPC in 5G/WiFi 6 (lower error floor, lower latency, better
parallelization). Revolutionary 1993 discovery---brought information
theory to practice.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
