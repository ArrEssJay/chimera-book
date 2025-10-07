---
layout: chapter
title: "Quadrature-Amplitude-Modulation-(QAM)"
chapter: 51
permalink: /chapters/quadrature-amplitude-modulation-(qam)/
---

# Quadrature Amplitude Modulation (QAM)

<div class="nontechnical">

**QAM is like having a grid of mailboxes---the more boxes, the
more messages you can send at once. Your WiFi/phone picks bigger grids
when signal is strong!**

**The idea - Vary BOTH brightness and angle**: - **PSK** (like
QPSK): Only varies angle (4 or 8 positions) - **QAM**: Varies
**both** angle AND distance from center! - Result: Many more
possible positions = much faster data!

**Real QAM sizes**: - **16-QAM**: 4\$\times\$4
grid = 16 positions = 4 bits/symbol - **64-QAM**:
8\$\times\$8 grid = 64 positions = 6 bits/symbol -
**256-QAM**: 16\$\times\$16 grid = 256 positions = 8
bits/symbol - **1024-QAM** (WiFi 6): 32\$\times\$32
grid = 1024 positions = 10 bits/symbol!

**Why you care - Speed differences**: - **QPSK**: 2
bits/symbol (baseline) - **16-QAM**: 4 bits/symbol =
**2\$\times\$ faster** - **64-QAM**: 6
bits/symbol = **3\$\times\$ faster**  
- **256-QAM**: 8 bits/symbol = **4\$\times\$
faster** - **1024-QAM**: 10 bits/symbol =
**5\$\times\$ faster**!

**The trade-off**: - **More positions** = faster BUT positions
are closer together - **Closer positions** = easier to confuse when
signal is noisy - Strong signal (close to router): Use 1024-QAM =
blazing fast! - Weak signal (far from router): Use QPSK = slower but
reliable

**Where you see it**: - **Your WiFi stats**: “MCS 9,
256-QAM” = using 256-position grid - **4G/5G**: “Modulation:
64-QAM” = using 64-position grid - **Cable modem**: DOCSIS 3.1
uses 4096-QAM (12 bits/symbol!) - **Phone signal bars**: Full bars
= can use high QAM, low bars = must use simple modulation

**Real experience**: - Walk toward router: Speed increases as phone
switches QPSK \$\rightarrow\$ 16-QAM
\$\rightarrow\$ 64-QAM \$\rightarrow\$
256-QAM - Walk away: Speed decreases as phone steps back down - This
happens automatically hundreds of times per second!

**Fun fact**: Modern WiFi 6E can use 1024-QAM, but ONLY at close
range with zero interference—it’s like threading a needle with radio waves!

</div>

## Overview

**Quadrature Amplitude Modulation (QAM)** encodes data by
modulating **both amplitude and phase** of a carrier wave.

**Key insight**: Combine **ASK** (amplitude-shift keying) and
**PSK** (phase-shift keying) in **2D constellation** (I/Q
plane)

**Advantage**: **Best spectral efficiency** for given SNR
(optimal use of 2D signal space)

**Applications**: WiFi, LTE/5G, cable modems (DOCSIS), DSL, digital
TV (DVB-C), microwave backhaul

<div class="keyconcept">

QAM achieves **superior spectral efficiency** by utilizing both amplitude and phase dimensions of the signal space. While PSK uses only phase, QAM leverages the entire I/Q plane, making it the optimal choice for high-throughput systems where bandwidth is constrained but SNR is adequate.

</div>

## Mathematical Description

### QAM Fundamentals

#### Complex Baseband Representation

The QAM symbol in complex baseband representation is:
``` math
\begin{equation}
s_m = I_m + jQ_m
\label{eq:qam-symbol}
\end{equation}
```
where:

- $`I_m`$ = In-phase amplitude (real axis)

- $`Q_m`$ = Quadrature amplitude (imaginary axis)

- $`m`$ = Symbol index ($`0`$ to $`M-1`$)

The passband RF signal is expressed as:
``` math
\begin{equation}
s_{\text{RF}}(t) = I_m \cos(2\pi f_c t) - Q_m \sin(2\pi f_c t)
\label{eq:qam-passband}
\end{equation}
```
where:

- $`f_c`$ = carrier frequency (Hz)

- $`t`$ = time (seconds)

#### M-ary QAM

For square M-QAM, the constellation contains:
``` math
\begin{equation}
M = L^2 \quad \text{points, where } L = \sqrt{M}
\label{eq:qam-m}
\end{equation}
```

The number of bits per symbol is:
``` math
\begin{equation}
k = \log_2(M)
\label{eq:qam-bits}
\end{equation}
```

**Common QAM orders:**

- 4-QAM (QPSK): $`2 \times 2`$ grid, 2 bits/symbol

- 16-QAM: $`4 \times 4`$ grid, 4 bits/symbol

- 64-QAM: $`8 \times 8`$ grid, 6 bits/symbol

