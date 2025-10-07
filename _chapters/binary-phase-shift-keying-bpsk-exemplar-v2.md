---
layout: chapter
title: "Binary Phase-Shift Keying (BPSK)"
permalink: /chapters/binary-phase-shift-keying-bpsk-exemplar-v2
date: 2025-10-07
---

# Binary Phase-Shift Keying (BPSK)

<div class="nontechnical">

**BPSK is like Morse code with a twist**—instead of turning a signal on and off, you flip the wave upside-down to send 1s and 0s.

**Simple idea:**

- Bit 0 = wave pointing “up” $\uparrow$

- Bit 1 = wave pointing “down” $\downarrow$ (flipped $180°$)

**Real use:** GPS satellites use BPSK. Your phone detects whether the signal is normal or flipped.

**Why flip instead of on/off?** More reliable in noise, works with constant power, less interference. Trade-off: Simple but slow (1 bit per symbol).

</div>

## Overview

**Binary Phase-Shift Keying (BPSK)** is the simplest form of phase modulation, where binary data is encoded by shifting the carrier phase between two states: $0°$ and $180°$.

<div class="keyconcept">

BPSK provides **3 dB better performance** than On-Off Keying (OOK) at the same signal-to-noise ratio, making it the optimal choice for power-limited channels such as satellite and deep-space communications.

</div>

BPSK forms the foundation for higher-order phase shift keying schemes including QPSK (4 phases), 8PSK (8 phases), and beyond.

## Mathematical Description

### Time-Domain Signal

The BPSK waveform is expressed as: $$s(t) = A \cos(2\pi f_c t + \phi_n)$$ where:

- $A$ = carrier amplitude

- $f_c$ = carrier frequency (Hz)

- $\phi_n \in \{0°, 180°\}$ = phase for bit $n$

**Phase encoding:** $$\phi_n = \begin{cases}
0° & \text{if bit = 0} \\
180° & \text{if bit = 1}
\end{cases}$$

**Alternative representation** using the cosine identity $\cos(\theta + 180°) = -\cos(\theta)$: $$s(t) = A \cdot d_n \cdot \cos(2\pi f_c t)$$ where $d_n \in \{+1, -1\}$ is the bipolar data symbol:

- Bit 0 $\rightarrow$ $d_n = +1$ $\rightarrow$ $0°$ phase

- Bit 1 $\rightarrow$ $d_n = -1$ $\rightarrow$ $180°$ phase (inverted carrier)

<div class="calloutbox">

Physical Interpretation BPSK is effectively **amplitude modulation with bipolar data**. The carrier polarity flips between positive and negative, which is equivalent to a $180°$ phase shift. This representation simplifies both mathematical analysis and hardware implementation.

</div>

## IQ Representation

The baseband complex representation of BPSK is: $$s(t) = \mathrm{Re}\{A \cdot d_n \cdot e^{j2\pi f_c t}\}$$

**IQ components:**

- **I (In-phase):** $I_n = A \cdot d_n$ (either $+A$ or $-A$)

- **Q (Quadrature):** $Q_n = 0$ (BPSK uses only the I axis)

### Constellation Diagram

The BPSK constellation consists of two points on the real axis separated by maximum distance $d = 2A$:


![Diagram 1]({{ '/assets/images/bpsk-exemplar_diagram_1.svg' | relative_url }})
{: .center-image}


This maximum Euclidean separation between symbols provides optimal noise immunity for binary modulation schemes.

## Modulation and Demodulation

### Transmitter (Modulator)

The BPSK modulator consists of three stages:


![Diagram 2]({{ '/assets/images/bpsk-exemplar_diagram_2.svg' | relative_url }})
{: .center-image}


**Process:**

1.  **NRZ encoding:** Map bits to bipolar symbols

    - Bit 0 $\rightarrow$ $d_n = +1$

    - Bit 1 $\rightarrow$ $d_n = -1$

2.  **Multiply by carrier:** $s(t) = A \cdot d_n \cdot \cos(2\pi f_c t)$

3.  **Pulse shaping:** Apply raised-cosine filter to:

    - Limit occupied bandwidth

    - Prevent intersymbol interference (ISI)

    - Meet spectral mask requirements

### Receiver (Coherent Detector)


![Diagram 3]({{ '/assets/images/bpsk-exemplar_diagram_3.svg' | relative_url }})
{: .center-image}


<div class="warningbox">

**Phase synchronization is critical.** The local oscillator must be exactly in phase with the transmitter carrier. A phase offset $\phi_e$ reduces detected signal by $\cos(\phi_e)$. At $\phi_e = 90°$, complete signal loss occurs.

</div>

**Detection process:**

