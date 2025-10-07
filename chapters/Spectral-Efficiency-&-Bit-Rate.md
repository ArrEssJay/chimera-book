---
layout: chapter
title: "Spectral-Efficiency-&-Bit-Rate"
chapter: 58
permalink: /chapters/spectral-efficiency-&-bit-rate/
---

# Spectral Efficiency & Bit Rate

\[\[Home\]\] **Digital Modulation**
\[\[Quadrature-Amplitude-Modulation-(QAM)\]\]
\[\[Shannon's-Channel-Capacity-Theorem\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Spectral efficiency is like measuring how many cars you can fit
on a highway---higher efficiency = more data squeezed into the same
bandwidth!**

**The metric - bits/sec/Hz**: - **Bandwidth**: Your “highway
width” (measured in Hz) - **Bit rate**: How much data flows
(measured in bits/sec) - **Spectral efficiency**: Data rate per Hz
of bandwidth

**Formula**:

    Spectral Efficiency = Bit Rate ÷ Bandwidth

**Real-world examples**:

**BPSK** (simple): - 1 bit per symbol - Spectral efficiency:
~1 bit/sec/Hz - Like: One narrow car per lane

**QPSK** (common): - 2 bits per symbol - Spectral efficiency:
~2 bits/sec/Hz - Like: Two motorcycles side-by-side per
lane

**16-QAM** (moderate): - 4 bits per symbol - Spectral efficiency:
~4 bits/sec/Hz - Like: Carpooling --- 4 people per
lane

**256-QAM** (high): - 8 bits per symbol  
- Spectral efficiency: ~8 bits/sec/Hz - Like:
Double-decker bus per lane!

**1024-QAM** (WiFi 6): - 10 bits per symbol - Spectral efficiency:
~10 bits/sec/Hz - Like: Triple-decker bus!

**Why it matters**:

**Limited spectrum**: - FCC/governments auction bandwidth - WiFi:
Only 20/40/80/160 MHz channels available - Cell carriers: Paid billions
for spectrum - MUST use it efficiently!

**More efficiency = more money**: - Double spectral efficiency =
double capacity - Serve twice as many users - Sell twice as much data -
This is why 5G is so important!

**Real systems**:

**WiFi evolution**: - **WiFi 4 (802.11n)**: 64-QAM,
~5.5 bits/sec/Hz - **WiFi 5 (802.11ac)**: 256-QAM,
~7 bits/sec/Hz (+27%) - **WiFi 6 (802.11ax)**:
1024-QAM, ~9.6 bits/sec/Hz (+37%)

**Cellular evolution**: - **3G (HSPA+)**: 16-QAM,
~2-3 bits/sec/Hz - **4G (LTE)**: 64-QAM,
~5-6 bits/sec/Hz (2\$\times\$ faster!) -
**5G (NR)**: 256-QAM, ~8-10 bits/sec/Hz
(2\$\times\$ faster again!)

**Shannon's limit**: - Theoretical maximum based on
SNR - Formula: C = B \$\times\$
log\textsubscript{2}(1 + SNR) - Modern systems get
within 70-90% of Shannon limit!

**Example calculation - WiFi**:

**Scenario**: 20 MHz WiFi channel, 256-QAM - Bandwidth: 20 MHz -
Modulation: 256-QAM = 8 bits/symbol - Coding rate: 5/6 (error correction
overhead) - OFDM subcarriers: 52 data subcarriers - Symbol rate: 250,000
symbols/sec - **Spectral efficiency**: 8 \$\times\$
(5/6) \$\times\$ (52/64) = 5.4 bits/sec/Hz - **Bit
rate**: 5.4 \$\times\$ 20 MHz = **108 Mbps**

**The trade-off**: - **Higher efficiency**: More data, BUT
needs better SNR - 1024-QAM: Amazing efficiency, but only works close to
router - QPSK: Lower efficiency, but works far away - Your device
**automatically adjusts** based on signal quality!

**When you see it**: - **Router specs**: “Up to 1200 Mbps on
160 MHz” = 7.5 bits/sec/Hz - **5G specs**: “Peak 20 Gbps on 100
MHz” = 200 bits/sec/Hz (with MIMO!) - **Spectrum auctions**: “\$1
billion for 10 MHz” = \$100M per MHz!

**Fun fact**: The difference between 3G and 5G is mostly spectral
efficiency improvements. Same amount of spectrum, but 5G packs
3-4\$\times\$ more data into it through better modulation
(256-QAM), MIMO, and OFDM. It's like upgrading from
single-lane roads to 4-lane highways!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Spectral efficiency** (\$\eta\$) measures how
efficiently a communication system uses available **bandwidth**.

**Definition**:

``` math
\eta = \frac{R_b}{B} \quad (\text{bits/sec/Hz})
```

Where: - $`R_b`$ = Bit rate (bits/sec) - $`B`$ = Occupied bandwidth (Hz)

**Goal**: **Maximize data rate** within limited spectrum
(spectrum is expensive!)

**Trade-off**: Spectral efficiency
\$\leftrightarrow\$ Power efficiency (SNR requirement)

<div class="center">

------------------------------------------------------------------------

</div>

## Fundamental Relationships

### Symbol Rate vs Bit Rate

**Bit rate**:

``` math
R_b = R_s \cdot \log_2(M) \quad (\text{bits/sec})
```

Where: - $`R_s`$ = Symbol rate (symbols/sec or baud) - $`M`$ =
Constellation size

**Example**: 1 Msps QPSK (M=4) -
$`R_b = 1 \times 10^6 \times \log_2(4) = 2`$ Mbps

<div class="center">

------------------------------------------------------------------------

</div>

### Bandwidth Occupancy

**With pulse shaping** (raised cosine filter):

``` math
B = (1 + \alpha) R_s \quad (\text{Hz})
```

Where: - $`\alpha`$ = Roll-off factor (typically 0.2-0.35) -
$`\alpha = 0`$: Minimum bandwidth (rect in freq, sinc in time) -
$`\alpha = 1`$: 2\$\times\$ bandwidth (smoother time
domain)

**Common choice**: $`\alpha = 0.35`$ (good balance)

<div class="center">

------------------------------------------------------------------------

</div>

### Spectral Efficiency Formula

**Combine equations**:

``` math
\eta = \frac{R_b}{B} = \frac{R_s \cdot \log_2(M)}{(1 + \alpha) R_s} = \frac{\log_2(M)}{1 + \alpha}
```

**Key insight**: \$\eta\$ depends only on M and
\$\alpha\$ (not absolute bandwidth!)

<div class="center">

------------------------------------------------------------------------

</div>

## Modulation Comparison

### Spectral Efficiency (\$\alpha\$ = 0.35)

| Modulation   | M    | $`\log_2(M)`$ | $`\eta`$ (bits/sec/Hz) |
|:-------------|:-----|:--------------|:-----------------------|
| **BPSK**     | 2    | 1             | 0.74                   |
| **QPSK**     | 4    | 2             | 1.48                   |
| **8PSK**     | 8    | 3             | 2.22                   |
| **16-QAM**   | 16   | 4             | 2.96                   |
| **32-QAM**   | 32   | 5             | 3.70                   |
| **64-QAM**   | 64   | 6             | 4.44                   |
| **128-QAM**  | 128  | 7             | 5.19                   |
| **256-QAM**  | 256  | 8             | 5.93                   |
| **1024-QAM** | 1024 | 10            | 7.41                   |
| **4096-QAM** | 4096 | 12            | 8.89                   |

<div class="center">

------------------------------------------------------------------------

</div>

### With Nyquist Signaling (\$\alpha\$ = 0)

| Modulation   | $`\eta`$ (bits/sec/Hz) |
|:-------------|:-----------------------|
| **BPSK**     | 1.0                    |
| **QPSK**     | 2.0                    |
| **8PSK**     | 3.0                    |
| **16-QAM**   | 4.0                    |
| **64-QAM**   | 6.0                    |
| **256-QAM**  | 8.0                    |
| **1024-QAM** | 10.0                   |

**Perfect Nyquist**: $`\eta = \log_2(M)`$ (theoretical best for
single carrier)

<div class="center">

------------------------------------------------------------------------

</div>

## With Forward Error Correction

**Code rate** $`r`$ reduces effective bit rate:

``` math
\eta_{\text{effective}} = \frac{\log_2(M)}{1 + \alpha} \cdot r
```

<div class="center">

------------------------------------------------------------------------

</div>

### Example: 64-QAM with LDPC

**Parameters**: - M = 64 (6 bits/symbol) - \$\alpha\$
= 0.35 - Code rate r = 3/4 (25% overhead)

**Uncoded**: $`\eta = 6/1.35 = 4.44`$ bits/sec/Hz

**Coded**: $`\eta = 4.44 \times 0.75 = 3.33`$ bits/sec/Hz

**Trade-off**: 25% spectral efficiency loss for ~6
dB SNR gain

<div class="center">

------------------------------------------------------------------------

</div>

## Shannon Capacity

**Shannon-Hartley theorem**:

``` math
C = B \log_2(1 + \text{SNR}) \quad (\text{bits/sec})
```

**Spectral efficiency limit**:

``` math
\eta_{\text{Shannon}} = \log_2(1 + \text{SNR}) \quad (\text{bits/sec/Hz})
```

**Key insight**: Fundamental limit---no system can exceed this!

<div class="center">

------------------------------------------------------------------------

</div>

### Shannon Limit vs SNR

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>SNR (dB)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>SNR (linear)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p><span class="math inline"><em>η</em><sub>max</sub></span> (bits/sec/Hz)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Example Modulation</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">BPSK 1/2 code</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">QPSK 3/4</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">QPSK</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">8PSK</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">-QAM 3/4</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">-QAM</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">-QAM 3/4</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">-QAM</td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;">,000</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">-QAM</td>
</tr>
</tbody>
</table>

**Practical systems**: 1-3 dB from Shannon limit (with modern codes
like LDPC, Turbo, Polar)

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Systems Performance

### WiFi (802.11)

**802.11a/g** (20 MHz channel):

| MCS | Modulation | Code Rate | Data Rate | \$\eta\$      
                                            (bits/sec/Hz)  |
|:----|:-----------|:----------|:----------|:--------------|
|     | BPSK       | 1/2       | 6 Mbps    | 0.30          |
| 1   | BPSK       | 3/4       | 9 Mbps    | 0.45          |
| 2   | QPSK       | 1/2       | 12 Mbps   | 0.60          |
| 3   | QPSK       | 3/4       | 18 Mbps   | 0.90          |
| 4   | 16-QAM     | 1/2       | 24 Mbps   | 1.20          |
| 5   | 16-QAM     | 3/4       | 36 Mbps   | 1.80          |
| 6   | 64-QAM     | 2/3       | 48 Mbps   | 2.40          |
| 7   | 64-QAM     | 3/4       | 54 Mbps   | 2.70          |

**OFDM**: 52 subcarriers (48 data, 4 pilots), 250 ksps per
subcarrier

<div class="center">

------------------------------------------------------------------------

</div>

**802.11n** (40 MHz channel, 1 spatial stream):

| MCS | Modulation | Code Rate | Data Rate | \$\eta\$      
                                            (bits/sec/Hz)  |
|:----|:-----------|:----------|:----------|:--------------|
|     | BPSK       | 1/2       | 13.5 Mbps | 0.34          |
| 3   | QPSK       | 3/4       | 40.5 Mbps | 1.01          |
| 5   | 16-QAM     | 3/4       | 81 Mbps   | 2.03          |
| 7   | 64-QAM     | 5/6       | 135 Mbps  | 3.38          |

**With 4\$\times\$4 MIMO**: 4\$\times\$
data rate (same \$\eta\$ per stream)

<div class="center">

------------------------------------------------------------------------

</div>

**802.11ac** (80 MHz, 1 stream):

| MCS | Modulation | Code Rate | Data Rate  | \$\eta\$      
                                             (bits/sec/Hz)  |
|:----|:-----------|:----------|:-----------|:--------------|
|     | BPSK       | 1/2       | 29.3 Mbps  | 0.37          |
| 5   | 16-QAM     | 3/4       | 175.5 Mbps | 2.19          |
| 8   | 256-QAM    | 3/4       | 351 Mbps   | 4.39          |
| 9   | 256-QAM    | 5/6       | 390 Mbps   | 4.88          |

**802.11ax (WiFi 6)**: Adds 1024-QAM \$\rightarrow\$
MCS 10, 11 (\$\eta\$ up to 6.1 bits/sec/Hz)

<div class="center">

------------------------------------------------------------------------

</div>

### LTE (20 MHz channel)

**Downlink (OFDMA)**:

| MCS | Modulation | Code Rate | Data Rate (1 layer) | \$\eta\$ |
|:----|:-----------|:----------|:--------------------|:---------|
|     | QPSK       | 0.08      | 1.1 Mbps            | 0.055    |
| 5   | QPSK       | 0.37      | 4.8 Mbps            | 0.24     |
| 10  | 16-QAM     | 0.48      | 11.4 Mbps           | 0.57     |
| 15  | 16-QAM     | 0.74      | 17.6 Mbps           | 0.88     |
| 20  | 64-QAM     | 0.55      | 24.5 Mbps           | 1.23     |
| 25  | 64-QAM     | 0.85      | 37.7 Mbps           | 1.89     |
| 28  | 256-QAM    | 0.93      | 55.0 Mbps           | 2.75     |

**With 4\$\times\$4 MIMO**: Max 220 Mbps (Category
9+)

**LTE-Advanced Pro**: Cat 16 = 1 Gbps (4\$\times\$4
MIMO, 256-QAM, carrier aggregation)

<div class="center">

------------------------------------------------------------------------

</div>

### 5G NR (100 MHz @ 3.5 GHz)

| MCS | Modulation | Code Rate | Data Rate (1 layer) | \$\eta\$ |
|:----|:-----------|:----------|:--------------------|:---------|
|     | QPSK       | 0.12      | 13.2 Mbps           | 0.13     |
| 10  | 16-QAM     | 0.57      | 99 Mbps             | 0.99     |
| 20  | 64-QAM     | 0.74      | 194 Mbps            | 1.94     |
| 27  | 256-QAM    | 0.93      | 325 Mbps            | 3.25     |

**With 8\$\times\$8 MIMO**: 2.6 Gbps (8 layers
\$\times\$ 325 Mbps)

**mmWave (28 GHz, 400 MHz BW)**: 10 Gbps+ (massive MIMO)

<div class="center">

------------------------------------------------------------------------

</div>

### Satellite DVB-S2

**Example: 36 MHz transponder**

| MODCOD | Modulation | Code Rate | Throughput | \$\eta\$ |
|:-------|:-----------|:----------|:-----------|:---------|
|        | QPSK       | 1/4       | 9.9 Mbps   | 0.27     |
| 6      | QPSK       | 3/4       | 29.8 Mbps  | 0.83     |
| 11     | 8PSK       | 2/3       | 39.7 Mbps  | 1.10     |
| 17     | 8PSK       | 9/10      | 59.6 Mbps  | 1.66     |
| 23     | 16-APSK    | 5/6       | 66.2 Mbps  | 1.84     |
| 28     | 32-APSK    | 9/10      | 82.8 Mbps  | 2.30     |

**ACM**: Adapt based on rain fade (QPSK 1/4 in heavy rain
\$\rightarrow\$ 32-APSK 9/10 in clear sky)

<div class="center">

------------------------------------------------------------------------

</div>

### Cable (DOCSIS 3.1)

**192 MHz OFDM channel**:

| QAM      | Code Rate | Throughput | \$\eta\$ |
|:---------|:----------|:-----------|:---------|
| -QAM     | 0.90      | 900 Mbps   | 4.7      |
| 256-QAM  | 0.90      | 1.2 Gbps   | 6.2      |
| 1024-QAM | 0.93      | 1.5 Gbps   | 7.8      |
| 4096-QAM | 0.95      | 1.9 Gbps   | 9.9      |

**Full 1 GHz spectrum**: 10 Gbps downstream (with 4096-QAM)

**Advantage**: Wired channel (no fading), high SNR
\$\rightarrow\$ highest-order QAM practical

<div class="center">

------------------------------------------------------------------------

</div>

## Bandwidth Efficiency vs Power Efficiency

**Shannon tradeoff**:

``` math
\frac{E_b}{N_0} = \frac{2^\eta - 1}{\eta} \quad (\text{linear})
```

**In dB**:

``` math
\frac{E_b}{N_0} \bigg|_{\text{dB}} = 10\log_{10}\left(\frac{2^\eta - 1}{\eta}\right)
```

<div class="center">

------------------------------------------------------------------------

</div>

### Shannon Limit Curve

| \$\eta\$ (bits/sec/Hz) | Min Eb/N0 (dB) |
|:-----------------------|:---------------|
|                        | -0.8           |
| 1.0                    | 0.0            |
| 2.0                    | 2.0            |
| 3.0                    | 4.8            |
| 4.0                    | 7.0            |
| 5.0                    | 9.0            |
| 6.0                    | 10.8           |
| 8.0                    | 14.0           |
| 10.0                   | 16.8           |

**Pattern**: As \$\eta\$ increases, required Eb/N0
increases (power-bandwidth tradeoff)

<div class="center">

------------------------------------------------------------------------

</div>

### Practical Systems vs Shannon

**Example: 64-QAM, r=3/4, \$\alpha\$=0.35**

**Spectral efficiency**: \$\eta\$ = 3.33 bits/sec/Hz

**Shannon limit**: Eb/N0 \$\geq\$ 6.3 dB

**Practical (with LDPC)**: Eb/N0 \$\approx\$ 8.5 dB

**Gap**: 2.2 dB (very good!)

<div class="center">

------------------------------------------------------------------------

</div>

## MIMO & Spatial Multiplexing

**Multiple antenna streams** increase spectral efficiency:

``` math
\eta_{\text{MIMO}} = N_s \cdot \frac{\log_2(M)}{1 + \alpha} \cdot r
```

Where $`N_s`$ = Number of spatial streams

<div class="center">

------------------------------------------------------------------------

</div>

### Example: 802.11ac

**Parameters**: - 4\$\times\$4 MIMO (4 spatial
streams) - 256-QAM (8 bits/symbol) - Code rate: 5/6 -
\$\alpha\$ = 0.35 - 80 MHz bandwidth

**Per-stream \$\eta\$**:
$`\frac{8}{1.35} \times \frac{5}{6} = 4.94`$ bits/sec/Hz

**Total \$\eta\$**: $`4 \times 4.94 = 19.75`$
bits/sec/Hz

**Data rate**: $`80 \times 10^6 \times 19.75 = 1.58`$ Gbps

**Actual (with overhead)**: ~1.3 Gbps (MAC overhead
~20%)

<div class="center">

------------------------------------------------------------------------

</div>

## OFDM Considerations

**OFDM uses multiple subcarriers**:

``` math
\eta_{\text{OFDM}} = \frac{N_{\text{data}}}{N_{\text{total}}} \cdot \frac{\log_2(M)}{1 + \alpha_{\text{CP}}} \cdot r
```

Where: - $`N_{\text{data}}`$ = Data subcarriers - $`N_{\text{total}}`$ =
Total subcarriers - $`\alpha_{\text{CP}}`$ = Cyclic prefix overhead
(typically 0.07-0.25)

<div class="center">

------------------------------------------------------------------------

</div>

### WiFi 802.11a Example

**Parameters**: - 64 subcarriers total - 52 used (48 data + 4
pilots) - CP: 0.8 \$\mu\$s / 4 \$\mu\$s =
0.20 (20% overhead) - 64-QAM (M=64) - Code rate: 3/4

**Spectral efficiency**:

``` math
\eta = \frac{48}{64} \times \frac{6}{1.20} \times 0.75 = 2.81 \text{ bits/sec/Hz}
```

**20 MHz channel**: $`20 \times 2.81 = 56.2`$ Mbps (theoretical)

**Actual**: 54 Mbps (slight additional overhead)

<div class="center">

------------------------------------------------------------------------

</div>

## Code Rate vs Spectral Efficiency

**Trade-off**: Higher code rate \$\rightarrow\$ More
spectral efficiency, less error protection

| Code Rate | Overhead | \$\eta\$ Penalty | SNR           
                                           Requirement    |
|:----------|:---------|:-----------------|:--------------|
| **1/2**   | 100%     | 0.50\$\times\$   | Lowest SNR    |
| **2/3**   | 50%      | 0.67\$\times\$   | Low SNR       |
| **3/4**   | 33%      | 0.75\$\times\$   | Moderate SNR  |
| **5/6**   | 20%      | 0.83\$\times\$   | High SNR      |
| **9/10**  | 11%      | 0.90\$\times\$   | Very high SNR |

**Example**: 64-QAM - r = 1/2: \$\eta\$ = 2.22
bits/sec/Hz, Eb/N0 \$\approx\$ 11 dB - r = 3/4:
\$\eta\$ = 3.33 bits/sec/Hz, Eb/N0
\$\approx\$ 13 dB - r = 5/6: \$\eta\$ = 3.70
bits/sec/Hz, Eb/N0 \$\approx\$ 14 dB

<div class="center">

------------------------------------------------------------------------

</div>

## Latency vs Spectral Efficiency

**Symbol duration**:

``` math
T_s = \frac{1}{R_s} = \frac{B}{1 + \alpha}
```

**Higher-order modulation** (larger M): - Same symbol rate - Higher
bit rate - **Same latency per symbol**

**Lower symbol rate** (wider pulses): - Better spectral efficiency
(lower \$\alpha\$ possible) - **Higher latency**

<div class="center">

------------------------------------------------------------------------

</div>

### Example: Satellite Link

**Option A**: 1 Msps QPSK - Symbol duration: 1
\$\mu\$s - Bit rate: 2 Mbps - Latency per symbol: 1
\$\mu\$s

**Option B**: 500 ksps 16-QAM - Symbol duration: 2
\$\mu\$s - Bit rate: 2 Mbps (same!) - Latency per symbol:
2 \$\mu\$s (2\$\times\$ worse)

**Trade-off**: 16-QAM needs higher SNR but uses less bandwidth

<div class="center">

------------------------------------------------------------------------

</div>

## Interference & Spectral Efficiency

**Adjacent channel interference (ACI)** limits practical
\$\eta\$:

**Guard bands** reduce usable spectrum:

``` math
\eta_{\text{effective}} = \frac{B_{\text{usable}}}{B_{\text{allocated}}} \cdot \eta_{\text{modulation}}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Example: LTE Resource Blocks

**20 MHz allocation**: - Usable: 18 MHz (100 resource blocks
\$\times\$ 180 kHz) - Guard bands: 2 MHz (10% loss) - DC
subcarrier: 1 (negligible)

**Effective \$\eta\$ reduction**: 10%

<div class="center">

------------------------------------------------------------------------

</div>

## Emerging Technologies

### 1. Massive MIMO (5G)

**64\$\times\$64 antennas** (base station): - 16+
spatial streams - Beamforming (20 dB gain) - Interference suppression

**Result**: \$\eta\$ \> 50 bits/sec/Hz
(system-wide with MU-MIMO)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Terahertz (THz)

**100 GHz+ spectrum**: - Extremely wide channels (10+ GHz) - QPSK @
10 Gbaud \$\rightarrow\$ 20 Gbps - Short range (high path
loss)

**Target**: 100 Gbps wireless (6G)

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Orbital Angular Momentum (OAM)

**Twisted light beams**: - Multiple OAM modes (like MIMO but with
photon spin) - Potential: 10\$\times\$ capacity increase -
**Status**: Research (practical issues remain)

<div class="center">

------------------------------------------------------------------------

</div>

## Design Guidelines

### 1. Choose Modulation for Channel

**High SNR (\>25 dB)**: 256-QAM, 1024-QAM - WiFi close
range - Cable modems - Microwave backhaul (clear weather)

**Moderate SNR (15-25 dB)**: 16-QAM, 64-QAM - WiFi medium range -
LTE good signal - Satellite clear sky

**Low SNR (\<15 dB)**: QPSK, 8PSK - Satellite rain fade -
Deep space - Long-range cellular (cell edge)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Select Code Rate

**Poor channel**: Low code rate (1/2, 2/3) - More redundancy -
Better error correction - Lower spectral efficiency

**Good channel**: High code rate (3/4, 5/6, 9/10) - Less redundancy
- Higher spectral efficiency - Requires higher SNR

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Adaptive Modulation & Coding (AMC)

**Measure SNR**, select MCS:

    if SNR > 30 dB:
        use 256-QAM, rate 5/6
    elif SNR > 20 dB:
        use 64-QAM, rate 3/4
    elif SNR > 15 dB:
        use 16-QAM, rate 1/2
    else:
        use QPSK, rate 1/2

**Update period**: 10-100 ms (faster than fading, slower than
noise)

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>System</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Bandwidth</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Modulation</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Code Rate</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>$\eta$ (bits/sec/Hz)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Peak Rate</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>GPS L1</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">BPSK</td>
<td style="text-align: left;">/2</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">bps (nav)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>WiFi 802.11a</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">-QAM</td>
<td style="text-align: left;">/4</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Mbps</td>
</tr>
<tr>
<td style="text-align: left;"><strong>WiFi 802.11ac</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">-QAM</td>
<td style="text-align: left;">/6</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Mbps (1
stream)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>WiFi 802.11ax</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">-QAM</td>
<td style="text-align: left;">/6</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Gbps (8
streams)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>LTE Cat 4</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">-QAM</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Mbps
(2$\times$2 MIMO)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>LTE Cat 16</strong></td>
<td style="text-align: left;">MHz (CA)</td>
<td style="text-align: left;">-QAM</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Gbps
(4$\times$4 MIMO)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>5G NR (sub-6)</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">-QAM</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Gbps
(8$\times$8 MIMO)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>5G NR (mmWave)</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">-QAM</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Gbps</td>
</tr>
<tr>
<td style="text-align: left;"><strong>DVB-S2</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">-APSK</td>
<td style="text-align: left;">/10</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Mbps</td>
</tr>
<tr>
<td style="text-align: left;"><strong>DOCSIS 3.1</strong></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;">-QAM</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Gbps</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Limits

**Shannon limit**: $`\eta = \log_2(1 + \text{SNR})`$

**Best systems**: 1-3 dB from Shannon (with LDPC, Turbo, Polar
codes)

**Wireless**: Typically 0.5-6 bits/sec/Hz (fading, mobility)

**Wired**: Up to 10 bits/sec/Hz (cable, fiber optics)

**MIMO**: Multiply by $`N_s`$ spatial streams
(4-8\$\times\$ typical)

**Fundamental constraint**: Can't exceed Shannon
limit!

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Shannon's-Channel-Capacity-Theorem\]\]**:
  Theoretical maximum

- **\[\[Quadrature-Amplitude-Modulation-(QAM)\]\]**: High
  spectral efficiency

- **\[\[Forward-Error-Correction-(FEC)\]\]**: Code rate
  trade-offs

- **\[\[OFDM-&-Multicarrier-Modulation\]\]**: Parallel
  channels

- **\[\[MIMO-&-Spatial-Multiplexing\]\]**: Multiple spatial
  streams

- **\[\[Complete-Link-Budget-Analysis\]\]**: SNR determines
  achievable \$\eta\$

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Spectral efficiency
\$\eta\$ = Rb/B measures bits per Hz.** Higher-order
modulation (M\$\uparrow\$) increases
\$\eta\$ but requires higher SNR. Code rate r \<
1 reduces \$\eta\$ but improves BER. Shannon limit
$`\eta = \log_2(1+\text{SNR})`$ is fundamental---no system can
exceed it. Modern systems (LDPC/Turbo codes) approach Shannon limit
within 1-3 dB. Practical wireless: 0.5-6 bits/sec/Hz. MIMO multiplies
\$\eta\$ by number of streams. Adaptive modulation &
coding (AMC) optimizes \$\eta\$ for varying channel
conditions. Trade-off: Spectral efficiency
\$\leftrightarrow\$ Power
efficiency---can't optimize both simultaneously.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
