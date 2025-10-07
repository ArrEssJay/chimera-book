---
layout: chapter
title: "8PSK-&-Higher-Order-PSK"
chapter: 1
permalink: /chapters/8psk-&-higher-order-psk/
---

# 8PSK & Higher-Order PSK

<div class="nontechnical">

**8PSK is like using 8 different hand gestures instead of 4**—you can send 50% more data per symbol, but the gestures are closer together, making them easier to confuse in noisy conditions.

**The progression:**

- **BPSK:** 2 positions (up/down) = 1 bit/symbol

- **QPSK:** 4 positions (corners) = 2 bits/symbol

- **8PSK:** 8 positions (compass directions) = 3 bits/symbol $`\leftarrow`$ *We are here*

- **16-PSK:** 16 positions = 4 bits/symbol

- **32-PSK:** 32 positions = 5 bits/symbol

**The trade-off:** More positions means faster data rate (8PSK is 1.5$`\times`$ faster than QPSK), but positions are closer together. This makes them easier to confuse when noise is present, requiring stronger signals (higher SNR) to work reliably.

**Real-world use:** **DVB-S2** satellite broadcasting uses 8PSK for HD channels because satellite bandwidth is expensive. The 50% data rate increase translates to 50% more channels in the same bandwidth. The trade-off is needing larger receiving dishes for adequate SNR.

**Why not go higher?** Beyond 8PSK, phase states become too closely spaced. Even tiny noise causes errors. For higher spectral efficiency, **QAM** (which varies both amplitude and phase) is more effective. This is why WiFi uses 64-QAM and 256-QAM, not 16-PSK or 32-PSK.

**Where you’ll encounter 8PSK:**

- Satellite TV (DVB-S2 HD channels)

- Military SATCOM (MILSTAR)

- NASA deep-space missions (high-rate data return)

- Microwave backhaul (cell tower point-to-point links)

**Angular spacing matters:**

- QPSK: 90° between positions (robust)

- 8PSK: 45° between positions (moderate)

- 16-PSK: 22.5° between positions (sensitive)

Smaller angular separation = easier to confuse = requires cleaner signal and better phase tracking.

</div>

## Overview

**8-ary Phase-Shift Keying (8PSK)** encodes data using **8 equally-spaced phase states** positioned around the unit circle, transmitting **3 bits per symbol**. This provides 50% higher spectral efficiency than QPSK at the cost of approximately 3.5 dB additional SNR requirement.

<div class="keyconcept">

8PSK achieves **3 bits/symbol** ($`\sim`$<!-- -->2.2 bps/Hz with pulse shaping), providing a middle ground between QPSK’s robustness (2 bits/symbol) and 16-QAM’s efficiency (4 bits/symbol). Its constant envelope property makes it ideal for satellite systems using nonlinear power amplifiers.

</div>

Higher-order PSK schemes ($`M`$-PSK) use $`M`$ phase states to transmit $`\log_2(M)`$ bits per symbol. However, beyond 8PSK, the reduced angular spacing between constellation points makes phase noise and additive noise increasingly problematic, leading to rapid BER degradation.

## Mathematical Description

### 8PSK Constellation

The 8PSK constellation consists of 8 equally-spaced phase states positioned on a unit circle with angular separation of $`45°`$ ($`\pi/4`$ radians):

``` math
\begin{equation}
\phi_m = \frac{2\pi m}{8} = \frac{\pi m}{4}, \quad m = 0, 1, \ldots, 7
\end{equation}
```
where:

- $`\phi_m`$ = phase angle for symbol $`m`$ (radians)

- $`m`$ = symbol index from 0 to 7

### Time-Domain Signal

The transmitted signal for symbol $`m`$ is:
``` math
\begin{equation}
s_m(t) = A\cos(2\pi f_c t + \phi_m)
\end{equation}
```
where:

- $`A`$ = carrier amplitude

- $`f_c`$ = carrier frequency (Hz)

- $`\phi_m`$ = phase for symbol $`m`$

- $`0 \leq t < T_s`$ (symbol period)

### Complex Baseband Representation

