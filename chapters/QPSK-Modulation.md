---
layout: chapter
title: "QPSK-Modulation"
chapter: 50
permalink: /chapters/qpsk-modulation/
---

# Quadrature Phase-Shift Keying (QPSK)

<div class="nontechnical">

**QPSK is like using 4 different hand signals instead of 2—you can send messages twice as fast!**

**Simple idea:**

- Bits 00 = wave pointing “northeast” $`\nearrow`$ (45°)

- Bits 01 = wave pointing “northwest” $`\nwarrow`$ (135°)

- Bits 11 = wave pointing “southwest” $`\swarrow`$ (225°)

- Bits 10 = wave pointing “southeast” $`\searrow`$ (315°)

**Real use:** Satellite TV (DVB-S), GPS, and 4G LTE all use QPSK. Your phone switches to QPSK when the signal is weak—more reliable than faster modes.

**Why 4 directions?** Sends 2 bits per symbol (twice as fast as BPSK), but still reliable because the 4 directions are well-separated (90° apart).

</div>

## Overview

**Quadrature Phase-Shift Keying (QPSK)** is a digital modulation technique that transmits 2 bits per symbol by encoding data into one of four carrier phase states: 45°, 135°, 225°, and 315°.

<div class="keyconcept">

QPSK achieves **double the spectral efficiency** of BPSK (2 bps/Hz vs 1 bps/Hz) while maintaining the same bit error rate performance at the same $`E_b/N_0`$. This makes it the optimal choice for bandwidth-limited channels where reliable communication is required.

</div>

QPSK is the foundation for many higher-order modulation schemes including offset QPSK (OQPSK), $`\pi`$/4-QPSK, and hierarchical QAM constellations.

## Mathematical Description

### Time-Domain Signal

The QPSK waveform is expressed as:
``` math
\begin{equation}
s(t) = A \cos(2\pi f_c t + \phi_n)
\end{equation}
```
where:

- $`A`$ = carrier amplitude

- $`f_c`$ = carrier frequency (Hz)

- $`\phi_n \in \{45°, 135°, 225°, 315°\}`$ = phase for symbol $`n`$

**Phase encoding (Gray coding):**
``` math
\begin{equation}
\phi_n = \begin{cases}
45° & \text{if bits = 00} \\
135° & \text{if bits = 01} \\
225° & \text{if bits = 11} \\
315° & \text{if bits = 10}
\end{cases}
\end{equation}
```

Gray coding ensures adjacent constellation points differ by only one bit, minimizing bit errors when phase noise causes symbol errors.

### IQ Representation

The complex baseband representation of QPSK is:
``` math
\begin{equation}
s(t) = \mathrm{Re}\left\{A \cdot (I_n + jQ_n) \cdot e^{j2\pi f_c t}\right\}
\end{equation}
```

Expanding this yields:
``` math
\begin{equation}
s(t) = A \cdot I_n \cos(2\pi f_c t) - A \cdot Q_n \sin(2\pi f_c t)
\end{equation}
```

**IQ component values for normalized unit-energy symbols:**
``` math
\begin{equation}
(I_n, Q_n) = \begin{cases}
(+\frac{1}{\sqrt{2}}, +\frac{1}{\sqrt{2}}) & \text{bits = 00, phase = 45°} \\
(-\frac{1}{\sqrt{2}}, +\frac{1}{\sqrt{2}}) & \text{bits = 01, phase = 135°} \\
(-\frac{1}{\sqrt{2}}, -\frac{1}{\sqrt{2}}) & \text{bits = 11, phase = 225°} \\
(+\frac{1}{\sqrt{2}}, -\frac{1}{\sqrt{2}}) & \text{bits = 10, phase = 315°}
\end{cases}
\end{equation}
```

<div class="calloutbox">

Physical Interpretation
QPSK can be viewed as **two independent BPSK channels** operating in quadrature (90° phase offset). The I-channel modulates $`\cos(2\pi f_c t)`$ while the Q-channel modulates $`\sin(2\pi f_c t)`$. This orthogonality allows both channels to occupy the same bandwidth without interference.

