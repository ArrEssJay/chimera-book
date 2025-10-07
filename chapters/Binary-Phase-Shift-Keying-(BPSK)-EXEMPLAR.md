---
layout: chapter
title: "Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR"
chapter: 12
permalink: /chapters/binary-phase-shift-keying-(bpsk)-exemplar/
---

# Binary Phase-Shift Keying (BPSK)

<div class="nontechnical">

**BPSK is like Morse code with a twist**—instead of turning a signal on and off, you flip the wave upside-down to send 1s and 0s.

**Simple idea:**

- Bit 0 = wave pointing “up” $`\uparrow`$

- Bit 1 = wave pointing “down” $`\downarrow`$ (flipped $`180°`$)

**Real use:** GPS satellites use BPSK! Your phone detects whether the signal is normal or flipped.

**Why flip instead of on/off?** More reliable in noise, works with constant power, less interference. Trade-off: Simple but slow (1 bit per symbol).

</div>

## Overview

**Binary Phase-Shift Keying (BPSK)** is the simplest form of phase modulation, where binary data is encoded by shifting the carrier phase between two states: $`0°`$ and $`180°`$.

**Key advantage over OOK and FSK:** BPSK uses coherent detection and provides 3 dB better performance (lower BER for same SNR).

**Foundation for:** QPSK (4 phases), 8PSK (8 phases), and higher-order modulation schemes.

## Mathematical Description

### Time-Domain Signal

The BPSK waveform is expressed as:
``` math
\begin{equation}
s(t) = A \cos(2\pi f_c t + \phi_n)
\end{equation}
```
where:

- $`A`$ = carrier amplitude

- $`f_c`$ = carrier frequency

- $`\phi_n \in \{0°, 180°\}`$ = phase for bit $`n`$

**Phase encoding:**
``` math
\begin{equation}
\phi_n = \begin{cases}
0° & \text{if bit = 0} \\
180° & \text{if bit = 1}
\end{cases}
\end{equation}
```

**Alternative representation** (using cosine identity):
``` math
\begin{equation}
s(t) = A \cdot d_n \cdot \cos(2\pi f_c t)
\end{equation}
```
where:

- $`d_n \in \{+1, -1\}`$ = bipolar data symbol

- Bit 0 $`\rightarrow`$ $`d_n = +1`$ $`\rightarrow`$ $`0°`$ phase

- Bit 1 $`\rightarrow`$ $`d_n = -1`$ $`\rightarrow`$ $`180°`$ phase (inverted carrier)

<div class="calloutbox">

Key Insight
BPSK is effectively **amplitude modulation with bipolar data**—the carrier polarity flips between positive and negative.

</div>

## IQ Representation

The baseband complex representation of BPSK is:
``` math
\begin{equation}
s(t) = \mathrm{Re}\{A \cdot d_n \cdot e^{j2\pi f_c t}\}
\end{equation}
```

**IQ components:**

- **I (In-phase):** $`I_n = A \cdot d_n`$ (either $`+A`$ or $`-A`$)

- **Q (Quadrature):** $`Q_n = 0`$ (BPSK uses only the I axis)

### Constellation Diagram

The BPSK constellation consists of two points on the real axis:

<div class="center">

</div>

**Euclidean distance between symbols:** $`d = 2A`$

This maximum separation provides optimal noise immunity for binary modulation.

## Modulation and Demodulation

### Transmitter (Modulator)

**Block diagram:**

<div class="center">

</div>

**Process:**

1.  **NRZ encoding:** Map bits to symbols

    - Bit 0 $`\rightarrow`$ $`d_n = +1`$

    - Bit 1 $`\rightarrow`$ $`d_n = -1`$

2.  **Multiply by carrier:** $`s(t) = A d_n \cos(2\pi f_c t)`$

3.  **Pulse shaping:** Apply raised-cosine filter to limit bandwidth and prevent intersymbol interference (ISI)

### Receiver (Coherent Detector)

**Block diagram:**

<div class="center">

</div>

<div class="calloutbox">

**WARNING:** Critical Requirement
**Phase synchronization:** The local oscillator must be exactly in phase with the transmitter carrier. Phase offset causes signal degradation or complete loss.

</div>

**Detection process:**

1.  **Multiply by local carrier** (same frequency and phase as TX):
    ``` math
    \begin{equation}
    r(t) = s(t) \cdot 2\cos(2\pi f_c t)
    \end{equation}
    ```

2.  **Product expansion:**
    ``` math
    \begin{equation}
    r(t) = A d_n \cos(2\pi f_c t) \cdot 2\cos(2\pi f_c t)
    \end{equation}
    ```

