---
layout: chapter
title: "Atmospheric-Effects-(Ionospheric,-Tropospheric)"
chapter: 8
permalink: /chapters/atmospheric-effects-(ionospheric,-tropospheric)/
---

# Atmospheric Effects: Ionospheric & Tropospheric

\[\[Home\]\] **RF Propagation**
\[\[Propagation-Modes-(Ground-Wave,-Sky-Wave,-Line-of-Sight)\]\]
\[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Think of the atmosphere as a giant, invisible lens and filter
for radio waves.**

Imagine you're trying to shine a flashlight across a
room: - **On a clear day**, the light travels straight and far -
**Through fog**, the light gets scattered and dimmer - **With
a curved mirror**, the light bends and can reach around corners

Radio waves behave similarly through Earth's atmosphere:

1.  **The Ionosphere** (60-400 km up) is like a **curved mirror
    in space**

    - Acts like a reflector for AM radio and shortwave (HF) signals

    - This is why you can hear distant AM radio stations at
      night---the signal bounces off this invisible mirror!

    - Created by the sun's energy ionizing air molecules

2.  **The Troposphere** (0-15 km up, where weather happens) is like
    **fog or water vapor**

    - Bends and absorbs radio waves, especially at high frequencies

    - This is why 5G signals don't travel as far as
      4G---they're more easily absorbed by air
      humidity

    - Weather (rain, fog) makes this worse

**Real-world impact**: - **GPS errors**: The ionosphere slows
down GPS signals, causing ~10-30 meter errors (your phone
corrects for this) - **Satellite TV in rain**: Signal drops out
because raindrops absorb the microwaves - **Shortwave radio at
night**: Can receive stations from across the globe because the
ionosphere reflects signals back to Earth

**The key insight**: Different radio frequencies interact with the
atmosphere in completely different ways---AM radio bounces off the
ionosphere, while 5G gets absorbed by humidity.

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Earth's atmosphere profoundly affects RF
propagation** through:

1.  **Ionosphere** (60-1000 km altitude): **Refracts HF**,
    enables sky wave

2.  **Troposphere** (0-15 km altitude): **Absorbs/refracts
    VHF+**, causes ducting

**Key distinction**: - **Below ~30 MHz**:
Ionosphere dominates (enables long-distance HF comms) - **Above
~1 GHz**: Troposphere/weather dominates (absorption, rain
fade)

<div class="center">

------------------------------------------------------------------------

</div>

## Ionospheric Effects

### Structure of the Ionosphere

**Ionosphere = layers of ionized gas** (free electrons and ions
created by solar UV/X-rays)

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Layer</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Altitude</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Peak Density (<span class="math inline"><em>N</em><sub><em>e</em></sub></span>)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Characteristics</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>D</strong></td>
<td style="text-align: left;">-90 km</td>
<td style="text-align: left;">\textsuperscript{8}-10\textsuperscript{9}
e\textsuperscript{-}/m\textsuperscript{3}</td>
<td style="text-align: left;"><strong>Absorbs MF/HF</strong> (daytime only)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>E</strong></td>
<td style="text-align: left;">-150 km</td>
<td style="text-align: left;">\textsuperscript{1}\textsuperscript{0}-10\textsuperscript{1}\textsuperscript{1}
e\textsuperscript{-}/m\textsuperscript{3}</td>
<td style="text-align: left;">Reflects MF, low HF</td>
</tr>
<tr>
<td style="text-align: left;"><strong>F1</strong></td>
<td style="text-align: left;">-250 km</td>
<td style="text-align: left;">\textsuperscript{1}\textsuperscript{1}
e\textsuperscript{-}/m\textsuperscript{3}</td>
<td style="text-align: left;">Daytime only, merges with F2 at night</td>
</tr>
<tr>
<td style="text-align: left;"><strong>F2</strong></td>
<td style="text-align: left;">-400 km</td>
<td style="text-align: left;">\textsuperscript{1}\textsuperscript{1}-10\textsuperscript{1}\textsuperscript{2}
e\textsuperscript{-}/m\textsuperscript{3}</td>
<td style="text-align: left;"><strong>Primary HF reflector</strong>, highest density</td>
</tr>
</tbody>
</table>

**Formation**: Solar UV photons ionize
O\textsubscript{2}, N\textsubscript{2}
\$\rightarrow\$
O\textsubscript{2}\textsuperscript{+},
N\textsubscript{2}\textsuperscript{+},
e\textsuperscript{-}

**Recombination**: Electrons recombine with ions (faster at lower
altitudes due to higher density)

<div class="center">

------------------------------------------------------------------------

</div>

### Refractive Index

**Plasma refractive index**:

``` math
n = \sqrt{1 - \frac{f_p^2}{f^2}}
```

Where: - $`f_p`$ = Plasma frequency = $`9\sqrt{N_e}`$ Hz ($`N_e`$ in
electrons/m\textsuperscript{3}) - $`f`$ = Signal
frequency

**Key behaviors**:

1.  **$`f \ll f_p`$**: Wave is **reflected** (HF sky wave)

2.  **$`f \approx f_p`$**: Wave **refracts** (bends back to
    Earth)

3.  **$`f \gg f_p`$**: Wave **penetrates** (VHF+ passes through
    ionosphere)

**Typical $`f_p`$ values**: - D-layer: ~1 MHz -
E-layer: ~3-5 MHz - F2-layer (day): ~10-15
MHz - F2-layer (night): ~5-10 MHz

**Implication**: **VHF and above (\>30 MHz) always
penetrate** ionosphere \$\rightarrow\$ No skywave, only
LOS.

<div class="center">

------------------------------------------------------------------------

</div>

### Critical Frequency & Skip Distance

**Critical frequency** $`f_c`$: Maximum frequency reflected at
**vertical incidence**

``` math
f_c = 9\sqrt{N_{e,\text{max}}}
```

**At oblique angles**, higher frequencies can be reflected:

``` math
\text{MUF} = \frac{f_c}{\sin(\theta)}
```

Where $`\theta`$ = elevation angle

**Example**: If $`f_c = 10`$ MHz, and wave launched at
10\$^\circ\$ elevation:

``` math
\text{MUF} = \frac{10}{\sin(10°)} = \frac{10}{0.174} = 57\ \text{MHz}
```

(But practical MUF limited by absorption and other factors to
~30 MHz)

<div class="center">

------------------------------------------------------------------------

</div>

### Absorption

**D-layer absorption** (collisional damping):

``` math
A = K \cdot \frac{N_e \cdot \nu}{f^2} \quad (\text{dB})
```

Where: - $`\nu`$ = Collision frequency
(~10\textsuperscript{6} Hz in D-layer) -
$`N_e`$ = Electron density - $`f`$ = Signal frequency

**Key insight**: **Absorption \$\propto\$
1/f\textsuperscript{2}** \$\rightarrow\$
Lower frequencies absorbed more

**Impact**: - **Daytime**: D-layer absorbs 1-5 MHz (MF/LF
severe absorption) - **Nighttime**: D-layer disappears
\$\rightarrow\$ Lower frequencies propagate (AM broadcast
skywave)

**Typical absorption** (HF, daytime): - 3 MHz: 10-20 dB - 7 MHz:
3-6 dB - 14 MHz: 1-2 dB - 28 MHz: \<1 dB

<div class="center">

------------------------------------------------------------------------

</div>

### Faraday Rotation

**Ionosphere is magnetized** (Earth's magnetic
field):

**Effect**: **Polarization rotates** as wave propagates
through ionosphere

``` math
\Omega = \frac{2.36 \times 10^4}{f^2} \int N_e B_\parallel \, dl \quad (\text{radians})
```

Where: - $`f`$ = Frequency (Hz) - $`N_e`$ = Electron density
(e\textsuperscript{-}/m\textsuperscript{3})
- $`B_\parallel`$ = Magnetic field component along path (Tesla) -
Integral over path length

**Impact**: - **Linear polarized signals** experience rotation
(can cause \>20 dB loss if RX antenna wrong orientation) -
**Circular polarization immune** (GPS, satellite comms use
RHCP/LHCP to mitigate)

**Example**: GPS L1 (1575 MHz) experiences
~10-50\$^\circ\$ rotation (varies with
solar activity, latitude)

<div class="center">

------------------------------------------------------------------------

</div>

### Ionospheric Scintillation

**Irregularities in ionosphere** (plasma turbulence) cause:

1.  **Amplitude scintillation**: Rapid fading (seconds to minutes)

2.  **Phase scintillation**: Phase jitter (disrupts carrier tracking)

**Causes**: - Equatorial plasma bubbles (post-sunset) - Auroral
activity (high latitudes) - Solar flares (sudden ionospheric
disturbances)

**Impact**: - GPS errors (meter-level positioning errors) -
Satellite comms outages (L-band, 1-2 GHz) - Most severe near magnetic
equator and auroral zones

**Mitigation**: Dual-frequency GPS (L1 + L5) corrects ionospheric
delay

<div class="center">

------------------------------------------------------------------------

</div>

### Solar Activity Effects

#### Solar Flares

**X-ray burst ionizes D-layer**:

- **Sudden Ionospheric Disturbance (SID)**: HF absorption increases
  10-30 dB instantly

- Duration: Minutes to hours

- Daytime only (needs sunlight)

**Result**: HF blackout on sunlit side of Earth

<div class="center">

------------------------------------------------------------------------

</div>

#### Geomagnetic Storms

**Coronal mass ejection (CME) hits Earth**:

- **Auroral electrojet**: Intense ionization at high latitudes

- **Ionospheric storm**: TEC (total electron content) increases
  globally

- Duration: Days

**Result**: - HF propagation unpredictable - GPS errors increase
(10-100m) - Satellite operations affected

<div class="center">

------------------------------------------------------------------------

</div>

#### 11-Year Solar Cycle

**Solar maximum**: - Higher ionization (F2 peak density
2-3\$\times\$ higher) - MUF increases (30+ MHz usable for
long-distance) - Better long-distance HF propagation

**Solar minimum**: - Lower MUF (~15-20 MHz) - 10m
band (28 MHz) often “dead” - More reliance on lower HF bands (7, 14
MHz)

**Current cycle**: Solar Cycle 25 (2019-2030), peak
~2025

<div class="center">

------------------------------------------------------------------------

</div>

### Ionospheric Delay

**Group delay** (signal travels slower than speed of light):

``` math
\Delta t = \frac{40.3}{c f^2} \int N_e \, dl \quad (\text{seconds})
```

**Impact**: - GPS ranging errors (10-100m if uncorrected) -
Two-frequency correction: Measure delay at L1 and L5, compute
ionospheric TEC

**TEC (Total Electron Content)**:

``` math
\text{TEC} = \int N_e \, dl \quad (\text{electrons/m}^2)
```

**Typical values**: - Nighttime:
10\textsuperscript{1}\textsuperscript{6}
e\textsuperscript{-}/m\textsuperscript{2}
- Daytime:
10\textsuperscript{1}\textsuperscript{7}
e\textsuperscript{-}/m\textsuperscript{2}
- Solar max:
10\textsuperscript{1}\textsuperscript{8}
e\textsuperscript{-}/m\textsuperscript{2}
(equatorial)

<div class="center">

------------------------------------------------------------------------

</div>

## Tropospheric Effects

**Troposphere** = Lower atmosphere (0-15 km altitude), where
weather occurs

**Key effects**: 1. **Refraction** (bending, ducting) 2.
**Absorption** (oxygen, water vapor) 3. **Scattering** (rain,
turbulence)

<div class="center">

------------------------------------------------------------------------

</div>

### Atmospheric Refraction

**Refractive index** depends on temperature, pressure, humidity:

``` math
n = 1 + N \times 10^{-6}
```

Where **refractivity** $`N`$:

``` math
N = 77.6 \frac{P}{T} + 3.73 \times 10^5 \frac{e}{T^2}
```

- $`P`$ = Pressure (hPa)

- $`T`$ = Temperature (K)

- $`e`$ = Water vapor partial pressure (hPa)

**Typical values**: - Sea level: $`N \approx 300-400`$
\$\rightarrow\$ $`n \approx 1.0003`$ - 10 km altitude:
$`N \approx 100`$ \$\rightarrow\$ $`n \approx 1.0001`$

<div class="center">

------------------------------------------------------------------------

</div>

### Ray Bending

**Gradient in $`N`$ bends rays downward**:

**Standard atmosphere**: $`dN/dh \approx -40`$ N-units/km

**Effect**: **Radio horizon extended** beyond geometric
horizon

**4/3 Earth radius model**:

``` math
d_{\text{radio}} = 1.33 \times d_{\text{geometric}}
```

**Example**: Geometric horizon for 30m antenna = 20 km
\$\rightarrow\$ Radio horizon = 26 km

<div class="center">

------------------------------------------------------------------------

</div>

### Tropospheric Ducting

**Temperature inversion** (warm air over cool) creates refractive
layer:

**Super-refraction**: Wave bends more than normal
\$\rightarrow\$ Trapped in duct

**Effect**: **VHF/UHF signals propagate 500-2000 km** (far
beyond normal LOS)

**Conditions**: - Coastal regions (cool ocean, warm land) -
High-pressure systems (stable, clear weather) - Nighttime (radiative
cooling)

**Impact**: - FM/TV interference from distant stations - Cellular
network interference (distant cells suddenly visible) - Opportunistic
long-range VHF communications

**Duct height**: Typically 10-100m (depends on inversion strength)

<div class="center">

------------------------------------------------------------------------

</div>

### Atmospheric Absorption

**Gases absorb RF energy**:

1.  **Oxygen (O\textsubscript{2})**: Peak at
    **60 GHz**, secondary at 118 GHz

2.  **Water vapor (H\textsubscript{2}O)**: Peaks at
    **22.2 GHz, 183 GHz, 325 GHz**, plus continuum absorption

<div class="center">

------------------------------------------------------------------------

</div>

#### Oxygen Absorption

**60 GHz resonance**:

``` math
\alpha_{O_2} \approx 15\ \text{dB/km} \quad \text{(at sea level, 60 GHz)}
```

**Frequency dependence** (0-100 GHz):

| Frequency  | Attenuation (dB/km) |
|:-----------|:--------------------|
| GHz        | 0.01                |
| 30 GHz     | 0.05                |
| 50 GHz     | 0.3                 |
| **60 GHz** | **15** (peak)       |
| 70 GHz     | 1                   |
| 100 GHz    | 0.5                 |

**Application**: 60 GHz used for **secure short-range comms**
(signals don't propagate far)

<div class="center">

------------------------------------------------------------------------

</div>

#### Water Vapor Absorption

**22.2 GHz resonance**:

``` math
\alpha_{H_2O} = k \cdot \rho \quad (\text{dB/km})
```

Where: - $`\rho`$ = Water vapor density
(g/m\textsuperscript{3}) - $`k`$ = Frequency-dependent
coefficient

**Typical humidity** (7.5 g/m\textsuperscript{3} at
sea level, temperate):

| Frequency    | Attenuation (dB/km) |
|:-------------|:--------------------|
| GHz          | 0.01                |
| **22.2 GHz** | **0.2** (peak)      |
| 30 GHz       | 0.08                |
| 50 GHz       | 0.15                |
| 100 GHz      | 1.0                 |
| 300 GHz      | 10+ (THz region)    |

**Implication**: **THz communications limited to
indoor/short-range** (water vapor + rain = severe attenuation)

<div class="center">

------------------------------------------------------------------------

</div>

### Atmospheric Windows

**Frequency ranges with low absorption** (clear air):

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Window</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Attenuation</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Use</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>HF</strong></td>
<td style="text-align: left;">-30 MHz</td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;">Skywave comms</td>
</tr>
<tr>
<td style="text-align: left;"><strong>VHF/UHF</strong></td>
<td style="text-align: left;">-3000 MHz</td>
<td style="text-align: left;">&lt; 0.01 dB/km</td>
<td style="text-align: left;">Broadcast,
cellular</td>
</tr>
<tr>
<td style="text-align: left;"><strong>L/S-band</strong></td>
<td style="text-align: left;">-4 GHz</td>
<td style="text-align: left;">&lt; 0.01 dB/km</td>
<td style="text-align: left;">GPS, mobile
satellite</td>
</tr>
<tr>
<td style="text-align: left;"><strong>C-band</strong></td>
<td style="text-align: left;">-8 GHz</td>
<td style="text-align: left;">dB/km</td>
<td style="text-align: left;">Satellite (robust)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>X/Ku-band</strong></td>
<td style="text-align: left;">-18 GHz</td>
<td style="text-align: left;">-0.5 dB/km</td>
<td style="text-align: left;">Satellite, radar</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Ka-band</strong></td>
<td style="text-align: left;">-40 GHz</td>
<td style="text-align: left;">-0.3 dB/km</td>
<td style="text-align: left;">High-rate satellite</td>
</tr>
<tr>
<td style="text-align: left;"><strong>V/W-band</strong></td>
<td style="text-align: left;">-100 GHz</td>
<td style="text-align: left;">-15 dB/km</td>
<td style="text-align: left;">Point-to-point (watch 60
GHz!)</td>
</tr>
</tbody>
</table>

**Avoid**: 22 GHz (H\textsubscript{2}O), 60 GHz
(O\textsubscript{2}), 183 GHz
(H\textsubscript{2}O)

<div class="center">

------------------------------------------------------------------------

</div>

### Tropospheric Scintillation

**Turbulence in troposphere** causes refractive index fluctuations:

**Effect**: Amplitude/phase scintillation (similar to ionospheric,
but different mechanism)

**Severity**: Increases with: - Frequency (\> 10 GHz) -
Low elevation angles (longer path through troposphere) - Daytime
(convective turbulence)

**Impact**: - Satellite links \> 20 GHz: 1-3 dB
peak-to-peak fading - Typically slower than rain fade (seconds to
minutes)

**Mitigation**: Less critical than rain fade (lower magnitude)

<div class="center">

------------------------------------------------------------------------

</div>

## Path Loss Models with Atmospheric Effects

### Satellite Link Budget (with Atmosphere)

**Total path loss**:

``` math
L_{\text{total}} = L_{\text{FS}} + L_{\text{atm}} + L_{\text{rain}} + L_{\text{scint}}
```

Where: - $`L_{\text{FS}}`$ = Free-space path loss (see
\[\[Free-Space-Path-Loss-(FSPL)\]\]) - $`L_{\text{atm}}`$ =
Clear-air atmospheric absorption (O\textsubscript{2},
H\textsubscript{2}O) - $`L_{\text{rain}}`$ = Rain
attenuation (see
\[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\]) -
$`L_{\text{scint}}`$ = Tropospheric scintillation (margin for fading)

<div class="center">

------------------------------------------------------------------------

</div>

#### Example: Ku-Band Satellite (12 GHz)

**Path**: GEO (36,000 km), 30\$^\circ\$ elevation

**Free-space loss**:

``` math
L_{\text{FS}} = 20\log(36000 \times 10^3) + 20\log(12 \times 10^9) + 92.45 = 205.5\ \text{dB}
```

**Clear-air atmospheric** (O\textsubscript{2} +
H\textsubscript{2}O, zenith):

``` math
L_{\text{atm}} \approx 0.3\ \text{dB}
```

**At 30\$^\circ\$ elevation** (longer slant path):

``` math
L_{\text{atm}} = 0.3 / \sin(30°) = 0.6\ \text{dB}
```

**Rain fade** (99.9% availability, temperate):

``` math
L_{\text{rain}} = 3\ \text{dB} \quad \text{(see weather effects page)}
```

**Scintillation margin**:

``` math
L_{\text{scint}} = 1\ \text{dB}
```

**Total**:

``` math
L_{\text{total}} = 205.5 + 0.6 + 3 + 1 = 210.1\ \text{dB}
```

<div class="center">

------------------------------------------------------------------------

</div>

#### Example: Ka-Band (30 GHz)

**Same geometry**:

``` math
L_{\text{FS}} = 20\log(36000 \times 10^3) + 20\log(30 \times 10^9) + 92.45 = 213.5\ \text{dB}
```

**Clear-air atmospheric**:

``` math
L_{\text{atm}} = 0.8 / \sin(30°) = 1.6\ \text{dB}
```

**Rain fade** (99.9%, temperate):

``` math
L_{\text{rain}} = 13\ \text{dB}
```

**Scintillation**:

``` math
L_{\text{scint}} = 2\ \text{dB}
```

**Total**:

``` math
L_{\text{total}} = 213.5 + 1.6 + 13 + 2 = 230.1\ \text{dB}
```

**Comparison**: Ka-band suffers **20 dB more loss** than
Ku-band (mostly rain!)

<div class="center">

------------------------------------------------------------------------

</div>

## Practical Considerations

### Elevation Angle Matters

**Low elevation** (\< 10\$^\circ\$): -
Longer path through troposphere - More atmospheric absorption - Worse
rain fade (factor of 2-3\$\times\$ vs
30\$^\circ\$ elevation) - Higher scintillation

**Design guideline**: Avoid elevations \<
10\$^\circ\$ if possible (especially for Ka-band+)

<div class="center">

------------------------------------------------------------------------

</div>

### Frequency Selection Trade-offs

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Band</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>FSPL</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Atmospheric</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Rain</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Antenna Size</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Bandwidth</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>C (4-8 GHz)</strong></td>
<td style="text-align: left;">Low</td>
<td style="text-align: left;">Very low</td>
<td style="text-align: left;"><strong>Very low</strong></td>
<td style="text-align: left;">Large</td>
<td style="text-align: left;">Moderate</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Ku (12-18 GHz)</strong></td>
<td style="text-align: left;">Moderate</td>
<td style="text-align: left;">Low</td>
<td style="text-align: left;"><strong>Moderate</strong></td>
<td style="text-align: left;">Moderate</td>
<td style="text-align: left;">Good</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Ka (26.5-40 GHz)</strong></td>
<td style="text-align: left;">High</td>
<td style="text-align: left;">Moderate</td>
<td style="text-align: left;"><strong>High</strong></td>
<td style="text-align: left;">Small</td>
<td style="text-align: left;">Excellent</td>
</tr>
<tr>
<td style="text-align: left;"><strong>V (40-75 GHz)</strong></td>
<td style="text-align: left;">Very high</td>
<td style="text-align: left;">High</td>
<td style="text-align: left;"><strong>Very high</strong></td>
<td style="text-align: left;">Very
small</td>
<td style="text-align: left;">Huge</td>
</tr>
</tbody>
</table>

**Tropical regions**: C-band preferred (rain-robust, 99.99%
availability achievable) **Temperate regions**: Ku-band good
compromise (rain manageable with margins) **Ka-band**: Requires
ACM, site diversity, or large margins

<div class="center">

------------------------------------------------------------------------

</div>

### Time-of-Day Effects

**Ionosphere** (HF): - **Daytime**: Higher MUF, D-layer
absorption - **Nighttime**: Lower MUF, no D-layer, skywave active

**Troposphere** (VHF+): - **Daytime**: More turbulence
(scintillation), convective clouds (rain) - **Nighttime**: Calmer,
potential ducting (temperature inversions)

**GPS errors**: - **Noon**: Peak TEC, highest ionospheric
delay (~10-30m error) - **Midnight**: Minimum TEC,
lower error (~5-10m)

<div class="center">

------------------------------------------------------------------------

</div>

## Regional Variations

### Equatorial Regions

**Ionosphere**: - High TEC
(10\textsuperscript{1}\textsuperscript{8}
e\textsuperscript{-}/m\textsuperscript{2})
- Plasma bubbles (scintillation) - GPS errors
2-3\$\times\$ worse than mid-latitudes

**Troposphere**: - High humidity (water vapor absorption) - Intense
rain (42-95 mm/hr)

**Recommendation**: C-band for satellite, robust GPS receivers

<div class="center">

------------------------------------------------------------------------

</div>

### High Latitudes

**Ionosphere**: - Auroral activity (scintillation, blackouts) -
Solar proton events (polar cap absorption)

**Troposphere**: - Low humidity (less absorption) - Moderate rain

**Recommendation**: HF comms challenging during storms, but low
rain fade

<div class="center">

------------------------------------------------------------------------

</div>

### Temperate Mid-Latitudes

**Ionosphere**: - Moderate TEC - Stable conditions (less
scintillation)

**Troposphere**: - Seasonal variations (summer rain, winter
ducting) - Moderate humidity

**Recommendation**: Best overall conditions for
satellite/terrestrial

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table: Atmospheric Effects by Frequency

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Ionosphere</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Troposphere</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Dominant Effect</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>LF/MF</strong></td>
<td style="text-align: left;">Absorbed by D-layer (day), reflected (night)</td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;"><strong>Ionospheric absorption</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>HF (3-30 MHz)</strong></td>
<td style="text-align: left;">Sky wave (F2 reflection)</td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;"><strong>Ionospheric refraction</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>VHF (30-300 MHz)</strong></td>
<td style="text-align: left;">Penetrates (no reflection)</td>
<td style="text-align: left;">Refraction,
ducting</td>
<td style="text-align: left;"><strong>Tropospheric refraction</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>UHF (300-3000 MHz)</strong></td>
<td style="text-align: left;">Faraday rotation, delay</td>
<td style="text-align: left;">Minimal
absorption</td>
<td style="text-align: left;"><strong>Ionospheric delay (GPS)</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>L/S (1-4 GHz)</strong></td>
<td style="text-align: left;">TEC delay (GPS error)</td>
<td style="text-align: left;">&lt; 0.01 dB/km</td>
<td style="text-align: left;"><strong>Ionospheric scintillation</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>C (4-8 GHz)</strong></td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;">dB/km</td>
<td style="text-align: left;"><strong>Rain fade
(minor)</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Ku (12-18 GHz)</strong></td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;">dB/km</td>
<td style="text-align: left;"><strong>Rain fade
(moderate)</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>Ka (26.5-40 GHz)</strong></td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;">-0.3 dB/km</td>
<td style="text-align: left;"><strong>Rain
fade (severe)</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>V (40-75 GHz)</strong></td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;">-15 dB/km (60 GHz peak)</td>
<td style="text-align: left;"><strong>O\textsubscript{2} absorption, rain</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>W (75-110 GHz)</strong></td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;">-5 dB/km</td>
<td style="text-align: left;"><strong>H\textsubscript{2}O absorption, rain</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>THz (&gt;300 GHz)</strong></td>
<td style="text-align: left;">Negligible</td>
<td style="text-align: left;">-100+ dB/km</td>
<td style="text-align: left;"><strong>H\textsubscript{2}O absorption (severe)</strong></td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Propagation-Modes-(Ground-Wave,-Sky-Wave,-Line-of-Sight)\]\]**:
  How ionosphere enables HF skywave

- **\[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\]**:
  Rain dominates at high frequencies

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Baseline loss before
  atmospheric effects

- **\[\[Signal-to-Noise-Ratio-(SNR)\]\]**: Atmospheric loss
  reduces SNR

- **\[\[Electromagnetic-Spectrum\]\]**: Frequency-dependent
  atmospheric behavior

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Ionosphere enables HF long-distance**
(refraction), but **disrupts GPS/satellite L-band** (delay,
scintillation). **Troposphere absorbs high frequencies**
(O\textsubscript{2} @ 60 GHz,
H\textsubscript{2}O @ 22 GHz), and **weather
dominates above 10 GHz** (rain fade). Choose frequency based on
application and climate.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