1.  **Multiply by local carrier** (frequency $f_c$, phase $\phi = 0$): $$r(t) = s(t) \cdot 2\cos(2\pi f_c t) = 2A d_n \cos^2(2\pi f_c t)$$

2.  **Apply trigonometric identity** $\cos^2(x) = \frac{1}{2}[1 + \cos(2x)]$: $$r(t) = A d_n [1 + \cos(4\pi f_c t)]$$

3.  **Lowpass filter** removes $2f_c$ component, leaving baseband: $$y(t) = A d_n$$

4.  **Sample at bit period** $T_b$: $y_n = A d_n + n(t)$ where $n(t)$ is AWGN

5.  **Threshold decision:** $$\hat{d}_n = \begin{cases}
    +1 & \text{if } y_n > 0 \quad \text{(decode as bit 0)} \\
    -1 & \text{if } y_n < 0 \quad \text{(decode as bit 1)}
    \end{cases}$$

## Carrier Recovery

The receiver must generate a local oscillator **exactly in phase** with the transmitter carrier. This is the primary challenge in coherent BPSK detection.

### Problem: Phase Ambiguity

A phase offset $\phi_e$ between transmitter and receiver carriers causes: $$y(t) = A d_n \cos(\phi_e) + n(t)$$

**Effects:**

- $\phi_e = 0°$: Full signal strength (optimal)

- $\phi_e = 45°$: Signal reduced by 3 dB

- $\phi_e = 90°$: Complete signal loss

- $\phi_e = 180°$: Inverted data (all bits flipped)

### Carrier Recovery Techniques

#### 1. Pilot Tone

- Simple implementation

- Accurate phase reference

- Wastes power (typically 10–20% of total)

- Reduces data throughput

#### 2. Costas Loop

PLL-based carrier recovery using I/Q demodulation:

- No pilot tone required

- Optimal for BPSK and QPSK

- Complex analog circuitry

- Acquisition time required

#### 3. Squaring Loop

Exploits $d_n^2 = 1$ to remove data modulation: $$^2 = \frac{1}{2}[1 + \cos(4\pi f_c t)]$$ PLL locks to $2f_c$, then divides by 2 to recover $f_c$.

- Completely removes data modulation

- Robust in low SNR

- $180°$ phase ambiguity (requires differential encoding)

### Differential BPSK (DBPSK)

**Principle:** Encode data in **phase transitions**, not absolute phase.

**Encoding rule:** $$\phi_n = \phi_{n-1} + \Delta\phi_n \quad\text{where}\quad \Delta\phi_n = \begin{cases}
0° & \text{if bit = 0} \\
180° & \text{if bit = 1}
\end{cases}$$

**Decoding:** Compare consecutive symbols: $$\hat{b}_n = \begin{cases}
0 & \text{if } \mathrm{sgn}(y_n) = \mathrm{sgn}(y_{n-1}) \\
1 & \text{if } \mathrm{sgn}(y_n) \neq \mathrm{sgn}(y_{n-1})
\end{cases}$$

**Trade-off:**

- No carrier recovery needed

- Simpler receiver

- Approximately 3 dB performance penalty

- Error propagation (single error affects two bits)

## Bit Error Rate (BER) Performance

### Coherent BPSK in AWGN Channel

For ideal coherent detection with perfect synchronization: $$\mathrm{BER} = Q\left(\sqrt{\frac{2E_b}{N_0}}\right) = \frac{1}{2}\mathrm{erfc}\left(\sqrt{\frac{E_b}{N_0}}\right)$$ where:

- $E_b = \frac{A^2 T_b}{2}$ = energy per bit (joules)

- $N_0$ = noise power spectral density (W/Hz)

- $Q(x) = \frac{1}{\sqrt{2\pi}}\int_x^\infty e^{-t^2/2}\,dt$ (Gaussian Q-function)

**Performance benchmarks:**

| $E_b/N_0$ (dB) |                   BER | Practical Meaning           |
|:---------------|----------------------:|:----------------------------|
| 0 dB           |  $7.9 \times 10^{-2}$ | 1 error in 13 bits          |
| 5 dB           |  $9.7 \times 10^{-4}$ | 1 error in 1,000 bits       |
| 10 dB          |  $3.9 \times 10^{-6}$ | 1 error in 250,000 bits     |
| 15 dB          | $6.9 \times 10^{-10}$ | 1 error in 1.4 billion bits |

![Diagram 4]({{ '/assets/images/bpsk-exemplar_diagram_4.svg' | relative_url }})
{: .center-image}


### Comparison: BPSK vs OOK

At the same $E_b/N_0 = 10$ dB:

| Modulation Scheme   |                           BER |       Performance Ratio |
|:--------------------|------------------------------:|------------------------:|
| OOK (non-coherent)  |          $4.0 \times 10^{-3}$ |                Baseline |
| **BPSK (coherent)** | $\mathbf{3.9 \times 10^{-6}}$ | **1000$\times$ better** |

