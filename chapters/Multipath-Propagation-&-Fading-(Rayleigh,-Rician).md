---
layout: chapter
title: "Multipath-Propagation-&-Fading-(Rayleigh,-Rician)"
chapter: 41
permalink: /chapters/multipath-propagation-&-fading-(rayleigh,-rician)/
---

# Multipath Propagation & Fading (Rayleigh & Rician)

\[\[Home\]\] **RF Propagation**
\[\[Channel-Models-(Rayleigh-&-Rician)\]\]
\[\[Atmospheric-Effects-(Ionospheric,-Tropospheric)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Multipath is like hearing echoes in a canyon---radio signals
bounce off buildings/walls and arrive at your phone from multiple
directions at slightly different times.**

**The problem**: 1. Signal travels **direct path** from tower
to phone (fast) 2. Same signal bounces off buildings (slower paths) 3.
All copies arrive at different times and **interfere** with each
other 4. Sometimes they add up (strong signal), sometimes they cancel
out (weak signal) 5. This causes **fading**: signal strength
fluctuates wildly as you move!

**Real-world experience**: - **Driving through city**: Cell
signal goes from 5 bars to 2 bars back to 5
bars---that's multipath fading - **WiFi dead
spots**: Walk 1 meter and signal drops---destructive interference
from multipath - **Crackling old TV**: Picture would fade
in/out---multipath from distant transmitter

**Two types**:

**1. Rayleigh fading** (no direct path): - All paths are
bounced/scattered - Signal strength varies randomly (can drop 30+ dB!) -
Common in dense urban areas, indoors

**2. Rician fading** (strong direct path + echoes): - One dominant
path (line-of-sight) + weaker echoes - Less severe fading - Common in
open areas, suburban

**How engineers fix it**: - **MIMO**: Multiple antennas sample
different fade patterns - **OFDM**: Spread data across many
frequencies---some fade, others don't -
**Adaptive coding**: Slow down when fading is bad -
**Interleaving**: Spread bits over time so fades
don't wipe out whole packets

**Fun fact**: Multipath is why 5G uses higher
frequencies---shorter waves = less bouncing = more predictable (but
shorter range!).

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Multipath propagation** occurs when RF signals reach the receiver
via **multiple paths** simultaneously, each with different: -
**Delay** (arrival time) - **Amplitude** (path loss) -
**Phase** (due to different path lengths)

**Result**: Signals combine **constructively** or
**destructively**, causing **fading** (rapid signal strength
variations).

**Critical for**: Cellular networks, WiFi, mobile satellite, any
NLOS (non-line-of-sight) communication

<div class="center">

------------------------------------------------------------------------

</div>

## Physical Mechanisms

### Reflection

**EM waves bounce off surfaces**: - **Ground** (two-ray model)
- **Buildings** (urban canyons) - **Water** (maritime comms) -
**Ionosphere** (HF skywave)

**Reflection coefficient** depends on: - Polarization (horizontal
vs vertical) - Angle of incidence - Surface material (conductivity,
permittivity)

**Example**: Concrete wall at 2.4 GHz \$\rightarrow\$
~0.3-0.5 reflection coefficient (~3-6 dB
loss per bounce)

<div class="center">

------------------------------------------------------------------------

</div>

### Diffraction

**Bending around obstacles** (Fresnel diffraction): - Building
edges - Hills/terrain - Trees

**Knife-edge diffraction loss**:

``` math
L_d \approx 6 + 20\log\left(\sqrt{(v-0.1)^2 + 1} + v - 0.1\right) \quad (\text{dB})
```

Where $`v`$ = Fresnel-Kirchhoff diffraction parameter

**Implication**: Signals can “bend” into shadowed regions (NLOS
coverage possible)

<div class="center">

------------------------------------------------------------------------

</div>

### Scattering

**Interaction with rough surfaces or small objects**: - Rough
terrain (vegetation, rocks) - Lamp posts, signs - Rain/fog droplets (at
high frequencies)

**Rayleigh scattering** (object size \$\ll\$
\$\lambda\$):

``` math
P_{\text{scattered}} \propto \frac{1}{\lambda^4}
```

**Example**: Blue sky (visible light Rayleigh scattering from air
molecules)

<div class="center">

------------------------------------------------------------------------

</div>

## Time-Domain Effects

### Delay Spread

**Multipath components arrive at different times**:

``` math
\tau_{\text{rms}} = \sqrt{\frac{\sum P_i (\tau_i - \bar{\tau})^2}{\sum P_i}}
```

Where: - $`P_i`$ = Power of path $`i`$ - $`\tau_i`$ = Delay of path
$`i`$ - $`\bar{\tau}`$ = Mean delay

**Typical values**: - **Rural/suburban**: 0.1-1
\$\mu\$s - **Urban**: 1-5 \$\mu\$s -
**Indoor**: 10-100 ns

<div class="center">

------------------------------------------------------------------------

</div>

### Coherence Bandwidth

**Frequency range over which channel response is flat**:

``` math
B_c \approx \frac{1}{5\tau_{\text{rms}}}
```

**Implication**: If signal bandwidth $`B > B_c`$
\$\rightarrow\$ **Frequency-selective fading**
(different frequencies fade independently)

**Example**: Urban ($`\tau_{\text{rms}} = 1\ \mu`$s):

``` math
B_c \approx \frac{1}{5 \times 10^{-6}} = 200\ \text{kHz}
```

- **Narrowband signal** (\< 200 kHz): Flat fading

- **Wideband signal** (\> 200 kHz): Frequency-selective
  fading (ISI)

<div class="center">

------------------------------------------------------------------------

</div>

### Intersymbol Interference (ISI)

**Delayed multipath overlaps with next symbol**:

**Condition for ISI**:

``` math
\tau_{\text{rms}} > T_s
```

Where $`T_s`$ = Symbol period

**Example**: 1 Mbps data ($`T_s = 1\ \mu`$s), urban channel
($`\tau_{\text{rms}} = 3\ \mu`$s): - ISI severe (3 symbols overlap!) -
**Mitigation**: Equalization, OFDM (see
\[\[OFDM-&-Multicarrier-Modulation\]\])

<div class="center">

------------------------------------------------------------------------

</div>

## Frequency-Domain Effects

### Doppler Shift

**Relative motion between TX/RX causes frequency shift**:

``` math
f_d = \frac{v}{\lambda} \cos(\theta)
```

Where: - $`v`$ = Velocity (m/s) - $`\theta`$ = Angle between velocity
and signal direction - $`f_d`$ = Doppler shift (Hz)

**Example**: Car at 100 km/h (27.8 m/s), 2 GHz signal:

``` math
f_d = \frac{27.8}{0.15} \cos(0°) = 185\ \text{Hz}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Doppler Spread

**Multiple paths with different Doppler shifts**:

``` math
B_d = 2f_{d,\text{max}} = \frac{2v}{\lambda}
```

**Coherence time** (how long channel stays constant):

``` math
T_c \approx \frac{0.423}{B_d}
```

**Example**: 100 km/h at 2 GHz:

``` math
B_d = 2 \times 185 = 370\ \text{Hz}
```

``` math
T_c = \frac{0.423}{370} = 1.14\ \text{ms}
```

**Implication**: Channel changes every ~1 ms (fast
fading for stationary systems, slow fading for fast data rates)

<div class="center">

------------------------------------------------------------------------

</div>

## Fading Classifications

### Flat vs Frequency-Selective

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Type</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Condition</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Effect</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Mitigation</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Flat</strong></td>
<td style="text-align: left;"><span class="math inline"><em>B</em> ≪ <em>B</em><sub><em>c</em></sub></span></td>
<td style="text-align: left;">All frequencies fade together</td>
<td style="text-align: left;">Diversity, FEC</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Frequency-selective</strong></td>
<td style="text-align: left;"><span class="math inline"><em>B</em> ≫ <em>B</em><sub><em>c</em></sub></span></td>
<td style="text-align: left;">Different frequencies
fade independently</td>
<td style="text-align: left;">Equalization, OFDM</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

### Fast vs Slow Fading

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Type</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Condition</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Effect</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Mitigation</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Slow</strong></td>
<td style="text-align: left;"><span class="math inline"><em>T</em><sub><em>c</em></sub> ≫ <em>T</em><sub><em>s</em></sub></span></td>
<td style="text-align: left;">Channel constant over many symbols</td>
<td style="text-align: left;">Interleaving, FEC</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Fast</strong></td>
<td style="text-align: left;"><span class="math inline"><em>T</em><sub><em>c</em></sub> ≪ <em>T</em><sub><em>s</em></sub></span></td>
<td style="text-align: left;">Channel changes within symbol</td>
<td style="text-align: left;">Pilot-aided estimation</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Rayleigh Fading

**Occurs when**: **No dominant LOS path**, many scattered
components with random phases

**Statistical model**: Envelope follows **Rayleigh
distribution**

### PDF (Probability Density Function)

``` math
p(r) = \frac{r}{\sigma^2} \exp\left(-\frac{r^2}{2\sigma^2}\right), \quad r \geq 0
```

Where: - $`r`$ = Signal envelope - $`\sigma^2`$ = Average power

**Mean**: $`\bar{r} = \sigma\sqrt{\pi/2}`$

**Variance**: $`\text{Var}(r) = \sigma^2(2 - \pi/2)`$

<div class="center">

------------------------------------------------------------------------

</div>

### CDF (Cumulative Distribution Function)

**Probability that signal \< threshold**:

``` math
P(r < R) = 1 - \exp\left(-\frac{R^2}{2\sigma^2}\right)
```

**Example**: Probability signal drops below 10 dB below average:

``` math
P(r < 0.316\bar{r}) = 1 - \exp(-0.05) \approx 5\%
```

<div class="center">

------------------------------------------------------------------------

</div>

### Impact on BER

**Rayleigh fading severely degrades performance**:

**BPSK in Rayleigh fading**:

``` math
\text{BER} = \frac{1}{2}\left(1 - \sqrt{\frac{\bar{\gamma}}{1 + \bar{\gamma}}}\right)
```

Where $`\bar{\gamma} = E_b/N_0`$ (average SNR)

**Comparison** (at 10 dB average SNR): - **AWGN**: BER = 3.9
\$\times\$
10\textsuperscript{-}\textsuperscript{6}
- **Rayleigh fading**: BER = 0.005 (1000\$\times\$
worse!)

**Key insight**: Deep fades cause **error bursts** (when
signal drops into noise floor)

<div class="center">

------------------------------------------------------------------------

</div>

### Applications

**Typical Rayleigh environments**: - Dense urban (no LOS, many
reflections) - Indoor (office, corridors) - Suburban/rural (obstructed
by trees/buildings)

<div class="center">

------------------------------------------------------------------------

</div>

## Rician Fading

**Occurs when**: **Dominant LOS path + scattered components**

**Statistical model**: Envelope follows **Rician
distribution**

### PDF

``` math
p(r) = \frac{r}{\sigma^2} \exp\left(-\frac{r^2 + A^2}{2\sigma^2}\right) I_0\left(\frac{Ar}{\sigma^2}\right)
```

Where: - $`A`$ = Amplitude of LOS component - $`I_0`$ = Modified Bessel
function of first kind, order 0

**Rician K-factor**:

``` math
K = \frac{A^2}{2\sigma^2} = \frac{\text{LOS power}}{\text{Scattered power}}
```

**K in dB**: $`K_{\text{dB}} = 10\log_{10}(K)`$

<div class="center">

------------------------------------------------------------------------

</div>

### Interpretation of K-factor

| K (dB)                | Environment            | Fading Severity         |
|:----------------------|:-----------------------|:------------------------|
| **-\$\infty\$ (K=0)** | No LOS (pure Rayleigh) | **Severe** (deep fades) |
| **0 dB (K=1)**        | Equal LOS/scatter      | Moderate                |
| **6 dB (K=4)**        | Strong LOS             | Mild                    |
| **10 dB (K=10)**      | Dominant LOS           | Negligible fading       |
| **+\$\infty\$**       | Pure LOS (AWGN-like)   | None                    |

**Special case**: $`K = 0`$ \$\rightarrow\$ Rayleigh
fading (Rician generalizes Rayleigh)

<div class="center">

------------------------------------------------------------------------

</div>

### Impact on BER

**Rician fading is less severe than Rayleigh**:

**BPSK in Rician fading**:

``` math
\text{BER} = Q\left(\sqrt{\frac{2K\bar{\gamma}}{K+1}}\right) \exp\left(-\frac{K\bar{\gamma}}{K+1}\right) \times ...
```

(Complex expression, see textbooks)

**Comparison** (10 dB average SNR): - **AWGN**: BER = 3.9
\$\times\$
10\textsuperscript{-}\textsuperscript{6}
- **Rician K=6 dB**: BER \$\approx\$
10\textsuperscript{-}\textsuperscript{5}
(better than Rayleigh, worse than AWGN) - **Rayleigh (K=0)**: BER =
0.005

<div class="center">

------------------------------------------------------------------------

</div>

### Applications

**Typical Rician environments**: - Suburban with partial LOS -
Elevated antennas (rooftops) - Satellite-to-handheld (weak LOS + ground
reflections) - Indoor near windows (outdoor LOS + indoor scatter)

<div class="center">

------------------------------------------------------------------------

</div>

## Fade Depth & Duration

### Fade Margin

**Link budget must include fade margin** to maintain target
availability:

``` math
P_r(\text{min}) = P_r(\text{average}) - M_{\text{fade}}
```

**Example**: Target 99% availability (1% outage)

**Rayleigh fading**: 10% of time, signal \< -10 dB below
average - Need **10 dB margin** for 90% availability - Need
**20 dB margin** for 99% availability

**Rician K=6 dB**: Fades less severe - ~5 dB margin
for 90% - ~10 dB margin for 99%

<div class="center">

------------------------------------------------------------------------

</div>

### Level Crossing Rate (LCR)

**How often signal crosses threshold** (in fades/sec):

``` math
N_R = \sqrt{2\pi} f_d \rho \exp(-\rho^2)
```

Where: - $`f_d`$ = Maximum Doppler frequency -
$`\rho = R/R_{\text{rms}}`$ (normalized threshold)

**Example**: Mobile at 100 km/h, 2 GHz ($`f_d = 185`$ Hz),
threshold = average power ($`\rho = 1`$):

``` math
N_R = \sqrt{2\pi} \times 185 \times 1 \times \exp(-1) \approx 85\ \text{fades/sec}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Average Fade Duration

``` math
\bar{t} = \frac{\exp(\rho^2) - 1}{\rho f_d \sqrt{2\pi}}
```

**Example**: Same scenario, threshold = average:

``` math
\bar{t} = \frac{e - 1}{1 \times 185 \times \sqrt{2\pi}} \approx 3.7\ \text{ms}
```

**Implication**: Fast fading (85 fades/sec), short fades
(~4 ms) \$\rightarrow\$ Interleaving
effective

<div class="center">

------------------------------------------------------------------------

</div>

## Mitigation Techniques

### 1. Diversity

**Combine multiple independent fading signals**:

#### Spatial Diversity (Antenna Diversity)

**Separate antennas by** $`d > \lambda/2`$:

**Diversity gain**: ~10 dB improvement with 2
antennas (selection combining)

**Example**: WiFi access point with 2 antennas (2.4 GHz,
$`\lambda = 12.5`$ cm): - Antenna spacing: 6 cm minimum - Result:
Probability both antennas in deep fade is very low

<div class="center">

------------------------------------------------------------------------

</div>

#### Frequency Diversity

**Transmit same data on multiple frequencies** separated by
$`> B_c`$:

**Application**: Frequency hopping spread spectrum (FHSS)

<div class="center">

------------------------------------------------------------------------

</div>

#### Time Diversity

**Transmit same data at different times** separated by $`> T_c`$:

**Implementation**: Interleaving + FEC (spread coded bits over
time)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Equalization

**Compensate for frequency-selective fading** (ISI):

#### Linear Equalization (LE)

**Zero-forcing (ZF)**: Invert channel response

``` math
H_{\text{eq}}(f) = \frac{1}{H_{\text{channel}}(f)}
```

**Problem**: Noise amplification at deep fades

<div class="center">

------------------------------------------------------------------------

</div>

#### Decision-Feedback Equalization (DFE)

**Use past decisions** to cancel ISI:

**Better than ZF**: Doesn't amplify noise as much

<div class="center">

------------------------------------------------------------------------

</div>

#### Adaptive Equalization

**Track time-varying channel**:

**Algorithms**: LMS (Least Mean Squares), RLS (Recursive Least
Squares)

**Training**: Periodic pilot symbols to update equalizer
coefficients

<div class="center">

------------------------------------------------------------------------

</div>

### 3. OFDM

**Divide wideband signal into many narrowband subcarriers**:

**Each subcarrier \< $`B_c`$**
\$\rightarrow\$ Flat fading per subcarrier

**Per-subcarrier equalization**: Simple single-tap equalizer

**See**: \[\[OFDM-&-Multicarrier-Modulation\]\]

<div class="center">

------------------------------------------------------------------------

</div>

### 4. Spread Spectrum

**Spread signal over wide bandwidth**:

**Frequency diversity**: Different frequency components fade
independently

**See**: \[\[Spread-Spectrum-(DSSS-FHSS)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

### 5. Error Correction Coding

**FEC protects against error bursts**:

**Interleaving**: Spread coded bits across time/frequency

**Example**: Convolutional code + interleaver - Error burst of 10
bits \$\rightarrow\$ Spread across 100+ bit positions -
Decoder sees isolated errors (easier to correct)

**See**: \[\[Forward-Error-Correction-(FEC)\]\],
\[\[LDPC-Codes\]\]

<div class="center">

------------------------------------------------------------------------

</div>

## Channel Models

### Rayleigh Fading Channel (MATLAB/Python)

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

### Rician Fading Channel

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Examples

### Example 1: Urban Cellular (900 MHz)

**Environment**: Dense urban, NLOS

**Parameters**: - Delay spread: $`\tau_{\text{rms}} = 3\ \mu`$s -
Doppler: $`f_d = 50`$ Hz (30 km/h) - Fading: Rayleigh

**Coherence bandwidth**:

``` math
B_c = \frac{1}{5 \times 3 \times 10^{-6}} = 67\ \text{kHz}
```

**Implication**: GSM channel (200 kHz) experiences
frequency-selective fading \$\rightarrow\$ Equalizer
needed

**Coherence time**:

``` math
T_c = \frac{0.423}{100} = 4.23\ \text{ms}
```

**Implication**: Channel constant over ~18 GSM
symbols (0.577 ms/symbol) \$\rightarrow\$ Slow fading

<div class="center">

------------------------------------------------------------------------

</div>

### Example 2: Suburban LTE (2.6 GHz)

**Environment**: Suburban, partial LOS

**Parameters**: - Delay spread: $`\tau_{\text{rms}} = 0.5\ \mu`$s -
Doppler: $`f_d = 240`$ Hz (100 km/h) - Fading: Rician K=5 dB

**Coherence bandwidth**:

``` math
B_c = \frac{1}{5 \times 0.5 \times 10^{-6}} = 400\ \text{kHz}
```

**Implication**: LTE RB (180 kHz) \< $`B_c`$
\$\rightarrow\$ Mostly flat fading per RB

**Coherence time**:

``` math
T_c = \frac{0.423}{480} = 0.88\ \text{ms}
```

**Implication**: Channel changes over ~12 OFDM
symbols (71 \$\mu\$s/symbol) \$\rightarrow\$
Moderate fading, pilot-aided tracking

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Parameter</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Rayleigh</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Rician (K=6 dB)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>AWGN</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>LOS component</strong></td>
<td style="text-align: left;">None</td>
<td style="text-align: left;">Dominant</td>
<td style="text-align: left;">Pure LOS</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Fade depth (10% time)</strong></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>BER penalty @ 10 dB SNR</strong></td>
<td style="text-align: left;">$\times$</td>
<td style="text-align: left;">$\times$</td>
<td style="text-align: left;">$\times$ (baseline)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Mitigation</strong></td>
<td style="text-align: left;">Diversity, FEC</td>
<td style="text-align: left;">Moderate FEC</td>
<td style="text-align: left;">Minimal FEC</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Typical environment</strong></td>
<td style="text-align: left;">Dense urban, indoor</td>
<td style="text-align: left;">Suburban, elevated</td>
<td style="text-align: left;">Free space, satellite</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Propagation-Modes-(Ground-Wave,-Sky-Wave,-Line-of-Sight)\]\]**:
  LOS vs NLOS propagation

- **\[\[Atmospheric-Effects-(Ionospheric,-Tropospheric)\]\]**:
  Clear-air effects (different from multipath)

- **\[\[Signal-to-Noise-Ratio-(SNR)\]\]**: Fading reduces
  instantaneous SNR

- **\[\[Bit-Error-Rate-(BER)\]\]**: Fading degrades BER
  significantly

- **\[\[QPSK-Modulation\]\]** /
  **\[\[LDPC-Codes\]\]**: Require fade mitigation

- **\[\[OFDM-&-Multicarrier-Modulation\]\]**: Combats
  frequency-selective fading

- **\[\[Spread-Spectrum-(DSSS-FHSS)\]\]**: Provides frequency
  diversity

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Multipath fading is the dominant
impairment** in mobile/urban wireless. Rayleigh fading (no LOS) is
severe, Rician fading (with LOS) is moderate. Mitigation requires
diversity, equalization, OFDM, and robust FEC. Understanding $`B_c`$ and
$`T_c`$ is critical for system design.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