In complex baseband notation:
``` math
\begin{equation}
s_m = A e^{j\phi_m} = A e^{j\pi m/4}
\end{equation}
```

**IQ components:**
``` math
\begin{equation}
I_m = A\cos(\phi_m), \quad Q_m = A\sin(\phi_m)
\end{equation}
```
where:

- $`I_m`$ = in-phase component

- $`Q_m`$ = quadrature component

### Constellation Diagram

The 8PSK constellation places 8 symbols at equal angular spacing of $`45°`$ around the unit circle:

<div class="center">

</div>

This maximum Euclidean distance constellation on the unit circle maintains constant envelope ($`|s_m| = A`$ for all $`m`$), enabling operation with nonlinear power amplifiers at saturation.

### Gray Coding

Adjacent constellation points differ by only one bit (Gray coding) to minimize bit errors when symbol errors occur:

<div class="center">

| Symbol | Gray Code |  Phase   | $`I_m/A`$  | $`Q_m/A`$  |
|:------:|:---------:|:--------:|:----------:|:----------:|
|   0    |    000    |  $`0°`$  |   1.000    |   0.000    |
|   1    |    001    | $`45°`$  |   0.707    |   0.707    |
|   2    |    011    | $`90°`$  |   0.000    |   1.000    |
|   3    |    010    | $`135°`$ | $`-0.707`$ |   0.707    |
|   4    |    110    | $`180°`$ | $`-1.000`$ |   0.000    |
|   5    |    111    | $`225°`$ | $`-0.707`$ | $`-0.707`$ |
|   6    |    101    | $`270°`$ |   0.000    | $`-1.000`$ |
|   7    |    100    | $`315°`$ |   0.707    | $`-0.707`$ |

</div>

Note that adjacent symbols (e.g., 000 $`\rightarrow`$ 001 $`\rightarrow`$ 011) differ by exactly one bit, minimizing the number of bit errors when noise causes a decision error to an adjacent symbol.

## Signal Characteristics

### Constant Envelope Property

All 8PSK symbols have identical amplitude:
``` math
\begin{equation}
|s_m| = A \quad \text{for all } m = 0, 1, \ldots, 7
\end{equation}
```

This constant envelope property provides a critical advantage:

- Power amplifier can operate at saturation (maximum DC-to-RF efficiency)

- No amplitude modulation $`\rightarrow`$ no AM-PM distortion

- Peak-to-Average Power Ratio (PAPR) = 0 dB

- Compatible with nonlinear satellite TWTAs

### Symbol and Bit Energy

The energy per symbol (normalized to unit symbol period $`T_s = 1`$):
``` math
\begin{equation}
E_s = \int_0^{T_s} |s_m(t)|^2 \, dt = A^2 T_s = A^2
\end{equation}
```

Since 8PSK transmits 3 bits per symbol:
``` math
\begin{equation}
E_b = \frac{E_s}{\log_2(8)} = \frac{E_s}{3} = \frac{A^2}{3}
\end{equation}
```
where:

- $`E_s`$ = energy per symbol (joules)

- $`E_b`$ = energy per bit (joules)

### Minimum Euclidean Distance

The minimum distance between adjacent constellation points is critical for noise immunity:
``` math
\begin{equation}
d_{\min} = 2A\sin\left(\frac{\pi}{8}\right) = 2A \times 0.3827 = 0.765A
\end{equation}
```

For normalized amplitude ($`A = 1`$): $`d_{\min} = 0.765`$

**Comparison with QPSK:**

- QPSK: $`d_{\min} = \sqrt{2}A = 1.414A`$ (at same average energy)

- 8PSK: $`d_{\min} = 0.765A`$

- **Ratio:** 8PSK minimum distance is $`1.414/0.765 = 1.85\times`$ smaller (5.3 dB)

This reduced separation explains why 8PSK requires approximately 3.5 dB higher SNR than QPSK to achieve the same BER.

## Modulation and Demodulation

### Transmitter (IQ Modulator)

The 8PSK modulator generates I and Q baseband components, then mixes with carrier quadrature signals:

<div class="center">

</div>