</div>

### Constellation Diagram

The QPSK constellation consists of four points arranged symmetrically at the corners of a square, separated by 90° in phase:

<div class="center">

</div>

**Key properties:**

- **Minimum distance:** $`d_{min} = \sqrt{2}A`$ (between adjacent points)

- **Average symbol energy:** $`E_s = A^2 T_s`$ where $`T_s`$ is symbol period

- **Gray coding:** Adjacent symbols differ by one bit only

- **Equal probability:** All four symbols are equally likely for random data

## Modulation and Demodulation

### Transmitter (Modulator)

The QPSK modulator splits the input bit stream into two parallel paths (I and Q) and modulates orthogonal carriers:

<div class="center">

</div>

**Modulation process:**

1.  **Serial-to-parallel conversion:** Split bit stream into even (I) and odd (Q) bits

    - Even bits (b$`_0`$, b$`_2`$, b$`_4`$, ...) $`\rightarrow`$ I-channel

    - Odd bits (b$`_1`$, b$`_3`$, b$`_5`$, ...) $`\rightarrow`$ Q-channel

2.  **NRZ encoding:** Map bits to bipolar symbols

    - Bit 0 $`\rightarrow`$ $`+1/\sqrt{2}`$

    - Bit 1 $`\rightarrow`$ $`-1/\sqrt{2}`$

3.  **Carrier multiplication:**
    ``` math
    \begin{align}
      I_{RF}(t) &= I_n \cos(2\pi f_c t) \\
      Q_{RF}(t) &= -Q_n \sin(2\pi f_c t)
      
    \end{align}
    ```

4.  **Summation:** $`s(t) = I_{RF}(t) + Q_{RF}(t)`$

5.  **Pulse shaping:** Apply raised-cosine filter to limit bandwidth and control ISI

### Receiver (Coherent Detector)

<div class="center">

</div>

<div class="warningbox">

**Carrier phase and frequency synchronization are critical.** Both I and Q local oscillators must be exactly in phase and frequency with the transmitter carriers. Phase offsets rotate the constellation, potentially causing all symbols to be decoded incorrectly. Carrier recovery circuits (Costas loop) or pilot signals are required.

</div>

**Detection process:**

1.  **Multiply by in-phase carrier:**
    ``` math
    \begin{equation}
    r_I(t) = s(t) \cdot 2\cos(2\pi f_c t) = 2I_n \cos^2(2\pi f_c t) - 2Q_n \sin(2\pi f_c t)\cos(2\pi f_c t)
    \end{equation}
    ```

2.  **Apply trigonometric identities:**
    ``` math
    \begin{equation}
    r_I(t) = I_n [1 + \cos(4\pi f_c t)] - Q_n \sin(4\pi f_c t)
    \end{equation}
    ```

3.  **Lowpass filter** removes $`2f_c`$ components:
    ``` math
    \begin{equation}
    y_I(t) = I_n + n_I(t)
    \end{equation}
    ```

4.  **Repeat for quadrature channel** (multiply by $`-2\sin(2\pi f_c t)`$):
    ``` math
    \begin{equation}
    y_Q(t) = Q_n + n_Q(t)
    \end{equation}
    ```

5.  **Sample at symbol period** $`T_s`$ and make threshold decisions:
    ``` math
    \begin{align}
    \hat{I}_n &= \begin{cases}
    +1 & \text{if } y_I > 0 \quad \text{(decode as bit 0)} \\
    -1 & \text{if } y_I < 0 \quad \text{(decode as bit 1)}
    \end{cases} \\
    \hat{Q}_n &= \begin{cases}
    +1 & \text{if } y_Q > 0 \quad \text{(decode as bit 0)} \\
    -1 & \text{if } y_Q < 0 \quad \text{(decode as bit 1)}
    \end{cases}
    \end{align}
    ```

6.  **Parallel-to-serial conversion:** Interleave I and Q bit decisions

