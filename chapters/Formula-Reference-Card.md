---
layout: chapter
title: "Formula-Reference-Card"
chapter: 24
permalink: /chapters/formula-reference-card/
---

# Formula Reference Card

\[\[Home\]\] **Quick Reference**

<div class="center">

------------------------------------------------------------------------

</div>

##  Link Budget & Propagation

### Friis Transmission Equation

See \[\[Free-Space-Path-Loss-(FSPL)\]\]

``` math
P_r = \frac{P_t G_t G_r \lambda^2}{(4\pi R)^2}
```

Or in dB:

``` math
P_r\ (\text{dBm}) = P_t\ (\text{dBm}) + G_t\ (\text{dBi}) + G_r\ (\text{dBi}) - \text{FSPL}\ (\text{dB})
```

### Free-Space Path Loss

``` math
\text{FSPL}\ (\text{dB}) = 20\log_{10}(R) + 20\log_{10}(f) + 32.45
```

Where: R in km, f in MHz

Or:

``` math
\text{FSPL}\ (\text{dB}) = 20\log_{10}(R) + 20\log_{10}(f) - 147.55
```

Where: R in meters, f in Hz

### Power Density

See \[\[Power-Density-&-Field-Strength\]\]

``` math
S = \frac{P_t G}{4\pi R^2} \quad (\text{W/m}^2)
```

``` math
E_{\text{rms}} = \sqrt{377 \times S} \approx 19.4\sqrt{S} \quad (\text{V/m})
```

<div class="center">

------------------------------------------------------------------------

</div>

##  Signal Quality Metrics

### Signal-to-Noise Ratio

See \[\[Signal-to-Noise-Ratio-(SNR)\]\]

``` math
\text{SNR} = \frac{P_{\text{signal}}}{P_{\text{noise}}}
```

In dB:

``` math
\text{SNR}_{\text{dB}} = 10\log_{10}(\text{SNR})
```

### Energy Ratios

See \[\[Energy-Ratios-(Es-N0-and-Eb-N0)\]\]

``` math
\frac{E_b}{N_0} = \frac{P_r}{R_b N_0} = \text{SNR} \cdot \frac{B}{R_b}
```

``` math
\frac{E_s}{N_0} = \frac{E_b}{N_0} \cdot \log_2(M)
```

Where M = constellation size

### Thermal Noise Power

See \[\[Noise-Sources-&-Noise-Figure\]\]

``` math
N = kTB
```

