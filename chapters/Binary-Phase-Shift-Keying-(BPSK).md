---
layout: chapter
title: "Binary-Phase-Shift-Keying-(BPSK)"
chapter: 13
permalink: /chapters/binary-phase-shift-keying-(bpsk)/
---

# Binary Phase-Shift Keying (BPSK)

\[\[Home\]\] **Modulation**
\[\[On-Off-Keying-(OOK)\]\]
\[\[Frequency-Shift-Keying-(FSK)\]\]
\[\[QPSK-Modulation\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**BPSK is like Morse code with a twist---instead of on/off,
you flip the wave upside-down to send 1s and 0s.**

**Simple idea**: - Bit 0 = wave pointing “up”
\$\uparrow\$  
- Bit 1 = wave pointing “down” \$\downarrow\$ (flipped
180\$^\circ\$)

**Real use**: GPS satellites use BPSK! Your phone detects whether
the signal is normal or flipped.

**Why flip instead of on/off?** More reliable in noise, works with
constant power, less interference. Trade-off: Simple but slow (1 bit per
symbol).

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Binary Phase-Shift Keying (BPSK)** is the simplest form of
**phase modulation**, where binary data is encoded by
**shifting the carrier phase** between two states:
0\$^\circ\$ and 180\$^\circ\$.

**Key advantage over \[\[On-Off-Keying-(OOK)OOK\]\]
and \[\[Frequency-Shift-Keying-(FSK)FSK\]\]**: BPSK uses
**coherent detection** and provides **3 dB better
performance** (lower BER for same SNR).

**Foundation for**: \[\[QPSK-Modulation\]\] (4 phases), 8PSK (8
phases), and higher-order modulation.

<div class="center">

------------------------------------------------------------------------

</div>

## Mathematical Description

### Time-Domain Signal

**BPSK waveform**:

``` math
s(t) = A \cos(2\pi f_c t + \phi_n)
```

Where: - $`A`$ = Carrier amplitude - $`f_c`$ = Carrier frequency -
$`\phi_n \in \{0°, 180°\}`$ = Phase for bit $`n`$

**Phase encoding**:

``` math
\phi_n = \begin{cases}
0° & \text{if bit = 0} \\
180° & \text{if bit = 1}
\end{cases}
```

**Alternative representation** (using cosine identity):

``` math
s(t) = A \cdot d_n \cdot \cos(2\pi f_c t)
```

Where: - $`d_n \in \{+1, -1\}`$ = Bipolar data symbol - Bit 0
\$\rightarrow\$ $`d_n = +1`$ \$\rightarrow\$
0\$^\circ\$ phase - Bit 1 \$\rightarrow\$
$`d_n = -1`$ \$\rightarrow\$
180\$^\circ\$ phase (inverted carrier)

**Key insight**: BPSK is **amplitude modulation with bipolar
data** (carrier polarity flips).

<div class="center">

------------------------------------------------------------------------

</div>

## \[\[IQ-Representation\]\]

**Baseband complex representation**:

``` math
s(t) = \text{Re}\{A \cdot d_n \cdot e^{j2\pi f_c t}\}
```

**IQ components**: - **I (In-phase)**: $`I_n = A \cdot d_n`$
(either $`+A`$ or $`-A`$) - **Q (Quadrature)**: $`Q_n = 0`$ (BPSK
uses only I axis)

**\[\[Constellation-DiagramsConstellation\]\]**:

    Q (Imaginary)
         |
         |
    -----+-----+-----  I (Real)
      -A | 0   | +A
         |
         |

    Two constellation points:
    - Bit 0: (+A, 0)   0° phase
    - Bit 1: (-A, 0)   180° phase

**Distance between symbols**: $`d = 2A`$

<div class="center">

------------------------------------------------------------------------

</div>

## Modulation & Demodulation

### Transmitter (Modulator)

**Block diagram**:

    Binary data  Bipolar NRZ  [×]  Bandpass  BPSK signal
     {0, 1}      {+1, -1}       |     filter
                                |
                             cos(2f_c t)
                             (Carrier)

**Steps**: 1. **NRZ encoding**: Map bits to symbols - Bit 0
\$\rightarrow\$ $`d_n = +1`$ - Bit 1
\$\rightarrow\$ $`d_n = -1`$ 2. **Multiply by
carrier**: $`s(t) = A d_n \cos(2\pi f_c t)`$ 3. **Pulse shaping**:
Apply raised-cosine filter (limit bandwidth, prevent ISI)

<div class="center">

------------------------------------------------------------------------

</div>

### Receiver (Coherent Detector)

**Block diagram**:

    BPSK signal  [×]  Lowpass  Sample  Threshold  Binary data
                   |     filter    at T_s    (> 0?)      {0, 1}
                   |
                cos(2f_c t + )
           (Local oscillator, must be phase-locked!)

**Steps**: 1. **Multiply by local carrier** (same frequency
and phase as TX):

``` math
r(t) = s(t) \cdot 2\cos(2\pi f_c t)
```

1.  **Product**:

``` math
r(t) = A d_n \cos(2\pi f_c t) \cdot 2\cos(2\pi f_c t)
```

1.  **Trig identity**: $`\cos(x)\cos(x) = \frac{1}{2}[1 + \cos(2x)]`$

``` math
r(t) = A d_n [1 + \cos(4\pi f_c t)]
```

1.  **Lowpass filter** removes $`2f_c`$ term:

``` math
r(t) = A d_n
```

1.  **Sample at bit period**: $`y_n = A d_n + n(t)`$

2.  **Threshold decision**:

``` math
\hat{d}_n = \begin{cases}
+1 & \text{if } y_n > 0 \quad (\text{bit } 0) \\
-1 & \text{if } y_n < 0 \quad (\text{bit } 1)
\end{cases}
```

**Critical requirement**: **Phase synchronization** (carrier
recovery circuit needed)

<div class="center">

------------------------------------------------------------------------

</div>

## Carrier Recovery

**Problem**: Receiver must generate local oscillator
**exactly in phase** with TX carrier.

**Phase offset $`\phi_e`$ causes errors**:

``` math
r(t) = A d_n \cos(\phi_e)
```

If $`\phi_e = 90°`$: $`r(t) = 0`$ (complete signal loss!)

<div class="center">

------------------------------------------------------------------------

</div>

### Solutions

#### 1. Pilot Tone

- TX sends unmodulated carrier alongside data

- RX phase-locks to pilot

- **Overhead**: Wastes power/bandwidth

#### 2. Costas Loop

- **PLL-based carrier recovery** from modulated signal

- Multiplies signal by $`\sin(2\pi f_c t)`$ and $`\cos(2\pi f_c t)`$

- Adjusts phase until Q-channel (sine branch) = 0

- **Advantage**: No pilot needed

#### 3. Squaring Loop

- Square BPSK signal:
  $`(d_n \cos(\theta))^2 = \frac{1}{2}d_n^2[1 + \cos(2\theta)]`$

- Since $`d_n^2 = 1`$: Doubled-frequency carrier emerges

- PLL locks to $`2f_c`$, then divide by 2

- **Advantage**: Removes data modulation

- **Disadvantage**: 180\$^\circ\$ phase ambiguity
  (need differential encoding)

<div class="center">

------------------------------------------------------------------------

</div>

### Differential BPSK (DBPSK)

**Solution to phase ambiguity**: Encode data in **phase
transitions**, not absolute phase.

**Encoding**:

``` math
\phi_n = \phi_{n-1} + \Delta\phi_n
```

Where: - Bit 0 \$\rightarrow\$ No phase change
($`\Delta\phi = 0°`$) - Bit 1 \$\rightarrow\$ Phase change
($`\Delta\phi = 180°`$)

**Decoding**: Compare consecutive symbols:

``` math
\hat{b}_n = \begin{cases}
0 & \text{if } \text{sgn}(y_n) = \text{sgn}(y_{n-1}) \\
1 & \text{if } \text{sgn}(y_n) \neq \text{sgn}(y_{n-1})
\end{cases}
```

**Advantage**: No carrier recovery needed (differential detection)
**Disadvantage**: ~3 dB worse than coherent BPSK
(errors propagate)

<div class="center">

------------------------------------------------------------------------

</div>

## Bit Error Rate (BER) Performance

### Coherent BPSK (Ideal)

**In AWGN channel**:

``` math
\text{BER} = Q\left(\sqrt{\frac{2E_b}{N_0}}\right) = \frac{1}{2}\text{erfc}\left(\sqrt{\frac{E_b}{N_0}}\right)
```

Where: - $`E_b`$ = Energy per bit = $`\frac{A^2 T_b}{2}`$ - $`N_0`$ =
Noise power spectral density - $`Q(x)`$ = Tail probability of Gaussian:
$`Q(x) = \frac{1}{\sqrt{2\pi}}\int_x^\infty e^{-t^2/2}dt`$

**Key values**:

| $`E_b/N_0`$ (dB) | BER |
|:---|:---|
| dB | 7.9 \$\times\$
10\textsuperscript{-}\textsuperscript{2}
(1 error in 13 bits) |
| 5 dB | 9.7 \$\times\$
10\textsuperscript{-}\textsuperscript{4}
(1 in 1,000) |
| 10 dB | 3.9 \$\times\$
10\textsuperscript{-}\textsuperscript{6}
(1 in 250,000) |
| 15 dB | 6.9 \$\times\$
10\textsuperscript{-}\textsuperscript{1}\textsuperscript{0}
(1 in 1.4 billion) |

<div class="center">

------------------------------------------------------------------------

</div>

### Comparison: BPSK vs OOK

**At same $`E_b/N_0`$**:

| Modulation              | BER @ 10 dB $`E_b/N_0`$                    |
|:------------------------|:-------------------------------------------|
| \[\[On-Off-Keying-(OOK) | OOK\]\] (non-coherent)                     |
| **BPSK (coherent)**     | **3.9 \$\times\$                           
                           10\textsuperscript{-}\textsuperscript{6}**  |

**BPSK is ~1000\$\times\$ better** at
10 dB!

**Why?** 1. **BPSK uses both halves of signal space**
(\$\pm\$A vs OOK's 0/A) 2.
**Coherent detection** (correlates with carrier, optimal) 3.
**Maximum Euclidean distance** between symbols

<div class="center">

------------------------------------------------------------------------

</div>

### Differential BPSK (DBPSK)

**Slightly worse than coherent BPSK**:

``` math
\text{BER}_{\text{DBPSK}} \approx \frac{1}{2}e^{-E_b/N_0}
```

**At 10 dB**: BER \$\approx\$ 5
\$\times\$
10\textsuperscript{-}\textsuperscript{6}
(~1.3 dB penalty vs coherent)

<div class="center">

------------------------------------------------------------------------

</div>

## Bandwidth Efficiency

**Occupied bandwidth** (99% power):

``` math
B \approx \frac{1}{T_b} = R_b
```

Where: - $`R_b`$ = Bit rate (bps) - $`T_b`$ = Bit period

**With raised-cosine pulse shaping** (roll-off $`\alpha`$):

``` math
B = R_b(1 + \alpha)
```

**Typical**: $`\alpha = 0.35`$ \$\rightarrow\$
$`B = 1.35 R_b`$

**Spectral efficiency**:

``` math
\eta = \frac{R_b}{B} = \frac{1}{1+\alpha} \approx 0.74\ \text{bps/Hz}
```

**Example**: 1 Mbps BPSK with $`\alpha = 0.35`$ requires
**1.35 MHz bandwidth**.

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Implementations

### 1. IEEE 802.15.4 (Zigbee, Low-Rate WPAN)

**PHY layer** (868/915 MHz bands): - **Modulation**: BPSK
(optional O-QPSK) - **Chip rate**: 300 kcps (868 MHz), 600 kcps
(915 MHz) - **Data rate**: 20 kbps (868), 40 kbps (915) -
**Spreading**: DSSS (Direct-Sequence Spread Spectrum)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Satellite Telemetry

**Deep-space missions** (Voyager, Mars rovers): -
**Modulation**: BPSK or QPSK - **Coding**: Convolutional +
Reed-Solomon (concatenated FEC) - **Data rate**: 10 bps - 10 kbps
(extreme distances) - **Why BPSK?**: Maximum power efficiency
(every dB counts)

**Example**: Voyager 1 (24 billion km): - TX power: 23 W - Antenna
gain: 48 dBi (dish) - RX antenna: 70 m DSN dish (74 dBi) - Link budget:
Barely positive with FEC (BER
10\textsuperscript{-}\textsuperscript{5})

<div class="center">

------------------------------------------------------------------------

</div>

### 3. RFID (Passive Tags)

**Backscatter modulation**: - Tag reflects/absorbs carrier energy -
**Binary encoding**: Reflection = bit 0, absorption = bit 1 -
**Effectively BPSK** (from reader's perspective) -
**Data rate**: 40-640 kbps (EPC Gen2)

<div class="center">

------------------------------------------------------------------------

</div>

## Advantages of BPSK

1.  **Best BER performance** for binary modulation (3 dB better than
    OOK)

2.  **Constant envelope** (nonlinear amplifiers OK, no AM-PM
    distortion)

3.  **Simple constellation** (two points, easy visualization)

4.  **Foundation for higher-order PSK**
    (\[\[QPSK-ModulationQPSK\]\], 8PSK)

<div class="center">

------------------------------------------------------------------------

</div>

## Disadvantages of BPSK

1.  **Requires carrier synchronization** (Costas loop, squaring loop
    = complex)

2.  **Differential BPSK** (DBPSK) avoids this but has 3 dB penalty

3.  **Low spectral efficiency** (1 bit/symbol = 1 bps/Hz max)

4.  **Higher-order modulation** (QPSK, 16-QAM) more efficient for
    high SNR

<div class="center">

------------------------------------------------------------------------

</div>

## Transition to QPSK

**BPSK uses one axis** (I-axis) with two constellation points.

**Natural extension**: Use **both I and Q axes**
\$\rightarrow\$ \[\[QPSK-ModulationQPSK\]\]:

    BPSK constellation:
       Q
       |
    ---+---+---  I
      -A   +A
       |

    QPSK constellation (4 points):
       Q
       |  +A
       | / \
    ---+-----+---  I
       | \ /
       | -A
       |

    4 phases: 45°, 135°, 225°, 315°
    2 bits per symbol  Double spectral efficiency

**QPSK** = Two independent BPSK channels (I and Q) in parallel.

**See**: \[\[QPSK-Modulation\]\] for details

<div class="center">

------------------------------------------------------------------------

</div>

## Worked Example: BPSK Link Budget

**Scenario**: Satellite downlink

**Given**: - TX power: $`P_t = 10`$ W (40 dBm) - TX antenna gain:
$`G_t = 30`$ dBi - Distance: $`d = 36,000`$ km (GEO) - Frequency:
$`f = 12`$ GHz (Ku-band) - RX antenna gain: $`G_r = 40`$ dBi (1 m dish)
- System noise temperature: $`T_s = 150`$ K - Bandwidth: $`B = 1`$ MHz -
Required BER: $`10^{-6}`$

<div class="center">

------------------------------------------------------------------------

</div>

### Step 1: Calculate FSPL

``` math
\text{FSPL} = 20\log(36 \times 10^6) + 20\log(12 \times 10^9) + 92.45 = 205.5\ \text{dB}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Step 2: Received Power

``` math
P_r = P_t + G_t + G_r - \text{FSPL}
```

``` math
P_r = 40 + 30 + 40 - 205.5 = -95.5\ \text{dBm}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Step 3: Noise Power

``` math
N = kT_sB = (1.38 \times 10^{-23})(150)(10^6) = 2.07 \times 10^{-15}\ \text{W} = -117\ \text{dBm}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Step 4: SNR

``` math
\text{SNR} = P_r - N = -95.5 - (-117) = 21.5\ \text{dB}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Step 5: Check BER Requirement

**For BPSK**, BER $`= 10^{-6}`$ requires:

``` math
\frac{E_b}{N_0} \approx 10.5\ \text{dB}
```

**Convert SNR to $`E_b/N_0`$**:

``` math
\frac{E_b}{N_0} = \text{SNR} + 10\log\left(\frac{B}{R_b}\right)
```

**If data rate** $`R_b = 500`$ kbps:

``` math
\frac{E_b}{N_0} = 21.5 + 10\log\left(\frac{10^6}{5 \times 10^5}\right) = 21.5 + 3 = 24.5\ \text{dB}
```

**Margin**: $`24.5 - 10.5 = 14`$ dB (comfortable margin for rain
fade, implementation loss)

**Link closes!**

<div class="center">

------------------------------------------------------------------------

</div>

## Summary

| Aspect | BPSK |
|:---|:---|
| **Bits per symbol** | 1 |
| **Constellation points** | 2 (0\$^\circ\$,
180\$^\circ\$) |
| **Spectral efficiency** | ~1 bps/Hz (with pulse
shaping) |
| **BER @ 10 dB $`E_b/N_0`$** | 3.9 \$\times\$
10\textsuperscript{-}\textsuperscript{6} |
| **Carrier recovery** | Required (Costas loop, squaring loop) |
| **Complexity** | Moderate (coherent detection) |
| **Best for** | Power-limited channels (satellite, deep-space) |

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[On-Off-Keying-(OOK)\]\]**: Simpler but 3 dB worse
  performance

- **\[\[Frequency-Shift-Keying-(FSK)\]\]**: Alternative binary
  modulation (non-coherent detection)

- **\[\[QPSK-Modulation\]\]**: Extension to 4 phases (2
  bits/symbol)

- **\[\[Constellation-Diagrams\]\]**: Visual representation of
  modulation

- **\[\[IQ-Representation\]\]**: Complex baseband notation

- **\[\[Bit-Error-Rate-(BER)\]\]**: Performance metric for
  digital modulation

- **\[\[Forward-Error-Correction-(FEC)\]\]**: Coding to improve
  BER

<div class="center">

------------------------------------------------------------------------

</div>

**Next**: **8PSK & Higher-Order Modulation** (TBD) - More
bits per symbol, trades SNR for bandwidth

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