![Diagram 5]({{ '/assets/images/bpsk-exemplar_diagram_5.svg' | relative_url }})
{: .center-image}


<div class="keyconcept">

**Why is BPSK 3 dB better than OOK?**

1.  **Full signal space utilization:** BPSK uses $\pm A$ (both polarities), while OOK uses $\{0, A\}$ (one polarity). This doubles the Euclidean distance between symbols.

2.  **Coherent detection:** Correlating with a known carrier phase is the optimal detection strategy (maximum likelihood).

3.  **Constant envelope:** Energy is transmitted continuously, not just during “on” bits.

</div>

### Differential BPSK Performance

DBPSK trades synchronization complexity for performance: $$\mathrm{BER}_{\mathrm{DBPSK}} \approx \frac{1}{2}e^{-E_b/N_0}$$

At $E_b/N_0 = 10$ dB: BER $\approx 5 \times 10^{-6}$ (approximately 1.3 dB penalty versus coherent BPSK).

## Bandwidth Efficiency

The occupied bandwidth (99% power) for rectangular pulses is: $$B \approx \frac{1}{T_b} = R_b$$ where $R_b$ is the bit rate (bps) and $T_b$ is the bit period (seconds).

With **raised-cosine pulse shaping** (roll-off factor $\alpha$): $$B = R_b(1 + \alpha)$$

**Typical value:** $\alpha = 0.35$ gives $B = 1.35 R_b$

**Spectral efficiency:** $$\eta = \frac{R_b}{B} = \frac{1}{1+\alpha} \approx 0.74\ \text{bps/Hz}$$

<div class="calloutbox">

Example: 1 Mbps BPSK System

- Data rate: $R_b = 1$ Mbps

- Roll-off: $\alpha = 0.35$

- Required bandwidth: $B = 1 \times (1 + 0.35) = 1.35$ MHz

- Spectral efficiency: $\eta = 1/1.35 = 0.74$ bps/Hz

</div>

## Practical Implementations

### IEEE 802.15.4 (Zigbee)

Low-rate wireless personal area networks (868/915 MHz bands):

- **Modulation:** BPSK with Direct-Sequence Spread Spectrum (DSSS)

- **Chip rate:** 300 kcps (868 MHz), 600 kcps (915 MHz)

- **Data rate:** 20 kbps (868 MHz), 40 kbps (915 MHz)

- **Spreading gain:** 15:1 to 20:1 (improves interference rejection)

### Satellite Telemetry

Deep-space missions (Voyager, Mars rovers) use BPSK for maximum power efficiency:

- **Modulation:** BPSK or QPSK

- **Coding:** Concatenated (Convolutional + Reed-Solomon)

- **Data rate:** 10 bps to 10 kbps (extreme path loss)

- **Rationale:** Every dB matters at interplanetary distances

<div class="calloutbox">

Example: Voyager 1 at 24 Billion km

|                      |                                       |
|:---------------------|:--------------------------------------|
| TX power             | 23 W                                  |
| TX antenna gain      | 48 dBi (3.7 m dish)                   |
| RX antenna           | 70 m Deep Space Network dish (74 dBi) |
| Free-space path loss | 310 dB                                |
| Received power       | $-196$ dBm                            |
| Link budget          | Barely positive with FEC              |
| Achieved BER         | $\sim 10^{-5}$                        |

</div>

### RFID Backscatter

Passive RFID tags use backscatter modulation (effectively BPSK):

- **Mechanism:** Tag switches antenna impedance (reflection vs absorption)

- **Binary encoding:** Reflection = bit 0, absorption = bit 1

- **Data rate:** 40–640 kbps (EPC Gen2 standard)

- **Power source:** Harvested from reader’s carrier

## Advantages and Disadvantages

### Advantages

1.  **Optimal binary modulation:** Best BER performance for 1 bit/symbol (3 dB better than OOK)

2.  **Constant envelope:** Compatible with nonlinear amplifiers (no AM-PM distortion)

3.  **Simple constellation:** Two points simplify visualization and analysis

4.  **Foundation for higher PSK:** Concepts extend naturally to QPSK, 8PSK, etc.

### Disadvantages

1.  **Carrier synchronization required:** Costas loop or squaring loop adds complexity

2.  **DBPSK penalty:** Avoiding synchronization costs 3 dB in performance

3.  **Low spectral efficiency:** 1 bit/symbol = maximum 1 bps/Hz

4.  **Outperformed at high SNR:** QPSK, 16-QAM more efficient when SNR permits

## Transition to Higher-Order Modulation