3.  **Apply trigonometric identity** $`\cos(x)\cos(x) = \frac{1}{2}[1 + \cos(2x)]`$:
    ``` math
    \begin{equation}
    r(t) = A d_n [1 + \cos(4\pi f_c t)]
    \end{equation}
    ```

4.  **Lowpass filter** removes $`2f_c`$ component:
    ``` math
    \begin{equation}
    r(t) = A d_n
    \end{equation}
    ```

5.  **Sample at bit period:** $`y_n = A d_n + n(t)`$ where $`n(t)`$ is noise

6.  **Threshold decision:**
    ``` math
    \begin{equation}
    \hat{d}_n = \begin{cases}
    +1 & \text{if } y_n > 0 \quad \text{(decode as bit 0)} \\
    -1 & \text{if } y_n < 0 \quad \text{(decode as bit 1)}
    \end{cases}
    \end{equation}
    ```

## Carrier Recovery

**Problem:** The receiver must generate a local oscillator **exactly in phase** with the transmitter carrier.

A phase offset $`\phi_e`$ reduces the detected signal amplitude:
``` math
\begin{equation}
r(t) = A d_n \cos(\phi_e)
\end{equation}
```

If $`\phi_e = 90°`$: $`r(t) = 0`$ (complete signal loss!)

### Carrier Recovery Techniques

#### 1. Pilot Tone

- TX sends unmodulated carrier alongside data

- RX phase-locks to pilot using a Phase-Locked Loop (PLL)

- **Disadvantage:** Wastes power and bandwidth

#### 2. Costas Loop

- PLL-based carrier recovery from the modulated signal itself

- Multiplies received signal by both $`\sin(2\pi f_c t)`$ and $`\cos(2\pi f_c t)`$

- Adjusts phase until Q-channel (sine branch) equals zero

- **Advantage:** No pilot tone needed

- **Disadvantage:** Complex implementation

#### 3. Squaring Loop

- Square the BPSK signal: $`(d_n \cos\theta)^2 = \frac{1}{2}d_n^2[1 + \cos(2\theta)]`$

- Since $`d_n^2 = 1`$, a doubled-frequency unmodulated carrier emerges

- PLL locks to $`2f_c`$, then frequency is divided by 2

- **Advantage:** Removes data modulation completely

- **Disadvantage:** $`180°`$ phase ambiguity requires differential encoding

### Differential BPSK (DBPSK)

**Solution to phase ambiguity:** Encode data in phase **transitions**, not absolute phase.

**Encoding:**
``` math
\begin{equation}
\phi_n = \phi_{n-1} + \Delta\phi_n
\end{equation}
```
where:

- Bit 0 $`\rightarrow`$ No phase change ($`\Delta\phi = 0°`$)

- Bit 1 $`\rightarrow`$ Phase change ($`\Delta\phi = 180°`$)

**Decoding:** Compare consecutive symbols:
``` math
\begin{equation}
\hat{b}_n = \begin{cases}
0 & \text{if } \mathrm{sgn}(y_n) = \mathrm{sgn}(y_{n-1}) \\
1 & \text{if } \mathrm{sgn}(y_n) \neq \mathrm{sgn}(y_{n-1})
\end{cases}
\end{equation}
```

- **✓ Advantage:** No carrier recovery needed

- **✗ Disadvantage:** Approximately 3 dB worse performance than coherent BPSK

## Bit Error Rate (BER) Performance

### Coherent BPSK in AWGN Channel

For ideal coherent detection in Additive White Gaussian Noise:
``` math
\begin{equation}
\mathrm{BER} = Q\left(\sqrt{\frac{2E_b}{N_0}}\right) = \frac{1}{2}\mathrm{erfc}\left(\sqrt{\frac{E_b}{N_0}}\right)
\end{equation}
```
where:

- $`E_b`$ = energy per bit = $`\frac{A^2 T_b}{2}`$

- $`N_0`$ = noise power spectral density

- $`Q(x) = \frac{1}{\sqrt{2\pi}}\int_x^\infty e^{-t^2/2}\,dt`$ (Gaussian tail probability)

**Key performance values:**

<div class="center">

| $`E_b/N_0`$ (dB) |                                         BER |
|:-----------------|--------------------------------------------:|
| 0 dB             | $`7.9 \times 10^{-2}`$ (1 error in 13 bits) |
| 5 dB             |         $`9.7 \times 10^{-4}`$ (1 in 1,000) |
| 10 dB            |       $`3.9 \times 10^{-6}`$ (1 in 250,000) |
| 15 dB            |  $`6.9 \times 10^{-10}`$ (1 in 1.4 billion) |

</div>

### Comparison: BPSK vs OOK

