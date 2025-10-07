---
layout: chapter
title: "Power-Density-&-Field-Strength"
chapter: 48
permalink: /chapters/power-density-&-field-strength/
---

# Power Density & Field Strength

\[\[Home\]\] **EM Fundamentals**
\[\[Maxwell's-Equations-&-Wave-Propagation\]\]
\[\[Wave-Polarization\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Power density is like measuring sunlight intensity---how
much energy hits each square meter. Field strength is like measuring the
“force” of the electromagnetic wave at a point.**

**Power Density (W/m\textsuperscript{2})**: - How
much power passes through 1 square meter? - Like sunlight:
~1000 W/m\textsuperscript{2} at noon
(hot!) - Radio waves: 0.000001 W/m\textsuperscript{2} =
1 µW/m\textsuperscript{2} (typical WiFi)

**Field Strength (V/m)**: - How strong is the electric field at
this point? - Higher V/m = stronger “electromagnetic force” - Think of
it like wind speed vs wind power

**Real-world examples**:

**Sunlight** (for comparison): - **Power density**: 1000
W/m\textsuperscript{2} at Earth's
surface - This is why solar panels work!

**WiFi router** (1 meter away): - **Power density**:
~10 µW/m\textsuperscript{2} (0.00001
W/m\textsuperscript{2}) - **Field strength**:
~2 V/m - 100 million times weaker than sunlight!

**Cell tower** (100 meters away): - **Power density**:
~0.1 µW/m\textsuperscript{2} -
**Field strength**: ~0.6 V/m - Regulations limit max
exposure to ~10 W/m\textsuperscript{2}

**Why they're related**: - **Power density**
\$\propto\$ (Field
strength)\textsuperscript{2} - Double the field strength
\$\rightarrow\$ 4\$\times\$ the power
density! - This is why moving closer to WiFi helps so much

**Inverse square law**: - Double the distance
\$\rightarrow\$ \$\frac{1}{4}\$ the
power density - This is why: - WiFi works at 50m but not 200m - Cell
towers need to be closer in cities - Satellites need huge power
(they're 36,000 km away!)

**Safety limits**: - **Sunlight**: 1000
W/m\textsuperscript{2} (safe for limited time) -
**FCC RF limit**: 10 W/m\textsuperscript{2} (safe
for general public) - **Typical WiFi**: 0.00001
W/m\textsuperscript{2} (100,000\$\times\$
below limit!) - **Your phone**: 0.001
W/m\textsuperscript{2} at 1cm
(10,000\$\times\$ below limit)

**When you encounter it**: - **RF safety assessments**: “Max
power density: 5 W/m\textsuperscript{2}” -
**Antenna specifications**: “Field strength: 50 V/m at 1 meter” -
**EMC testing**: Measuring field strength for interference -
**Link budget**: Converting transmit power to received power

**Fun fact**: The power density from the sun is so high (1000
W/m\textsuperscript{2}) that if WiFi routers were as
powerful, a 100W router at 1 meter would deliver the same power
density---but would violate FCC limits by
1000\$\times\$ and cook you like a microwave oven!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Power density** and **field strength** quantify the
**intensity of electromagnetic radiation** at a given point in
space.

**Key relationships**: - **Field strength** (E, H)
\$\rightarrow\$ Measured in V/m, A/m - **Power
density** (S) \$\rightarrow\$ Measured in
W/m\textsuperscript{2} - **Relationship**: Power
density proportional to E\textsuperscript{2}

**Why it matters**: - **Link budget calculations**: Determine
received signal strength - **Safety standards**: RF exposure limits
(FCC, ICNIRP) - **Antenna performance**: Radiated power
distribution - **Radar range equation**: Detection capability vs
distance

<div class="center">

------------------------------------------------------------------------

</div>

## Electric Field Strength (E)

**Electric field** $`\vec{E}`$ describes the **force per unit
charge** exerted on a test charge:

``` math
\vec{E} = \frac{\vec{F}}{q} \quad (\text{V/m or N/C})
```

**In electromagnetic wave** (plane wave, propagating in +z):

``` math
E(z,t) = E_0 \cos(\omega t - kz + \phi)
```

Where: - $`E_0`$ = Peak electric field amplitude (V/m) - Often use
**RMS value**: $`E_{\text{rms}} = E_0 / \sqrt{2}`$

<div class="center">

------------------------------------------------------------------------

</div>

### Typical Values

| Source                    | Distance     | E-field (V/m)          |
|:--------------------------|:-------------|:-----------------------|
| **AM broadcast** (50 kW)  | 1 km         | ~0.1                   |
| **FM broadcast** (100 kW) | 1 km         | ~0.2                   |
| **Cell tower** (40 W ERP) | 100 m        | ~1-2                   |
| **WiFi router** (100 mW)  | 1 m          | ~3                     |
| **Microwave oven** leak   | 5 cm         | ~10-50 (max            
                                            allowed)                |
| **Lightning**             | Near channel | ~10\textsuperscript{6} |

<div class="center">

------------------------------------------------------------------------

</div>

## Magnetic Field Strength (H)

**Magnetic field** $`\vec{H}`$ describes the **magnetizing
force**:

``` math
\vec{H} = \frac{\vec{B}}{\mu} \quad (\text{A/m})
```

Where: - $`\vec{B}`$ = Magnetic flux density (Tesla) - $`\mu`$ =
Permeability (H/m)

**In free space**: $`\mu = \mu_0 = 4\pi \times 10^{-7}`$ H/m

<div class="center">

------------------------------------------------------------------------

</div>

### Relationship Between E and H (Far Field)

**In plane wave** (far from source), E and H are related by
**wave impedance**:

``` math
\frac{E}{H} = \eta_0 = \sqrt{\frac{\mu_0}{\epsilon_0}} \approx 377\ \Omega
```

Where: - $`\eta_0`$ = Impedance of free space \$\approx\$
120\$\pi\$ \$\Omega\$
\$\approx\$ 377 \$\Omega\$ - $`\epsilon_0`$
= Permittivity of free space

**Practical form**:

``` math
H = \frac{E}{377} \quad (\text{A/m})
```

**Example**: E = 10 V/m \$\rightarrow\$ H = 10/377
\$\approx\$ 0.0265 A/m

<div class="center">

------------------------------------------------------------------------

</div>

### Near Field vs Far Field

#### Near Field (Reactive Near Field)

**Distance from antenna**: $`r < 0.62\sqrt{D^3/\lambda}`$ (for
large antennas)

Or simpler: $`r < \lambda/(2\pi)`$ (for small antennas)

**Characteristics**: - E and H not in simple ratio (reactive energy
dominates) - Energy oscillates between E-field and H-field storage -
Fields decay faster than $`1/r`$ (typically $`1/r^2`$ or $`1/r^3`$)

**Example**: HF antenna (3 MHz, \$\lambda\$ = 100 m)
at 10 m distance - Near field: E/H \$\neq\$ 377
\$\Omega\$ - Inductive or capacitive coupling dominates

<div class="center">

------------------------------------------------------------------------

</div>

#### Far Field (Radiating Far Field)

**Distance from antenna**: $`r > 2D^2/\lambda`$ (Fraunhofer
distance)

Where D = Largest antenna dimension

**Characteristics**: - E/H = 377 \$\Omega\$ (plane
wave approximation valid) - Radiation pattern independent of distance
(shape constant) - Fields decay as $`1/r`$ (power density as $`1/r^2`$)

**Example**: WiFi 2.4 GHz (\$\lambda\$ = 12.5 cm),
antenna size D = 5 cm

``` math
r_{\text{far}} = \frac{2 \times (0.05)^2}{0.125} = 0.04\ \text{m} = 4\ \text{cm}
```

**Far field begins at 4 cm** (very close for WiFi!)

<div class="center">

------------------------------------------------------------------------

</div>

## Power Density (Poynting Vector)

**Poynting vector** $`\vec{S}`$ represents **power flow per
unit area**:

``` math
\vec{S} = \vec{E} \times \vec{H} \quad (\text{W/m}^2)
```

**Magnitude** (for plane wave with E \$\perp\$ H):

``` math
S = E \cdot H = \frac{E^2}{\eta_0} = \frac{E^2}{377}
```

Or in terms of H:

``` math
S = \eta_0 H^2 = 377 H^2
```

<div class="center">

------------------------------------------------------------------------

</div>

### Time-Averaged Power Density

**For sinusoidal wave**, instantaneous power oscillates at 2f. Use
**time-average**:

``` math
\langle S \rangle = \frac{1}{2} \frac{E_0^2}{\eta_0} = \frac{E_{\text{rms}}^2}{\eta_0} = \frac{E_{\text{rms}}^2}{377}
```

**Example**: E_rms = 10 V/m

``` math
\langle S \rangle = \frac{100}{377} \approx 0.265\ \text{W/m}^2
```

<div class="center">

------------------------------------------------------------------------

</div>

## Power Density from Isotropic Source

**Isotropic radiator** distributes power uniformly over sphere:

``` math
S = \frac{P_t}{4\pi r^2}
```

Where: - $`P_t`$ = Transmitted power (W) - $`r`$ = Distance from source
(m) - $`4\pi r^2`$ = Surface area of sphere

**Inverse square law**: Power density decreases as $`1/r^2`$

**Example**: 100 W isotropic source at 10 m

``` math
S = \frac{100}{4\pi (10)^2} = \frac{100}{1257} \approx 0.0796\ \text{W/m}^2
```

<div class="center">

------------------------------------------------------------------------

</div>

## Power Density from Directional Antenna

**Antenna with gain** G concentrates power:

``` math
S = \frac{P_t \cdot G}{4\pi r^2}
```

**Effective Isotropic Radiated Power (EIRP)**:

``` math
\text{EIRP} = P_t \cdot G
```

**Power density becomes**:

``` math
S = \frac{\text{EIRP}}{4\pi r^2}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Example: WiFi Router

**Specs**: - Transmit power: 100 mW = 0.1 W - Antenna gain: 2 dBi
(linear gain \$\approx\$ 1.58) - Distance: 10 m

**EIRP**:

``` math
\text{EIRP} = 0.1 \times 1.58 = 0.158\ \text{W}
```

**Power density at 10 m**:

``` math
S = \frac{0.158}{4\pi (10)^2} = \frac{0.158}{1257} \approx 0.000126\ \text{W/m}^2 = 0.126\ \text{mW/m}^2
```

**Convert to E-field**:

``` math
E_{\text{rms}} = \sqrt{S \times 377} = \sqrt{0.000126 \times 377} \approx 0.218\ \text{V/m}
```

<div class="center">

------------------------------------------------------------------------

</div>

## Relationship Between Power Density and E-field

**Summary formulas** (far field, plane wave):

``` math
S = \frac{E_{\text{rms}}^2}{377} \quad (\text{W/m}^2)
```

``` math
E_{\text{rms}} = \sqrt{377 \times S} \approx 19.4\sqrt{S} \quad (\text{V/m})
```

``` math
E_0 = \sqrt{2} \times E_{\text{rms}} = \sqrt{2 \times 377 \times S} \approx 27.5\sqrt{S}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Quick Conversion Table

| Power Density (W/m\textsuperscript{2}) | E_rms (V/m) | E_peak (V/m) |
|:---------------------------------------|:------------|:-------------|
| (1 mW/m\textsuperscript{2})            | 0.61        | 0.87         |
| 0.01 (10 mW/m\textsuperscript{2})      | 1.94        | 2.75         |
| 0.1                                    | 6.14        | 8.68         |
| 1                                      | 19.4        | 27.5         |
| 10                                     | 61.4        | 86.8         |
| 100                                    | 194         | 275          |

<div class="center">

------------------------------------------------------------------------

</div>

## Power Delivered to Receiving Antenna

**Effective aperture** $`A_e`$ captures power from incident wave:

``` math
P_r = S \cdot A_e
```

Where:

``` math
A_e = \frac{G_r \lambda^2}{4\pi}
```

- $`G_r`$ = Receive antenna gain (linear)

- $`\lambda`$ = Wavelength

**Combining**:

``` math
P_r = \frac{P_t G_t G_r \lambda^2}{(4\pi r)^2}
```

**This is the Friis transmission equation** (see
\[\[Free-Space-Path-Loss-(FSPL)\]\])

<div class="center">

------------------------------------------------------------------------

</div>

### Example: Satellite Downlink

**Specs**: - Satellite EIRP: 50 dBW = 100 kW - Frequency: 12 GHz
(\$\lambda\$ = 0.025 m) - Distance: 36,000 km (GEO) - RX
antenna gain: 40 dBi (10,000 linear)

**Power density at ground**:

``` math
S = \frac{10^5}{4\pi (3.6 \times 10^7)^2} = \frac{10^5}{1.63 \times 10^{16}} \approx 6.1 \times 10^{-12}\ \text{W/m}^2
```

**E-field**:

``` math
E_{\text{rms}} = \sqrt{377 \times 6.1 \times 10^{-12}} \approx 1.5 \times 10^{-3}\ \text{V/m} = 1.5\ \text{mV/m}
```

**Received power** (1 m\textsuperscript{2} dish,
A_e \$\approx\$ 0.5
m\textsuperscript{2}):

``` math
P_r = 6.1 \times 10^{-12} \times 0.5 \approx 3 \times 10^{-12}\ \text{W} = 3\ \text{pW}
```

**In dBm**: $`10\log_{10}(3 \times 10^{-12} / 10^{-3}) = -115`$ dBm

**Using Friis equation**:

``` math
P_r = \frac{100,000 \times 10,000 \times (0.025)^2}{(4\pi \times 3.6 \times 10^7)^2} \approx 3 \times 10^{-12}\ \text{W}
```

**Consistent!**

<div class="center">

------------------------------------------------------------------------

</div>

## RF Safety Standards

**Exposure limits** protect against thermal and non-thermal
effects:

### FCC Limits (USA)

**Occupational/Controlled Exposure** (aware workers):

| Frequency        | E-field (V/m) | H-field (A/m) | Power Density            
                                                    (W/m\textsuperscript{2})  |
|:-----------------|:--------------|:--------------|:-------------------------|
| -3 MHz           | 614           | 1.63          | \-                       |
| 3-30 MHz         | 1842/f        | 4.89/f        | \-                       |
| 30-300 MHz       | 61.4          | 0.163         | 1.0                      |
| 300-1500 MHz     | \-            | \-            | f/300                    |
| 1500-100,000 MHz | \-            | \-            | 5.0                      |

Where f is in MHz

**General Population/Uncontrolled Exposure** (public):

Limits are **5\$\times\$ lower** (e.g., 0.2
W/m\textsuperscript{2} @ 30-300 MHz)

<div class="center">

------------------------------------------------------------------------

</div>

### ICNIRP Limits (International)

**General Public** (6-minute average):

| Frequency    | E-field (V/m)     | Power Density            
                                    (W/m\textsuperscript{2})  |
|:-------------|:------------------|:-------------------------|
| -400 MHz     | 28                | 2                        |
| 400-2000 MHz | 1.375\$\sqrt{}\$f | f/200                    |
| 2-300 GHz    | 61                | 10                       |

Where f is in MHz

<div class="center">

------------------------------------------------------------------------

</div>

### Example: WiFi Router Compliance

**WiFi 2.4 GHz, 100 mW, gain 2 dBi**

**At 20 cm** (typical human distance):

``` math
S = \frac{0.1 \times 1.58}{4\pi (0.2)^2} = \frac{0.158}{0.503} \approx 0.314\ \text{W/m}^2
```

**FCC limit @ 2.4 GHz**: 5 W/m\textsuperscript{2}
(controlled), 1 W/m\textsuperscript{2} (uncontrolled)

**ICNIRP limit**: f/200 = 2400/200 = 12
W/m\textsuperscript{2}

**Result**: WiFi at 20 cm = 0.314
W/m\textsuperscript{2} **\< 1
W/m\textsuperscript{2}** (OK for public exposure, but
close!)

**At 1 m**: $`S = 0.0126`$ W/m\textsuperscript{2}
(much safer)

<div class="center">

------------------------------------------------------------------------

</div>

## Radar Power Budget

**Radar equation** relates transmitted power to received echo:

``` math
P_r = \frac{P_t G^2 \lambda^2 \sigma}{(4\pi)^3 R^4}
```

Where: - $`\sigma`$ = Target radar cross-section
(m\textsuperscript{2}) - R = Range to target (m)

**Power density at target**:

``` math
S_{\text{target}} = \frac{P_t G}{4\pi R^2}
```

**Reflected power density back at radar**:

``` math
S_{\text{return}} = \frac{S_{\text{target}} \cdot \sigma}{4\pi R^2} = \frac{P_t G \sigma}{(4\pi)^2 R^4}
```

**Notice**: $`1/R^4`$ dependence (power travels to target and back)

<div class="center">

------------------------------------------------------------------------

</div>

### Example: Weather Radar

**Specs**: - Transmit power: 1 MW (peak) - Antenna gain: 45 dBi
(\$\approx\$ 31,600 linear) - Frequency: 3 GHz
(\$\lambda\$ = 0.1 m) - Target: Raindrop,
\$\sigma\$ =
10\textsuperscript{-}\textsuperscript{6}
m\textsuperscript{2} (light rain) - Range: 100 km

**Power density at raindrop**:

``` math
S_{\text{target}} = \frac{10^6 \times 31,600}{4\pi (10^5)^2} = \frac{3.16 \times 10^{10}}{1.26 \times 10^{11}} \approx 0.25\ \text{W/m}^2
```

**Received power**:

``` math
P_r = \frac{10^6 \times (31,600)^2 \times (0.1)^2 \times 10^{-6}}{(4\pi)^3 (10^5)^4} \approx 1.6 \times 10^{-13}\ \text{W} = -98\ \text{dBm}
```

**Weak but detectable** with sensitive receiver (noise floor
~ -110 dBm)

<div class="center">

------------------------------------------------------------------------

</div>

## Electromagnetic Interference (EMI)

**Field strength limits** for conducted and radiated emissions:

### FCC Part 15 Radiated Emission Limits

**Class B** (residential):

| Frequency     | E-field @ 3 m (\$\mu\$V/m) | dB\$\mu\$V/m |
|:--------------|:---------------------------|:-------------|
| -88 MHz       | 100                        | 40           |
| 88-216 MHz    | 150                        | 43.5         |
| 216-960 MHz   | 200                        | 46           |
| Above 960 MHz | 500                        | 54           |

**Measurement**: Use calibrated antenna + spectrum analyzer

<div class="center">

------------------------------------------------------------------------

</div>

### Example: Spurious Emission Check

**Digital device @ 300 MHz, measured 180 \$\mu\$V/m
@ 3 m**

**Limit @ 300 MHz**: 200 \$\mu\$V/m

**Result**: 180 \< 200 \$\rightarrow\$
**Pass**

**Margin**: $`20\log_{10}(200/180) = 0.9`$ dB

<div class="center">

------------------------------------------------------------------------

</div>

## Field Strength in Different Media

**In dielectric medium** (not free space):

``` math
\eta = \sqrt{\frac{\mu}{\epsilon}} = \frac{\eta_0}{\sqrt{\epsilon_r}}
```

Where: - $`\epsilon_r`$ = Relative permittivity - $`\eta_0 = 377`$
\$\Omega\$ (free space)

**Example**: Water ($`\epsilon_r \approx 80`$ @ low freq)

``` math
\eta_{\text{water}} = \frac{377}{\sqrt{80}} \approx 42\ \Omega
```

**Power density for same E-field**:

``` math
S = \frac{E^2}{42}
```

**9\$\times\$ higher power density** than free space
(for same E-field)

**Implication**: Underwater communications have different impedance
matching requirements

<div class="center">

------------------------------------------------------------------------

</div>

## Antenna Gain and Directivity

**Gain** increases power density in preferred direction:

``` math
G = \eta_{\text{ant}} \cdot D
```

Where: - $`\eta_{\text{ant}}`$ = Antenna efficiency (0-1) - D =
Directivity (ratio of max to average power density)

**Directivity**:

``` math
D = \frac{S_{\text{max}}}{S_{\text{avg}}} = \frac{4\pi S_{\text{max}} r^2}{P_t}
```

**Example**: Isotropic antenna - $`D = 1`$ (0 dBi) - Power
uniformly distributed

**Half-wave dipole**: - $`D = 1.64`$ (2.15 dBi) - Power
concentrated in broadside direction

**Parabolic dish** (diameter D, wavelength
\$\lambda\$):

``` math
G \approx \eta_{\text{ant}} \left(\frac{\pi D}{\lambda}\right)^2
```

With $`\eta_{\text{ant}} \approx 0.5-0.7`$ (typical)

<div class="center">

------------------------------------------------------------------------

</div>

## Skin Depth and Field Penetration

**In conductors**, field decays exponentially:

``` math
E(z) = E_0 e^{-z/\delta}
```

**Skin depth** $`\delta`$:

``` math
\delta = \sqrt{\frac{2}{\omega \mu \sigma}} = \sqrt{\frac{1}{\pi f \mu \sigma}}
```

Where: - $`\sigma`$ = Conductivity (S/m) - Copper:
$`\sigma = 5.8 \times 10^7`$ S/m

**Example**: Copper @ 1 GHz

``` math
\delta = \sqrt{\frac{1}{\pi \times 10^9 \times 4\pi \times 10^{-7} \times 5.8 \times 10^7}} \approx 2.1\ \mu\text{m}
```

**Implication**: At microwave frequencies, current flows in thin
surface layer (\< 2 \$\mu\$m)

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Quantity</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Symbol</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Units</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Typical Range</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Relationship</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Electric field</strong></td>
<td style="text-align: left;">E</td>
<td style="text-align: left;">V/m</td>
<td style="text-align: left;">-1000</td>
<td style="text-align: left;"><span class="math inline">$E = \sqrt{377 \times S}$</span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Magnetic field</strong></td>
<td style="text-align: left;">H</td>
<td style="text-align: left;">A/m</td>
<td style="text-align: left;">-3</td>
<td style="text-align: left;"><span class="math inline"><em>H</em> = <em>E</em>/377</span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Power density</strong></td>
<td style="text-align: left;">S</td>
<td style="text-align: left;">W/m\textsuperscript{2}</td>
<td style="text-align: left;">\textsuperscript{-}\textsuperscript{6}
- 10</td>
<td style="text-align: left;"><span class="math inline"><em>S</em> = <em>E</em><sup>2</sup>/377</span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Transmitted power</strong></td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub><em>t</em></sub></span></td>
<td style="text-align: left;">W</td>
<td style="text-align: left;">-100,000</td>
<td style="text-align: left;"><span class="math inline"><em>S</em> = <em>P</em><sub><em>t</em></sub><em>G</em>/(4<em>π</em><em>r</em><sup>2</sup>)</span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Distance</strong></td>
<td style="text-align: left;">r</td>
<td style="text-align: left;">m</td>
<td style="text-align: left;">-10\textsuperscript{8}</td>
<td style="text-align: left;"><span class="math inline"><em>S</em> ∝ 1/<em>r</em><sup>2</sup></span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Antenna gain</strong></td>
<td style="text-align: left;">G</td>
<td style="text-align: left;">-</td>
<td style="text-align: left;">-10\textsuperscript{6}</td>
<td style="text-align: left;"><span class="math inline"><em>S</em> ∝ <em>G</em></span></td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Uses power density
  to derive path loss

- **\[\[Antenna-Theory-Basics\]\]**: Gain, effective aperture,
  directivity

- **\[\[Maxwell's-Equations-&-Wave-Propagation\]\]**:
  E and H field derivation

- **\[\[Signal-to-Noise-Ratio-(SNR)\]\]**: Received power from
  power density

- **\[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\]**:
  Power density reduction mechanisms

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Power density S =
E\textsuperscript{2}/377 in far field**. Follows inverse
square law ($`1/r^2`$) from isotropic source. Directional antennas
concentrate power (multiply by gain). E-field strength and power density
determine link performance and safety compliance. Far field (E/H = 377
\$\Omega\$) begins at $`2D^2/\lambda`$ from antenna.
Safety limits typically 0.2-10 W/m\textsuperscript{2}
depending on frequency and exposure type.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