- 256-QAM: $`16 \times 16`$ grid, 8 bits/symbol

- 1024-QAM: $`32 \times 32`$ grid, 10 bits/symbol

- 4096-QAM: $`64 \times 64`$ grid, 12 bits/symbol

## Constellation Diagrams

### 16-QAM

#### Constellation Diagram

The 16-QAM constellation forms a $`4 \times 4`$ square grid in the I/Q plane:

<div class="center">

</div>

**Amplitude levels**: $`I, Q \in \{-3d, -d, +d, +3d\}`$

where $`d`$ = unit spacing (normalized distance)

#### Bit Mapping (Gray Coding)

**4 bits per symbol**: $`b_3 b_2 b_1 b_0`$

**Typical mapping**: - $`b_3 b_2`$ \$\rightarrow\$ I
component (00=-3d, 01=-d, 11=+d, 10=+3d) - $`b_1 b_0`$
\$\rightarrow\$ Q component (00=-3d, 01=-d, 11=+d, 10=+3d)

**Example symbols**:

| Bits | I   | Q   | Position           |
|:-----|:----|:----|:-------------------|
|      | -3d | -3d | Bottom-left corner |
| 0001 | -3d | -d  |                    |
| 0011 | -3d | +d  |                    |
| 0010 | -3d | +3d | Top-left corner    |
| 1010 | +3d | +3d | Top-right corner   |

**Gray coding**: Adjacent symbols differ by exactly 1 bit, minimizing bit errors when symbol errors occur.

#### Signal Characteristics

The average symbol energy for 16-QAM is:
``` math
\begin{equation}
\bar{E}_s = \frac{1}{16}\sum_{m=0}^{15} (I_m^2 + Q_m^2) = \frac{1}{16} \times 16 \times 10d^2 = 10d^2
\label{eq:16qam-energy}
\end{equation}
```

For unit average energy normalization, set $`d^2 = 1/10`$, giving $`\bar{E}_s = 1`$.

The minimum Euclidean distance between adjacent constellation points is:
``` math
\begin{equation}
d_{\min} = 2d = 2\sqrt{\frac{1}{10}} = \frac{2}{\sqrt{10}} \approx 0.632
\label{eq:16qam-distance}
\end{equation}
```

### 64-QAM

#### Constellation Diagram

The 64-QAM constellation forms an $`8 \times 8`$ square grid:

<div class="center">

</div>

**Amplitude levels**: $`I, Q \in \{-7d, -5d, -3d, -d, +d, +3d, +5d, +7d\}`$

**Bits per symbol**: $`k = \log_2(64) = 6`$

The average symbol energy is:
``` math
\begin{equation}
\bar{E}_s = \frac{1}{64}\sum_{m=0}^{63} (I_m^2 + Q_m^2) = 42d^2
\label{eq:64qam-energy}
\end{equation}
```

For normalized energy ($`\bar{E}_s = 1`$): $`d = 1/\sqrt{42}`$

Minimum distance:
``` math
\begin{equation}
d_{\min} = 2d = \frac{2}{\sqrt{42}} \approx 0.309
\label{eq:64qam-distance}
\end{equation}
```

### 256-QAM

#### Constellation Diagram

256-QAM uses a $`16 \times 16`$ square grid with 256 constellation points.

**Bits per symbol**: $`k = \log_2(256) = 8`$

The average symbol energy is:
``` math
\begin{equation}
\bar{E}_s = 170d^2
\label{eq:256qam-energy}
\end{equation}
```

For normalized energy: $`d = 1/\sqrt{170}`$

Minimum distance:
``` math
\begin{equation}
d_{\min} = 2d = \frac{2}{\sqrt{170}} \approx 0.153
\label{eq:256qam-distance}
\end{equation}
```

#### High-Order QAM

**1024-QAM**: $`32 \times 32`$ grid, 10 bits/symbol

**4096-QAM**: $`64 \times 64`$ grid, 12 bits/symbol

**Practical limit**: $`\sim`$<!-- -->4096-QAM (802.11ax WiFi 6, DOCSIS 3.1 cable modems)

<div class="warningbox">

High-order QAM (1024-QAM and above) requires **exceptional channel conditions**:

- SNR $`>`$ 30–40 dB (typically achievable only in controlled environments)

- Excellent transmitter/receiver linearity (EVM $`<`$ 1%)

- Accurate I/Q balance and phase noise control

- Short transmission distances or high-quality cables

In practice, 1024/4096-QAM are limited to WiFi at very close range or wired systems (cable/DSL).

</div>

## Performance Analysis

### Symbol Error Rate (SER)

For square M-QAM in an AWGN channel (approximate, high SNR):
``` math
\begin{equation}
P_s \approx 4\left(1 - \frac{1}{\sqrt{M}}\right) Q\left(\sqrt{\frac{3}{M-1} \cdot \frac{E_s}{N_0}}\right)
\label{eq:qam-ser}
\end{equation}
```
where:

- $`Q(x) = \frac{1}{\sqrt{2\pi}} \int_x^\infty e^{-t^2/2} dt`$ = Gaussian Q-function

- $`E_s`$ = average symbol energy (joules)

- $`N_0`$ = noise power spectral density (W/Hz)

- $`M`$ = constellation size

### Bit Error Rate (BER)

With Gray coding (adjacent symbols differ by 1 bit), the approximate BER is:
``` math
\begin{equation}
\text{BER} \approx \frac{P_s}{\log_2(M)}
\label{eq:qam-ber-gray}
\end{equation}
```

Expressed in terms of $`E_b/N_0`$:
``` math
\begin{equation}
\text{BER} \approx \frac{4}{\log_2(M)}\left(1 - \frac{1}{\sqrt{M}}\right) Q\left(\sqrt{\frac{3\log_2(M)}{M-1} \cdot \frac{E_b}{N_0}}\right)
\label{eq:qam-ber-eb}
\end{equation}
```
where $`E_b/N_0 = (E_s/N_0) / \log_2(M)`$ is the energy per bit to noise ratio.

#### Required Eb/N0 for BER = 10\textsuperscript{-}\textsuperscript{6}

| Modulation   | Bits/symbol | Required Eb/N0 (dB) | SNR Penalty vs QPSK |
|:-------------|:------------|:--------------------|:--------------------|
| **QPSK**     | 2           | 10.5                | 0 dB (baseline)     |
| **16-QAM**   | 4           | 14.5                | +4 dB               |
| **64-QAM**   | 6           | 18.5                | +8 dB               |
| **256-QAM**  | 8           | 23                  | +12.5 dB            |
| **1024-QAM** | 10          | 27.5                | +17 dB              |
| **4096-QAM** | 12          | 32                  | +21.5 dB            |

**Pattern**: Each 4\$\times\$ increase in M adds
~4 dB

<div class="center">

------------------------------------------------------------------------

</div>

#### BER Comparison Table

| Eb/N0 (dB) | QPSK | 16-QAM | 64-QAM | 256-QAM |
|:---|:---|:---|:---|:---|
|  | 3.9\$\times\$10\textsuperscript{-}\textsuperscript{6} | 2\$\times\$10\textsuperscript{-}\textsuperscript{3} | 0.1 | 0.3 |
| 15 | 7\$\times\$10\textsuperscript{-}\textsuperscript{1}\textsuperscript{0} | 5\$\times\$10\textsuperscript{-}\textsuperscript{6} | 5\$\times\$10\textsuperscript{-}\textsuperscript{3} | 0.08 |
| 20 | \<10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2} | 1\$\times\$10\textsuperscript{-}\textsuperscript{9} | 1\$\times\$10\textsuperscript{-}\textsuperscript{5} | 3\$\times\$10\textsuperscript{-}\textsuperscript{3} |
| 25 | \<10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2} | \<10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2} | 1\$\times\$10\textsuperscript{-}\textsuperscript{8} | 2\$\times\$10\textsuperscript{-}\textsuperscript{5} |
| 30 | \<10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2} | \<10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2} | \<10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2} | 2\$\times\$10\textsuperscript{-}\textsuperscript{8} |

<div class="center">

------------------------------------------------------------------------

</div>

## Bandwidth Efficiency

With raised-cosine pulse shaping (roll-off factor $`\alpha`$), the occupied bandwidth is:
``` math
\begin{equation}
B = (1 + \alpha) R_s = (1 + \alpha) \frac{R_b}{\log_2(M)} \quad \text{(Hz)}
\label{eq:qam-bandwidth}
\end{equation}
```
where:

- $`R_b`$ = bit rate (bps)

- $`R_s`$ = symbol rate (symbols/sec)

- $`\alpha`$ = roll-off factor (typically 0.2–0.5)

The spectral efficiency is:
``` math
\begin{equation}
\eta = \frac{R_b}{B} = \frac{\log_2(M)}{1 + \alpha} \quad \text{(bits/sec/Hz)}
\label{eq:qam-spectral-efficiency}
\end{equation}
```

#### Comparison (\$\alpha\$ = 0.35)

| Modulation | Bits/symbol | Spectral Efficiency | Practical Limit |
|:---|:---|:---|:---|
| **QPSK** | 2 | 1.48 | Good SNR (10 dB) |
| **16-QAM** | 4 | 2.96 | Moderate SNR (15 dB) |
| **64-QAM** | 6 | 4.44 | High SNR (20 dB) |
| **256-QAM** | 8 | 5.93 | Very high SNR (25 dB) |
| **1024-QAM** | 10 | 7.41 | Excellent SNR (30 dB), wired only |
| **4096-QAM** | 12 | 8.89 | Exceptional SNR (35 dB), cable/DSL |

## Worked Example: WiFi Link with 64-QAM

<div class="calloutbox">

