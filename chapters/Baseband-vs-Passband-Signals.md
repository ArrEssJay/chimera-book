---
layout: chapter
title: "Baseband-vs-Passband-Signals"
chapter: 9
permalink: /chapters/baseband-vs-passband-signals/
---

# Baseband vs Passband Signals

\[\[Home\]\] **Digital Modulation**
\[\[QPSK-Modulation\]\] \[\[IQ-Representation\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Baseband vs passband is like the difference between sheet music
(the notes you play) and the actual sound coming out of a trumpet
(shifted to a specific pitch range).**

**Baseband = The raw information**: - Your data, voice, video in
its original form - Frequency near 0 Hz (DC) - Like: Microphone output
(20 Hz - 20 kHz) - Example: MP3 file on your computer

**Passband = Information shifted to radio frequency**: - Same
information, but “moved” to carrier frequency - Frequency at
~MHz/GHz (radio waves) - Like: FM radio station at 101.5
MHz - Example: WiFi signal at 2.4 GHz carrying your data

**Musical analogy**: - **Baseband**: Musical melody (the
pattern of notes) - **Passband**: Same melody played on a flute
(high pitch) vs tuba (low pitch) - The melody (information) is
identical, just at different frequency ranges!

**Why we need BOTH**:

**Baseband is better for**: - Processing (computers work in
baseband) - Storage (files are baseband) - Display (audio speakers
output baseband) - Development (easier to analyze/test)

**Passband is better for**: - Radio transmission (antennas need
high frequency) - Multiple channels (FM 88.1, 88.3, 88.5
don't interfere) - Long distance (higher frequency =
better propagation) - Regulation (FCC assigns frequency bands)

**Real examples**:

**Your phone call journey**: 1. **Your voice**: Baseband (20
Hz - 3.4 kHz) 2. **Cell phone transmitter**: Shifts to passband
(e.g., 1.9 GHz) 3. **Over the air**: Passband signal travels to
tower 4. **Tower receiver**: Shifts back down to baseband 5.
**Phone network**: Processes in baseband 6.
**Recipient's phone**: Shifts to passband again
(transmit) 7. **Recipient's speaker**: Back to
baseband (audio)

**WiFi example**: - **Your laptop**: Creates baseband IQ data
(MHz range) - **WiFi chip**: Shifts baseband up to 2.4 GHz or 5 GHz
(passband) - **Transmit antenna**: Radiates passband signal -
**Router antenna**: Receives passband signal  
- **Router WiFi chip**: Shifts back down to baseband -
**Router processes**: Baseband Ethernet data

**The frequency shift process = “modulation”**: -
**Upconversion**: Baseband \$\rightarrow\$ Passband
(multiply by carrier) - **Downconversion**: Passband
\$\rightarrow\$ Baseband (multiply by carrier again) -
Same information, just at different frequencies!

**Why antennas need passband**: - Efficient antenna size
\$\approx\$ \$\lambda\$/2 (half wavelength)
- Audio (baseband): 20 Hz \$\rightarrow\$
\$\lambda\$ = 15,000 km \$\rightarrow\$
antenna = 7,500 km! - WiFi (passband): 2.4 GHz
\$\rightarrow\$ \$\lambda\$ = 12.5 cm
\$\rightarrow\$ antenna = 6 cm

**Fun fact**: Software Defined Radio (SDR) works by keeping signals
in baseband as long as possible---only converting to passband at the
last moment. This is why your phone's “radio” is
mostly software running on baseband signals!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Baseband signal**: Information signal at **original
frequency range** (near DC, ~0 Hz)

**Passband signal**: Information signal **shifted to carrier
frequency** $`f_c`$ (RF)

**Why we need both**: - **Baseband**: Digital signal
processing, modulation/demodulation, algorithm development -
**Passband**: Radio transmission (antennas need RF, spectrum
allocation, propagation)

**Key operation**: **Upconversion** (baseband
\$\rightarrow\$ passband) and **downconversion**
(passband \$\rightarrow\$ baseband)

<div class="center">

------------------------------------------------------------------------

</div>

## Baseband Signal

**Definition**: Signal with frequency content centered
**around DC (0 Hz)**

**Spectrum**: Extends from ~0 Hz to $`B`$ Hz
(bandwidth)

### Examples

**Digital baseband**: - NRZ (Non-Return-to-Zero): Rectangular
pulses, \$\pm\$1 - Manchester encoding: Phase transitions
- Pulse-shaped symbols: Raised cosine, RRC

**Analog baseband**: - Voice: 300-3400 Hz - Audio: 20 Hz - 20 kHz -
Video: DC - 6 MHz (NTSC)

<div class="center">

------------------------------------------------------------------------

</div>

### Complex Baseband Representation

**For bandpass systems**, represent signal as **complex
envelope**:

``` math
s(t) = s_I(t) + j s_Q(t)
```

Where: - $`s_I(t)`$ = In-phase component - $`s_Q(t)`$ = Quadrature
component

**Advantages**: - Simplifies DSP (single complex signal vs two real
signals) - Natural representation for IQ modulation - Halves sampling
rate requirement (no negative frequencies)

**See**: \[\[IQ-Representation\]\]

<div class="center">

------------------------------------------------------------------------

</div>

### Baseband Bandwidth

**Occupied bandwidth** depends on symbol rate $`R_s`$ and pulse
shaping:

**Ideal rectangular pulses**:

``` math
B = R_s \quad (\text{Hz})
```

**Raised cosine pulse shaping** (roll-off $`\alpha`$):

``` math
B = R_s (1 + \alpha) \quad (\text{Hz})
```

**Example**: QPSK @ 1 Msps, \$\alpha\$ = 0.35 -
Bandwidth: 1 \$\times\$ (1 + 0.35) = 1.35 MHz (baseband)

<div class="center">

------------------------------------------------------------------------

</div>

## Passband Signal

**Definition**: Signal with frequency content centered
**around carrier $`f_c`$**

**Spectrum**: Extends from $`f_c - B/2`$ to $`f_c + B/2`$

### Why Passband?

1.  **Antenna efficiency**: Antenna size ~
    \$\lambda\$/4, need high frequency for practical size

    - 100 Hz baseband: \$\lambda\$ = 3000 km
      \$\rightarrow\$ 750 km antenna (infeasible!)

    - 2.4 GHz RF: \$\lambda\$ = 12.5 cm
      \$\rightarrow\$ 3 cm antenna (WiFi)

2.  **Spectrum allocation**: Different services assigned different
    frequency bands (AM 540-1600 kHz, FM 88-108 MHz, WiFi 2.4/5 GHz)

3.  **Propagation characteristics**: HF skips ionosphere, VHF
    line-of-sight, UHF penetrates buildings

4.  **Multiplexing**: Multiple baseband signals upconverted to
    different carriers (FDM)

<div class="center">

------------------------------------------------------------------------

</div>

### Passband Representation

**Real passband signal** from complex baseband:

``` math
s_{\text{RF}}(t) = \text{Re}\{s(t) e^{j2\pi f_c t}\}
```

``` math
= s_I(t) \cos(2\pi f_c t) - s_Q(t) \sin(2\pi f_c t)
```

**Interpretation**: **IQ modulation** - I channel modulates
cosine (0\$^\circ\$ phase) - Q channel modulates sine
(90\$^\circ\$ phase)

**Example**: QPSK - $`s(t) = A e^{j\phi}`$ where
$`\phi \in \{45°, 135°, 225°, 315°\}`$ - $`s_I(t) = A\cos\phi`$,
$`s_Q(t) = A\sin\phi`$ -
$`s_{\text{RF}}(t) = A\cos\phi \cos(2\pi f_c t) - A\sin\phi \sin(2\pi f_c t) = A\cos(2\pi f_c t + \phi)`$

<div class="center">

------------------------------------------------------------------------

</div>

## Upconversion (Modulation)

**Process**: Shift baseband signal to carrier frequency

### IQ Modulator (Quadrature Modulator)

**Block diagram**:

               cos(2f_c t)
                    |
        s_I(t) --> [×] ----\
                            [+] --> s_RF(t)
        s_Q(t) --> [×] ----/
                    |
              -sin(2f_c t)

**Output**:

``` math
s_{\text{RF}}(t) = s_I(t) \cos(2\pi f_c t) - s_Q(t) \sin(2\pi f_c t)
```

<div class="center">

------------------------------------------------------------------------

</div>

### Single-Sideband (SSB) Upconversion

**Complex multiplication**:

``` math
s_{\text{RF}}(t) = \text{Re}\{s(t) e^{j2\pi f_c t}\}
```

**In frequency domain**:

``` math
S_{\text{RF}}(f) = \frac{1}{2}[S(f - f_c) + S^*(-f - f_c)]
```

**Result**: Positive frequencies shifted to $`f_c`$, negative
frequencies to $`-f_c`$ (conjugate)

**Since $`s(t)`$ real RF signal**: Spectrum symmetric around 0, so
both sidebands present

<div class="center">

------------------------------------------------------------------------

</div>

### Image Rejection

**Problem**: Real mixer produces both $`f_c + f_{\text{BB}}`$ and
$`f_c - f_{\text{BB}}`$ (USB and LSB)

**IQ modulator advantage**: Can select **one sideband** by
controlling I/Q phase - USB only: I/Q phase =
+90\$^\circ\$ - LSB only: I/Q phase =
-90\$^\circ\$ - DSB: I only (Q = 0)

<div class="center">

------------------------------------------------------------------------

</div>

### Example: WiFi 2.4 GHz

**Baseband**: - Symbol rate: 20 Msps (20 MHz OFDM) - Complex
baseband: -10 MHz to +10 MHz

**Upconversion**: - Carrier: 2.412 GHz (channel 1) - RF spectrum:
2.402-2.422 GHz (20 MHz)

**Transmit chain**: 1. Generate OFDM baseband (I/Q symbols) 2. DAC
@ 40 Msps (2\$\times\$ oversampling) 3. IQ modulator @
2.412 GHz 4. PA \$\rightarrow\$ antenna

<div class="center">

------------------------------------------------------------------------

</div>

## Downconversion (Demodulation)

**Process**: Shift RF signal back to baseband

### IQ Demodulator (Quadrature Demodulator)

**Block diagram**:

                   cos(2f_c t)
                        |
    s_RF(t) --> [×] --> [LPF] --> s_I(t)
             |
             |  -sin(2f_c t)
             |      |
             +--> [×] --> [LPF] --> s_Q(t)

**I channel**:

``` math
s_I(t) = \text{LPF}\{s_{\text{RF}}(t) \cos(2\pi f_c t)\}
```

**Q channel**:

``` math
s_Q(t) = \text{LPF}\{s_{\text{RF}}(t) \cdot [-\sin(2\pi f_c t)]\}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Mathematical Derivation

**Input**:

``` math
s_{\text{RF}}(t) = s_I^{\text{TX}}(t) \cos(2\pi f_c t) - s_Q^{\text{TX}}(t) \sin(2\pi f_c t)
```

**I channel after mixing**:

``` math
s_I^{\text{mix}}(t) = [s_I^{\text{TX}} \cos(2\pi f_c t) - s_Q^{\text{TX}} \sin(2\pi f_c t)] \cos(2\pi f_c t)
```

``` math
= s_I^{\text{TX}} \cos^2(2\pi f_c t) - s_Q^{\text{TX}} \sin(2\pi f_c t)\cos(2\pi f_c t)
```

**Using trig identities**: -
$`\cos^2\theta = \frac{1 + \cos(2\theta)}{2}`$ -
$`\sin\theta\cos\theta = \frac{\sin(2\theta)}{2}`$

``` math
s_I^{\text{mix}}(t) = s_I^{\text{TX}} \frac{1 + \cos(4\pi f_c t)}{2} - s_Q^{\text{TX}} \frac{\sin(4\pi f_c t)}{2}
```

**After LPF** (removes $`2f_c`$ terms):

``` math
s_I(t) = \frac{1}{2} s_I^{\text{TX}}(t)
```

**Similarly for Q channel**:

``` math
s_Q(t) = \frac{1}{2} s_Q^{\text{TX}}(t)
```

**Recovered baseband** (with 1/2 amplitude, easily corrected):

``` math
s(t) = s_I(t) + j s_Q(t) = \frac{1}{2}[s_I^{\text{TX}}(t) + j s_Q^{\text{TX}}(t)]
```

<div class="center">

------------------------------------------------------------------------

</div>

### Image Frequency

**Problem**: Mixer sensitive to both $`f_c + f`$ and $`f_c - f`$

**Image frequency**:
$`f_{\text{image}} = 2f_c - f_{\text{desired}}`$

**Example**: Desired signal @ 2.45 GHz, LO @ 2.4 GHz -
Downconverted to: 2.45 - 2.4 = 50 MHz - Image @ 2.4 - 0.05 = 2.35 GHz
also downconverts to 50 MHz!

**Mitigation**: - **Image-reject filter** before mixer (RF
bandpass filter) - **IQ demodulator** (natural image rejection if
I/Q balanced) - **Superheterodyne** (multiple conversion stages
with filtering)

<div class="center">

------------------------------------------------------------------------

</div>

## Superheterodyne Receiver

**Classic architecture**: RF \$\rightarrow\$ IF
\$\rightarrow\$ Baseband

**Stages**: 1. **RF stage**: LNA, RF bandpass filter 2.
**First mixer**: RF \$\rightarrow\$ IF (intermediate
frequency, e.g., 10.7 MHz for FM radio) 3. **IF stage**: IF filter
(high selectivity), IF amplifier 4. **Second mixer**: IF
\$\rightarrow\$ Baseband (or direct demodulation at IF)

**Advantages**: - **Image rejection**: IF filter very
selective - **Fixed IF**: Optimized filters regardless of RF tuning
- **Gain distribution**: Spread gain across stages (avoid
instability)

**Example**: FM radio receiver - RF: 88-108 MHz (tunable) - LO:
98.7-118.7 MHz (tracks RF + 10.7 MHz) - IF: 10.7 MHz (fixed) - Crystal
filter @ IF: 150 kHz bandwidth (adjacent channel rejection)

<div class="center">

------------------------------------------------------------------------

</div>

## Zero-IF (Direct Conversion) Receiver

**Modern SDR approach**: RF \$\rightarrow\$ Baseband
(no IF)

**Advantages**: - Fewer components (no IF filters, single LO) -
Compact, low power (mobile devices) - Flexible (software-defined
bandwidth)

**Challenges**: - **DC offset**: LO leakage self-mixes to DC
(corrupts baseband) - **Flicker noise**: 1/f noise near DC -
**I/Q imbalance**: Gain/phase mismatch between I/Q paths

**Mitigation**: - AC coupling (removes DC) - High-pass filtering
(kills flicker noise) - Digital calibration (I/Q imbalance correction)

<div class="center">

------------------------------------------------------------------------

</div>

## Sampling Considerations

### Nyquist for Passband Signals

**Real passband signal** $`s_{\text{RF}}(t)`$ centered at $`f_c`$,
bandwidth $`B`$:

**Bandpass sampling theorem**: Can sample at $`f_s < 2f_c`$ if:

``` math
f_s \geq 2B
```

**Condition**: $`f_c = n \frac{f_s}{4}`$ (integer $`n`$) for easy
downconversion

**Example**: WiFi @ 2.4 GHz, 20 MHz BW - Minimum
$`f_s = 2 \times 20 = 40`$ MHz (bandpass sampling) - Typical $`f_s`$ =
80-100 MHz (allows filtering roll-off)

<div class="center">

------------------------------------------------------------------------

</div>

### Complex Baseband Sampling

**Complex baseband** $`s(t) = s_I(t) + j s_Q(t)`$:

**Sampling rate**:

``` math
f_s \geq B \quad (\text{Hz})
```

**Why lower?** Negative frequencies meaningful (complex signal
asymmetric)

**Example**: QPSK @ 1 MHz baseband bandwidth - Real passband @ 2.4
GHz: Need $`f_s \geq 2`$ MHz (bandpass sampling) - Complex baseband:
Need $`f_s \geq 1`$ MHz (but typically 2\$\times\$ for
pulse shaping)

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Impairments

### 1. Carrier Frequency Offset (CFO)

**TX and RX oscillators not perfectly matched**:

``` math
\Delta f = f_{\text{TX}} - f_{\text{RX}}
```

**Effect on baseband**:

``` math
s_{\text{RX}}(t) = s(t) e^{j2\pi \Delta f t}
```

**Consequence**: Constellation rotates over time

**Typical**: \$\pm\$10 ppm (parts per million) - @
2.4 GHz: \$\pm\$24 kHz offset - @ 28 GHz (5G mmWave):
\$\pm\$280 kHz offset

**Mitigation**: Frequency synchronization (see
\[\[Synchronization-(Carrier,-Timing,-Frame)\]\])

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Phase Noise

**Oscillator jitter** causes random phase variations:

``` math
s_{\text{RF}}(t) = s_I(t) \cos(2\pi f_c t + \phi_n(t))
```

Where $`\phi_n(t)`$ = Random phase noise process

**Effect**: Constellation spreading, ICI (inter-carrier
interference in OFDM)

**Spec**: $`\mathcal{L}(f_m)`$ (phase noise PSD at offset $`f_m`$
from carrier, dBc/Hz)

**Example**: Good TCXO @ 10 kHz offset - Phase noise: -110 dBc/Hz -
Integrated phase error: ~1\$^\circ\$ RMS
(acceptable for QPSK)

<div class="center">

------------------------------------------------------------------------

</div>

### 3. I/Q Imbalance

**Gain mismatch**: $`G_I \neq G_Q`$

**Phase mismatch**: 90\$^\circ\$ shifter imperfect
(e.g., 88\$^\circ\$ or 92\$^\circ\$)

**Effect**: Image sideband leakage, constellation distortion

**Model**:

``` math
s_{\text{imb}}(t) = G_I s_I(t) + G_Q e^{j(\pi/2 + \epsilon)} s_Q(t)
```

**Typical**: \$\pm\$0.5 dB gain,
\$\pm\$2\$^\circ\$ phase (good hardware)

**Mitigation**: Digital pre-distortion, calibration using known
pilots

<div class="center">

------------------------------------------------------------------------

</div>

### 4. LO Leakage (DC Offset)

**TX LO leaks** into RF path \$\rightarrow\$
Self-mixing at RX \$\rightarrow\$ DC component

**Effect**: DC spike in baseband spectrum

**Mitigation**: - AC coupling (blocks DC) - Blank center subcarrier
(OFDM) - Digital DC offset estimation/cancellation

<div class="center">

------------------------------------------------------------------------

</div>

## Spectral Efficiency Comparison

| Architecture | Bandwidth Used | Spectral Efficiency | Example |
|:---|:---|:---|:---|
| **Baseband (DSB)** | $`2B`$ (USB + LSB) | N/A (not RF) | Ethernet |
| **SSB (analog)** | $`B`$ | 1\$\times\$ | HAM radio |
| **DSB-SC** | $`2B`$ | 0.5\$\times\$ | AM radio
(suppressed carrier) |
| **VSB** | $`1.25B`$ | 0.8\$\times\$ | Analog TV |
| **IQ modulation** | $`B`$ | 1\$\times\$ | QPSK, QAM
(most digital) |

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Aspect</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Baseband</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Passband</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Frequency range</strong></td>
<td style="text-align: left;">~0 to <span class="math inline"><em>B</em></span> Hz</td>
<td style="text-align: left;"><span class="math inline"><em>f</em><sub><em>c</em></sub> − <em>B</em>/2</span>
to <span class="math inline"><em>f</em><sub><em>c</em></sub> + <em>B</em>/2</span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Signal type</strong></td>
<td style="text-align: left;">Complex or real</td>
<td style="text-align: left;">Real only</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Sampling rate</strong></td>
<td style="text-align: left;"><span class="math inline"> ≥ <em>B</em></span> (complex) or <span class="math inline"> ≥ 2<em>B</em></span> (real)</td>
<td style="text-align: left;"><span class="math inline"> ≥ 2<em>B</em></span> (bandpass)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Processing</strong></td>
<td style="text-align: left;">Digital (DSP)</td>
<td style="text-align: left;">Analog (RF) or digital (SDR)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Transmission</strong></td>
<td style="text-align: left;">Wired (Ethernet)</td>
<td style="text-align: left;">Wireless (antenna)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Representation</strong></td>
<td style="text-align: left;"><span class="math inline"><em>s</em>(<em>t</em>) = <em>s</em><sub><em>I</em></sub> + <em>j</em><em>s</em><sub><em>Q</em></sub></span></td>
<td style="text-align: left;"><span class="math inline"><em>s</em><sub>RF</sub> = <em>s</em><sub><em>I</em></sub>cos <em>ω</em><em>t</em> − <em>s</em><sub><em>Q</em></sub>sin <em>ω</em><em>t</em></span></td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[IQ-Representation\]\]**: Complex baseband I/Q signals

- **\[\[QPSK-Modulation\]\]**: Example of IQ modulation

- **\[\[Constellation-Diagrams\]\]**: Visualizing baseband IQ
  symbols

- **\[\[Synchronization-(Carrier,-Timing,-Frame)\]\]**: Carrier
  frequency/phase recovery

- **\[\[OFDM-&-Multicarrier-Modulation\]\]**: Uses IQ
  modulation per subcarrier

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Why we need RF
  (antenna efficiency)

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Baseband = information at low frequency,
passband = shifted to RF carrier.** IQ modulation (quadrature
upconversion) shifts complex baseband to RF without image.
Downconversion reverses process. Complex baseband simplifies DSP, halves
sample rate. Passband required for wireless (antenna, propagation,
spectrum). Practical impairments: CFO, phase noise, I/Q imbalance, LO
leakage. Superheterodyne =
RF\$\rightarrow\$IF\$\rightarrow\$BB
(classic), zero-IF = RF\$\rightarrow\$BB (modern SDR).

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