BPSK uses only the I-axis (real axis) with two constellation points.

**Natural extension:** Utilize **both I and Q axes** to create QPSK:


![Diagram 6]({{ '/assets/images/bpsk-exemplar_diagram_6.svg' | relative_url }})
{: .center-image}


**QPSK** = Two independent BPSK channels (I and Q) operating in parallel, doubling spectral efficiency to $\sim$<!-- -->2 bps/Hz.

## Worked Example: Satellite Link Budget

**Scenario:** Geostationary satellite downlink to 1 m ground station

### Given Parameters

|                   |                               |
|:------------------|:------------------------------|
| TX power          | $P_t = 10$ W = 40 dBm         |
| TX antenna gain   | $G_t = 30$ dBi                |
| Distance          | $d = 36{,}000$ km (GEO orbit) |
| Frequency         | $f = 12$ GHz (Ku-band)        |
| RX antenna gain   | $G_r = 40$ dBi (1 m dish)     |
| System noise temp | $T_s = 150$ K                 |
| Bandwidth         | $B = 1$ MHz                   |
| Required BER      | $10^{-6}$                     |

### Step 1: Free-Space Path Loss

$$\mathrm{FSPL\,[dB]} = 20\log_{10}(d_{\text{km}}) + 20\log_{10}(f_{\text{MHz}}) + 32.45$$ $$\mathrm{FSPL} = 20\log_{10}(36{,}000) + 20\log_{10}(12{,}000) + 32.45 = 205.5~\text{dB}$$

### Step 2: Received Signal Power

$$P_r = P_t + G_t + G_r - \mathrm{FSPL}$$ $$P_r = 40 + 30 + 40 - 205.5 = -95.5~\text{dBm}$$

### Step 3: Noise Power

$$N = kT_sB = (1.38 \times 10^{-23})(150)(10^6) = 2.07 \times 10^{-15}~\text{W}$$ $$N = 10\log_{10}(2.07 \times 10^{-15} / 10^{-3}) = -117~\text{dBm}$$

### Step 4: Signal-to-Noise Ratio

$$\mathrm{SNR} = P_r - N = -95.5 - (-117) = 21.5~\text{dB}$$

### Step 5: Energy-per-Bit to Noise Ratio

Assuming data rate $R_b = 500$ kbps: $$\frac{E_b}{N_0} = \mathrm{SNR} + 10\log_{10}\left(\frac{B}{R_b}\right)$$ $$\frac{E_b}{N_0} = 21.5 + 10\log_{10}\left(\frac{1{,}000{,}000}{500{,}000}\right) = 21.5 + 3.0 = 24.5~\text{dB}$$

### Step 6: Link Margin Calculation

- **Required $E_b/N_0$ for BER $= 10^{-6}$:** 10.5 dB

- **Available $E_b/N_0$:** 24.5 dB

- **Link margin:** $24.5 - 10.5 = 14.0$ dB

<div class="calloutbox">

Link Budget Summary **Result: Link closes with 14 dB margin**

This comfortable margin accommodates:

- Rain fade ($\sim$<!-- -->5–8 dB at Ku-band)

- Implementation losses ($\sim$<!-- -->2–3 dB)

- Pointing errors ($\sim$<!-- -->1–2 dB)

- Aging and component degradation

**Conclusion:** Link is viable for reliable 500 kbps BPSK transmission.

</div>

## Summary

| **Parameter**         | **Value**                       |
|:----------------------|:--------------------------------|
| Bits per symbol       | 1                               |
| Constellation points  | 2 ($0°$, $180°$)                |
| Spectral efficiency   | $\sim$<!-- -->0.7–1.0 bps/Hz    |
| BER @ 10 dB $E_b/N_0$ | $3.9 \times 10^{-6}$            |
| Carrier recovery      | Required (Costas/squaring loop) |
| Implementation        | Moderate complexity             |
| Best application      | Power-limited channels          |
| Typical uses          | Satellite, deep-space, RFID     |

![Diagram 7]({{ '/assets/images/bpsk-exemplar_diagram_7.svg' | relative_url }})
{: .center-image}


## Further Reading

- **Chapter 5:** On-Off Keying (OOK)—simpler but inferior performance

- **Chapter 6:** Frequency-Shift Keying (FSK)—alternative binary scheme

- **Chapter 7:** Quadrature Phase-Shift Keying (QPSK)—2 bits/symbol extension

- **Chapter 12:** Constellation Diagrams—visualization techniques

- **Chapter 13:** IQ Representation—complex baseband mathematics

- **Chapter 18:** Bit Error Rate Analysis—performance measurement

- **Chapter 22:** Forward Error Correction—coding for BER improvement

- **Chapter 25:** Carrier Recovery Techniques—synchronization methods