At the same $`E_b/N_0`$:

<div class="center">

| Modulation          |         BER @ 10 dB $`E_b/N_0`$ |
|:--------------------|--------------------------------:|
| OOK (non-coherent)  |          $`4.0 \times 10^{-3}`$ |
| **BPSK (coherent)** | $`\mathbf{3.9 \times 10^{-6}}`$ |

</div>

<div class="calloutbox">

Performance Advantage
**BPSK is approximately 1000$`\times`$ better than OOK at 10 dB!**

**Why?**

1.  BPSK uses both halves of signal space ($`\pm A`$ vs OOK’s $`\{0, A\}`$)

2.  Coherent detection (correlates with carrier—optimal receiver)

3.  Maximum Euclidean distance between symbols

</div>

### Differential BPSK Performance

DBPSK has slightly worse performance than coherent BPSK:
``` math
\begin{equation}
\mathrm{BER}_{\mathrm{DBPSK}} \approx \frac{1}{2}e^{-E_b/N_0}
\end{equation}
```

At 10 dB $`E_b/N_0`$: BER $`\approx 5 \times 10^{-6}`$ (approximately 1.3 dB penalty vs coherent)

## Bandwidth Efficiency

The occupied bandwidth (containing 99% of power) is approximately:
``` math
\begin{equation}
B \approx \frac{1}{T_b} = R_b
\end{equation}
```
where $`R_b`$ is the bit rate in bits per second.

With raised-cosine pulse shaping (roll-off factor $`\alpha`$):
``` math
\begin{equation}
B = R_b(1 + \alpha)
\end{equation}
```

**Typical value:** $`\alpha = 0.35`$ gives $`B = 1.35 R_b`$

**Spectral efficiency:**
``` math
\begin{equation}
\eta = \frac{R_b}{B} = \frac{1}{1+\alpha} \approx 0.74\ \text{bps/Hz}
\end{equation}
```

<div class="calloutbox">

Example
A 1 Mbps BPSK signal with $`\alpha = 0.35`$ requires **1.35 MHz** of bandwidth.

</div>

## Practical Implementations

### IEEE 802.15.4 (Zigbee, Low-Rate WPAN)

**PHY layer** (868/915 MHz bands):

- **Modulation:** BPSK (optional O-QPSK in 2.4 GHz band)

- **Chip rate:** 300 kcps (868 MHz), 600 kcps (915 MHz)

- **Data rate:** 20 kbps (868 MHz), 40 kbps (915 MHz)

- **Spreading:** Direct-Sequence Spread Spectrum (DSSS)

### Satellite Telemetry

Deep-space missions (Voyager, Mars rovers):

- **Modulation:** BPSK or QPSK

- **Coding:** Convolutional + Reed-Solomon (concatenated FEC)

- **Data rate:** 10 bps to 10 kbps (extreme distances)

- **Why BPSK?** Maximum power efficiency—every dB counts at interplanetary distances

<div class="calloutbox">

Voyager 1 Example
At 24 billion km from Earth:

- TX power: 23 W

- Antenna gain: 48 dBi (dish)

- RX antenna: 70 m Deep Space Network dish (74 dBi)

- Link budget: Barely positive with FEC (BER $`\sim 10^{-5}`$)

</div>

### RFID (Passive Tags)

**Backscatter modulation:**

- Tag reflects or absorbs carrier energy

- Binary encoding: reflection = bit 0, absorption = bit 1

- Effectively BPSK from the reader’s perspective

- Data rate: 40–640 kbps (EPC Gen2 standard)

## Advantages of BPSK

1.  **Best BER performance** for binary modulation (3 dB better than OOK)

2.  **Constant envelope** (nonlinear amplifiers acceptable, no AM-PM distortion)

3.  **Simple constellation** (two points—easy to visualize and implement)

4.  **Foundation for higher-order PSK** (QPSK, 8PSK extend the concept)

## Disadvantages of BPSK

1.  **Requires carrier synchronization** (Costas loop or squaring loop adds complexity)

2.  **Differential BPSK** avoids synchronization but suffers 3 dB penalty

3.  **Low spectral efficiency** (1 bit/symbol = maximum 1 bps/Hz)

4.  **Higher-order modulation** (QPSK, 16-QAM) more efficient for high SNR channels

## Transition to QPSK

BPSK uses only the I-axis with two constellation points.

**Natural extension:** Use **both I and Q axes** to create QPSK:

<div class="center">

</div>

**QPSK** = Two independent BPSK channels (I and Q) operating in parallel, doubling spectral efficiency.

## Worked Example: BPSK Link Budget

**Scenario:** Satellite downlink from geostationary orbit