**Process:**

1.  **Symbol mapping:** Map 3-bit groups to I/Q coordinates using Gray coding

2.  **Pulse shaping:** Apply root raised-cosine (RRC) filter to limit bandwidth

3.  **Upconversion:** Mix I with $`\cos(2\pi f_c t)`$ and Q with $`-\sin(2\pi f_c t)`$

4.  **Combine:** Sum I and Q paths to generate RF signal

The transmitted signal is:
``` math
\begin{equation}
s_{\text{RF}}(t) = I_m(t) \cos(2\pi f_c t) - Q_m(t) \sin(2\pi f_c t)
\end{equation}
```
where $`I_m(t)`$ and $`Q_m(t)`$ are the pulse-shaped baseband waveforms.

### Receiver (Coherent Detector)

<div class="center">

</div>

<div class="warningbox">

**Phase synchronization is critical.** The local oscillator must be exactly in phase with the transmitter carrier. A phase offset $`\phi_e`$ rotates the entire constellation, degrading performance. At $`\phi_e = 22.5°`$ (midpoint between symbols), complete decision ambiguity occurs.

</div>

**Detection process:**

1.  **Downconvert:** Mix received signal with local I/Q carriers

2.  **Lowpass filter:** Remove $`2f_c`$ component, retain baseband

3.  **Sample:** Capture I and Q values at optimal sampling instant

4.  **Decision:** Find closest of 8 constellation points

**Decision rule:** Calculate phase angle and quantize:
``` math
\begin{equation}
\hat{\phi} = \arctan\left(\frac{\hat{Q}}{\hat{I}}\right)
\end{equation}
```
``` math
\begin{equation}
\hat{m} = \left\lfloor \frac{\hat{\phi} + \pi/8}{2\pi/8} \right\rfloor \bmod 8
\end{equation}
```

The decision regions are 8 pie-slice wedges, each spanning $`45°`$ ($`\pi/4`$ radians), centered on each constellation point.

### Differential 8PSK (D8PSK)

Differential encoding avoids the carrier phase ambiguity inherent in coherent PSK systems.

**Encoding:** Data is encoded in the *phase change* between consecutive symbols:
``` math
\begin{equation}
\phi_k = \phi_{k-1} + \Delta\phi_k \bmod 2\pi
\end{equation}
```
where $`\Delta\phi_k \in \{0, \pi/4, \pi/2, 3\pi/4, \pi, 5\pi/4, 3\pi/2, 7\pi/4\}`$ encodes 3 data bits.

**Demodulation:** Compute phase difference between consecutive received symbols:
``` math
\begin{equation}
\Delta\hat{\phi}_k = \hat{\phi}_k - \hat{\phi}_{k-1}
\end{equation}
```

The 3-bit data word is decoded from $`\Delta\hat{\phi}_k`$ rather than from the absolute phase $`\hat{\phi}_k`$.

**Trade-off:**

- No carrier phase recovery needed (only frequency synchronization)

- Simpler receiver implementation

- Immune to 8-fold phase ambiguity

- Approximately 3 dB performance penalty versus coherent detection

- Error propagation (one symbol error affects two decoded symbols)

## Bit Error Rate (BER) Performance

### Symbol Error Rate in AWGN

For 8PSK in additive white Gaussian noise (AWGN) with coherent detection (high SNR approximation):
``` math
\begin{equation}
P_s \approx 2Q\left(\sqrt{\frac{2E_s}{N_0}} \sin\left(\frac{\pi}{8}\right)\right) = 2Q\left(0.765\sqrt{\frac{E_s}{N_0}}\right)
\end{equation}
```
where:

- $`P_s`$ = symbol error probability

- $`E_s`$ = energy per symbol (joules)

- $`N_0`$ = noise power spectral density (W/Hz)

- $`Q(x) = \frac{1}{\sqrt{2\pi}} \int_x^\infty e^{-t^2/2} \, dt`$ (Gaussian Q-function)

### Bit Error Rate with Gray Coding

