---
layout: chapter
title: "Antenna-Theory-Basics"
chapter: 7
permalink: /chapters/antenna-theory-basics/
---

# Antenna Theory Basics

\[\[Home\]\] **Foundation**
\[\[Electromagnetic-Spectrum\]\]
\[\[Maxwell's-Equations-&-Wave-Propagation\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**An antenna is like a funnel for radio waves---it
concentrates energy in one direction (transmit) or collects it from many
directions (receive).**

**Simple analogies**: - **Flashlight vs. bare bulb**: A
flashlight (directional antenna) focuses light. A bare bulb
(omnidirectional) lights up everything. - **Satellite dish**:
Curved shape collects weak space signals and focuses them onto a tiny
receiver - **Your cell phone**: Has multiple tiny antennas
inside---cellular, WiFi, GPS, Bluetooth (each tuned to different
frequencies)

**Key insights**: - **Bigger = stronger**: 10-meter dish
collects 100\$\times\$ more energy than 1-meter dish -
**Shape matters**: Long wire for AM radio, small stub for WiFi,
dish for satellites - **Trade-off**: Omnidirectional (WiFi router)
covers whole area but weak. Directional (satellite dish) is strong but
must point exactly right.

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

An **antenna** is a transducer that converts **electrical
signals into electromagnetic waves** (transmit) and vice versa (receive).
Antennas are governed by **reciprocity**: their transmit and
receive properties are identical.

**Fundamental principle**: Accelerating charges radiate EM energy
(\[\[Maxwell's-Equations-&-Wave-PropagationMaxwell's
equations\]\]).

<div class="center">

------------------------------------------------------------------------

</div>

## Key Antenna Parameters

### 1. Radiation Pattern

**The spatial distribution of radiated power**.

**Coordinate system**: - **Azimuth (\$\phi\$)**:
Horizontal angle (0\$^\circ\$ -
360\$^\circ\$) - **Elevation
(\$\theta\$)**: Vertical angle from zenith
(0\$^\circ\$ = straight up)

**Typical patterns**:

#### Isotropic Radiator (Theoretical)

- Radiates **equally in all directions** (sphere)

- **Power density** at distance $`r`$:

``` math
S = \frac{P_t}{4\pi r^2}
```

- **Does not exist in reality** (used as reference for gain)

<div class="center">

------------------------------------------------------------------------

</div>

#### Dipole (\$\lambda\$/2)

**Classic antenna**: Half-wavelength wire

**Pattern**: - **Omnidirectional in azimuth**
(\$\phi\$) - **Figure-8 in elevation**
(\$\theta\$): Nulls along wire axis

**3D pattern**: Donut-shaped (toroid)

**Radiation resistance**: $`R_r = 73\ \Omega`$ (lossless)

<div class="center">

------------------------------------------------------------------------

</div>

#### Directional Antennas

**Yagi-Uda** (TV antenna): - Single driven element (dipole) -
Parasitic elements (directors + reflector) - **Gain**: 10-15 dBi -
**Beamwidth**: ~30-60\$^\circ\$

**Parabolic Dish**: - Large aperture (diameter $`D \gg \lambda`$) -
**Gain**: 30-60 dBi (satellite comms) - **Beamwidth**:
$`\theta \approx 70 \lambda / D`$ degrees

**Phased Array**: - Multiple elements with controllable phase -
**Electronically steerable** beam (no mechanical movement) - Used
in: Radar, 5G base stations, \[\[AID-Protocol-Case-StudyAID
Protocol\]\] (THz)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Antenna Gain (G)

**Ratio of power density in preferred direction vs isotropic
radiator**.

``` math
G = \frac{S(\theta, \phi)}{S_{\text{iso}}}
```

**Units**: dBi (dB relative to isotropic)

**Typical gains**:

| Antenna Type                  | Gain (dBi) | Beamwidth                         |
|:------------------------------|:-----------|:----------------------------------|
| Isotropic (reference)         | 0 dBi      | 360\$^\circ\$ (all                
                                              directions)                        |
| Dipole (\$\lambda\$/2)        | 2.15 dBi   | ~78\$^\circ\$ (elevation)         |
| Monopole (\$\lambda\$/4)      | 5.15 dBi   | ~30\$^\circ\$ (over ground plane) |
| Patch (microstrip)            | 6-9 dBi    | ~70-90\$^\circ\$                  |
| Yagi (10 elements)            | 12-15 dBi  | ~30\$^\circ\$                     |
| Parabolic dish (1 m @ 10 GHz) | ~40 dBi    | ~2\$^\circ\$                      |
| Phased array (64 elements)    | 18-24 dBi  | Steerable                         |

**Relationship to directivity**:

``` math
G = \eta_{\text{ant}} \cdot D
```

Where: - $`D`$ = Directivity (concentrates power) -
$`\eta_{\text{ant}}`$ = Antenna efficiency (0.5-0.95 typical, accounts
for ohmic losses)

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Directivity (D)

**Power concentration factor** (independent of losses):

``` math
D = \frac{4\pi}{\Omega_A}
```

Where $`\Omega_A`$ is the **solid angle** of the main lobe
(steradians).

**Approximation** for narrow beams:

``` math
D \approx \frac{41,253}{\theta_E \cdot \theta_H}
```

Where: - $`\theta_E`$ = Elevation beamwidth (degrees) - $`\theta_H`$ =
Azimuth beamwidth (degrees)

**Example**: Beamwidth 10\$^\circ\$
\$\times\$ 10\$^\circ\$
\$\rightarrow\$
$`D = 41,253 / (10 \times 10) = 412.53 \approx 26.2`$ dBi

<div class="center">

------------------------------------------------------------------------

</div>

### 4. Beamwidth

**Angular width where power drops to half (-3 dB) of peak**.

**Half-power beamwidth (HPBW)**:

``` math
\theta_{\text{HPBW}} \approx \frac{k \lambda}{D}
```

Where: - $`D`$ = Antenna diameter (aperture antennas) - $`k`$ = Constant
(~70\$^\circ\$ for parabolic dishes)

**Example**: 1 m dish at 10 GHz ($`\lambda = 3`$ cm):

``` math
\theta_{\text{HPBW}} = \frac{70 \times 0.03}{1} = 2.1°
```

**Implication**: Narrow beams require **precise pointing**
(satellites, radar)

<div class="center">

------------------------------------------------------------------------

</div>

### 5. Polarization

**Orientation of electric field vector**.

#### Linear Polarization

- **Vertical**: E-field parallel to ground (monopole, vertical
  dipole)

- **Horizontal**: E-field perpendicular to ground (horizontal
  dipole)

**Cross-polarization loss**: 20-30 dB if TX and RX polarizations
are perpendicular

<div class="center">

------------------------------------------------------------------------

</div>

#### Circular Polarization

- **E-field rotates** as wave propagates

- **Right-hand circular (RHCP)**: Clockwise (looking at source)

- **Left-hand circular (LHCP)**: Counter-clockwise

**Applications**: GPS, satellite comms (immune to Faraday rotation
in ionosphere)

**Axial ratio**: Measure of circularity (0 dB = perfect circular,
\>3 dB = elliptical)

<div class="center">

------------------------------------------------------------------------

</div>

#### Elliptical Polarization

- General case (between linear and circular)

- Common when reflection/scattering depolarizes signal

<div class="center">

------------------------------------------------------------------------

</div>

### 6. Impedance & Matching

**Antenna input impedance**:

``` math
Z_{\text{ant}} = R_{\text{rad}} + R_{\text{loss}} + jX
```

Where: - $`R_{\text{rad}}`$ = Radiation resistance (power radiated) -
$`R_{\text{loss}}`$ = Loss resistance (heat in conductors/dielectrics) -
$`X`$ = Reactance (energy storage in near-field)

**Goal**: Match to transmission line (typically
50\$\Omega\$ or 75\$\Omega\$)

<div class="center">

------------------------------------------------------------------------

</div>

#### Standing Wave Ratio (SWR)

**Mismatch metric**:

``` math
\text{SWR} = \frac{1 + |\Gamma|}{1 - |\Gamma|}
```

Where $`\Gamma = \frac{Z_{\text{ant}} - Z_0}{Z_{\text{ant}} + Z_0}`$
(reflection coefficient)

**Acceptable values**: - SWR \< 1.5:1
\$\rightarrow\$ Good match (\< 4% power
reflected) - SWR = 2:1 \$\rightarrow\$ Marginal (11%
reflected) - SWR \> 3:1 \$\rightarrow\$ Poor
(25% reflected, may damage TX)

**Measurement**: Antenna analyzer, network analyzer, SWR meter

<div class="center">

------------------------------------------------------------------------

</div>

### 7. Bandwidth

**Frequency range where antenna performs adequately**.

**Criteria**: - SWR \< 2:1 - Gain variation \< 3
dB - Pattern distortion minimal

**Narrowband antennas**: Dipole (2-5%), loop (1-2%)
**Wideband antennas**: Log-periodic (10:1 ratio), biconical
(octave), spiral (decade+)

**Example**: WiFi 2.4 GHz (2.4-2.5 GHz = 4% bandwidth)
\$\rightarrow\$ Simple patch works **Example**: UWB
radar (3-10 GHz = 107% fractional BW) \$\rightarrow\$
Needs spiral or horn

<div class="center">

------------------------------------------------------------------------

</div>

### 8. Effective Aperture ($`A_e`$)

**Equivalent capture area** for receiving antennas:

``` math
A_e = \frac{G \lambda^2}{4\pi}
```

**Physical interpretation**: Power received = Incident power
density \$\times\$ $`A_e`$

``` math
P_r = S \cdot A_e
```

**Example**: Dipole ($`G = 2.15`$ dBi = 1.64 linear) at 1 GHz
($`\lambda = 0.3`$ m):

``` math
A_e = \frac{1.64 \times (0.3)^2}{4\pi} = 0.0125\ \text{m}^2
```

**Aperture efficiency**:
$`\eta_{\text{ap}} = A_e / A_{\text{phys}}`$ (0.5-0.7 for dishes)

<div class="center">

------------------------------------------------------------------------

</div>

## Antenna Types by Application

### 1. Communication Antennas

#### Dipole (VHF/UHF)

- **Simple, cheap, omnidirectional**

- **Use**: FM broadcast, amateur radio, WiFi (2.4 GHz diversity
  antennas)

#### Patch (Microstrip)

- **Flat, low-profile, easy to integrate**

- **Use**: GPS, cellular, WiFi (5 GHz), IoT devices

#### Yagi-Uda

- **Directional, moderate gain**

- **Use**: TV reception, point-to-point links, amateur radio

#### Parabolic Dish

- **High gain, narrow beam**

- **Use**: Satellite TV (12 GHz), deep-space comms (Ka-band), radio
  astronomy

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Mobile/Wearable Antennas

#### Monopole (\$\lambda\$/4)

- **Requires ground plane** (vehicle roof, PCB)

- **Use**: Car antennas, handheld radios

#### PIFA (Planar Inverted-F Antenna)

- **Compact, dual-band**

- **Use**: Smartphones (cellular + WiFi)

#### Loop Antenna

- **Small, magnetic field dominant**

- **Use**: RFID tags, NFC, AM radio (ferrite bar)

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Phased Arrays

**Multiple elements with controllable phase/amplitude**:

**Advantages**: - **Electronic beam steering** (no moving
parts) - **Adaptive nulling** (cancel interference) - **MIMO**
(spatial multiplexing)

**Beam steering**:

``` math
\theta = \sin^{-1}\left(\frac{\phi \lambda}{2\pi d}\right)
```

Where: - $`\phi`$ = Phase shift between elements - $`d`$ = Element
spacing

**Applications**: - Radar (military, automotive 77 GHz) - 5G base
stations (massive MIMO, 64-256 elements) -
\[\[AID-Protocol-Case-StudyAID Protocol\]\] (THz phased
array for coherent combining)

<div class="center">

------------------------------------------------------------------------

</div>

## Friis Transmission Equation

**Link budget fundamental** (connects antennas to
\[\[Free-Space-Path-Loss-(FSPL)path loss\]\]):

``` math
P_r = P_t + G_t + G_r - L_{\text{FSPL}}
```

(in dB)

Or in linear form:

``` math
P_r = P_t \cdot G_t \cdot G_r \cdot \left(\frac{\lambda}{4\pi d}\right)^2
```

**Derivation**:

1.  TX power $`P_t`$ radiated isotropically \$\rightarrow\$
    Power density at distance $`d`$:

``` math
S_{\text{iso}} = \frac{P_t}{4\pi d^2}
```

1.  TX antenna gain $`G_t`$ concentrates power:

``` math
S = \frac{P_t G_t}{4\pi d^2}
```

1.  RX antenna effective aperture $`A_e = G_r \lambda^2 / 4\pi`$ captures
    power:

``` math
P_r = S \cdot A_e = \frac{P_t G_t}{4\pi d^2} \cdot \frac{G_r \lambda^2}{4\pi}
```

1.  Simplify:

``` math
P_r = P_t G_t G_r \left(\frac{\lambda}{4\pi d}\right)^2
```

**Key insight**: Antenna gain **adds** to link budget (in dB),
compensating for path loss.

<div class="center">

------------------------------------------------------------------------

</div>

## Antenna Design by Frequency

### VLF/LF (\< 300 kHz)

**Challenge**: Wavelength \>\> practical
antenna size

**Solution**: - **Electrically small antennas** (length
$`\ll \lambda`$) - **Low efficiency** (most power lost in ohmic
resistance) - **Loading coils** to resonate (match reactance)

**Example**: 100 kHz (\$\lambda\$ = 3000 m), 10 m
vertical monopole: - Radiation resistance: ~0.1
\$\Omega\$ - Loss resistance: ~10
\$\Omega\$ - Efficiency: ~1%

<div class="center">

------------------------------------------------------------------------

</div>

### HF/VHF (3-300 MHz)

**Sweet spot**: Antennas are practical size

**Common types**: - Dipole (\$\lambda\$/2): 50 m @ 3
MHz, 1 m @ 150 MHz - Monopole (\$\lambda\$/4): 25 m @ 3
MHz (vertical tower) - Yagi-Uda: TV reception (VHF channels)

**Efficiency**: 50-90% (good conductors, minimal loss)

<div class="center">

------------------------------------------------------------------------

</div>

### UHF/SHF (300 MHz - 30 GHz)

**Miniaturization**: Antennas fit on PCBs

**Common types**: - Patch (microstrip): 3 cm
\$\times\$ 3 cm @ 2.4 GHz - Slot: Waveguide-based (radar,
satellite) - Horn: Wideband, calibration standard

**Phased arrays become feasible**: Element spacing
$`d \sim \lambda/2`$

**Example**: 10 GHz, $`\lambda = 3`$ cm
\$\rightarrow\$ 1.5 cm spacing
\$\rightarrow\$ 100 elements in 15 cm
\$\times\$ 15 cm

<div class="center">

------------------------------------------------------------------------

</div>

### EHF/THz (30 GHz - 10 THz)

**Challenges**: - **Fabrication tolerance**
(\$\mu\$m precision required) - **Surface roughness
losses** (skin depth at THz ~ nm) - **Impedance
matching** difficult (high frequencies)

**Solutions**: - **On-chip antennas** (silicon, III-V
semiconductors) - **Photolithography** (THz: \<100
\$\mu\$m features) - **Lens-coupled antennas** (match
impedance to free space)

**Example**: 1.875 THz (AID protocol), $`\lambda = 160`$
\$\mu\$m: - Dipole: 80 \$\mu\$m (fabricated
via e-beam lithography) - Phased array: 40 \$\mu\$m
spacing, 1024 elements in 40 mm \$\times\$ 40 mm

<div class="center">

------------------------------------------------------------------------

</div>

## Antenna Measurements

### Anechoic Chamber

**Facility for measuring radiation patterns**:

- **Absorber walls**: Eliminate reflections (simulate free space)

- **Turntable**: Rotate antenna under test (AUT)

- **Reference antenna**: Known gain/pattern

- **Network analyzer**: Measure
  S\textsubscript{2}\textsubscript{1}
  (transmission) vs angle

**Far-field distance**: $`d > 2D^2/\lambda`$ (Fraunhofer region)

**Example**: 1 m dish @ 10 GHz \$\rightarrow\$
$`d > 2 \times 1^2 / 0.03 = 67`$ m (large chamber!)

<div class="center">

------------------------------------------------------------------------

</div>

### Near-Field Scanning

**For electrically large antennas** (where far-field distance is
impractical):

1.  **Scan E/H fields** on planar/cylindrical/spherical surface near
    antenna

2.  **FFT transform** to compute far-field pattern

3.  **Smaller chamber** required (1-2 m)

<div class="center">

------------------------------------------------------------------------

</div>

### Gain Measurement (Comparison Method)

1.  Measure received power with **standard gain horn** (calibrated)

2.  Replace with **antenna under test** (AUT)

3.  Compare powers:

``` math
G_{\text{AUT}} = G_{\text{std}} + (P_{\text{AUT}} - P_{\text{std}})
```

(in dB)

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Design Considerations

### 1. Matching Network

**Goal**: Transform antenna impedance to 50\$\Omega\$

**Techniques**: - **LC network**: Series/shunt
inductors/capacitors - **Quarter-wave transformer**:
$`Z_{\lambda/4} = \sqrt{Z_0 Z_{\text{ant}}}`$ - **Stub matching**:
Open/short-circuited transmission line stubs

**Example**: Dipole ($`Z = 73 + j42.5\ \Omega`$) to
50\$\Omega\$: - Add series capacitor to cancel reactance
(j42.5\$\Omega\$) - Use transformer to match
73\$\Omega\$ to 50\$\Omega\$

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Balun (Balanced-Unbalanced Transformer)

**Problem**: Coaxial cable (unbalanced) feeding dipole (balanced)
\$\rightarrow\$ Common-mode currents on outer shield
(pattern distortion)

**Solution**: Balun isolates antenna from feedline

**Types**: - **Choke balun**: Coil of coax (high impedance to
common-mode) - **Sleeve balun**: \$\lambda\$/4 sleeve
over coax - **Transformer balun**: 1:1 or 4:1 turns ratio (ferrite
core)

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Environmental Effects

#### Ground Plane

- **Monopole requires ground plane** (acts as mirror image)

- **Poor ground** (dry soil, concrete)
  \$\rightarrow\$ Reduced efficiency

- **Elevated radials** (4-8 wires, \$\lambda\$/4
  length) improve performance

#### Nearby Objects

- **Metal structures**: Detune antenna (shift resonance), reflect
  energy

- **Human body**: Lossy dielectric (especially at cellular
  frequencies) \$\rightarrow\$ Detuning, absorption

- **Solution**: Antenna placement away from body (smartphones:
  top/bottom), adaptive matching

<div class="center">

------------------------------------------------------------------------

</div>

## Summary: Key Antenna Formulas

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Parameter</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Formula</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Units</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Gain</strong></td>
<td style="text-align: left;"><span class="math inline"><em>G</em> = <em>η</em><sub>ant</sub> ⋅ <em>D</em></span></td>
<td style="text-align: left;">Linear or dBi</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Effective aperture</strong></td>
<td style="text-align: left;"><span class="math inline">$A_e = \frac{G\lambda^2}{4\pi}$</span></td>
<td style="text-align: left;">m\textsuperscript{2}</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Beamwidth (aperture)</strong></td>
<td style="text-align: left;"><span class="math inline"><em>θ</em> ≈ 70<em>λ</em>/<em>D</em></span></td>
<td style="text-align: left;">Degrees</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Directivity (narrow beam)</strong></td>
<td style="text-align: left;"><span class="math inline"><em>D</em> ≈ 41253/(<em>θ</em><sub><em>E</em></sub><em>θ</em><sub><em>H</em></sub>)</span></td>
<td style="text-align: left;">Linear</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Friis equation</strong></td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub><em>r</em></sub> = <em>P</em><sub><em>t</em></sub><em>G</em><sub><em>t</em></sub><em>G</em><sub><em>r</em></sub>(<em>λ</em>/4<em>π</em><em>d</em>)<sup>2</sup></span></td>
<td style="text-align: left;">Watts</td>
</tr>
<tr>
<td style="text-align: left;"><strong>FSPL</strong></td>
<td style="text-align: left;"><span class="math inline"><em>L</em> = 20log (<em>d</em>) + 20log (<em>f</em>) + 92.45</span></td>
<td style="text-align: left;">dB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Radiation resistance (dipole)</strong></td>
<td style="text-align: left;"><span class="math inline"><em>R</em><sub><em>r</em></sub> = 73 <em>Ω</em></span></td>
<td style="text-align: left;">Ohms</td>
</tr>
<tr>
<td style="text-align: left;"><strong>SWR</strong></td>
<td style="text-align: left;"><span class="math inline">SWR = (1 + |<em>Γ</em>|)/(1 − |<em>Γ</em>|)</span></td>
<td style="text-align: left;">Ratio</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Quantifies
  distance-dependent loss (uses antenna gains)

- **\[\[Electromagnetic-Spectrum\]\]**: Frequency-dependent
  antenna design

- **\[\[Maxwell's-Equations-&-Wave-Propagation\]\]**:
  Radiation mechanism

- **\[\[Signal-to-Noise-Ratio-(SNR)\]\]**: Antenna gain
  improves SNR

- **\[\[AID-Protocol-Case-Study\]\]**: THz phased array example
  (1.875 THz, 40 dB gain)

- **Propagation Modes**: How antennas couple to environment (TBD)

- **Multipath & Fading**: Antenna diversity, MIMO (TBD)

<div class="center">

------------------------------------------------------------------------

</div>

**Next**: **Binary Phase-Shift Keying (BPSK)** (TBD) -
Simplest phase modulation, bridge to \[\[QPSK-Modulation\]\]

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