**Given parameters:**

- TX power: $`P_t = 10`$ W (40 dBm)

- TX antenna gain: $`G_t = 30`$ dBi

- Distance: $`d = 36{,}000`$ km (GEO)

- Frequency: $`f = 12`$ GHz (Ku-band)

- RX antenna gain: $`G_r = 40`$ dBi (1 m dish)

- System noise temperature: $`T_s = 150`$ K

- Bandwidth: $`B = 1`$ MHz

- Required BER: $`10^{-6}`$

### Step 1: Calculate Free-Space Path Loss

``` math
\begin{equation}
\mathrm{FSPL} = 20\log_{10}(d) + 20\log_{10}(f) + 92.45
\end{equation}
```
``` math
\begin{equation}
\mathrm{FSPL} = 20\log_{10}(36 \times 10^6) + 20\log_{10}(12 \times 10^9) + 92.45 = 205.5\ \text{dB}
\end{equation}
```

### Step 2: Calculate Received Power

``` math
\begin{equation}
P_r = P_t + G_t + G_r - \mathrm{FSPL}
\end{equation}
```
``` math
\begin{equation}
P_r = 40 + 30 + 40 - 205.5 = -95.5\ \text{dBm}
\end{equation}
```

### Step 3: Calculate Noise Power

``` math
\begin{equation}
N = kT_sB = (1.38 \times 10^{-23})(150)(10^6) = 2.07 \times 10^{-15}\ \text{W} = -117\ \text{dBm}
\end{equation}
```

### Step 4: Calculate SNR

``` math
\begin{equation}
\mathrm{SNR} = P_r - N = -95.5 - (-117) = 21.5\ \text{dB}
\end{equation}
```

### Step 5: Verify BER Requirement

For BPSK at BER $`= 10^{-6}`$, we require $`E_b/N_0 \approx 10.5`$ dB.

Convert SNR to $`E_b/N_0`$:
``` math
\begin{equation}
\frac{E_b}{N_0} = \mathrm{SNR} + 10\log_{10}\left(\frac{B}{R_b}\right)
\end{equation}
```

If data rate $`R_b = 500`$ kbps:
``` math
\begin{equation}
\frac{E_b}{N_0} = 21.5 + 10\log_{10}\left(\frac{10^6}{5 \times 10^5}\right) = 21.5 + 3 = 24.5\ \text{dB}
\end{equation}
```

<div class="calloutbox">

✓ Link Margin
**Available $`E_b/N_0`$:** 24.5 dB

**Required $`E_b/N_0`$:** 10.5 dB

**Margin:** $`24.5 - 10.5 = 14`$ dB

This comfortable margin accommodates rain fade, implementation loss, and other impairments. **Link closes successfully!**

</div>

## Summary

<div class="center">

| **Aspect**              | **BPSK**                                       |
|:------------------------|:-----------------------------------------------|
| Bits per symbol         | 1                                              |
| Constellation points    | 2 ($`0°`$, $`180°`$)                           |
| Spectral efficiency     | $`\sim`$<!-- -->1 bps/Hz (with pulse shaping)  |
| BER @ 10 dB $`E_b/N_0`$ | $`3.9 \times 10^{-6}`$                         |
| Carrier recovery        | Required (Costas loop, squaring loop)          |
| Complexity              | Moderate (coherent detection)                  |
| Best application        | Power-limited channels (satellite, deep-space) |

</div>

## Further Reading

- **Chapter <a href="#ch:ook" data-reference-type="ref" data-reference="ch:ook">[ch:ook]</a>:** On-Off Keying—simpler but 3 dB worse performance

- **Chapter <a href="#ch:fsk" data-reference-type="ref" data-reference="ch:fsk">[ch:fsk]</a>:** Frequency-Shift Keying—alternative binary modulation

- **Chapter <a href="#ch:qpsk" data-reference-type="ref" data-reference="ch:qpsk">[ch:qpsk]</a>:** QPSK—extension to 4 phases (2 bits/symbol)

- **Chapter <a href="#ch:constellation" data-reference-type="ref" data-reference="ch:constellation">[ch:constellation]</a>:** Constellation Diagrams—visual representation

- **Chapter <a href="#ch:iq" data-reference-type="ref" data-reference="ch:iq">[ch:iq]</a>:** IQ Representation—complex baseband notation

- **Chapter <a href="#ch:ber" data-reference-type="ref" data-reference="ch:ber">[ch:ber]</a>:** Bit Error Rate analysis and measurement

- **Chapter <a href="#ch:fec" data-reference-type="ref" data-reference="ch:fec">[ch:fec]</a>:** Forward Error Correction for improved BER