With Gray coding, most symbol errors cause only a single bit error:
``` math
\begin{equation}
\mathrm{BER} \approx \frac{P_s}{\log_2(8)} = \frac{P_s}{3}
\end{equation}
```

Expressing BER in terms of $`E_b/N_0`$ using $`E_s = 3E_b`$:
``` math
\begin{equation}
\mathrm{BER} \approx \frac{2}{3}Q\left(0.765\sqrt{\frac{3E_b}{N_0}}\right) = \frac{2}{3}Q\left(1.325\sqrt{\frac{E_b}{N_0}}\right)
\end{equation}
```

### Required $`E_b/N_0`$ for Target BER

To achieve BER $`= 10^{-6}`$:

<div class="center">

| Modulation | Required $`E_b/N_0`$ (dB) | Penalty vs BPSK |
|:-----------|:-------------------------:|:---------------:|
| BPSK       |           10.5            |        —        |
| QPSK       |           10.5            |      0 dB       |
| **8PSK**   |         **14.0**          |   **+3.5 dB**   |
| 16-PSK     |           18.0            |     +7.5 dB     |
| 32-PSK     |           22.0            |    +11.5 dB     |

</div>

**Key observation:** Each doubling of $`M`$ (from $`M`$-PSK to $`2M`$-PSK) adds approximately 3.5–4 dB SNR requirement, making higher-order PSK increasingly impractical.

### BER Performance Comparison

<div class="center">

| $`E_b/N_0`$ (dB) | BPSK | QPSK | 8PSK | 16-PSK |
|:--:|:--:|:--:|:--:|:--:|
| 6 | $`1.9 \times 10^{-3}`$ | $`1.9 \times 10^{-3}`$ | $`4.0 \times 10^{-2}`$ | $`1.5 \times 10^{-1}`$ |
| 8 | $`5.6 \times 10^{-5}`$ | $`5.6 \times 10^{-5}`$ | $`8.0 \times 10^{-3}`$ | $`8.0 \times 10^{-2}`$ |
| 10 | $`3.9 \times 10^{-6}`$ | $`3.9 \times 10^{-6}`$ | $`7.0 \times 10^{-4}`$ | $`3.0 \times 10^{-2}`$ |
| 12 | $`7.8 \times 10^{-8}`$ | $`7.8 \times 10^{-8}`$ | $`4.0 \times 10^{-5}`$ | $`8.0 \times 10^{-3}`$ |
| 14 | $`7.7 \times 10^{-10}`$ | $`7.7 \times 10^{-10}`$ | $`1.0 \times 10^{-6}`$ | $`7.0 \times 10^{-4}`$ |

</div>

**Key observation:** At a given SNR, higher-order PSK schemes suffer significantly higher BER due to reduced minimum distance between constellation points. To maintain the same BER as lower-order schemes, higher SNR is required.

## Bandwidth Efficiency

The symbol rate for $`M`$-ary modulation is:
``` math
\begin{equation}
R_s = \frac{R_b}{\log_2(M)} \quad \text{(symbols/second)}
\end{equation}
```
where $`R_b`$ is the bit rate (bps).

With raised-cosine pulse shaping (roll-off factor $`\alpha`$), the occupied bandwidth is:
``` math
\begin{equation}
B = (1 + \alpha) R_s = (1 + \alpha) \frac{R_b}{\log_2(M)} \quad \text{(Hz)}
\end{equation}
```

The spectral efficiency (data rate per unit bandwidth) is:
``` math
\begin{equation}
\eta = \frac{R_b}{B} = \frac{\log_2(M)}{1 + \alpha} \quad \text{(bps/Hz)}
\end{equation}
```

### Comparison of PSK Schemes

For $`\alpha = 0.35`$ (typical raised-cosine roll-off):

<div class="center">

| Modulation | Bits/Symbol | $`\eta`$ (bps/Hz) | Required $`E_b/N_0`$ | Relative SNR |
|:-----------|:-----------:|:-----------------:|:--------------------:|:------------:|
| BPSK       |      1      |       0.74        |       10.5 dB        |   Baseline   |
| QPSK       |      2      |       1.48        |       10.5 dB        |     0 dB     |
| **8PSK**   |    **3**    |     **2.22**      |     **14.0 dB**      | **+3.5 dB**  |
| 16-PSK     |      4      |       2.96        |       18.0 dB        |   +7.5 dB    |
| 32-PSK     |      5      |       3.70        |       22.0 dB        |   +11.5 dB   |