## Bit Error Rate (BER) Performance

### QPSK in AWGN Channel

For ideal coherent detection with perfect synchronization, QPSK achieves the same BER as BPSK:
``` math
\begin{equation}
\mathrm{BER} = Q\left(\sqrt{\frac{2E_b}{N_0}}\right) = \frac{1}{2}\mathrm{erfc}\left(\sqrt{\frac{E_b}{N_0}}\right)
\end{equation}
```
where:

- $`E_b = \frac{E_s}{2} = \frac{A^2 T_s}{2}`$ = energy per bit (joules)

- $`E_s = A^2 T_s`$ = energy per symbol (joules)

- $`N_0`$ = noise power spectral density (W/Hz)

- $`Q(x) = \frac{1}{\sqrt{2\pi}}\int_x^\infty e^{-t^2/2}\,dt`$ (Gaussian Q-function)

<div class="keyconcept">

**Why does QPSK have the same BER as BPSK?**

Although QPSK transmits 2 bits per symbol, each bit is detected independently on orthogonal I and Q channels. Since symbol energy $`E_s`$ is split equally between 2 bits ($`E_b = E_s/2`$), and the minimum distance is $`\sqrt{2}A`$, the per-bit error probability matches BPSK while doubling the data rate.

</div>

**Performance benchmarks:**

<div class="center">

| $`E_b/N_0`$ (dB) |                     BER | Practical Meaning           |
|:-----------------|------------------------:|:----------------------------|
| 0 dB             |  $`7.9 \times 10^{-2}`$ | 1 error in 13 bits          |
| 5 dB             |  $`9.7 \times 10^{-4}`$ | 1 error in 1,000 bits       |
| 10 dB            |  $`3.9 \times 10^{-6}`$ | 1 error in 250,000 bits     |
| 15 dB            | $`6.9 \times 10^{-10}`$ | 1 error in 1.4 billion bits |

</div>

### Symbol Error Rate (SER)

The symbol error rate (probability that the received symbol is decoded incorrectly) is higher than BER:
``` math
\begin{equation}
\mathrm{SER} \approx 2Q\left(\sqrt{\frac{2E_b}{N_0}}\right) \left[1 - \frac{1}{2}Q\left(\sqrt{\frac{2E_b}{N_0}}\right)\right]
\end{equation}
```

At high SNR, this simplifies to:
``` math
\begin{equation}
\mathrm{SER} \approx 2 \cdot \mathrm{BER}
\end{equation}
```

This is because most symbol errors occur at adjacent constellation points (Gray coding), affecting only one bit per symbol error.

## Bandwidth Efficiency

The occupied bandwidth (99% power) for rectangular pulses is:
``` math
\begin{equation}
B \approx \frac{1}{T_s} = \frac{R_b}{2}
\end{equation}
```
where $`R_b`$ is the bit rate (bps) and $`T_s`$ is the symbol period.

With **raised-cosine pulse shaping** (roll-off factor $`\alpha`$):
``` math
\begin{equation}
B = \frac{R_b}{2}(1 + \alpha)
\end{equation}
```

**Typical value:** $`\alpha = 0.35`$ gives $`B = 0.675 R_b`$

**Spectral efficiency:**
``` math
\begin{equation}
\eta = \frac{R_b}{B} = \frac{2}{1+\alpha} \approx 1.48\ \text{bps/Hz}
\end{equation}
```

<div class="calloutbox">

Example: 2 Mbps QPSK System

- Data rate: $`R_b = 2`$ Mbps

- Symbol rate: $`R_s = 1`$ Msps (2 bits/symbol)

- Roll-off: $`\alpha = 0.35`$

- Required bandwidth: $`B = 1 \times (1 + 0.35) = 1.35`$ MHz

- Spectral efficiency: $`\eta = 2/1.35 = 1.48`$ bps/Hz

**Comparison to BPSK:** Same 2 Mbps data rate would require 2.7 MHz for BPSK—QPSK uses half the bandwidth!