Where: - k = 1.38 \$\times\$
10\textsuperscript{-}\textsuperscript{2}\textsuperscript{3}
J/K (Boltzmann's constant) - T = Temperature (K) - B =
Bandwidth (Hz)

In dBm:

``` math
N\ (\text{dBm}) = -174 + 10\log_{10}(B)
```

For T = 290 K, B in Hz

<div class="center">

------------------------------------------------------------------------

</div>

##  Information Theory

### Shannon Channel Capacity

See \[\[Shannon's-Channel-Capacity-Theorem\]\]

``` math
C = B \log_2(1 + \text{SNR}) \quad (\text{bits/sec})
```

### Spectral Efficiency

See \[\[Spectral-Efficiency-&-Bit-Rate\]\]

``` math
\eta = \frac{R_b}{B} \quad (\text{bits/sec/Hz})
```

Shannon limit:

``` math
\eta_{\max} = \log_2(1 + \text{SNR})
```

<div class="center">

------------------------------------------------------------------------

</div>

##  Bit Error Rate (BER)

See \[\[Bit-Error-Rate-(BER)\]\]

### Q-Function

``` math
Q(x) = \frac{1}{\sqrt{2\pi}} \int_x^\infty e^{-t^2/2} dt
```

Approximation:

``` math
Q(x) \approx \frac{1}{x\sqrt{2\pi}} e^{-x^2/2} \quad (x > 3)
```

### BPSK in AWGN

See \[\[Binary-Phase-Shift-Keying-(BPSK)\]\]

``` math
\text{BER} = Q\left(\sqrt{\frac{2E_b}{N_0}}\right)
```

### QPSK in AWGN

See \[\[QPSK-Modulation\]\]

``` math
\text{BER} \approx Q\left(\sqrt{\frac{2E_b}{N_0}}\right)
```

(Same as BPSK for Gray coding)

### M-PSK in AWGN

``` math
\text{BER} \approx \frac{2}{\ log_2(M)} Q\left(\sqrt{\frac{2E_b}{N_0}\log_2(M)} \sin\left(\frac{\pi}{M}\right)\right)
```

### M-QAM in AWGN

See \[\[Quadrature-Amplitude-Modulation-(QAM)\]\]

``` math
\text{BER} \approx \frac{4}{\log_2(M)}\left(1 - \frac{1}{\sqrt{M}}\right) Q\left(\sqrt{\frac{3\log_2(M)}{M-1} \cdot \frac{E_b}{N_0}}\right)
```

<div class="center">

------------------------------------------------------------------------

</div>

##  Modulation

### IQ Representation

See \[\[IQ-Representation\]\]

``` math
s(t) = I(t)\cos(2\pi f_c t) - Q(t)\sin(2\pi f_c t)
```

Or:

``` math
s(t) = \text{Re}\{[I(t) + jQ(t)]e^{j2\pi f_c t}\}
```

### Symbol Rate vs Bit Rate

``` math
R_b = R_s \log_2(M)
```

Where: - R_b = Bit rate (bits/sec) - R_s = Symbol rate (symbols/sec) -
M = Constellation size

<div class="center">

------------------------------------------------------------------------

</div>

##  Propagation Effects

### Doppler Shift

See \[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\]

``` math
f_d = \frac{v}{\lambda} \cos(\theta) = \frac{vf_c}{c} \cos(\theta)
```

### Coherence Bandwidth

``` math
B_c \approx \frac{1}{5\tau_{\text{rms}}}
```

Where \$\tau\$\_rms = RMS delay spread

### Coherence Time

``` math
T_c \approx \frac{0.423}{B_d} = \frac{0.423}{2f_{d,\max}}
```

Where B_d = Doppler spread

### Rayleigh Fading PDF

See \[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\]

``` math
p(r) = \frac{r}{\sigma^2} \exp\left(-\frac{r^2}{2\sigma^2}\right)
```

### Rician K-Factor

``` math
K = \frac{A^2}{2\sigma^2} = \frac{\text{LOS power}}{\text{Scattered power}}
```

<div class="center">

------------------------------------------------------------------------

</div>

##  Antenna & Polarization

### Antenna Gain (Parabolic Dish)

See \[\[Antenna-Theory-Basics\]\]

``` math
G \approx \eta_{\text{ant}} \left(\frac{\pi D}{\lambda}\right)^2
```

### Effective Aperture

``` math
A_e = \frac{G\lambda^2}{4\pi}
```

### Polarization Loss Factor

See \[\[Wave-Polarization\]\]

For angle mismatch \$\theta\$:

``` math
\text{PLF} = \cos^2(\theta)
```

In dB:

``` math
L_{\text{pol}}\ (\text{dB}) = -20\log_{10}(\cos\theta)
```

<div class="center">

------------------------------------------------------------------------

</div>

##  Atmospheric Effects

### Rain Attenuation (ITU-R Model)

See \[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\]

``` math
A = \gamma R^{\beta} \quad (\text{dB/km})
```

Where: - \$\gamma\$, \$\beta\$ depend on
frequency and polarization - R = Rain rate (mm/hr)

### Faraday Rotation

See \[\[Wave-Polarization\]\]

``` math
\Omega = 2.36 \times 10^4 \frac{B_\parallel \cdot \text{TEC}}{f^2} \quad (\text{radians})
```

Where: - B\_\$\parallel\$ = Magnetic field (Tesla) - TEC =
Total Electron Content (electrons/m\textsuperscript{2})
- f = Frequency (Hz)

<div class="center">

------------------------------------------------------------------------

</div>

##  Error Correction

### Hamming Distance

See \[\[Hamming-Distance-&-Error-Detection\]\]

**Error detection capability**:

``` math
d_{\min} \geq t + 1
```

**Error correction capability**:

``` math
d_{\min} \geq 2t + 1
```

Where: - d_min = Minimum Hamming distance - t = Number of errors

### Code Rate

``` math
R_c = \frac{k}{n}
```

Where: - k = Information bits - n = Total bits (information + parity)

<div class="center">

------------------------------------------------------------------------

</div>

##  System Parameters

### Noise Figure

See \[\[Noise-Sources-&-Noise-Figure\]\]

``` math
F = \frac{\text{SNR}_{\text{in}}}{\text{SNR}_{\text{out}}}
```

In dB:

``` math
NF\ (\text{dB}) = 10\log_{10}(F)
```

### Cascade Noise Figure

``` math
F_{\text{total}} = F_1 + \frac{F_2 - 1}{G_1} + \frac{F_3 - 1}{G_1 G_2} + \ldots
```

### Processing Gain (Spread Spectrum)

See \[\[Spread-Spectrum-(DSSS-FHSS)\]\]

``` math
G_p = \frac{B_{\text{RF}}}{B_{\text{data}}}
```

In dB:

``` math
G_p\ (\text{dB}) = 10\log_{10}\left(\frac{B_{\text{RF}}}{B_{\text{data}}}\right)
```

<div class="center">

------------------------------------------------------------------------

</div>

##  MIMO Capacity

See \[\[MIMO-&-Spatial-Multiplexing\]\]

### Ergodic Capacity (known CSI at RX)

``` math
C = \log_2 \det\left(\mathbf{I}_{N_r} + \frac{\rho}{N_t} \mathbf{HH}^H\right) \quad (\text{bits/sec/Hz})
```

Where: - N_r, N_t = Number of RX/TX antennas - \$\rho\$
= SNR - H = Channel matrix

<div class="center">

------------------------------------------------------------------------

</div>

##  Useful Constants

| Constant | Symbol | Value |
|:---|:---|:---|
| **Speed of light** | c | 3 \$\times\$
10\textsuperscript{8} m/s |
| **Boltzmann's constant** | k | 1.38
\$\times\$
10\textsuperscript{-}\textsuperscript{2}\textsuperscript{3}
J/K |
| **Impedance of free space** | $`\eta_0`$ | 377
\$\Omega\$ |
| **Thermal noise floor** (290 K, 1 Hz) | \- | -174 dBm/Hz |

<div class="center">

------------------------------------------------------------------------

</div>

##  Unit Conversions

### Power

``` math
P\ (\text{dBm}) = 10\log_{10}(P\ (\text{mW}))
```

``` math
P\ (\text{dBW}) = P\ (\text{dBm}) - 30
```

### Wavelength \$\leftrightarrow\$ Frequency

``` math
\lambda = \frac{c}{f}
```

**Examples**: - 2.4 GHz \$\rightarrow\$
\$\lambda\$ = 12.5 cm - 900 MHz
\$\rightarrow\$ \$\lambda\$ = 33.3 cm - 28
GHz \$\rightarrow\$ \$\lambda\$ = 10.7 mm

<div class="center">

------------------------------------------------------------------------

</div>

##  Quick Reference Values

### BER vs Eb/N0 (BPSK)

| Eb/N0 (dB) | BER                                      |
|:-----------|:-----------------------------------------|
|            | 0.079                                    |
| 5          | 5.9 \$\times\$                           
              10\textsuperscript{-}\textsuperscript{4}  |
| 10         | 3.9 \$\times\$                           
              10\textsuperscript{-}\textsuperscript{6}  |
| 15         | 7.7 \$\times\$                           
              10\textsuperscript{-}\textsuperscript{9}  |

### Typical Link Budgets

**WiFi (2.4 GHz, 10 m)**: - TX power: 20 dBm (100 mW) - FSPL: -60
dB - RX power: -40 dBm

**Satellite (12 GHz, GEO)**: - TX power (EIRP): 50 dBW - FSPL: -206
dB - RX power: -156 dBW = -126 dBm

<div class="center">

------------------------------------------------------------------------

</div>

##  Common System Parameters

| System           | Frequency         | Modulation         | Coding           |
|:-----------------|:------------------|:-------------------|:-----------------|
| **WiFi 802.11g** | 2.4 GHz           | OFDM (BPSK-64QAM)  | Convolutional    |
| **LTE**          | 700 MHz - 2.6 GHz | OFDM (QPSK-256QAM) | Turbo            |
| **5G NR**        | 600 MHz - 40 GHz  | OFDM (QPSK-256QAM) | LDPC, Polar      |
| **GPS**          | 1.5 GHz           | BPSK               | None (spreading) |
| **DVB-S2**       | 10-12 GHz         | 8PSK, 16/32APSK    | LDPC + BCH       |

<div class="center">

------------------------------------------------------------------------

</div>

*For detailed derivations, see the linked wiki pages.*

*Updated: October 4, 2025*