</div>

<div class="calloutbox">

Spectral Efficiency vs Power Efficiency Trade-off
8PSK provides 50% higher spectral efficiency than QPSK (2.22 vs 1.48 bps/Hz) but requires 3.5 dB more SNR to achieve the same BER. This makes 8PSK ideal for bandwidth-limited systems with adequate link margin, such as:

- Satellite broadcasting (DVB-S2)

- Microwave backhaul links

- High-throughput military SATCOM

</div>

## Higher-Order PSK

### 16-PSK

16-PSK extends the concept to 16 phase states with $`22.5°`$ angular spacing:

- **Phase states:** 16 ($`M = 16`$)

- **Bits per symbol:** 4

- **Angular spacing:** $`22.5° = \pi/8`$ radians

- **Spectral efficiency:** $`\sim`$<!-- -->2.96 bps/Hz ($`\alpha = 0.35`$)

**Minimum distance:**
``` math
\begin{equation}
d_{\min} = 2A\sin\left(\frac{\pi}{16}\right) = 2A \times 0.1951 = 0.39A
\end{equation}
```

This is only half the minimum distance of 8PSK ($`d_{\min} = 0.765A`$), explaining the $`\sim`$<!-- -->4 dB performance penalty. The tight angular spacing makes 16-PSK extremely sensitive to:

- Phase noise from local oscillators

- Frequency offset and drift

- Timing jitter

- Multipath fading

**Practical consideration:** 16-PSK is rarely used because 16-QAM provides similar spectral efficiency with better BER performance.

### 32-PSK and Beyond

**32-PSK:** $`11.25°`$ spacing, 5 bits/symbol

**64-PSK:** $`5.625°`$ spacing, 6 bits/symbol

<div class="warningbox">

PSK schemes beyond 8PSK ($`M > 8`$) are rarely used in practice. The extremely small angular spacing makes them highly sensitive to phase noise, frequency offset, and channel impairments. **QAM modulation** (which varies both amplitude and phase) provides superior performance for $`M > 8`$.

</div>

**Why QAM wins for $`M > 8`$:**

- Larger minimum distance for same average power

- Better noise immunity

- Comparable implementation complexity

- Industry standard (WiFi, LTE, cable modems use 16/64/256-QAM, not 16/64/256-PSK)

## Comparisons and Trade-offs

### 8PSK vs 16-QAM

At similar spectral efficiency ($`\sim`$<!-- -->2.2 bps/Hz):

<div class="center">

| Parameter | 8PSK | 16-QAM |
|:---|:--:|:--:|
| Bits/symbol | 3 | 4 |
| Spectral efficiency | 2.22 bps/Hz | 2.96 bps/Hz |
| Required $`E_b/N_0`$ (BER $`10^{-6}`$) | 14.0 dB | 14.5 dB |
| Envelope | Constant (PAPR = 0 dB) | Variable (PAPR $`\sim`$<!-- -->2.6 dB) |
| PA efficiency | Excellent | Good |
| Phase noise sensitivity | Moderate | Moderate |

</div>

**When to use 8PSK:**

- Nonlinear power amplifiers (satellite TWTAs)

- Maximum PA efficiency required

- Constant envelope property is essential

**When to use 16-QAM:**

- Linear amplifiers available

- Higher spectral efficiency needed

- Slightly better BER performance acceptable trade-off

### Phase Noise Sensitivity

Oscillator phase noise $`\phi_n(t)`$ causes constellation rotation and spreading:
``` math
\begin{equation}
r_m(t) = A e^{j(\phi_m + \phi_n(t))} + n(t)
\end{equation}
```

**Effect of phase noise:**

- **Constant offset:** Rotates entire constellation

- **Random jitter:** Blurs constellation points

**Angular spacing comparison:**

<div class="center">