</div>

## Practical Implementations

### DVB-S/DVB-S2 Satellite Television

Digital Video Broadcasting standards use QPSK for reliable long-distance transmission:

- **Modulation:** QPSK (DVB-S) or adaptive QPSK/8PSK/16APSK (DVB-S2)

- **Frequency:** Ku-band (10.7–12.75 GHz) or Ka-band (18–31 GHz)

- **Symbol rate:** 20–45 Msps (typical)

- **Data rate:** 40–90 Mbps per transponder

- **FEC:** Concatenated Reed-Solomon + Convolutional (DVB-S) or LDPC + BCH (DVB-S2)

- **Rationale:** Reliable reception with small dish antennas (45–90 cm) in rain/snow

### GPS Navigation Signals

Global Positioning System uses BPSK and QPSK for satellite-to-receiver links:

- **L1 C/A signal:** BPSK with 1.023 Mcps chipping rate

- **L1C/L2C/L5 signals:** QPSK with dual-channel data and pilot

- **Carrier frequency:** L1 = 1575.42 MHz, L2 = 1227.60 MHz, L5 = 1176.45 MHz

- **Spreading:** Direct-Sequence Spread Spectrum (DSSS) with Gold codes

- **Power level:** $`-`$<!-- -->160 dBW (extremely weak—below thermal noise floor)

- **Acquisition:** Correlator-based code phase and Doppler search

### 4G LTE Mobile Communications

Long-Term Evolution uses adaptive modulation including QPSK:

- **Uplink:** SC-FDMA with QPSK/16-QAM/64-QAM

- **Downlink:** OFDMA with QPSK/16-QAM/64-QAM/256-QAM

- **Bandwidth:** 1.4, 3, 5, 10, 15, 20 MHz channels

- **Adaptation:** Switch to QPSK at cell edge or in poor signal conditions

- **Peak rates:** 3–10 Mbps (QPSK) up to 100–300 Mbps (256-QAM)

- **Rationale:** Robustness at low SNR ($`<`$<!-- -->10 dB $`E_b/N_0`$)

<div class="calloutbox">

Example: DVB-S2 Link Budget for Europe

|                      |                                     |
|:---------------------|:------------------------------------|
| Satellite TX power   | 100 W EIRP = 80 dBW                 |
| Frequency            | 11.5 GHz (Ku-band)                  |
| Distance             | 38,000 km (GEO)                     |
| RX dish diameter     | 60 cm (36 dBi gain)                 |
| LNB noise figure     | 0.8 dB ($`T_s \approx 80`$ K)       |
| Symbol rate          | 27.5 Msps                           |
| Free-space path loss | 205.8 dB                            |
| Received power       | $`-126`$ dBm                        |
| $`C/N_0`$            | 77 dB-Hz                            |
| Required $`E_b/N_0`$ | 4.5 dB (QPSK + FEC)                 |
| Link margin          | 8 dB                                |
| **Result**           | **Reliable reception in clear sky** |

</div>

## Worked Example: Wireless Microphone Link

**Scenario:** Design a QPSK wireless microphone system for theatre production

### Given Parameters

|                     |                                         |
|:--------------------|:----------------------------------------|
| Audio bandwidth     | $`B_a = 15`$ kHz (high-quality speech)  |
| Sampling rate       | $`f_s = 48`$ kHz                        |
| Quantization        | 16 bits/sample                          |
| RF carrier          | $`f_c = 2.4`$ GHz (ISM band)            |
| Available bandwidth | $`B_{RF} = 500`$ kHz                    |
| Range               | $`d = 50`$ m (line of sight)            |
| TX power            | $`P_t = 10`$ mW = 10 dBm                |
| Antenna gain        | $`G_t = G_r = 2`$ dBi (omnidirectional) |
| Required BER        | $`10^{-6}`$ (transparent audio)         |

### Step 1: Calculate Required Bit Rate

``` math
\begin{equation}
R_b = f_s \times \text{bits/sample} = 48{,}000 \times 16 = 768~\text{kbps}
\end{equation}
```