Example: 802.11ac Link Budget Analysis

**Scenario:** Indoor WiFi link using 64-QAM at 5 GHz

### Given Parameters

|                 |                                   |
|:----------------|:----------------------------------|
| Frequency       | $`f = 5.2`$ GHz (802.11ac)        |
| Distance        | $`d = 10`$ m (indoor)             |
| TX power        | $`P_t = 20`$ dBm (100 mW)         |
| TX antenna gain | $`G_t = 2`$ dBi (omnidirectional) |
| RX antenna gain | $`G_r = 2`$ dBi (laptop)          |
| Bandwidth       | $`B = 20`$ MHz                    |
| Modulation      | 64-QAM (6 bits/symbol)            |
| Coding rate     | $`r = 3/4`$                       |
| Noise figure    | $`NF = 6`$ dB                     |
| Target BER      | $`10^{-6}`$                       |

### Step 1: Free-Space Path Loss

``` math
\begin{equation*}
\mathrm{FSPL} = 20\log_{10}(d) + 20\log_{10}(f) + 32.45 = 20\log_{10}(10) + 20\log_{10}(5200) + 32.45
\end{equation*}
```
``` math
\begin{equation*}
\mathrm{FSPL} = 20 + 74.3 + 32.45 = 126.8~\text{dB}
\end{equation*}
```

### Step 2: Indoor Propagation Loss

Indoor walls and obstacles add approximately 15 dB additional loss:
``` math
\begin{equation*}
L_{\text{indoor}} = 15~\text{dB}
\end{equation*}
```

### Step 3: Received Signal Power

``` math
\begin{equation*}
P_r = P_t + G_t + G_r - \mathrm{FSPL} - L_{\text{indoor}}
\end{equation*}
```
``` math
\begin{equation*}
P_r = 20 + 2 + 2 - 126.8 - 15 = -117.8~\text{dBm}
\end{equation*}
```

### Step 4: Noise Power

``` math
\begin{equation*}
N = kTB \cdot NF = (-174 + 10\log_{10}(20 \times 10^6) + 6)~\text{dBm}
\end{equation*}
```
``` math
\begin{equation*}
N = -174 + 73 + 6 = -95~\text{dBm}
\end{equation*}
```

### Step 5: Signal-to-Noise Ratio

``` math
\begin{equation*}
\mathrm{SNR} = P_r - N = -117.8 - (-95) = -22.8~\text{dB} \quad \text{(Oops! Negative!)}
\end{equation*}
```

Wait, this link won’t work! Let’s recalculate with a more realistic scenario at $`d = 5`$ m:
``` math
\begin{equation*}
\mathrm{FSPL}(5~\text{m}) = 20 + 68.3 + 32.45 = 120.8~\text{dB}
\end{equation*}
```
``` math
\begin{equation*}
P_r = 20 + 2 + 2 - 120.8 - 10 = -106.8~\text{dBm}
\end{equation*}
```
``` math
\begin{equation*}
\mathrm{SNR} = -106.8 - (-95) = -11.8~\text{dB} \quad \text{(Still negative!)}
\end{equation*}
```

**Actually**, the symbol rate for 20 MHz 802.11ac is $`R_s \approx 312.5`$ kSymbols/sec (accounting for OFDM overhead), so effective bandwidth is narrower. Using $`B_{\text{eff}} = 16.25`$ MHz:
``` math
\begin{equation*}
N = -174 + 72.1 + 6 = -95.9~\text{dBm}
\end{equation*}
```
``` math
\begin{equation*}
\mathrm{SNR} = -106.8 - (-95.9) = -10.9~\text{dB} \quad \text{(Still too low!)}
\end{equation*}
```

**Correct approach - use symbol rate:**
``` math
\begin{equation*}
R_b = 6~\text{bits/symbol} \times \frac{3}{4}~\text{(coding)} \times 312.5~\text{kSymbols/sec} \approx 1.4~\text{Mbps per subcarrier}
\end{equation*}
```

For 52 data subcarriers (802.11ac), total rate $`\approx 73`$ Mbps.

### Step 6: Required $`E_b/N_0`$ for 64-QAM

From equation <a href="#eq:qam-ber-eb" data-reference-type="ref" data-reference="eq:qam-ber-eb">[eq:qam-ber-eb]</a>, for BER $`= 10^{-6}`$ with 64-QAM: $`E_b/N_0 \approx 18.5`$ dB

### Conclusion

The link margin is tight. In practice, 802.11ac would use adaptive modulation:

- **Close range (\< 5 m)**: 256-QAM possible

- **Medium range (5–15 m)**: 64-QAM typical

- **Long range (\> 20 m)**: Falls back to 16-QAM or QPSK

**Key insight:** This calculation shows why WiFi speed drops dramatically with distance—the system must switch to lower-order QAM to maintain link reliability.

</div>

## Modulation and Demodulation

### QAM Modulator

