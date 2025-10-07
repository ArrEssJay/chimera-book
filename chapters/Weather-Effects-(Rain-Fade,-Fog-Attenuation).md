---
layout: chapter
title: "Weather-Effects-(Rain-Fade,-Fog-Attenuation)"
chapter: 68
permalink: /chapters/weather-effects-(rain-fade,-fog-attenuation)/
---

# Weather Effects: Rain Fade & Fog Attenuation

\[\[Home\]\] **RF Propagation**
\[\[Free-Space-Path-Loss-(FSPL)\]\]
\[\[Atmospheric-Effects-(Ionospheric,-Tropospheric)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

## For Non-Technical Readers

**Think of radio waves like light beams traveling through the
air.**

When it rains, you notice that: - **Headlights look dimmer**
through heavy rain - **You can't see as far** in
fog - **Everything gets blurry** during a storm

**The exact same thing happens to satellite TV, 5G cell signals,
and WiFi** --- but you can't see it with your eyes.

### The Core Problem

**Raindrops absorb and scatter radio waves**, weakening the signal.
The bigger the problem when:

1.  **Higher frequencies** (like 5G's “millimeter
    wave”) are used

    - Think: FM radio (low frequency) works fine in rain, but satellite
      internet (high frequency) struggles

2.  **Heavier rain** falls

    - Light drizzle: barely noticeable

    - Thunderstorm: your satellite dish might lose connection entirely

3.  **Longer distances** through the weather

    - Short WiFi connection (30 feet): rain doesn't matter
      much

    - Satellite signal (22,000 miles up): crosses miles of rain clouds

### Real-World Examples You've Experienced

**Satellite TV going out during storms** - Your dish is trying to
receive a signal from space - Heavy rain blocks 50-90% of the signal
strength - Below a threshold \$\rightarrow\$ “Searching
for signal\ldots{}” - This is called **rain fade**

**Slower 5G during rain** - 5G “mmWave” uses very high
frequencies (like satellite dishes) - Rain weakens the signal between
tower and your phone - Phone automatically switches to slower but more
reliable 4G - You don't notice the rain, just “slower
internet”

**Why your GPS still works** - GPS uses lower frequencies (1.5
GHz) than satellite TV (12+ GHz) - Rain barely affects it (like how
radio stations work in any weather)

### The Math Part (Optional)

The technical sections below answer questions like: - **“Exactly
how much weaker?”** (e.g., 10 dB loss = 90% power lost) - **“At
what frequency does rain start mattering?”** (~10 GHz
threshold) - **“How do engineers design systems that work in
rain?”** (Add backup power, use multiple frequencies, switch to lower
data rates)

**You don't need to understand the equations** to
grasp the main point:

> **Rain affects high-frequency radio signals a lot, low-frequency
> signals barely at all. Engineers compensate by adding extra power, using
> smarter antennas, or accepting slower speeds during storms.**

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Weather significantly impacts RF propagation**, especially at
frequencies above 10 GHz. Rain, fog, snow, and clouds introduce
**frequency-dependent attenuation** that must be accounted for in
link budgets.

**Key principle**: Attenuation increases with: 1.
**Frequency** (higher frequencies = more attenuation) 2.
**Precipitation rate** (heavier rain = more loss) 3. **Path
length through weather** (longer distance = more cumulative loss)

**Critical for**: Satellite communications (Ku/Ka/V-band), 5G
mmWave (28/39 GHz), point-to-point microwave links

<div class="center">

------------------------------------------------------------------------

</div>

## Rain Attenuation

### Physical Mechanism

**Raindrops act as lossy dielectric spheres**:

1.  **Absorption**: EM energy heats water molecules (dielectric loss)

2.  **Scattering**: Raindrops redirect energy out of main beam (Mie
    scattering when droplet size \$\approx\$
    \$\lambda\$)

**Frequency dependence**: - **\< 10 GHz**: Rain
effects negligible (\$\lambda\$ \>\>
raindrop size) - **10-100 GHz**: Strong attenuation
(\$\lambda\$ \$\approx\$ raindrop size, 1-5
mm) - **\> 100 GHz**: Extreme attenuation (THz
communications impossible in rain)

<div class="center">

------------------------------------------------------------------------

</div>

### ITU-R Rain Attenuation Model

**Standard method**: ITU-R P.838 and P.618

**Specific attenuation** (dB/km):

``` math
\gamma_R = k \cdot R^\alpha
```

Where: - $`\gamma_R`$ = Specific attenuation (dB/km) - $`R`$ = Rain rate
(mm/hr) - $`k, \alpha`$ = Frequency-dependent coefficients (from ITU
tables)

<div class="center">

------------------------------------------------------------------------

</div>

#### Coefficients by Frequency

**Selected values** (horizontal polarization):

| Frequency   | $`k`$     | $`\alpha`$ | Attenuation @ 25 mm/hr rain |
|:------------|:----------|:-----------|:----------------------------|
| GHz         | 0.0000387 | 0.912      | 0.0005 dB/km                |
| 4 GHz       | 0.00065   | 1.121      | 0.025 dB/km                 |
| 10 GHz      | 0.0101    | 1.276      | 0.50 dB/km                  |
| 12 GHz (Ku) | 0.0188    | 1.310      | 1.02 dB/km                  |
| 20 GHz (Ka) | 0.0751    | 1.099      | 3.26 dB/km                  |
| 30 GHz      | 0.187     | 1.021      | 7.14 dB/km                  |
| 40 GHz      | 0.350     | 0.939      | 12.2 dB/km                  |
| 50 GHz      | 0.536     | 0.873      | 16.8 dB/km                  |
| 60 GHz      | 0.707     | 0.826      | 20.3 dB/km                  |
| 80 GHz      | 0.999     | 0.784      | 26.4 dB/km                  |
| 100 GHz     | 1.187     | 0.751      | 29.8 dB/km                  |

**Note**: Vertical polarization has slightly different coefficients
(typically ~10-20% more attenuation)

<div class="center">

------------------------------------------------------------------------

</div>

### Rain Rate Classifications

**ITU rain zones** (global climate regions):

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Zone</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Climate</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Rain rate exceeded 0.01% of year</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Example locations</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">A</td>
<td style="text-align: left;">Polar</td>
<td style="text-align: left;">mm/hr</td>
<td style="text-align: left;">Arctic, Antarctic</td>
</tr>
<tr>
<td style="text-align: left;">B</td>
<td style="text-align: left;">Temperate</td>
<td style="text-align: left;">mm/hr</td>
<td style="text-align: left;">Northern Europe, Canada</td>
</tr>
<tr>
<td style="text-align: left;">C</td>
<td style="text-align: left;">Subtropical</td>
<td style="text-align: left;">mm/hr</td>
<td style="text-align: left;">Southern US, Mediterranean</td>
</tr>
<tr>
<td style="text-align: left;">D</td>
<td style="text-align: left;">Moderate tropical</td>
<td style="text-align: left;">mm/hr</td>
<td style="text-align: left;">Southeast Asia, India</td>
</tr>
<tr>
<td style="text-align: left;">E</td>
<td style="text-align: left;">Equatorial</td>
<td style="text-align: left;">mm/hr</td>
<td style="text-align: left;">Central Africa, Indonesia</td>
</tr>
<tr>
<td style="text-align: left;">F</td>
<td style="text-align: left;">Tropical maritime</td>
<td style="text-align: left;">mm/hr</td>
<td style="text-align: left;">Amazon, Congo Basin</td>
</tr>
<tr>
<td style="text-align: left;">G</td>
<td style="text-align: left;">Monsoon</td>
<td style="text-align: left;">mm/hr</td>
<td style="text-align: left;">Bangladesh, Myanmar</td>
</tr>
<tr>
<td style="text-align: left;">H</td>
<td style="text-align: left;">Intense tropical</td>
<td style="text-align: left;">mm/hr</td>
<td style="text-align: left;">Extreme storms</td>
</tr>
</tbody>
</table>

**Design criterion**: Typically design for 99.9% availability
(0.01% outage time) - Temperate: 12 mm/hr - Tropical: 42-63 mm/hr

<div class="center">

------------------------------------------------------------------------

</div>

### Link Budget Impact: Satellite Examples

#### Example 1: Ku-Band Satellite (12 GHz Downlink)

**Scenario**: GEO satellite \$\rightarrow\$ Home
receiver, temperate climate

**Path geometry**: - Elevation angle: 30\$^\circ\$
- Slant path through rain: ~6 km effective length - Rain
rate (0.01% time): 12 mm/hr

**Calculation**:

``` math
\gamma_R = 0.0188 \times 12^{1.310} = 0.50\ \text{dB/km}
```

``` math
A_{\text{rain}} = \gamma_R \times d_{\text{eff}} = 0.50 \times 6 = 3\ \text{dB}
```

**Impact**: 3 dB margin needed for 99.9% availability

**With 95 mm/hr extreme storm** (H zone):

``` math
\gamma_R = 0.0188 \times 95^{1.310} = 6.3\ \text{dB/km}
```

``` math
A_{\text{rain}} = 6.3 \times 6 = 38\ \text{dB}
```

**Result**: Complete outage (exceeds typical 10-15 dB link margin)

<div class="center">

------------------------------------------------------------------------

</div>

#### Example 2: Ka-Band Satellite (20 GHz Downlink)

**Same scenario** as Ku-band:

**Temperate (12 mm/hr)**:

``` math
\gamma_R = 0.0751 \times 12^{1.099} = 1.16\ \text{dB/km}
```

``` math
A_{\text{rain}} = 1.16 \times 6 = 7\ \text{dB}
```

**Tropical (42 mm/hr)**:

``` math
\gamma_R = 0.0751 \times 42^{1.099} = 4.4\ \text{dB/km}
```

``` math
A_{\text{rain}} = 4.4 \times 6 = 26\ \text{dB}
```

**Comparison**: Ka-band suffers **2-3\$\times\$
more rain fade** than Ku-band!

**Mitigation**: - Adaptive coding/modulation (ACM)
\$\rightarrow\$ Lower data rate in rain - Site diversity
\$\rightarrow\$ Multiple ground stations (rain cells are
localized) - Higher TX power margin

<div class="center">

------------------------------------------------------------------------

</div>

#### Example 3: V-Band Satellite (40 GHz)

**Next-gen satellite comms** (e.g., OneWeb, Starlink
inter-satellite links):

**Temperate (12 mm/hr)**:

``` math
\gamma_R = 0.350 \times 12^{0.939} = 3.6\ \text{dB/km}
```

``` math
A_{\text{rain}} = 3.6 \times 6 = 22\ \text{dB}
```

**Result**: **Severe rain fade**, requires 25+ dB margin or
advanced mitigation

<div class="center">

------------------------------------------------------------------------

</div>

### Terrestrial Path: 5G mmWave

#### Example 4: 28 GHz 5G Link (Urban Microcell)

**Scenario**: Base station \$\rightarrow\$ UE, 200 m
range, light rain (5 mm/hr)

**Calculation**:

``` math
\gamma_R = 0.187 \times 5^{1.021} = 0.98\ \text{dB/km}
```

``` math
A_{\text{rain}} = 0.98 \times 0.2 = 0.2\ \text{dB}
```

**Impact**: Minimal (short path length)

**Heavy rain (25 mm/hr)**:

``` math
\gamma_R = 0.187 \times 25^{1.021} = 5.2\ \text{dB/km}
```

``` math
A_{\text{rain}} = 5.2 \times 0.2 = 1\ \text{dB}
```

**Conclusion**: 5G mmWave is **relatively rain-tolerant for
short ranges** (\< 500 m)

<div class="center">

------------------------------------------------------------------------

</div>

#### Example 5: 60 GHz Point-to-Point Link

**Scenario**: Building-to-building backhaul, 1 km, moderate rain
(15 mm/hr)

**Calculation**:

``` math
\gamma_R = 0.707 \times 15^{0.826} = 6.4\ \text{dB/km}
```

``` math
A_{\text{rain}} = 6.4 \times 1 = 6.4\ \text{dB}
```

**Plus oxygen absorption**: ~15 dB/km at 60 GHz
(clear air)

``` math
A_{\text{total}} = 15 + 6.4 = 21.4\ \text{dB}
```

**Result**: **60 GHz is impractical for \>1 km in
rain** (used for indoor/short-range only)

<div class="center">

------------------------------------------------------------------------

</div>

## Fog & Cloud Attenuation

**Fog = suspended water droplets** (smaller than rain,
~10-100 \$\mu\$m diameter)

**Attenuation mechanism**: Primarily absorption (droplets
\$\ll\$ \$\lambda\$ for most RF bands)

<div class="center">

------------------------------------------------------------------------

</div>

### Fog Attenuation Model

**Specific attenuation**:

``` math
\gamma_{\text{fog}} = K_l \cdot M \quad (\text{dB/km})
```

Where: - $`M`$ = Liquid water content
(g/m\textsuperscript{3}) - $`K_l`$ = Frequency-dependent
coefficient

**Typical fog**: $`M = 0.05`$
g/m\textsuperscript{3} (light fog) to $`M = 0.5`$
g/m\textsuperscript{3} (dense fog)

<div class="center">

------------------------------------------------------------------------

</div>

### Coefficients by Frequency

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p><span class="math inline"><em>K</em><sub><em>l</em></sub></span> (dB/km per g/m\textsuperscript{3})</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Attenuation (dense fog, 0.5 g/m\textsuperscript{3})</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB/km</td>
</tr>
<tr>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB/km</td>
</tr>
<tr>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB/km</td>
</tr>
<tr>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB/km</td>
</tr>
<tr>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB/km</td>
</tr>
<tr>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB/km</td>
</tr>
</tbody>
</table>

**Key insight**: Fog is **negligible below 30 GHz**, but
significant at THz frequencies.

<div class="center">

------------------------------------------------------------------------

</div>

### Comparison: Rain vs Fog

**At 30 GHz, 1 km path**:

| Condition                              | Attenuation |
|:---------------------------------------|:------------|
| Clear air                              | ~0.1 dB     |
| Dense fog (0.5 g/m\textsuperscript{3}) | 0.10 dB     |
| Light rain (5 mm/hr)                   | 3.7 dB      |
| Moderate rain (12 mm/hr)               | 7.1 dB      |
| Heavy rain (25 mm/hr)                  | 12.5 dB     |

**Rain dominates** at microwave/mmWave frequencies.

**Fog becomes important** at THz (\> 100 GHz):

**At 300 GHz (THz), 100 m path**:

| Condition            | Attenuation                     |
|:---------------------|:--------------------------------|
| Clear air            | ~5 dB (water vapor)             |
| Dense fog            | 0.75 dB                         |
| Light rain (5 mm/hr) | **300+ dB** (complete blockage) |

<div class="center">

------------------------------------------------------------------------

</div>

## Snow & Ice Attenuation

**Dry snow**: Very low attenuation (air + ice crystals, low loss)

``` math
\gamma_{\text{dry snow}} \approx 0.0005 \times f^2 \times S \quad (\text{dB/km})
```

Where: - $`f`$ = Frequency (GHz) - $`S`$ = Snowfall rate (mm/hr liquid
equivalent)

**At 20 GHz, 10 mm/hr dry snow**: $`\gamma \approx 0.2`$ dB/km
(negligible)

<div class="center">

------------------------------------------------------------------------

</div>

**Wet snow** (melting): Much higher attenuation (comparable to
rain)

**Ice crystals** (cirrus clouds): Minimal attenuation (\<
0.1 dB even at 100 GHz)

**Practical implication**: Snow is **far less problematic**
than rain for RF links.

<div class="center">

------------------------------------------------------------------------

</div>

## Hail Attenuation

**Hailstones**: Large (5-50 mm), but mostly ice (low loss tangent)

**Attenuation**: Typically **less than rain of equivalent
water content**

**Why?**: Ice has lower dielectric loss than liquid water
($`\tan \delta_{\text{ice}} \ll \tan \delta_{\text{water}}`$)

**Concern**: **Depolarization** (hailstones tumble, scatter
energy to cross-pol)

<div class="center">

------------------------------------------------------------------------

</div>

## Frequency-Specific Considerations

### Bands Most Affected by Rain

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Band</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Primary Use</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Rain Sensitivity</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">C-band</td>
<td style="text-align: left;">-8 GHz</td>
<td style="text-align: left;">Satellite TV, radar</td>
<td style="text-align: left;"><strong>Low</strong> (0.05 dB/km @ 25
mm/hr)</td>
</tr>
<tr>
<td style="text-align: left;">X-band</td>
<td style="text-align: left;">-12 GHz</td>
<td style="text-align: left;">Military, radar</td>
<td style="text-align: left;"><strong>Moderate</strong> (0.5 dB/km)</td>
</tr>
<tr>
<td style="text-align: left;">Ku-band</td>
<td style="text-align: left;">-18 GHz</td>
<td style="text-align: left;">Satellite TV/broadband</td>
<td style="text-align: left;"><strong>Moderate-High</strong>
(1-2 dB/km)</td>
</tr>
<tr>
<td style="text-align: left;">Ka-band</td>
<td style="text-align: left;">-40 GHz</td>
<td style="text-align: left;">Satellite, 5G backhaul</td>
<td style="text-align: left;"><strong>High</strong> (3-12
dB/km)</td>
</tr>
<tr>
<td style="text-align: left;">V-band</td>
<td style="text-align: left;">-75 GHz</td>
<td style="text-align: left;">Next-gen satellite</td>
<td style="text-align: left;"><strong>Very High</strong> (12-20
dB/km)</td>
</tr>
<tr>
<td style="text-align: left;">W-band</td>
<td style="text-align: left;">-110 GHz</td>
<td style="text-align: left;">Automotive radar, imaging</td>
<td style="text-align: left;"><strong>Extreme</strong>
(20-30 dB/km)</td>
</tr>
</tbody>
</table>

**C-band advantage**: Widely used for tropical regions (low rain
fade)

**Ka-band challenge**: High data rates, but needs ACM and large
margins

<div class="center">

------------------------------------------------------------------------

</div>

## Mitigation Techniques

### 1. Link Margin

**Add extra dB to link budget** for rain:

- Temperate climate, Ku-band: **+3-5 dB**

- Tropical climate, Ka-band: **+8-15 dB**

- mmWave terrestrial (\< 1 km): **+2-3 dB**

**Tradeoff**: Higher TX power or larger antennas (more expensive)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Adaptive Coding & Modulation (ACM)

**Dynamically adjust modulation** based on link quality:

- Clear sky: 16-APSK (4 bits/symbol)

- Light rain: QPSK (2 bits/symbol)

- Heavy rain: BPSK + strong FEC (0.5 bits/symbol effective)

**Result**: **Graceful degradation** (lower data rate instead
of outage)

**Used in**: DVB-S2, 5G NR, satellite modems

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Site Diversity

**Multiple ground stations** separated by 5-20 km:

**Principle**: Rain cells are **localized**
(~5-10 km diameter) - Probability both sites in heavy rain
is low - Switch to non-rainy site

**Diversity gain**: 5-10 dB improvement in availability

**Example**: Satellite gateways often have 2-3 sites for 99.99%
uptime

<div class="center">

------------------------------------------------------------------------

</div>

### 4. Frequency Diversity

**Backup link at lower frequency**:

- Primary: Ka-band (high data rate, rain-sensitive)

- Backup: Ku-band (lower rate, rain-tolerant)

**Switchover**: Automatic when Ka-band SNR drops

<div class="center">

------------------------------------------------------------------------

</div>

### 5. Uplink Power Control (UPC)

**Increase TX power during rain** to compensate for attenuation:

- Monitor beacon signal from satellite

- Detect fade, boost uplink power (up to ~10 dB)

- Avoid saturating satellite transponder

**Limitation**: Power amplifier headroom (can't
boost infinitely)

<div class="center">

------------------------------------------------------------------------

</div>

### 6. Orbit Selection

**Low Earth Orbit (LEO)** satellites have shorter slant paths:

- GEO: ~40,000 km, slant path through rain
  ~6 km @ 30\$^\circ\$ elevation

- LEO: ~550 km, slant path ~2 km @
  30\$^\circ\$ elevation

**Rain attenuation**:
**~3\$\times\$ less for LEO** (shorter
path)

**Starlink/OneWeb advantage**: Better rain performance than GEO

<div class="center">

------------------------------------------------------------------------

</div>

## Depolarization Effects

**Rain also causes cross-polarization**:

**Mechanism**: Raindrops are **oblate** (flattened spheres) -
Horizontal and vertical polarizations experience different phase shifts
- Converts co-pol energy \$\rightarrow\$ cross-pol

**Impact**: Degrades dual-polarization systems (e.g., V/H reuse for
2\$\times\$ capacity)

**Cross-Polarization Discrimination (XPD)**:

``` math
\text{XPD}_{\text{rain}} = U - V \log(A_{\text{rain}}) \quad (\text{dB})
```

Where: - $`U, V`$ = Frequency-dependent constants (~30-40
dB, ~12-20 dB typical) - $`A_{\text{rain}}`$ = Co-pol
attenuation (dB)

**Example**: If rain causes 10 dB attenuation
\$\rightarrow\$ XPD degrades from 30 dB (clear) to
~20 dB

<div class="center">

------------------------------------------------------------------------

</div>

## Regional Considerations

### Temperate Climates (Europe, Northern US, Canada)

**Rain characteristics**: - Moderate intensity (12-22 mm/hr, 0.01%
time) - Long-duration stratiform rain (hours) - Lower fade durations

**Design approach**: - Standard margins (3-5 dB for Ku, 8-12 dB for
Ka) - ACM effective (gradual fade)

<div class="center">

------------------------------------------------------------------------

</div>

### Tropical Climates (Southeast Asia, Equatorial Africa, Amazon)

**Rain characteristics**: - High intensity (42-95 mm/hr, 0.01%
time) - Short-duration convective storms (minutes) - High fade depths

**Design approach**: - Large margins (8-15 dB for Ku, 15-25 dB for
Ka) - Site diversity essential for Ka-band - C-band preferred for
critical services

**Case study**: Indonesia (equatorial) - Ku-band outages:
~0.5% of time (annual) - Ka-band: ~2-5%
(unacceptable without mitigation) - C-band: \< 0.01%
(reliable)

<div class="center">

------------------------------------------------------------------------

</div>

### Coastal vs Inland

**Coastal regions**: Lower rain rates (maritime climate)
**Inland tropics**: Higher convective activity (more intense
storms)

**Elevation matters**: Higher altitude
\$\rightarrow\$ shorter path through rain layer
(troposphere)

<div class="center">

------------------------------------------------------------------------

</div>

## Measurement & Prediction

### Radiometer Method

**Measure sky brightness temperature** $`T_B`$:

``` math
A_{\text{rain}} = 10 \log\left(\frac{T_{\text{sky}} - T_B}{T_{\text{sky}} - T_{\text{medium}}}\right) \quad (\text{dB})
```

**Real-time fade monitoring** for UPC systems.

<div class="center">

------------------------------------------------------------------------

</div>

### Weather Radar Integration

**Use ground-based weather radar** to predict rain attenuation:

1.  Measure rain rate along path (3D map)

2.  Apply ITU model

3.  Predict fade 5-10 minutes ahead

**Proactive ACM**: Adjust modulation before fade hits (minimize
disruption)

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table: Rain Attenuation by Band

**Path**: 6 km slant through rain (satellite,
30\$^\circ\$ elevation)

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Band</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>12 mm/hr (Temperate)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>42 mm/hr (Tropical)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>95 mm/hr (Extreme)</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">C</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
</tr>
<tr>
<td style="text-align: left;">C</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
</tr>
<tr>
<td style="text-align: left;">X</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
</tr>
<tr>
<td style="text-align: left;">Ku</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"><strong>3 dB</strong></td>
<td style="text-align: left;"><strong>9 dB</strong></td>
<td style="text-align: left;"><strong>25 dB</strong></td>
</tr>
<tr>
<td style="text-align: left;">Ku</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
</tr>
<tr>
<td style="text-align: left;">Ka</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"><strong>7 dB</strong></td>
<td style="text-align: left;"><strong>22 dB</strong></td>
<td style="text-align: left;"><strong>55 dB</strong></td>
</tr>
<tr>
<td style="text-align: left;">Ka</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
</tr>
<tr>
<td style="text-align: left;">V</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
</tr>
<tr>
<td style="text-align: left;">V</td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">dB</td>
</tr>
</tbody>
</table>

**Bold**: Typical link budget fades

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Baseline propagation
  loss

- **\[\[Atmospheric-Effects-(Ionospheric,-Tropospheric)\]\]**:
  Clear-air propagation

- **\[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\]**:
  Rayleigh/Rician fading (different mechanism)

- **\[\[Signal-to-Noise-Ratio-(SNR)\]\]**: Impact of
  attenuation on link quality

- **\[\[QPSK-Modulation\]\]** /
  **\[\[LDPC-Codes\]\]**: ACM adapts these for rain conditions

- **Antenna Theory**: Larger antennas provide more gain margin

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Rain fade increases dramatically with
frequency**. C-band is robust but bandwidth-limited. Ka-band and above
require sophisticated mitigation (ACM, diversity, large margins) for
reliable service, especially in tropical regions.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