### Step 2: Add Channel Coding Overhead

Using rate-1/2 convolutional code for error correction:
``` math
\begin{equation}
R_{coded} = 768 \times 2 = 1{,}536~\text{kbps} = 1.536~\text{Mbps}
\end{equation}
```

### Step 3: Calculate Symbol Rate

For QPSK (2 bits/symbol):
``` math
\begin{equation}
R_s = \frac{R_{coded}}{2} = \frac{1{,}536{,}000}{2} = 768~\text{ksps}
\end{equation}
```

### Step 4: Check Bandwidth Requirement

With raised-cosine pulse shaping ($`\alpha = 0.35`$):
``` math
\begin{equation}
B_{req} = R_s (1 + \alpha) = 768 \times 1.35 = 1{,}037~\text{kHz}
\end{equation}
```

**Problem:** Exceeds available 500 kHz! **Solution:** Use tighter filtering or reduce sample rate.

Revised: Use $`\alpha = 0.20`$ and 44.1 kHz sampling:
``` math
\begin{align}
R_b &= 44{,}100 \times 16 = 705.6~\text{kbps} \\
R_{coded} &= 705.6 \times 2 = 1{,}411.2~\text{kbps} \\
R_s &= 705.6~\text{ksps} \\
B_{req} &= 705.6 \times 1.20 = 847~\text{kHz}
\end{align}
```

Still too high. Use 32 kHz sampling (broadcast quality):
``` math
\begin{align}
R_b &= 32{,}000 \times 16 = 512~\text{kbps} \\
R_{coded} &= 1{,}024~\text{kbps} \\
R_s &= 512~\text{ksps} \\
B_{req} &= 512 \times 1.20 = 614~\text{kHz}
\end{align}
```

**Further optimization:** Use 12-bit quantization:
``` math
\begin{equation}
B_{req} = \frac{32{,}000 \times 12 \times 2}{2} \times 1.20 = 461~\text{kHz} \quad \checkmark
\end{equation}
```

### Step 5: Link Budget Analysis

**Free-space path loss at 2.4 GHz:**
``` math
\begin{equation}
\mathrm{FSPL} = 20\log_{10}(50) + 20\log_{10}(2400) + 32.45 = 80.5~\text{dB}
\end{equation}
```

**Received power:**
``` math
\begin{equation}
P_r = P_t + G_t + G_r - \mathrm{FSPL} = 10 + 2 + 2 - 80.5 = -66.5~\text{dBm}
\end{equation}
```

**Noise power (assuming $`T_s = 300`$ K):**
``` math
\begin{equation}
N = kT_sB = (1.38 \times 10^{-23})(300)(461{,}000) = 1.91 \times 10^{-15}~\text{W} = -117~\text{dBm}
\end{equation}
```

**SNR:**
``` math
\begin{equation}
\mathrm{SNR} = P_r - N = -66.5 - (-117) = 50.5~\text{dB}
\end{equation}
```

**$`E_b/N_0`$:**
``` math
\begin{equation}
\frac{E_b}{N_0} = \mathrm{SNR} - 10\log_{10}(B/R_b) = 50.5 - 10\log_{10}(461{,}000/384{,}000) = 49.7~\text{dB}
\end{equation}
```

### Step 6: Verify Link Closure

- **Required $`E_b/N_0`$ for BER $`= 10^{-6}`$ (QPSK):** 10.5 dB

- **Coding gain (rate-1/2 convolutional):** $`\sim`$<!-- -->5 dB

- **Required $`E_b/N_0`$ with coding:** 10.5 – 5 = 5.5 dB

- **Available $`E_b/N_0`$:** 49.7 dB

- **Link margin:** $`49.7 - 5.5 = 44.2`$ dB

<div class="calloutbox">

Design Summary
**Result: Link closes with massive 44 dB margin**

This comfortable margin provides:

- Multipath fading tolerance (20–30 dB)

- Body shadowing/absorption (5–10 dB)