The QAM modulator uses standard I/Q (quadrature) modulation architecture:

<div class="center">

</div>

**Note:** The hardware is identical to QPSK; only the symbol mapping differs (QAM uses multiple amplitude levels).

### QAM Coherent Demodulator

The receiver uses coherent I/Q demodulation to recover the transmitted symbols:

<div class="center">

</div>

**Detection process:**

1.  Sample I and Q at symbol rate $`T_s`$

2.  Find nearest constellation point (minimum Euclidean distance)

3.  Map constellation point to bits using Gray code mapping

### Soft-Decision Decoding

**Hard decision:** Select nearest constellation point, output bits directly.

**Soft decision:** Pass I/Q values or Log-Likelihood Ratios (LLRs) to the FEC decoder.

The LLR for bit $`b_k`$ is:
``` math
\begin{equation}
\text{LLR}(b_k) = \log\frac{P(b_k=0 | r)}{P(b_k=1 | r)}
\label{eq:qam-llr-simple}
\end{equation}
```

<div class="keyconcept">

Soft-decision decoding provides approximately **2 dB coding gain** over hard decisions when used with modern FEC codes (LDPC, Turbo). The decoder utilizes the reliability information from the demodulator, not just the bit decision.

</div>

## Power Efficiency

### Peak-to-Average Power Ratio (PAPR)

Unlike constant-envelope modulations (BPSK, QPSK, FSK), QAM has a varying envelope:
``` math
\begin{equation}
|s_m| = \sqrt{I_m^2 + Q_m^2}
\label{eq:qam-envelope}
\end{equation}
```

The Peak-to-Average Power Ratio is defined as:
``` math
\begin{equation}
\text{PAPR} = \frac{P_{\max}}{P_{\text{avg}}} = \frac{|s_{\max}|^2}{\bar{E}_s}
\label{eq:qam-papr}
\end{equation}
```
where:

- $`|s_{\max}|`$ = maximum constellation point magnitude

- $`\bar{E}_s`$ = average symbol energy

#### PAPR Values

| Modulation   | PAPR (linear) | PAPR (dB) | Notes                  |
|:-------------|:--------------|:----------|:-----------------------|
| **QPSK**     | 1             | 0 dB      | Constant envelope      |
| **16-QAM**   | 2.55          | 4.1 dB    | Corner points          
                                            2.55\$\times\$ average  |
| **64-QAM**   | 3.68          | 5.7 dB    |                        |
| **256-QAM**  | 4.80          | 6.8 dB    |                        |
| **1024-QAM** | 5.93          | 7.7 dB    |                        |

**Impact**: High PAPR requires PA backoff (reduces efficiency)

**Example**: 64-QAM with 5.7 dB PAPR - PA must back off 5.7 dB from
saturation - Efficiency drops from 50% to ~13%
(4\$\times\$ penalty)

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Impairments

### I/Q Imbalance

Hardware imperfections in the I/Q modulator/demodulator cause:

**Gain mismatch:** $`G_I \neq G_Q`$

**Phase error:** Quadrature hybrid not exactly $`90°`$ (e.g., $`88°`$ or $`92°`$)

The received signal model with I/Q imbalance is:
``` math
\begin{equation}
r = (1 + \alpha_G) I + j(1 - \alpha_G) e^{j\epsilon} Q + n
\label{eq:iq-imbalance}
\end{equation}
```
where:

- $`\alpha_G`$ = gain imbalance coefficient

- $`\epsilon`$ = phase error (rad)

- $`n`$ = AWGN

**Typical values:** $`\pm 0.5`$ dB gain, $`\pm 2°`$ phase

**Effect:** Constellation distortion, image frequency leakage, significant degradation for 256-QAM and higher.

**Mitigation:** Digital I/Q calibration using pilot symbols or training sequences.

### Nonlinear Power Amplifier Distortion

Non-constant envelope QAM signals suffer from PA nonlinearity:

**AM-AM conversion:** Gain compression at high signal amplitudes

**AM-PM conversion:** Phase shift varies with instantaneous amplitude

**Effects:**

- Constellation warping (outer points compressed)

- Reduced minimum distance $`\rightarrow`$ increased BER

- Spectral regrowth (adjacent channel interference)

**Example:** For 64-QAM, if corner points compress by 1 dB:

- Effective $`E_b/N_0`$ penalty: $`\sim`$<!-- -->2 dB

- Spectral mask violations possible

**Mitigation techniques:**

1.  **Power backoff:** Operate PA 6–10 dB below saturation (reduces efficiency)

2.  **Digital predistortion (DPD):** Pre-warp signal to compensate for PA nonlinearity

3.  **Crest factor reduction (CFR):** Clip and filter peaks to reduce PAPR

4.  **Linearization:** Feedforward or feedback techniques

### Phase Noise

Oscillator jitter causes constellation rotation and spreading:
``` math
\begin{equation}
r(t) = s(t) e^{j\phi_n(t)} + n(t)
\label{eq:phase-noise-model}
\end{equation}
```
where $`\phi_n(t)`$ is the random phase noise process.

