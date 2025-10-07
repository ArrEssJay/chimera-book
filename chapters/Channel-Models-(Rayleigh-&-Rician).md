---
layout: chapter
title: "Channel-Models-(Rayleigh-&-Rician)"
chapter: 18
permalink: /chapters/channel-models-(rayleigh-&-rician)/
---

# Channel Models: Rayleigh & Rician Implementation

\[\[Home\]\] **Link Budget & System Performance**
\[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\]
\[\[Signal-to-Noise-Ratio-(SNR)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Channel models are like flight simulators for radio
engineers---they let you test communication systems in virtual
cities, tunnels, and open fields before building real hardware!**

**The problem**: - Can't test every scenario:
urban, suburban, highway, indoor, etc. - Real-world testing is expensive
(need hardware, locations, permits) - Need to test in bad conditions
(rain, crowds, interference) - Can't test satellites or
Mars missions easily!

**The solution - Mathematical simulation**: - Create computer
models of radio environments - Run communication system in simulation -
See how well it performs - Fix problems BEFORE building hardware!

**The two main models**:

**1. Rayleigh Fading** (no line-of-sight): - **Environment**:
Dense urban (downtown), indoors, tunnels - **Characteristic**:
Signal bounces everywhere, no direct path - **Result**: Wild signal
fluctuations (30+ dB swings!) - **Example**: Walking through city,
WiFi in building with walls

**2. Rician Fading** (strong line-of-sight): -
**Environment**: Suburban, rural, highways, open areas -
**Characteristic**: One strong direct path + weaker echoes -
**Result**: More stable signal, less severe fading -
**Example**: Highway cell tower, rural WiFi

**How engineers use models**:

**Step 1**: Pick scenario - “Designing WiFi for dense apartment
building” \$\rightarrow\$ use Rayleigh - “Designing
highway cell system” \$\rightarrow\$ use Rician

**Step 2**: Run simulation - Send 1 million test bits through model
- Model adds realistic fading, multipath, noise

**Step 3**: Measure performance - How many errors? (Bit Error Rate)
- How fast can it go? (Data rate) - Does it meet requirements?

**Step 4**: Iterate - Try different modulations (QPSK vs 64-QAM) -
Add error correction (FEC) - Optimize until it works!

**Real-world impact**: - **5G standard**: Tested in
standardized channel models before deployment - **Your WiFi**:
Manufacturers test with Rayleigh/Rician models - **Satellite
systems**: Simulated before launching \$500M satellite! -
**Military radios**: Tested in tactical channel models

**Why simulation beats real testing**: - **Reproducible**:
Same conditions every test - **Extreme scenarios**: Test 99.9th
percentile bad cases - **Fast**: Test 10,000 scenarios in hours -
**Cheap**: No hardware, no permits, no travel - **Safe**: Can
test failure modes without consequences

**Standards bodies define models**: - **3GPP**: Defines
channel models for 4G/5G (TDL-A, TDL-B, TDL-C) - **ITU**: Defines
models for satellite, fixed wireless - **WiFi**: IEEE 802.11
working groups define indoor/outdoor models

**Fun fact**: When engineers designed the LTE standard (4G), they
ran over 1 million simulations using standardized channel models. This
is why 4G “just worked” globally from day
one---they'd already tested every conceivable
environment virtually!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Channel models** simulate propagation effects for communication
system design and testing.

**Purpose**: - **System simulation**: Test modulation/coding
without real-world deployment - **Performance prediction**:
Estimate BER vs SNR for different environments - **Algorithm
development**: Design equalizers, synchronizers without hardware -
**Standards compliance**: 3GPP, ITU specify reference channel
models

**Key models**: 1. **AWGN**: Ideal (additive white Gaussian
noise only) 2. **Rayleigh fading**: NLOS multipath (no dominant
path) 3. **Rician fading**: LOS + multipath (K-factor parameterizes
LOS strength) 4. **Frequency-selective**: Wideband channels with
delay spread (ISI)

<div class="center">

------------------------------------------------------------------------

</div>

## AWGN Channel

**Simplest model**: Received signal = transmitted signal + Gaussian
noise

``` math
r(t) = s(t) + n(t)
```

Where: - $`s(t)`$ = Transmitted signal - $`n(t)`$ = White Gaussian
noise, variance $`\sigma^2 = N_0 B`$

### Implementation (MATLAB/Python)

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

**Usage**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Flat Fading Channel

**Narrowband model**: Single complex gain + AWGN

``` math
r(t) = h(t) \cdot s(t) + n(t)
```

Where: - $`h(t)`$ = Complex channel gain (time-varying) - $`|h(t)|`$ =
Amplitude (Rayleigh or Rician distributed) - $`\angle h(t)`$ = Phase
(uniformly distributed)

**Flat fading applies when**: Signal bandwidth $`\ll`$ coherence
bandwidth

<div class="center">

------------------------------------------------------------------------

</div>

## Rayleigh Fading Channel

**Model**: No LOS, many scattered paths with equal power

### Statistical Properties

**Envelope** $`r = |h(t)|`$ follows **Rayleigh distribution**:

``` math
p(r) = \frac{r}{\sigma^2} \exp\left(-\frac{r^2}{2\sigma^2}\right), \quad r \geq 0
```

**Mean**: $`\bar{r} = \sigma\sqrt{\pi/2}`$

**Variance**: $`\sigma_r^2 = \sigma^2(2 - \pi/2)`$

**Normalized** (average power = 1): $`\sigma^2 = 1/2`$

<div class="center">

------------------------------------------------------------------------

</div>

### Clarke's Model (Isotropic Scattering)

**Assumption**: Infinite scatterers uniformly distributed in
azimuth

**Doppler spectrum** (U-shaped):

``` math
S(f) = \frac{1}{\pi f_d \sqrt{1 - (f/f_d)^2}}, \quad |f| < f_d
```

Where $`f_d = v/\lambda`$ = Maximum Doppler frequency

**Autocorrelation**:

``` math
R(\tau) = J_0(2\pi f_d \tau)
```

$`J_0`$ = Bessel function of first kind, order 0

<div class="center">

------------------------------------------------------------------------

</div>

### Jakes' Model (Sum of Sinusoids)

**Efficient implementation** using sum of sinusoids:

**In-phase component**:

``` math
h_I(t) = \frac{1}{\sqrt{M}} \sum_{m=1}^{M} \cos(2\pi f_d t \cos\theta_m + \phi_m)
```

**Quadrature component**:

``` math
h_Q(t) = \frac{1}{\sqrt{M}} \sum_{m=1}^{M} \sin(2\pi f_d t \cos\theta_m + \phi_m)
```

Where: - $`M`$ = Number of scatterers (typically 8-20) -
$`\theta_m = \frac{2\pi m}{M}`$ (equally spaced angles) - $`\phi_m`$ =
Random phase, uniform \[0, 2\$\pi\$\]

**Complex channel gain**:

``` math
h(t) = h_I(t) + j h_Q(t)
```

<div class="center">

------------------------------------------------------------------------

</div>

### Implementation (Jakes' Model)

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

**Usage**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

### Verification

**Check statistics**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Rician Fading Channel

**Model**: Dominant LOS + scattered components

### Statistical Properties

**Envelope** follows **Rician distribution**:

``` math
p(r) = \frac{r}{\sigma^2} \exp\left(-\frac{r^2 + A^2}{2\sigma^2}\right) I_0\left(\frac{Ar}{\sigma^2}\right)
```

Where: - $`A`$ = Amplitude of LOS component - $`I_0`$ = Modified Bessel
function of first kind, order 0

**K-factor** (ratio of LOS to scattered power):

``` math
K = \frac{A^2}{2\sigma^2}
```

**In dB**: $`K_{\text{dB}} = 10\log_{10}(K)`$

**Special cases**: - $`K = 0`$ (K = -\$\infty\$ dB):
Pure Rayleigh (no LOS) - $`K \to \infty`$: Pure LOS (AWGN-like)

<div class="center">

------------------------------------------------------------------------

</div>

### Implementation (LOS + Rayleigh)

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

**Usage**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

### Verification

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Frequency-Selective Fading (Tapped Delay Line)

**Wideband model**: Multiple delayed copies (taps)

``` math
h(t, \tau) = \sum_{l=0}^{L-1} h_l(t) \delta(\tau - \tau_l)
```

Where: - $`L`$ = Number of paths (taps) - $`h_l(t)`$ = Complex gain of
path $`l`$ (Rayleigh or Rician) - $`\tau_l`$ = Delay of path $`l`$

**Received signal**:

``` math
r(t) = \sum_{l=0}^{L-1} h_l(t) s(t - \tau_l) + n(t)
```

<div class="center">

------------------------------------------------------------------------

</div>

### Implementation (Tapped Delay Line)

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

**Usage (Urban channel)**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Standard Channel Models

### 3GPP Spatial Channel Model (SCM)

**LTE/5G NR channel models**:

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Model</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Environment</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Delay Spread</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Doppler</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>K-factor</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>EPA</strong></td>
<td style="text-align: left;">Extended Pedestrian A</td>
<td style="text-align: left;">$\mu$s</td>
<td style="text-align: left;">Low
(3 km/h)</td>
<td style="text-align: left;">-</td>
</tr>
<tr>
<td style="text-align: left;"><strong>EVA</strong></td>
<td style="text-align: left;">Extended Vehicular A</td>
<td style="text-align: left;">$\mu$s</td>
<td style="text-align: left;">Medium (30 km/h)</td>
<td style="text-align: left;">-</td>
</tr>
<tr>
<td style="text-align: left;"><strong>ETU</strong></td>
<td style="text-align: left;">Extended Typical Urban</td>
<td style="text-align: left;">$\mu$s</td>
<td style="text-align: left;">High (120 km/h)</td>
<td style="text-align: left;">-</td>
</tr>
<tr>
<td style="text-align: left;"><strong>CDL-A</strong></td>
<td style="text-align: left;">Clustered Delay Line A</td>
<td style="text-align: left;">NLOS (varies)</td>
<td style="text-align: left;">Configurable</td>
<td style="text-align: left;">Rayleigh</td>
</tr>
<tr>
<td style="text-align: left;"><strong>CDL-B</strong></td>
<td style="text-align: left;">Clustered Delay Line B</td>
<td style="text-align: left;">NLOS</td>
<td style="text-align: left;">Configurable</td>
<td style="text-align: left;">Rayleigh</td>
</tr>
<tr>
<td style="text-align: left;"><strong>CDL-C</strong></td>
<td style="text-align: left;">Clustered Delay Line C</td>
<td style="text-align: left;">LOS</td>
<td style="text-align: left;">Configurable</td>
<td style="text-align: left;">Rician
(K=13 dB)</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

### ITU-R Pedestrian/Vehicular Models

**Pedestrian A** (low delay spread):

| Tap | Delay (ns) | Power (dB) |
|:----|:-----------|:-----------|
|     | 0          | 0          |
| 2   | 110        | -9.7       |
| 3   | 190        | -19.2      |
| 4   | 410        | -22.8      |

**Vehicular A** (moderate delay spread):

| Tap | Delay (ns) | Power (dB) |
|:----|:-----------|:-----------|
|     | 0          | 0          |
| 2   | 310        | -1         |
| 3   | 710        | -9         |
| 4   | 1090       | -10        |
| 5   | 1730       | -15        |
| 6   | 2510       | -20        |

<div class="center">

------------------------------------------------------------------------

</div>

### Implementation (3GPP EPA)

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Doppler Spectrum Visualization

**Verify Doppler spread**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## BER Simulation with Fading

**Complete system simulation**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Channel Estimation

**Practical systems need to estimate** $`h(t)`$:

### Pilot-Based Estimation

**Insert known symbols (pilots) periodically**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

## Summary of Channel Models

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Model</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Use Case</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Complexity</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Realism</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>AWGN</strong></td>
<td style="text-align: left;">Satellite LOS, benchmarking</td>
<td style="text-align: left;">Low</td>
<td style="text-align: left;">Idealized</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Rayleigh (Jakes)</strong></td>
<td style="text-align: left;">Urban NLOS, mobile</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Good for
NLOS</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Rician</strong></td>
<td style="text-align: left;">Suburban LOS+scatter</td>
<td style="text-align: left;">Medium</td>
<td style="text-align: left;">Good for partial
LOS</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Tapped delay line</strong></td>
<td style="text-align: left;">Wideband, frequency-selective</td>
<td style="text-align: left;">High</td>
<td style="text-align: left;">Excellent</td>
</tr>
<tr>
<td style="text-align: left;"><strong>3GPP CDL</strong></td>
<td style="text-align: left;">LTE/5G NR</td>
<td style="text-align: left;">Very high</td>
<td style="text-align: left;">Industry standard</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Implementation Tips

1.  **Sampling rate**: Choose $`f_s \gg 2f_d`$ to avoid aliasing
    Doppler spectrum (typically $`f_s > 50 f_d`$)

2.  **Number of scatterers**: M = 8-16 sufficient for
    Jakes' model (higher M = smoother statistics but
    slower)

3.  **Normalization**: Always verify average channel power = 1 (so
    SNR definition consistent)

4.  **CSI assumption**: Perfect CSI (known h)
    \$\rightarrow\$ Upper bound. Pilot-based estimation
    \$\rightarrow\$ Practical performance

5.  **Long simulations**: Need many fade cycles for accurate BER
    (typically $`> 100/\text{BER}`$ bits)

6.  **Tap spacing**: For frequency-selective, ensure tap delays match
    expected delay spread ($`\tau_{\text{rms}}`$)

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\]**:
  Theory behind channel models

- **\[\[Signal-to-Noise-Ratio-(SNR)\]\]**: SNR definition for
  fading channels

- **\[\[Bit-Error-Rate-(BER)\]\]**: Performance metric vs
  fading

- **\[\[Complete-Link-Budget-Analysis\]\]**: Using fading
  margin in link budget

- **\[\[OFDM-&-Multicarrier-Modulation\]\]**: Combats
  frequency-selective fading

- **\[\[Channel-Equalization\]\]**: Compensates for ISI in
  frequency-selective channels

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Channel models enable realistic system
simulation without hardware.** AWGN is baseline, Rayleigh for NLOS
mobile, Rician for partial LOS, tapped delay line for wideband ISI.
Jakes' model efficiently generates Rayleigh fading with
correct Doppler spectrum. 3GPP CDL models are industry-standard for
LTE/5G. Pilot-based channel estimation is practical approach. Always
verify statistics (envelope PDF, average power, Doppler spectrum) match
theory.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