| Modulation | Angular Spacing |   Phase Noise Tolerance   |
|:-----------|:---------------:|:-------------------------:|
| QPSK       |     $`90°`$     |     Robust (10° RMS)      |
| 8PSK       |     $`45°`$     |    Moderate (4.5° RMS)    |
| 16-PSK     |    $`22.5°`$    |   Sensitive (2.3° RMS)    |
| 32-PSK     |   $`11.25°`$    | Very sensitive (1.1° RMS) |

</div>

**Rule of thumb:** Phase noise RMS should be $`<`$ 1/10 of angular spacing.

<div class="calloutbox">

8PSK Phase Noise Requirement
For 8PSK with $`45°`$ spacing:

- Tolerable phase noise: $`\sim`$<!-- -->4.5° RMS

- Equivalent integrated phase noise: $`\sim`$-25 dBc

- This requires high-quality crystal oscillators or phase-locked loops

</div>

## Practical Implementations

### DVB-S2 Satellite Broadcasting

The DVB-S2 standard (Digital Video Broadcasting - Satellite 2nd Generation) uses 8PSK extensively for high-definition television distribution.

**Adaptive Coding and Modulation (ACM):**

- **Clear sky conditions:** 8PSK with high code rate (3/4 or 5/6)

- **Rain fade conditions:** Switch to QPSK with lower code rate (1/2 or 3/5)

- **Severe degradation:** Fall back to BPSK or QPSK 1/4

<div class="calloutbox">

DVB-S2 Throughput Example
Consider a 36 MHz transponder with $`\alpha = 0.35`$ pulse shaping:

**QPSK, code rate 1/2:**

- Spectral efficiency: $`1.48 \times 0.5 = 0.74`$ bps/Hz

- Throughput: $`36 \times 0.74 = 26.6`$ Mbps

**8PSK, code rate 3/4:**

- Spectral efficiency: $`2.22 \times 0.75 = 1.67`$ bps/Hz

- Throughput: $`36 \times 1.67 = 60.1`$ Mbps

**Result:** 8PSK provides $`\mathbf{2.26\times}`$ higher throughput when link margin permits, enabling more HD channels per transponder.

</div>

### Military SATCOM (MILSTAR)

The U.S. military’s MILSTAR satellite constellation uses differential 8PSK for protected strategic communications:

- **Modulation:** Differential 8PSK (D8PSK)

- **Spread spectrum:** Combined with DSSS for anti-jam capability

- **Low probability of intercept (LPI):** Spread signal difficult to detect

- **Robust operation:** Works without precise carrier phase tracking

### Microwave Backhaul

Point-to-point microwave links (6–42 GHz) for cellular backhaul use adaptive modulation including 8PSK:

<div class="center">

| Condition         | Modulation | Typical Throughput        |
|:------------------|:-----------|:--------------------------|
| Excellent (clear) | 256-QAM    | 300 Mbps (56 MHz channel) |
| Good              | 64-QAM     | 200 Mbps                  |
| Moderate          | 16-QAM     | 135 Mbps                  |
| Rain fade         | **8PSK**   | **100 Mbps**              |
| Heavy rain        | QPSK       | 67 Mbps                   |

</div>

8PSK serves as a robust fallback mode when rain attenuation degrades the link but QPSK would sacrifice too much capacity.

### Deep-Space Communications

NASA and ESA deep-space missions traditionally use BPSK or QPSK to maximize link margin. However, 8PSK is emerging for high-rate science data return:

**Mars orbiters (e.g., Mars Reconnaissance Orbiter):**

- Frequency: Ka-band (32 GHz)

- Modulation: Switchable QPSK/8PSK

- Peak data rate: 6 Mbps (8PSK) vs 4 Mbps (QPSK)

- Trade-off: 50% higher rate vs 3.5 dB reduced link margin

**Strategy:** Use 8PSK when spacecraft is close to Earth and link margin is high; switch to QPSK as distance increases.

## Implementation Challenges

### Carrier Phase Recovery

8PSK exhibits 8-fold phase ambiguity (every $`45°`$), requiring robust synchronization:

**Pilot-aided synchronization:**

- Insert known pilot symbols periodically

- Estimate phase offset from received pilots

- Apply correction to data symbols

**Blind synchronization:**

- **8th-power loop:** Removes modulation to extract carrier

- **Decision-directed:** Uses decoded symbols to refine phase estimate

- **Costas loop:** PLL-based feedback structure

### Timing Recovery

Accurate symbol timing is critical for sampling at optimal decision instants:

- **Early-late gate detector:** Compares early vs late samples

- **Gardner algorithm:** Decision-directed timing error detection

- **Timing jitter:** Causes intersymbol interference (ISI) and BER degradation

### Pulse Shaping and PAPR

While 8PSK has constant envelope in baseband, pulse shaping introduces envelope variation:

- **Raised-cosine filter:** Creates 3–4 dB PAPR

- **PA backoff:** Required to avoid clipping, reducing efficiency

- **Mitigation:** Constant-envelope pulse shaping (MSK, GMSK) or predistortion

### Frequency Offset Tolerance

Carrier frequency offset $`\Delta f`$ causes constellation rotation:
``` math
\begin{equation}
r(t) = s(t) e^{j2\pi \Delta f t}
\end{equation}
```

**Rule of thumb:** $`|\Delta f| < 0.01 \times R_s`$

<div class="calloutbox">

Example: 8PSK at 1 Msps

- Symbol rate: $`R_s = 1`$ Msps

- Tolerable frequency offset: $`|\Delta f| < 10`$ kHz

- Oscillator requirement: $`< 10`$ ppm at 1 GHz carrier

</div>

## Worked Example: DVB-S2 Satellite Link

**Scenario:** Geostationary satellite broadcasting 8PSK to 60 cm home dish

### Given Parameters

|                   |                               |
|:------------------|:------------------------------|
| TX power          | $`P_t = 100`$ W = 50 dBm      |
| TX antenna gain   | $`G_t = 30`$ dBi              |
| Distance          | $`d = 38{,}000`$ km (GEO)     |
| Frequency         | $`f = 11.5`$ GHz (Ku-band)    |
| RX antenna gain   | $`G_r = 33`$ dBi (60 cm dish) |
| System noise temp | $`T_s = 120`$ K               |
| Bandwidth         | $`B = 27`$ MHz                |
| Symbol rate       | $`R_s = 20`$ Msps             |
| Modulation        | 8PSK, code rate 3/4           |

### Step 1: Free-Space Path Loss

``` math
\begin{equation}
\mathrm{FSPL\,[dB]} = 20\log_{10}(d_{\text{km}}) + 20\log_{10}(f_{\text{MHz}}) + 32.45
\end{equation}
```
``` math
\begin{equation}
\mathrm{FSPL} = 20\log_{10}(38{,}000) + 20\log_{10}(11{,}500) + 32.45 = 205.9~\text{dB}
\end{equation}
```

### Step 2: Received Power

``` math
\begin{equation}
P_r = P_t + G_t + G_r - \mathrm{FSPL} = 50 + 30 + 33 - 205.9 = -92.9~\text{dBm}
\end{equation}
```

### Step 3: Noise Power

``` math
\begin{equation}
N = kT_sB = (1.38 \times 10^{-23})(120)(27 \times 10^6) = 4.47 \times 10^{-14}~\text{W} = -103.5~\text{dBm}
\end{equation}
```

### Step 4: Carrier-to-Noise Ratio

``` math
\begin{equation}
\mathrm{C/N} = P_r - N = -92.9 - (-103.5) = 10.6~\text{dB}
\end{equation}
```

### Step 5: $`E_b/N_0`$ Calculation

Data rate: $`R_b = R_s \times 3 \times (3/4) = 20 \times 3 \times 0.75 = 45`$ Mbps

``` math
\begin{equation}
\frac{E_b}{N_0} = \mathrm{C/N} + 10\log_{10}\left(\frac{B}{R_b}\right) = 10.6 + 10\log_{10}\left(\frac{27}{45}\right) = 8.4~\text{dB}
\end{equation}
```