**Effects:**

- Common Phase Error (CPE): All symbols rotated by same random angle

- Inter-Carrier Interference (ICI) in OFDM systems

- Effective SNR degradation

**Sensitivity:** Higher-order QAM is extremely sensitive to phase noise.

**Example (256-QAM):**

- Tolerable phase noise: $`\sim 1°`$ RMS

- Requires high-quality oscillator (PLL with TCXO or OCXO reference)

- Phase noise spectral density: $`< -100`$ dBc/Hz at 1 kHz offset

### Timing Jitter

Symbol clock errors cause sampling offset, leading to:

- Intersymbol interference (ISI)

- Constellation blurring and rotation

- Reduced effective SNR

**Requirement:** Timing error $`< 0.1`$ symbol period

**Example:** For 64-QAM at 10 Msymbols/sec:

- Symbol period: $`T_s = 100`$ ns

- Tolerable jitter: $`< 10`$ ns RMS

- Clock accuracy: $`< 10^{-4}`$ (100 ppm)

## Applications

### WiFi (802.11 Standards)

OFDM subcarriers in WiFi use QAM modulation:

| Standard              | Max QAM  | Max Rate | Notes              |
|:----------------------|:---------|:---------|:-------------------|
| **802.11a**           | 64-QAM   | 54 Mbps  | 20 MHz channel     |
| **802.11n**           | 64-QAM   | 600 Mbps | 4\$\times\$4 MIMO, 
                                               40 MHz              |
| **802.11ac**          | 256-QAM  | 6.9 Gbps | 8\$\times\$8       
                                               MIMO, 160 MHz       |
| **802.11ax** (WiFi 6) | 1024-QAM | 9.6 Gbps | OFDMA, MU-MIMO     |

**Adaptive modulation:** Systems dynamically switch between QPSK $`\rightarrow`$ 16/64/256/1024-QAM based on measured SNR.

### LTE/5G NR

**LTE downlink**: Up to 256-QAM (Cat 9+)

**5G NR**: Up to 256-QAM (mmWave can use 1024-QAM in some
scenarios)

**Example**: LTE Cat 16 (1 Gbps downlink) -
4\$\times\$4 MIMO, 256-QAM, 20 MHz carrier aggregation -
Per-carrier: 4 layers \$\times\$ 8 bits/symbol
\$\times\$ 75k symbols/sec = 2.4 Gbps (theoretical)

**Adaptive MCS** (Modulation & Coding Scheme):

- Poor channel: QPSK 1/4 (0.5 bits/symbol effective)

- Good channel: 256-QAM 3/4 (6 bits/symbol effective)

### Cable Modems (DOCSIS)

**DOCSIS 3.0**: 256-QAM (8 bits/symbol)

**DOCSIS 3.1**: 4096-QAM (12 bits/symbol) - Requires SNR
\> 40 dB (excellent cable plant) - OFDM with 4096-QAM
subcarriers \$\rightarrow\$ 10 Gbps downstream

**Key advantage:** Wired channel has no fading, enabling high SNR and thus very high-order QAM.

### Digital TV

**DVB-C (Cable)**: 256-QAM standard

**DVB-T2 (Terrestrial)**: Up to 256-QAM (typically 64-QAM)

**ATSC 3.0 (US)**: 256-QAM, 1024-QAM, 4096-QAM (OFDM)

### Microwave Backhaul

Point-to-point microwave links use adaptive QAM:

**Weather-dependent modulation:**

- **Clear weather:** 2048-QAM, 4096-QAM ($`\geq 30`$ dB SNR)

- **Light rain:** 256-QAM

- **Heavy rain:** Adaptive fallback to 16-QAM or QPSK

**Frequency bands:** 6–42 GHz (E-band: 70–80 GHz)

**Example:** 28 GHz link with 56 MHz channel:

- 4096-QAM: 12 bits/symbol $`\rightarrow`$ 672 Mbps (uncoded)

- With FEC rate 3/4: 504 Mbps net throughput

## Comparison and Tradeoffs

### QAM vs PSK

**Same spectral efficiency**:

| M-PSK       | M-QAM             | Comparison                  |
|:------------|:------------------|:----------------------------|
| -PSK (QPSK) | 4-QAM (identical) | Same constellation          |
| 8-PSK       | 8-QAM (rare)      | 8-PSK used (const envelope) |
| 16-PSK      | 16-QAM            | **16-QAM 4 dB better**      |
| 32-PSK      | 32-QAM            | **32-QAM much better**      |
| 64-PSK      | 64-QAM            | **64-QAM far superior**     |

**General rule:** For $`M > 8`$, QAM significantly outperforms M-PSK.

**Reason:** The 2D rectangular grid of QAM uses signal space more efficiently than the circular PSK constellation. QAM achieves larger minimum distance for the same average power.