- Implementation losses (3–5 dB)

- Interference margin

**Final design:**

- Modulation: QPSK

- Sample rate: 32 kHz, 12-bit

- Data rate: 768 kbps (384 kbps after FEC)

- Symbol rate: 384 ksps

- Bandwidth: 461 kHz

- Link margin: 44 dB

**Conclusion:** Design is viable with significant margin for real-world impairments.

</div>

## Advantages and Disadvantages

### Advantages

1.  **Double spectral efficiency:** 2 bps/Hz vs 1 bps/Hz for BPSK (twice data rate in same bandwidth)

2.  **Same BER as BPSK:** No performance penalty at same $`E_b/N_0`$

3.  **Constant envelope:** Compatible with nonlinear amplifiers (Class C, Class D)

4.  **Mature technology:** Well-understood with extensive commercial implementations

5.  **Gray coding:** Most symbol errors affect only one bit, minimizing BER

6.  **Power efficient:** Optimal for bandwidth-limited channels requiring reliable links

### Disadvantages

1.  **Carrier synchronization required:** Costas loop or pilot signals add complexity and overhead

2.  **Phase ambiguity:** 90° rotations of constellation require differential encoding or unique word sync

3.  **Lower spectral efficiency than QAM:** 16-QAM achieves 4 bps/Hz but requires higher SNR

4.  **Susceptible to phase noise:** Oscillator stability critical for maintaining constellation alignment

5.  **Fixed data rate:** Cannot adapt modulation depth (unlike adaptive QAM schemes)

## Summary

<div class="center">

| **Parameter**            | **Value**                          |
|:-------------------------|:-----------------------------------|
| Bits per symbol          | 2                                  |
| Constellation points     | 4 (45°, 135°, 225°, 315°)          |
| Spectral efficiency      | $`\sim`$<!-- -->1.4–2.0 bps/Hz     |
| BER @ 10 dB $`E_b/N_0`$  | $`3.9 \times 10^{-6}`$             |
| Minimum phase separation | 90°                                |
| Symbol energy            | $`E_s = 2E_b`$                     |
| Carrier recovery         | Required (Costas loop or pilot)    |
| Implementation           | Moderate complexity (I/Q channels) |
| Best application         | Bandwidth-limited reliable links   |
| Typical uses             | Satellite TV, GPS, LTE, WiFi       |

</div>

**Key takeaways:**

- QPSK doubles spectral efficiency over BPSK with no BER penalty

- Requires carrier synchronization but offers excellent power efficiency

- Widely deployed in satellite, terrestrial wireless, and navigation systems

- Foundation for higher-order PSK and QAM modulation schemes

## Further Reading

### Related Chapters

- **Chapter <a href="#ch:bpsk" data-reference-type="ref" data-reference="ch:bpsk">[ch:bpsk]</a>:** Binary Phase-Shift Keying (BPSK)—foundation for QPSK

- **Chapter 8:** Offset QPSK (OQPSK)—reduced envelope variation

- **Chapter 9:** $`\pi`$/4-DQPSK—differential QPSK with rotation

- **Chapter 10:** 8PSK and 16PSK—higher-order phase modulation

- **Chapter 11:** Quadrature Amplitude Modulation (QAM)—combined amplitude/phase

- **Chapter 12:** Constellation Diagrams—visualization techniques

- **Chapter 13:** IQ Representation—complex baseband mathematics

- **Chapter 18:** Bit Error Rate Analysis—performance measurement

- **Chapter 22:** Forward Error Correction—coding for BER improvement

- **Chapter 25:** Carrier Recovery Techniques—Costas loop and alternatives

### Standards and References

- ETSI EN 302 307: *Digital Video Broadcasting (DVB-S2)*

- IS-GPS-200: *GPS Interface Specification*

- 3GPP TS 36.211: *LTE Physical Channels and Modulation*

- IEEE 802.11: *Wireless LAN QPSK/OFDM*

- Proakis & Salehi: *Digital Communications*, Chapter 4