<div class="calloutbox">

Link Budget Result
**Result:** $`E_b/N_0 = 8.4`$ dB

With rate-3/4 FEC ($`\sim`$<!-- -->5.5 dB gain), effective uncoded $`E_b/N_0 \approx 14`$ dB, meeting 8PSK requirement for BER $`10^{-6}`$.

**Link margin:** Minimal (0.4 dB) in clear sky. Rain fade ($`\sim`$<!-- -->3–5 dB at Ku-band) requires fallback to QPSK or larger dish.

</div>

## Advantages and Disadvantages

### Advantages

1.  **50% higher spectral efficiency than QPSK** (2.22 vs 1.48 bps/Hz with $`\alpha = 0.35`$)

2.  **Constant envelope** enables operation with nonlinear power amplifiers at saturation

3.  **Ideal for bandwidth-limited systems** with adequate SNR (satellite, backhaul)

4.  **Moderate implementation complexity** using standard IQ modulators

5.  **Gray coding minimizes BER** for symbol errors

### Disadvantages

1.  **3.5 dB SNR penalty vs QPSK** to achieve same BER

2.  **Carrier phase synchronization required** (8-fold ambiguity)

3.  **Sensitive to phase noise** (requires $`\sim`$<!-- -->4.5° RMS phase stability)

4.  **Not optimal for very high SNR** (16-QAM provides better efficiency/performance trade-off)

5.  **Differential encoding** costs additional 3 dB if carrier recovery must be avoided

## Summary

<div class="center">

| **Parameter** | **Value** |
|:---|:---|
| Bits per symbol | 3 |
| Constellation points | 8 (equally spaced on circle) |
| Phase spacing | $`45°`$ ($`\pi/4`$ radians) |
| Minimum distance | $`0.765A`$ (normalized) |
| Spectral efficiency | $`\sim`$<!-- -->2.22 bps/Hz ($`\alpha = 0.35`$) |
| BER @ 10 dB $`E_b/N_0`$ | $`7.0 \times 10^{-4}`$ |
| Required $`E_b/N_0`$ (BER $`10^{-6}`$) | 14.0 dB (coherent) |
| PAPR | 0 dB (constant envelope) |
| Carrier recovery | Required (8-fold ambiguity) |
| Best application | Bandwidth-limited, high-SNR |
| Typical uses | Satellite (DVB-S2), backhaul |

</div>

## Further Reading

- **Chapter <a href="#ch:bpsk" data-reference-type="ref" data-reference="ch:bpsk">[ch:bpsk]</a>:** Binary Phase-Shift Keying—foundation of PSK modulation

- **Chapter <a href="#ch:qpsk" data-reference-type="ref" data-reference="ch:qpsk">[ch:qpsk]</a>:** Quadrature Phase-Shift Keying—2 bits/symbol, lower SNR requirement

- **Chapter <a href="#ch:qam" data-reference-type="ref" data-reference="ch:qam">[ch:qam]</a>:** Quadrature Amplitude Modulation—superior alternative for $`M > 8`$

- **Chapter <a href="#ch:constellation" data-reference-type="ref" data-reference="ch:constellation">[ch:constellation]</a>:** Constellation Diagrams—visualization techniques

- **Chapter <a href="#ch:iq" data-reference-type="ref" data-reference="ch:iq">[ch:iq]</a>:** IQ Representation—complex baseband mathematics

- **Chapter <a href="#ch:ber" data-reference-type="ref" data-reference="ch:ber">[ch:ber]</a>:** Bit Error Rate Analysis—performance measurement

- **Chapter <a href="#ch:fec" data-reference-type="ref" data-reference="ch:fec">[ch:fec]</a>:** Forward Error Correction—improving BER with coding

- **Chapter <a href="#ch:sync" data-reference-type="ref" data-reference="ch:sync">[ch:sync]</a>:** Carrier and Timing Recovery—synchronization methods

- **Chapter <a href="#ch:dvbs2" data-reference-type="ref" data-reference="ch:dvbs2">[ch:dvbs2]</a>:** DVB-S2 Standard—practical 8PSK implementation