<div class="keyconcept">

QAM’s superiority over PSK arises from optimal packing in 2D space. While PSK points lie on a circle (wasting corners of the I/Q square), QAM fills the entire signal space uniformly, maximizing the minimum distance between symbols.

</div>

### Non-Square QAM

**Cross QAM:** Non-square constellations for non-power-of-2 constellation sizes.

**32-QAM** (5 bits/symbol):

- Constellation: 4 inner + 12 middle + 16 outer points (hexagonal-like pattern)

- Used in some proprietary systems

**128-QAM** (7 bits/symbol):

- Fills gap between 64-QAM and 256-QAM

- Optimized constellation placement for best performance

**Trade-off:** Slightly worse performance than square QAM, but allows finer granularity in adaptive rate selection.

### Constellation Shaping

**Probabilistic shaping** uses non-uniform symbol probability distribution.

**Key idea:** Transmit inner constellation points (lower energy) more frequently than outer points $`\rightarrow`$ reduces average transmitted power for same information rate.

**Benefit:** $`\sim`$<!-- -->0.5–1 dB SNR gain, approaches Shannon capacity limit.

**Applications:** High-capacity optical communications (400G/800G coherent systems), submarine cables.

### Adaptive QAM

Link adaptation dynamically selects QAM order and FEC rate based on measured channel SNR.

**Typical SNR thresholds:**

| SNR (dB) | Modulation | Code Rate | Spectral Eff. |
|:---------|:-----------|:----------|:--------------|
| -5       | QPSK       | 1/2       | 1.0           |
| 5-10     | QPSK       | 3/4       | 1.5           |
| 10-15    | 16-QAM     | 1/2       | 2.0           |
| 15-20    | 16-QAM     | 3/4       | 3.0           |
| 20-25    | 64-QAM     | 2/3       | 4.0           |
| 25-30    | 64-QAM     | 3/4       | 4.5           |
| 30-35    | 256-QAM    | 3/4       | 6.0           |
| \>35     | 1024-QAM   | 5/6       | 8.3           |

**Used in**: All modern wireless (WiFi, LTE, 5G)

## Advantages and Disadvantages

### Advantages

1.  **Superior spectral efficiency:** QAM achieves the highest bits/sec/Hz for a given constellation size compared to PSK or ASK alone.

2.  **Flexible data rates:** Support for multiple QAM orders (16, 64, 256, 1024-QAM) enables adaptive modulation to match channel conditions.

3.  **Optimal signal space utilization:** Rectangular grid constellation uses 2D I/Q space more efficiently than phase-only modulation (PSK).

4.  **Standard implementation:** Same I/Q hardware as QPSK; only symbol mapping differs. Compatible with standard RF architectures.

5.  **Well-suited for OFDM:** Each subcarrier can use independent QAM order, enabling fine-grained rate adaptation.

### Disadvantages

1.  **High SNR requirement:** Higher-order QAM (256-QAM and above) requires excellent channel conditions (SNR $`>`$ 25 dB).

2.  **Non-constant envelope:** Variable amplitude increases PAPR (Peak-to-Average Power Ratio), requiring linear amplifiers with reduced efficiency.

3.  **Sensitive to impairments:** Susceptible to:

    - I/Q imbalance (gain/phase mismatch between branches)

    - Phase noise (degrades SNR, especially for high-order QAM)

    - Nonlinear distortion (amplifier compression)

    - Frequency/timing offsets

4.  **Coherent detection required:** Receiver must maintain accurate carrier phase and frequency synchronization.

5.  **Performance degradation in fading:** Rapid channel variations (mobility, multipath) force fallback to lower-order QAM, reducing throughput.

6.  **Higher complexity:** Symbol decision requires 2D nearest-neighbor search (vs 1D threshold for BPSK/OOK).

### Implementation Tips

### Constellation Normalization

For fair performance comparisons, normalize constellations to unit average energy:
``` math
\begin{equation}
\bar{E}_s = \frac{1}{M}\sum_{m=0}^{M-1} |s_m|^2 = 1
\label{eq:constellation-normalization}
\end{equation}
```

**Example (16-QAM):**

- Un-normalized: $`I, Q \in \{-3, -1, +1, +3\}`$

- Average power: $`\bar{E}_s = 10`$

- Normalized: $`I, Q \in \{-3, -1, +1, +3\}/\sqrt{10}`$

- Result: $`\bar{E}_s = 1`$

### Gray Coding Implementation

Map bits to I/Q symbols using Gray code to minimize bit errors:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

### Soft-Decision LLR Calculation

For optimal FEC decoder performance, compute LLR for each bit:
``` math
\begin{equation}
\text{LLR}(b_k) = \log\frac{\sum_{s \in S_0} e^{-|r-s|^2/(2\sigma^2)}}{\sum_{s \in S_1} e^{-|r-s|^2/(2\sigma^2)}}
\label{eq:llr-calculation}
\end{equation}
```
where:

- $`S_0`$ = constellation points with bit $`b_k = 0`$

- $`S_1`$ = constellation points with bit $`b_k = 1`$

- $`r`$ = received complex symbol

- $`\sigma^2`$ = noise variance estimate

## Summary

<div class="center">

| **Parameter** | **Value/Description** |
|:---|:---|
| Basic principle | Modulate both amplitude *and* phase |
| Constellation | Rectangular grid in I/Q plane |
| Common orders | 16-QAM (4 bits), 64-QAM (6 bits), 256-QAM (8 bits) |
| Spectral efficiency | $`\eta = \log_2(M)/(1+\alpha)`$ bps/Hz |
| Gray coding | Adjacent symbols differ by 1 bit |
| BER (64-QAM @ 10$`^{-6}`$) | Requires $`E_b/N_0 \approx 18.5`$ dB |
| Detection | Coherent I/Q demodulation, nearest neighbor |
| PAPR | Increases with QAM order (non-constant envelope) |
| Key advantage | Optimal use of 2D signal space |
| Key disadvantage | Requires high SNR, sensitive to impairments |
| Primary applications | WiFi, LTE/5G, cable modems, microwave links |
| Adaptive modulation | Switch QAM order based on channel SNR |

</div>

**Key insight:** QAM achieves the highest spectral efficiency among single-carrier modulation schemes by utilizing both I and Q dimensions. While PSK varies only phase (constant radius) and ASK varies only amplitude (fixed phase), QAM combines both for optimal signal space packing. The trade-off is increased sensitivity to noise and hardware impairments, requiring careful system design and adaptive rate control.

**Performance comparison:**

<div class="center">

| **QAM Order** | **Bits/Symbol** | **$`d_{\min}`$** | **$`E_b/N_0`$ @ BER=$`10^{-6}`$** | **Typical Use** |
|:---|:--:|:--:|:--:|:--:|
| 4-QAM (QPSK) | 2 | 1.41 | 10.5 dB | Satellite, long-range |
| 16-QAM | 4 | 0.63 | 14.5 dB | WiFi, LTE baseline |
| 64-QAM | 6 | 0.31 | 18.5 dB | WiFi, LTE good SNR |
| 256-QAM | 8 | 0.15 | 23 dB | WiFi 5/6, LTE-A |
| 1024-QAM | 10 | 0.098 | 27.5 dB | WiFi 6 (short range) |
| 4096-QAM | 12 | 0.049 | 32 dB | Cable/DSL only |

</div>

## Further Reading

- **Chapter <a href="#ch:qpsk" data-reference-type="ref" data-reference="ch:qpsk">[ch:qpsk]</a>:** QPSK Modulation—the simplest QAM (4-QAM), foundation for understanding QAM

- **Chapter <a href="#ch:constellation" data-reference-type="ref" data-reference="ch:constellation">[ch:constellation]</a>:** Constellation Diagrams—visualization and interpretation of QAM signals

- **Chapter <a href="#ch:iq" data-reference-type="ref" data-reference="ch:iq">[ch:iq]</a>:** IQ Representation—mathematical foundation of quadrature modulation

- **Chapter <a href="#ch:ber" data-reference-type="ref" data-reference="ch:ber">[ch:ber]</a>:** Bit Error Rate Analysis—performance metrics and measurement

- **Chapter <a href="#ch:ofdm" data-reference-type="ref" data-reference="ch:ofdm">[ch:ofdm]</a>:** OFDM & Multicarrier—uses QAM on each subcarrier for WiFi/LTE

- **Chapter <a href="#ch:adaptive" data-reference-type="ref" data-reference="ch:adaptive">[ch:adaptive]</a>:** Adaptive Modulation & Coding—dynamic QAM order selection

- **Chapter <a href="#ch:synchronization" data-reference-type="ref" data-reference="ch:synchronization">[ch:synchronization]</a>:** Carrier/Timing Synchronization—critical for coherent QAM detection

- **Chapter <a href="#ch:fec" data-reference-type="ref" data-reference="ch:fec">[ch:fec]</a>:** Forward Error Correction—essential for reliable high-order QAM

- **Chapter <a href="#ch:channel-models" data-reference-type="ref" data-reference="ch:channel-models">[ch:channel-models]</a>:** Channel Models—understand fading effects on QAM performance

- **Chapter <a href="#ch:ask" data-reference-type="ref" data-reference="ch:ask">[ch:ask]</a>:** Amplitude Shift Keying—amplitude-only modulation component

- **Chapter <a href="#ch:psk" data-reference-type="ref" data-reference="ch:psk">[ch:psk]</a>:** Phase Shift Keying—phase-only modulation component

- **Chapter <a href="#ch:shannon" data-reference-type="ref" data-reference="ch:shannon">[ch:shannon]</a>:** Shannon’s Channel Capacity—theoretical limits of spectral efficiency
