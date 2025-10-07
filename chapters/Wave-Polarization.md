---
layout: chapter
title: "Wave-Polarization"
chapter: 67
permalink: /chapters/wave-polarization/
---

# Wave Polarization

\[\[Home\]\] **EM Fundamentals**
\[\[Maxwell's-Equations-&-Wave-Propagation\]\]
\[\[Electromagnetic-Spectrum\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Wave polarization is like the orientation of a jump
rope---you can shake it up/down (vertical), side-to-side
(horizontal), or in circles (circular). Antennas must match this
orientation to catch the signal!**

**The idea**: - Radio waves are oscillating electric/magnetic
fields - The **electric field** can point in different directions -
**Polarization** = which direction the field oscillates

**Three main types**:

**1. Linear Polarization** (most common): - Field oscillates in one
fixed direction - **Vertical**: Field points up/down
(\$\updownarrow\$) - **Horizontal**: Field points
left/right (\$\leftrightarrow\$) -
**45\$^\circ\$**: Somewhere in between
(\$\nearrow\$)

**2. Circular Polarization**: - Field rotates in a circle as wave
travels - **Right-hand circular** (RHCP): Rotates clockwise -
**Left-hand circular** (LHCP): Rotates counter-clockwise

**3. Elliptical Polarization**: - Field traces an ellipse
(in-between linear and circular) - Most real-world signals (not
perfectly linear/circular)

**Real-world examples**:

**FM Radio**: - **Vertical polarization** - Your car antenna:
Vertical rod - Must be vertical to match transmitter!

**TV Broadcasting**: - **Horizontal polarization** (old analog
TV) - Roof antennas: Horizontal elements - Must be horizontal to receive
signal

**WiFi**: - **Usually vertical** (your
router's antennas) - Laptop: Internal antenna usually
vertical - This is why tilting laptop changes signal strength!

**Satellite**: - **Circular polarization** (GPS, satellite TV)
- Why circular? Survives Faraday rotation in ionosphere - Your satellite
dish: Works at any angle!

**Why polarization matters**:

**Antenna alignment**: - **Matched polarization**: Maximum
signal (0 dB loss) - **Cross-polarization**
(90\$^\circ\$ off): -20 to -30 dB loss! - This is why
rotating your phone can improve reception

**Example**: - Cell tower: Vertical polarization - Your phone held
horizontally: Antenna now horizontal - Signal loss: 10-20 dB! - Result:
Dropped call

**Frequency reuse**: - Send two signals at same frequency,
different polarization - Vertical signal + Horizontal signal = no
interference! - **Satellite TV**: Uses both RHCP and LHCP to double
capacity

**Faraday rotation**: - Ionosphere rotates polarization (like
twisting jump rope) - Linear polarization \$\rightarrow\$
gets rotated \$\rightarrow\$ antenna mismatch! -
**Solution**: Use circular (rotation doesn't
matter) - This is why GPS uses circular!

**Your experience**:

**Old TV “rabbit ears”**: - Had to rotate/tilt for best picture -
You were matching antenna polarization! - Horizontal = horizontal
polarization - V-shape = trying to catch both!

**Cell phone**: - Hold normally: Antenna vertical (good) - Hold
horizontally (watching video): Antenna horizontal (bad!) - This is
“death grip” effect (partly)

**WiFi router antennas**: - Multiple antennas at different angles -
Catches signals from devices in any orientation - Some routers: Mix
vertical/horizontal for diversity

**Satellite dish**: - Circular polarization
\$\rightarrow\$ dish angle doesn't matter
for polarization - Only matters for pointing at satellite!

**Fun fact**: GPS satellites transmit right-hand circular
polarization (RHCP). If you flip your GPS receiver upside-down, it
receives left-hand circular polarization (LHCP)---and the signal is
20-30 dB weaker, basically unusable. This is why your
phone's GPS doesn't work well face-down
on a table!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Polarization** describes the **orientation of the electric
field vector** as an electromagnetic wave propagates through space.

**Key insight**: While the wave travels in one direction (e.g.,
+z), the electric field **oscillates in a plane perpendicular** to
propagation. The pattern traced by the E-field tip defines polarization.

**Why it matters**: - **Antenna alignment**: RX antenna must
match TX polarization for maximum signal capture - **Propagation
effects**: Ionosphere rotates polarization (Faraday rotation) -
**Interference mitigation**: Orthogonal polarizations enable
frequency reuse - **Satellite communications**: Circular
polarization combats ionospheric effects

<div class="center">

------------------------------------------------------------------------

</div>

## Mathematical Foundation

### Plane Wave Representation

**General electric field** (propagating in +z direction):

``` math
\vec{E}(z,t) = E_x \cos(\omega t - kz + \phi_x)\hat{x} + E_y \cos(\omega t - kz + \phi_y)\hat{y}
```

Where: - $`E_x`$, $`E_y`$ = Amplitudes in x and y directions -
$`\phi_x`$, $`\phi_y`$ = Phase offsets -
$`\Delta\phi = \phi_y - \phi_x`$ = **Relative phase** (determines
polarization type)

**At fixed observation point** (z=0):

``` math
\vec{E}(t) = E_x \cos(\omega t + \phi_x)\hat{x} + E_y \cos(\omega t + \phi_y)\hat{y}
```

<div class="center">

------------------------------------------------------------------------

</div>

## Polarization Types

### 1. Linear Polarization

**Condition**: $`\Delta\phi = 0°`$ or $`180°`$ (in-phase or
anti-phase)

**Result**: E-field oscillates along a **fixed line**

#### Vertical Polarization

``` math
\vec{E}(t) = E_0 \cos(\omega t)\hat{y}
```

**E-field aligned with y-axis** (vertical if antenna vertical)

**Applications**: - AM/FM broadcast (vertical monopoles) - HF
vertical antennas (ground wave propagation) - Mobile handsets (typically
held vertically)

<div class="center">

------------------------------------------------------------------------

</div>

#### Horizontal Polarization

``` math
\vec{E}(t) = E_0 \cos(\omega t)\hat{x}
```

**E-field aligned with x-axis** (horizontal)

**Applications**: - TV broadcast (horizontal dipoles) - WiFi (many
routers use horizontal dipoles) - Yagi antennas (horizontal for TV
reception)

<div class="center">

------------------------------------------------------------------------

</div>

#### Slant Polarization

``` math
\vec{E}(t) = E_0 \cos(\omega t)(\cos\theta\hat{x} + \sin\theta\hat{y})
```

**E-field at angle** $`\theta`$ from horizontal

**Example**: 45\$^\circ\$ slant
(\$\pm\$45\$^\circ\$):

``` math
\vec{E}(t) = \frac{E_0}{\sqrt{2}} \cos(\omega t)(\hat{x} + \hat{y})
```

**Applications**: - Satellite polarization diversity
(\$\pm\$45\$^\circ\$ orthogonal channels)
- Reduce building penetration loss (less reflection)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Circular Polarization

**Condition**: $`E_x = E_y`$ and $`\Delta\phi = \pm 90°`$

**Result**: E-field tip traces a **circle**, rotating as wave
propagates

#### Right-Hand Circular Polarization (RHCP)

``` math
\vec{E}(t) = E_0[\cos(\omega t)\hat{x} - \sin(\omega t)\hat{y}]
```

**Viewed from receiver** (wave approaching): E-field rotates
**clockwise**

**Phase**: $`\Delta\phi = -90°`$ (y lags x by
90\$^\circ\$)

<div class="center">

------------------------------------------------------------------------

</div>

#### Left-Hand Circular Polarization (LHCP)

``` math
\vec{E}(t) = E_0[\cos(\omega t)\hat{x} + \sin(\omega t)\hat{y}]
```

**Viewed from receiver**: E-field rotates **counterclockwise**

**Phase**: $`\Delta\phi = +90°`$ (y leads x by
90\$^\circ\$)

<div class="center">

------------------------------------------------------------------------

</div>

#### Properties

**Axial ratio**: AR = 1 (perfect circle)

**Isolation between RHCP/LHCP**: Theoretically infinite
(orthogonal)

**Practical isolation**: 20-30 dB (antenna imperfections)

**Applications**: - **GPS satellites** (RHCP) - Mitigates
Faraday rotation, multipath - **Satellite communications** (RHCP or
LHCP) - Reduces rain depolarization - **RFID tags** -
Orientation-insensitive - **Radar** (circular) - Target
discrimination via polarization

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Elliptical Polarization

**Condition**: General case where $`E_x \neq E_y`$ and/or
$`\Delta\phi \neq 0°, 90°, 180°`$

**Result**: E-field tip traces an **ellipse**

``` math
\frac{E_x^2(t)}{A^2} + \frac{E_y^2(t)}{B^2} = 1
```

Where A, B are semi-major/minor axes

<div class="center">

------------------------------------------------------------------------

</div>

#### Axial Ratio (AR)

**Measure of ellipse eccentricity**:

``` math
\text{AR} = \frac{\text{Major axis}}{\text{Minor axis}} = \frac{A}{B}
```

**In dB**:

``` math
\text{AR}_{\text{dB}} = 20\log_{10}\left(\frac{A}{B}\right)
```

**Special cases**: - **AR = 1 (0 dB)**: Circular polarization
- **AR \$\rightarrow\$ \$\infty\$**:
Linear polarization

**Typical spec**: AR \< 3 dB for “circular” antennas
(ellipticity acceptable)

<div class="center">

------------------------------------------------------------------------

</div>

#### Sense of Rotation

**Right-hand elliptical**: Rotates clockwise (RHEP)

**Left-hand elliptical**: Rotates counterclockwise (LHEP)

**Example**: $`E_x = 2E_y`$, $`\Delta\phi = 90°`$ - Elliptical (not
circular due to unequal amplitudes) - Right-hand sense
(90\$^\circ\$ phase like RHCP) - AR = 2 (6 dB)

<div class="center">

------------------------------------------------------------------------

</div>

## Polarization Loss Factor (PLF)

**Mismatch between TX and RX polarizations causes loss**:

``` math
\text{PLF} = |\hat{e}_{\text{TX}} \cdot \hat{e}_{\text{RX}}^*|^2
```

Where $`\hat{e}`$ = Normalized polarization vectors (complex)

<div class="center">

------------------------------------------------------------------------

</div>

### Linear Polarizations

**Angle mismatch** $`\theta`$ between TX and RX:

``` math
\text{PLF} = \cos^2\theta
```

**In dB**:

``` math
L_{\text{pol}} = -10\log_{10}(\cos^2\theta) = -20\log_{10}(\cos\theta)
```

**Examples**: - **0\$^\circ\$**: 0 dB loss
(perfect match) - **30\$^\circ\$**: 1.2 dB loss -
**45\$^\circ\$**: 3 dB loss (half power) -
**90\$^\circ\$**: \$\infty\$ dB loss
(complete null - orthogonal)

<div class="center">

------------------------------------------------------------------------

</div>

### Circular Polarizations

| TX   | RX   | PLF | Loss                 |
|:-----|:-----|:----|:---------------------|
| RHCP | RHCP | 1   | 0 dB (match)         |
| LHCP | LHCP | 1   | 0 dB (match)         |
| RHCP | LHCP | 0   | \$\infty\$ dB (null) |
| LHCP | RHCP | 0   | \$\infty\$ dB (null) |

**Co-pol vs cross-pol**: - **Co-pol**: Same sense (RHCP-RHCP
or LHCP-LHCP) - **Cross-pol**: Opposite sense (RHCP-LHCP or
LHCP-RHCP)

<div class="center">

------------------------------------------------------------------------

</div>

### Linear to Circular

**Linear antenna receiving circular wave** (or vice versa):

``` math
\text{PLF} = 0.5 \quad (-3\ \text{dB loss})
```

**Explanation**: Linear antenna captures only one component of
circular wave (e.g., vertical dipole receives only vertical component of
RHCP)

**Example**: GPS receiver with linear patch antenna - GPS
satellites transmit RHCP - Linear patch: 3 dB polarization loss - Need
higher gain to compensate

<div class="center">

------------------------------------------------------------------------

</div>

## Polarization Generation

### Linear Polarization

**Simple dipole or monopole**: - Current flows in one direction
\$\rightarrow\$ E-field perpendicular to current -
Vertical monopole \$\rightarrow\$ Vertical polarization -
Horizontal dipole \$\rightarrow\$ Horizontal polarization

<div class="center">

------------------------------------------------------------------------

</div>

### Circular Polarization

#### Crossed Dipoles with 90\$^\circ\$ Phase Shift

**Two perpendicular dipoles**, fed with: - Equal amplitude -
90\$^\circ\$ phase difference (quadrature)

**Geometry**:

          y (vertical dipole)
          |
          |
          +------ x (horizontal dipole)

**Feed**: - Horizontal: $`I_x = I_0 \cos(\omega t)`$ - Vertical:
$`I_y = I_0 \cos(\omega t - 90°) = I_0 \sin(\omega t)`$

**Result**: RHCP (assuming correct phase)

**Implementation**: 90\$^\circ\$ hybrid coupler
(branch-line, Lange coupler)

<div class="center">

------------------------------------------------------------------------

</div>

#### Helical Antenna

**Helix wound around cylinder** (axial mode):

**Geometry**: - Diameter: $`D \approx \lambda/\pi`$ (circumference
\$\approx\$ \$\lambda\$) - Pitch angle:
12-15\$^\circ\$ - Turns: 5-10 for good AR

**Result**: Circular polarization (sense depends on helix
direction) - Right-hand helix \$\rightarrow\$ RHCP -
Left-hand helix \$\rightarrow\$ LHCP

**Applications**: GPS antennas, satellite ground stations

<div class="center">

------------------------------------------------------------------------

</div>

#### Patch Antenna with Corners Truncated

**Circular or square patch** with: - Two opposite corners cut
(truncated) - Single feed point

**Mechanism**: Truncation creates two orthogonal modes with
~90\$^\circ\$ phase difference

**Result**: Circular polarization (RHCP or LHCP depending on which
corners cut)

**Applications**: GPS receivers, compact GNSS antennas

<div class="center">

------------------------------------------------------------------------

</div>

## Propagation Effects on Polarization

### Faraday Rotation

**Ionosphere causes polarization rotation** (linear
\$\rightarrow\$ rotated linear):

``` math
\Omega = 2.36 \times 10^4 \frac{B_\parallel \cdot \text{TEC}}{f^2} \quad (\text{radians})
```

Where: - $`B_\parallel`$ = Earth's magnetic field
component along path (Tesla) - TEC = Total Electron Content
(electrons/m\textsuperscript{2}) - $`f`$ = Frequency
(Hz)

**Effect scales as** $`1/f^2`$ (severe at HF, negligible at SHF)

**Example**: HF @ 10 MHz, TEC =
10\textsuperscript{1}\textsuperscript{8}
el/m\textsuperscript{2} - Rotation:
~500\$^\circ\$ (multiple full rotations!)
- Linear polarization unusable (unpredictable rotation)

**Mitigation**: Use **circular polarization** (immune to
Faraday rotation)

<div class="center">

------------------------------------------------------------------------

</div>

### Differential Propagation (Rain Depolarization)

**Rain causes differential attenuation** between H and V
components:

**Horizontal attenuated more** than vertical (raindrops are oblate)

**Effect**: Linear \$\rightarrow\$ Elliptical,
Circular \$\rightarrow\$ Elliptical

**Cross-Polarization Discrimination (XPD)**:

``` math
\text{XPD} = \frac{\text{Co-pol power}}{\text{Cross-pol power}} \quad (\text{dB})
```

**Typical**: 30 dB in clear air, degrades to 15-20 dB in heavy rain

**Example**: Satellite Ku-band,
\$\pm\$45\$^\circ\$ linear polarization -
Clear air: 30 dB isolation between channels - Heavy rain: 20 dB
isolation (increased interference)

**Mitigation**: Adaptive coding/modulation, switch to single
polarization in heavy rain

<div class="center">

------------------------------------------------------------------------

</div>

### Reflection

**Polarization changes upon reflection**:

#### Perpendicular Incidence (Normal)

**Horizontal and vertical polarizations reflect with** $`180°`$
**phase shift** (for good conductors)

<div class="center">

------------------------------------------------------------------------

</div>

#### Oblique Incidence

**Brewster angle** ($`\theta_B`$):

``` math
\theta_B = \arctan\left(\frac{n_2}{n_1}\right)
```

**At Brewster angle**: Parallel (horizontal) polarization
**not reflected** (complete transmission)

**Example**: Air-to-glass ($`n_1=1`$, $`n_2=1.5`$):

``` math
\theta_B = \arctan(1.5) \approx 56°
```

**Application**: Polarizing filters, anti-reflection coatings

<div class="center">

------------------------------------------------------------------------

</div>

## Applications

### 1. Satellite Communications

**Frequency reuse via polarization diversity**:

**Traditional**: H and V (or
\$\pm\$45\$^\circ\$ linear) - Two
independent channels on same frequency - Isolation: 25-30 dB (limited by
cross-pol)

**Modern**: RHCP and LHCP - Better rain performance (less
depolarization) - Isolation: 20-30 dB

**Example**: Ku-band DBS (Direct Broadcast Satellite) - 12 GHz
downlink - Odd transponders: RHCP - Even transponders: LHCP - Doubles
capacity

<div class="center">

------------------------------------------------------------------------

</div>

### 2. GPS and GNSS

**All GPS satellites transmit RHCP**:

**Reasons**: 1. **Faraday rotation immunity**: Circular
unaffected by ionosphere rotation 2. **Multipath rejection**:
Ground reflection flips RHCP \$\rightarrow\$ LHCP
(cross-pol rejected) 3. **Orientation insensitive**: Works at any
receiver angle (within hemisphere)

**Receiver antenna**: RHCP patch or helix

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Radar

**Polarimetric radar** uses multiple polarizations:

**Modes**: - HH: Transmit H, receive H - VV: Transmit V, receive V
- HV: Transmit H, receive V (cross-pol) - VH: Transmit V, receive H
(cross-pol)

**Applications**: - **Weather radar**: Distinguish rain, hail,
snow (different depolarization) - **SAR imaging**: Surface type
classification (vegetation vs metal vs water) - **Target
identification**: Military (tanks vs trees)

<div class="center">

------------------------------------------------------------------------

</div>

### 4. WiFi and Cellular

**Diversity antennas** use orthogonal polarizations:

**MIMO systems**: 2\$\times\$2,
4\$\times\$4 with
\$\pm\$45\$^\circ\$ slant polarization -
Reduce correlation between antenna elements - Improve capacity in rich
scattering environments

**Example**: WiFi 802.11n/ac router - Antenna 1:
+45\$^\circ\$ slant - Antenna 2:
-45\$^\circ\$ slant - Independent fading
\$\rightarrow\$ Diversity gain

<div class="center">

------------------------------------------------------------------------

</div>

### 5. EMI/EMC Testing

**Measure emissions in both H and V polarizations**:

**Standards** (FCC, CISPR): Require testing at both polarizations
to find worst-case emissions

<div class="center">

------------------------------------------------------------------------

</div>

## Stokes Parameters

**Complete polarization description** (intensity + polarization
state):

``` math
\begin{aligned}
S_0 &= E_x^2 + E_y^2 \quad (\text{Total intensity}) \\
S_1 &= E_x^2 - E_y^2 \quad (\text{H vs V preference}) \\
S_2 &= 2E_xE_y\cos\Delta\phi \quad (\text{±45° preference}) \\
S_3 &= 2E_xE_y\sin\Delta\phi \quad (\text{Circular preference})
\end{aligned}
```

**Interpretation**: - $`S_3 > 0`$: RHCP dominant - $`S_3 < 0`$:
LHCP dominant - $`S_3 = 0`$: Linear polarization

**Degree of polarization**:

``` math
\text{DOP} = \frac{\sqrt{S_1^2 + S_2^2 + S_3^2}}{S_0}
```

**Range**: 0 (unpolarized) to 1 (fully polarized)

<div class="center">

------------------------------------------------------------------------

</div>

## Poincaré Sphere

**Graphical representation** of polarization states:

**3D sphere** where: - **North pole**: LHCP - **South
pole**: RHCP - **Equator**: All linear polarizations (H, V,
\$\pm\$45\$^\circ\$)

**Coordinates**: $`(S_1/S_0, S_2/S_0, S_3/S_0)`$

**Application**: Visualize polarization transformations (e.g.,
Faraday rotation = rotation around S\textsubscript{3}
axis)

<div class="center">

------------------------------------------------------------------------

</div>

## Polarization Measurement

### Antenna Pattern Testing

**Measure co-pol and cross-pol patterns**:

**Setup**: 1. Rotate RX antenna 90\$^\circ\$ (H
\$\leftrightarrow\$ V) 2. Measure received power vs angle
3. Plot co-pol and cross-pol gains

**Cross-pol level**: Typically 20-30 dB below co-pol for good
antenna

<div class="center">

------------------------------------------------------------------------

</div>

### Polarization Ratio

**For linear polarization**:

``` math
\text{PR} = \frac{P_{\text{co}}}{P_{\text{cross}}} \quad (\text{dB})
```

**Typical**: \> 20 dB for well-designed antenna

<div class="center">

------------------------------------------------------------------------

</div>

### Axial Ratio Measurement

**For circular polarization**:

**Method 1**: Spinning linear dipole - Rotate RX linear antenna
360\$^\circ\$ - Measure $`P_{\text{max}}`$ and
$`P_{\text{min}}`$

``` math
\text{AR} = \frac{P_{\text{max}}}{P_{\text{min}}} \quad (\text{linear}), \quad \text{AR}_{\text{dB}} = 10\log_{10}\left(\frac{P_{\text{max}}}{P_{\text{min}}}\right)
```

**Method 2**: Dual-pol receiver - Measure $`E_x`$ and $`E_y`$
amplitudes and phases - Calculate AR from ellipse parameters

**Good circular antenna**: AR \< 3 dB

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Considerations

### Antenna Orientation

**Must match TX/RX polarizations**:

**Example**: Vertical monopole on car - Works well with vertical
base station antenna - 90\$^\circ\$ mismatch if base
station is horizontal (\$\infty\$ dB loss)

**WiFi routers**: Often mixed polarizations (multiple antennas at
different angles) for robustness

<div class="center">

------------------------------------------------------------------------

</div>

### Polarization vs Bandwidth

**Circular polarization antennas are narrowband**:

**Reason**: 90\$^\circ\$ phase shift only accurate
over limited bandwidth

**Typical**: 2-5% bandwidth for AR \< 3 dB

**Wideband circular polarization**: Difficult (requires complex
feed networks)

<div class="center">

------------------------------------------------------------------------

</div>

### Cost/Complexity

| Polarization | Complexity | Cost   | Applications                       |
|:-------------|:-----------|:-------|:-----------------------------------|
| **Linear**   | Simple     | Low    | Most terrestrial (AM/FM, WiFi,     
                                      cellular)                           |
| **Circular** | Moderate   | Medium | GPS, satellite, RFID               |
| **Dual-pol** | High       | High   | Radar, satellite (frequency reuse) |

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Polarization</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p><span class="math inline"><em>Δ</em><em>ϕ</em></span></p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p><span class="math inline"><em>E</em><sub><em>x</em></sub> : <em>E</em><sub><em>y</em></sub></span></p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Axial Ratio</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Applications</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Horizontal</strong></td>
<td style="text-align: left;">$^\circ$</td>
<td style="text-align: left;">$\infty$ : 1</td>
<td style="text-align: left;">$\infty$</td>
<td style="text-align: left;">TV broadcast,
WiFi</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Vertical</strong></td>
<td style="text-align: left;">$^\circ$</td>
<td style="text-align: left;">:
$\infty$</td>
<td style="text-align: left;">$\infty$</td>
<td style="text-align: left;">AM/FM, mobile</td>
</tr>
<tr>
<td style="text-align: left;"><strong>$\pm$45$^\circ$ Slant</strong></td>
<td style="text-align: left;">$^\circ$</td>
<td style="text-align: left;">: 1</td>
<td style="text-align: left;">$\infty$</td>
<td style="text-align: left;">Satellite downlink</td>
</tr>
<tr>
<td style="text-align: left;"><strong>RHCP</strong></td>
<td style="text-align: left;">$^\circ$</td>
<td style="text-align: left;">: 1</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">GPS,
satellite</td>
</tr>
<tr>
<td style="text-align: left;"><strong>LHCP</strong></td>
<td style="text-align: left;">+90$^\circ$</td>
<td style="text-align: left;">: 1</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Satellite,
RFID</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Elliptical</strong></td>
<td style="text-align: left;">Arbitrary</td>
<td style="text-align: left;">Arbitrary</td>
<td style="text-align: left;">-$\infty$</td>
<td style="text-align: left;">Imperfect circular</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Maxwell's-Equations-&-Wave-Propagation\]\]**:
  E and H fields in EM waves

- **\[\[Antenna-Theory-Basics\]\]**: Polarization matching for
  maximum gain

- **\[\[Atmospheric-Effects-(Ionospheric,-Tropospheric)\]\]**:
  Faraday rotation

- **\[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\]**:
  Depolarization in multipath

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Friis equation
  assumes matched polarization

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Polarization is the “orientation” of
the electric field**. Linear (H, V, slant) is simplest and most common.
Circular (RHCP, LHCP) is robust to ionospheric effects and multipath,
used in GPS and satellites. Mismatch causes 3 dB to
\$\infty\$ dB loss depending on angle. Propagation effects
(Faraday rotation, rain depolarization) degrade polarization purity.
Match TX and RX polarizations for optimal link performance.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
