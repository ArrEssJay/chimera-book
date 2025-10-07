---
layout: chapter
title: "Propagation-Modes-(Ground-Wave,-Sky-Wave,-Line-of-Sight)"
chapter: 49
permalink: /chapters/propagation-modes-(ground-wave,-sky-wave,-line-of-sight)/
---

# Propagation Modes: Ground Wave, Sky Wave, Line-of-Sight

\[\[Home\]\] **RF Propagation**
\[\[Free-Space-Path-Loss-(FSPL)\]\]
\[\[Electromagnetic-Spectrum\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Radio waves can travel three different ways---think of it
like: rolling on the ground, bouncing off the sky, or shooting straight
like a laser!**

**1. Ground Wave** (Surface Wave) - **What**: Radio wave hugs
the Earth's surface and bends around the curve -
**Frequency**: Low (AM radio, 500 kHz - 1.5 MHz) - **Range**:
100-1000+ km depending on frequency - **Analogy**: Rolling a ball
on the ground---it follows the terrain

**Real example**: - **AM radio stations**: Travel hundreds of
miles, even over the horizon - **Why AM works everywhere**: Ground
wave bends around hills/buildings - **Maritime communications**:
Ships use ground wave to communicate over the ocean

**2. Sky Wave** (Ionospheric Bounce) - **What**: Radio wave
shoots up, bounces off ionosphere (layer of charged particles 100-400 km
up), comes back down - **Frequency**: Medium (shortwave radio, 3-30
MHz / HF) - **Range**: Global! Can bounce multiple times -
**Analogy**: Skipping a stone on water---one throw, many
bounces

**Real example**: - **Shortwave radio**: Broadcast from
London, heard in Australia! - **Amateur (ham) radio**: Talk to
people on other continents - **Why it works at night**: Ionosphere
gets stronger after sunset (no sun breaking it apart)

**3. Line-of-Sight** (LOS) - **What**: Radio wave travels
straight like light---if you can't “see” the
tower, signal is blocked - **Frequency**: High (FM radio, TV, cell
phones, WiFi, 30 MHz+) - **Range**: Limited to visible horizon
(~5-50 km depending on height) - **Analogy**: Laser
pointer---must have clear path

**Real example**: - **Cell phones**: Need tower in view
(mostly) - **WiFi**: Walls/floors block it - **Satellite TV**:
Dish must point directly at satellite (trees in the way = no signal!) -
**5G mmWave**: Can't even go through your hand!

**Why different modes?** - **Lower frequency**
\$\rightarrow\$ bends around obstacles, long range, slow
data - **Higher frequency** \$\rightarrow\$
straight-line only, shorter range, fast data

**Fun fact**: During the Cold War, governments used sky wave
propagation to broadcast radio into other countries---signals would
bounce off the ionosphere and arrive “from above,” impossible to
block!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Electromagnetic waves propagate via different mechanisms**
depending on frequency, distance, and environment. Understanding
propagation modes is essential for predicting coverage and designing
wireless systems.

**Three primary modes**: 1. **Ground Wave** (Surface wave) -
LF/MF/HF, follows Earth's curvature 2. **Sky Wave**
(Ionospheric) - HF, bounces off ionosphere, global reach 3.
**Line-of-Sight (LOS)** - VHF and above, direct path required

<div class="center">

------------------------------------------------------------------------

</div>

## Ground Wave Propagation

### Definition

**Ground wave** = EM wave that travels along
Earth's surface, guided by the ground-air interface.

**Mechanism**: - Electric field induces currents in ground
(conductive surface) - Ground acts as imperfect dielectric, slows wave
slightly - **Diffraction** allows wave to follow
Earth's curvature (beyond horizon)

**Frequency range**: **LF to MF** (30 kHz - 3 MHz), limited
use in **HF** (3-30 MHz)

<div class="center">

------------------------------------------------------------------------

</div>

### Attenuation Factors

**Ground wave attenuation depends on**:

1.  **Frequency**: Higher frequency = more attenuation

2.  **Ground conductivity**: Seawater (high \$\sigma\$)
    \< freshwater \< wet soil \< dry soil
    \< ice

3.  **Distance**: Exponential decay with range

4.  **Polarization**: **Vertical polarization required**
    (horizontal is rapidly attenuated)

<div class="center">

------------------------------------------------------------------------

</div>

#### Ground Conductivity

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Surface Type</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Conductivity (S/m)</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Relative Permittivity <span class="math inline"><em>ϵ</em><sub><em>r</em></sub></span></p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Attenuation</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Seawater</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"><strong>Very low</strong> (best)</td>
</tr>
<tr>
<td style="text-align: left;">Freshwater</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Low</td>
</tr>
<tr>
<td style="text-align: left;">Wet soil</td>
<td style="text-align: left;">-0.001</td>
<td style="text-align: left;">-30</td>
<td style="text-align: left;">Moderate</td>
</tr>
<tr>
<td style="text-align: left;">Dry soil</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">-10</td>
<td style="text-align: left;">High</td>
</tr>
<tr>
<td style="text-align: left;">Urban/concrete</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">High</td>
</tr>
<tr>
<td style="text-align: left;">Ice/snow</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">Very high</td>
</tr>
</tbody>
</table>

**Maritime advantage**: Ships can communicate over 1000+ km at
LF/MF (AM broadcast)

**Desert disadvantage**: Dry sand severely limits ground wave (100s
of meters)

<div class="center">

------------------------------------------------------------------------

</div>

### Range vs Frequency

**Empirical range** (over average soil, vertical polarization):

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Wavelength</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Typical Range</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Applications</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">kHz (VLF)</td>
<td style="text-align: left;">m</td>
<td style="text-align: left;">-1000 km</td>
<td style="text-align: left;">Navigation (LORAN)</td>
</tr>
<tr>
<td style="text-align: left;">kHz (LF)</td>
<td style="text-align: left;">m</td>
<td style="text-align: left;">-800 km</td>
<td style="text-align: left;">Longwave broadcast</td>
</tr>
<tr>
<td style="text-align: left;">kHz (MF)</td>
<td style="text-align: left;">m</td>
<td style="text-align: left;">-500 km</td>
<td style="text-align: left;">Marine distress (SOS)</td>
</tr>
<tr>
<td style="text-align: left;">MHz (AM)</td>
<td style="text-align: left;">m</td>
<td style="text-align: left;">-300 km</td>
<td style="text-align: left;">AM radio (nighttime skywave extends
this)</td>
</tr>
<tr>
<td style="text-align: left;">MHz (HF)</td>
<td style="text-align: left;">m</td>
<td style="text-align: left;">-50 km</td>
<td style="text-align: left;">Limited ground wave, skywave dominant</td>
</tr>
</tbody>
</table>

**Key insight**: **Ground wave range decreases rapidly with
frequency**

<div class="center">

------------------------------------------------------------------------

</div>

### Path Loss Model

**Norton ground wave equation** (simplified):

``` math
L_{\text{ground}} = L_{\text{FS}} + A_{\text{ground}}(f, d, \sigma, \epsilon_r)
```

Where: - $`L_{\text{FS}}`$ = Free-space path loss -
$`A_{\text{ground}}`$ = Additional ground attenuation (complex function,
see ITU-R P.368)

**Approximation** (MF band, average soil):

``` math
A_{\text{ground}} \approx 0.1 \times \left(\frac{f}{1\ \text{MHz}}\right)^2 \times \left(\frac{d}{1\ \text{km}}\right) \quad (\text{dB})
```

**Example**: 1 MHz, 100 km over average soil:

``` math
A_{\text{ground}} \approx 0.1 \times 1^2 \times 100 = 10\ \text{dB additional loss}
```

<div class="center">

------------------------------------------------------------------------

</div>

### Applications

#### AM Radio (540-1600 kHz)

**Daytime**: Ground wave only - Local coverage: 50-150 km - Limited
by ground conductivity

**Nighttime**: Skywave + ground wave - Extended coverage: 500-2000+
km (skywave reflection) - Interference common (multiple stations bounce
off ionosphere)

<div class="center">

------------------------------------------------------------------------

</div>

#### Maritime Communications (LF/MF)

**VLF (20-100 kHz)**: Submarine comms - Penetrates seawater (10-20
m depth) - Global coverage (ground wave over ocean) - Very low data rate
(\< 100 bps)

**MF (300-3000 kHz)**: Ship-to-shore - 200-500 km range over
seawater - Distress frequency: 500 kHz (historical SOS)

<div class="center">

------------------------------------------------------------------------

</div>

#### Aviation NDB (Non-Directional Beacons)

**Frequency**: 190-535 kHz **Range**: 50-100 km (ground wave)
**Use**: Aircraft homing (ADF receivers)

<div class="center">

------------------------------------------------------------------------

</div>

## Sky Wave (Ionospheric Propagation)

### Definition

**Sky wave** = EM wave refracted by ionosphere, returning to Earth
at distant location.

**Mechanism**: 1. HF wave travels upward at angle 2. Ionosphere
(charged plasma layer, 60-400 km altitude) acts as refractive medium 3.
Wave bends back toward Earth (if frequency/angle correct) 4. Can bounce
multiple times (multi-hop)

**Frequency range**: **HF (3-30 MHz)** primarily, some
**MF at night**

<div class="center">

------------------------------------------------------------------------

</div>

### Ionospheric Layers

**Ionosphere = ionized by solar UV/X-rays**

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
<p>Ionization</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Daytime Behavior</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Nighttime Behavior</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>D</strong></td>
<td style="text-align: left;">-90 km</td>
<td style="text-align: left;">Low</td>
<td style="text-align: left;"><strong>Absorbs HF</strong> (attenuates MF/HF)</td>
<td style="text-align: left;"><strong>Disappears</strong> (recombination fast)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>E</strong></td>
<td style="text-align: left;">-150 km</td>
<td style="text-align: left;">Moderate</td>
<td style="text-align: left;">Reflects some HF (&lt; 10
MHz)</td>
<td style="text-align: left;">Weakens</td>
</tr>
<tr>
<td style="text-align: left;"><strong>F1</strong></td>
<td style="text-align: left;">-250 km</td>
<td style="text-align: left;">Moderate</td>
<td style="text-align: left;">Reflects MF/HF</td>
<td style="text-align: left;"><strong>Merges
with F2</strong></td>
</tr>
<tr>
<td style="text-align: left;"><strong>F2</strong></td>
<td style="text-align: left;">-400 km</td>
<td style="text-align: left;">High</td>
<td style="text-align: left;"><strong>Primary reflector</strong> for HF</td>
<td style="text-align: left;">Descends, remains strong</td>
</tr>
</tbody>
</table>

**Key concept**: **Critical frequency** $`f_c`$ - maximum
frequency reflected at vertical incidence

``` math
f_c = 9 \sqrt{N_e}
```

Where $`N_e`$ = electron density
(electrons/m\textsuperscript{3})

**Typical values**: - Daytime F2: $`f_c = 10-15`$ MHz - Nighttime
F2: $`f_c = 5-10`$ MHz

<div class="center">

------------------------------------------------------------------------

</div>

### Skip Distance & Hop

**Skip distance** = minimum ground range for sky wave return

``` math
d_{\text{skip}} = 2h \tan(\theta)
```

Where: - $`h`$ = Ionospheric layer height - $`\theta`$ = Elevation angle
of departure

**For F2 layer** (h \$\approx\$ 300 km): - Low angle
(5\$^\circ\$): Skip ~3500 km (single hop)
- High angle (45\$^\circ\$): Skip ~600 km

**Dead zone** = Region between ground wave limit and skip distance
(no coverage)

<div class="center">

------------------------------------------------------------------------

</div>

### Multi-Hop Propagation

**Wave bounces between ionosphere and ground**:

- **Single hop**: 2000-4000 km

- **Two hops**: 4000-8000 km

- **Multiple hops**: Global coverage possible (with sufficient
  power)

**Loss per hop**: 5-15 dB (depends on ionospheric conditions,
frequency)

<div class="center">

------------------------------------------------------------------------

</div>

### Frequency Selection

**MUF (Maximum Usable Frequency)**: Highest frequency that refracts
back (not penetrating ionosphere)

``` math
\text{MUF} = \frac{f_c}{\cos(\theta)}
```

**LUF (Lowest Usable Frequency)**: Lowest frequency not absorbed by
D-layer

**Optimal Working Frequency (FOT)**: 80-90% of MUF (safety margin)

<div class="center">

------------------------------------------------------------------------

</div>

### Diurnal Variations

**Daytime**: - D-layer absorbs lower HF (\< 5 MHz) - F2
layer reflects higher HF (10-30 MHz) - **Best bands**: 15 MHz, 20
MHz (long-distance)

**Nighttime**: - D-layer disappears (no absorption) - F2 descends,
lower MUF - **Best bands**: 5 MHz, 7 MHz (medium-distance) - AM
broadcast skywave active (500-1600 kHz)

<div class="center">

------------------------------------------------------------------------

</div>

### Seasonal & Solar Cycle Effects

**Solar cycle** (11 years): - **Solar max**: High ionization,
higher MUF (30 MHz+ usable) - **Solar min**: Lower MUF (often
\< 20 MHz)

**Seasonal**: - **Summer**: Higher D-layer absorption
(daytime) - **Winter**: Lower absorption, better long-distance
(daytime)

**Sporadic E** (Es): - Unpredictable intense E-layer patches -
Reflects VHF (up to 150 MHz!) for short periods - Used opportunistically
by amateur radio

<div class="center">

------------------------------------------------------------------------

</div>

### Applications

#### Shortwave Broadcast

**Frequency**: 3-30 MHz (HF bands) **Range**: 500-10,000+ km
(multi-hop) **Use**: International broadcasting (BBC World Service,
Voice of America)

**Schedule management**: Different frequencies for day/night,
seasons

<div class="center">

------------------------------------------------------------------------

</div>

#### Amateur Radio (Ham Radio)

**HF bands**: 1.8, 3.5, 7, 10, 14, 18, 21, 24, 28 MHz
**Activity**: Global communication with \< 100W (due to
skywave)

**80m (3.5 MHz)**: Nighttime, regional (500-2000 km) **20m
(14 MHz)**: Daytime, worldwide (DX)

<div class="center">

------------------------------------------------------------------------

</div>

#### Over-the-Horizon (OTH) Radar

**Frequency**: 5-28 MHz **Range**: 1000-3500 km (beyond
line-of-sight) **Use**: Early warning, detection beyond horizon

**Principle**: Reflect radar signal off ionosphere to detect
aircraft/ships at great distance

<div class="center">

------------------------------------------------------------------------

</div>

#### Military HF Communications

**Strategic links**: Long-range, no satellite dependence
**Frequency hopping**: Adapt to ionospheric conditions
**Robustness**: Survives nuclear EMP (no infrastructure needed)

<div class="center">

------------------------------------------------------------------------

</div>

## Line-of-Sight (LOS) Propagation

### Definition

**Line-of-sight** = Direct path from transmitter to receiver, no
obstructions.

**Frequency range**: **VHF and above** (\> 30 MHz)

**Why?**: At VHF+, waves no longer refract around
Earth's curvature (ionosphere transparent)

<div class="center">

------------------------------------------------------------------------

</div>

### Radio Horizon

**Geometric horizon** (flat Earth): Distance where curvature blocks
LOS

**Radio horizon** (accounting for refraction):

``` math
d_{\text{horizon}} = 3.57(\sqrt{h_t} + \sqrt{h_r}) \quad (\text{km})
```

Where: - $`h_t`$ = Transmitter antenna height (meters) - $`h_r`$ =
Receiver antenna height (meters) - **4/3 Earth radius model**
accounts for atmospheric refraction

<div class="center">

------------------------------------------------------------------------

</div>

#### Examples

**Mobile phone** (base station 30m, phone 1.5m):

``` math
d = 3.57(\sqrt{30} + \sqrt{1.5}) = 3.57(5.48 + 1.22) = 24\ \text{km}
```

**TV broadcast tower** (300m, home antenna 10m):

``` math
d = 3.57(\sqrt{300} + \sqrt{10}) = 3.57(17.3 + 3.16) = 73\ \text{km}
```

**Aircraft at 10,000m** (cruising altitude):

``` math
d = 3.57 \sqrt{10000} = 357\ \text{km}
```

**Satellite (LEO at 550 km)**: Horizon ~2500 km
(covers ~5% of Earth)

<div class="center">

------------------------------------------------------------------------

</div>

### Fresnel Zone

**For reliable LOS, path must be clear not just geometrically, but
also volumetrically**.

**Fresnel zone** = Ellipsoidal region around direct path where
reflections can interfere

**First Fresnel zone radius** at midpoint:

``` math
r_1 = \sqrt{\frac{\lambda d_1 d_2}{d_1 + d_2}}
```

Where: - $`\lambda`$ = Wavelength - $`d_1, d_2`$ = Distances from TX and
RX to obstacle

**60% clearance rule**: Keep first Fresnel zone 60% clear for
reliable LOS

**Example**: 2 GHz (\$\lambda\$ = 15 cm), 10 km link:

``` math
r_1 = \sqrt{\frac{0.15 \times 5000 \times 5000}{10000}} = \sqrt{375} = 19\ \text{m}
```

**Need**: 60% \$\times\$ 19m = **11m
clearance** at midpoint

<div class="center">

------------------------------------------------------------------------

</div>

### Applications

#### FM Radio (VHF, 88-108 MHz)

**Range**: Line-of-sight limited - Transmitter tower: 100-300m
\$\rightarrow\$ 40-70 km range - Terrain shadowing common
(mountains block signal)

<div class="center">

------------------------------------------------------------------------

</div>

#### TV Broadcast (VHF/UHF)

**VHF**: Channels 2-13 (54-216 MHz) - legacy analog **UHF**:
Channels 14-51 (470-698 MHz) - digital TV (ATSC, DVB-T)

**Range**: 40-100 km (depends on tower height)

<div class="center">

------------------------------------------------------------------------

</div>

#### Cellular (800 MHz - 6 GHz)

**Macrocells**: LOS to horizon (~10-30 km)
**Microcells**: Urban, 200m-2km (NLOS due to buildings, but
diffraction/scattering help) **Picocells**: Indoor, 10-100m

<div class="center">

------------------------------------------------------------------------

</div>

#### Microwave Links (6-80 GHz)

**Point-to-point backhaul**: - Tower-to-tower links (10-50 km) -
Requires clear Fresnel zone - Rain fade significant (see
\[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\])

<div class="center">

------------------------------------------------------------------------

</div>

#### Satellite Communications

**All satellite links are LOS**: - GEO (35,786 km): Always LOS if
above 10\$^\circ\$ elevation - LEO (400-1200 km): Pass
overhead, 5-15 min visibility windows - MEO (GPS, 20,200 km): 4-8 hours
visibility

<div class="center">

------------------------------------------------------------------------

</div>

#### 5G mmWave (24-100 GHz)

**Ultra-short range LOS**: - Range: 100-500m typical - Building
penetration: Poor (requires outdoor-to-outdoor LOS) - Use: Dense urban,
stadiums, fixed wireless access

<div class="center">

------------------------------------------------------------------------

</div>

## Comparison: Propagation Modes

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Mode</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Range</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Characteristics</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Applications</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Ground Wave</strong></td>
<td style="text-align: left;">LF/MF</td>
<td style="text-align: left;">-500 km</td>
<td style="text-align: left;">Follows curvature, stable,
vertical pol</td>
<td style="text-align: left;">AM radio, maritime, NDB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Sky Wave</strong></td>
<td style="text-align: left;">HF</td>
<td style="text-align: left;">-10,000+ km</td>
<td style="text-align: left;">Ionospheric reflection,
variable</td>
<td style="text-align: left;">Shortwave, amateur, OTH radar</td>
</tr>
<tr>
<td style="text-align: left;"><strong>LOS</strong></td>
<td style="text-align: left;">VHF+</td>
<td style="text-align: left;">-100 km</td>
<td style="text-align: left;">Direct path, terrain-limited</td>
<td style="text-align: left;">FM, TV,
cellular, microwave</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Satellite LOS</strong></td>
<td style="text-align: left;">VHF-Ka</td>
<td style="text-align: left;">Global</td>
<td style="text-align: left;">Space path, rain fade
(&gt;10 GHz)</td>
<td style="text-align: left;">GPS, satellite TV/internet</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Troposcatter</strong></td>
<td style="text-align: left;">UHF/SHF</td>
<td style="text-align: left;">-500 km</td>
<td style="text-align: left;">Beyond-horizon scatter</td>
<td style="text-align: left;">Military long-haul</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Non-Line-of-Sight (NLOS) Propagation

**Even at VHF+, signals can reach beyond LOS via**:

1.  **Diffraction**: Bending around obstacles (buildings, hills)

2.  **Reflection**: Bounce off surfaces (see
    \[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\])

3.  **Scattering**: Random scatter from rough surfaces, rain, foliage

4.  **Troposcatter**: Forward scatter from tropospheric turbulence
    (beyond-horizon, 100-500 km)

**Result**: Cellular networks work in urban canyons (NLOS), but
with higher path loss and multipath fading.

<div class="center">

------------------------------------------------------------------------

</div>

## Ducting & Anomalous Propagation

### Tropospheric Ducting

**Temperature inversion** creates refractive layer that traps
VHF/UHF waves:

**Mechanism**: Warm air over cool surface
\$\rightarrow\$ gradient in refractive index
\$\rightarrow\$ wave bends back to Earth

**Effect**: **VHF/UHF propagation far beyond horizon**
(500-2000 km)

**Conditions**: - Coastal regions (cool ocean, warm land) -
High-pressure systems (calm, clear weather) - Morning/evening
(temperature inversions)

**Impact**: - FM radio stations suddenly heard 1000 km away - TV
interference from distant stations - Cellular interference (distant
cells)

<div class="center">

------------------------------------------------------------------------

</div>

### Evaporation Ducts

**Common over oceans**: Humidity gradient creates duct
~10-50m above sea surface

**Effect**: Ships can communicate VHF far beyond horizon (200-500
km)

<div class="center">

------------------------------------------------------------------------

</div>

## Propagation Models Summary

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
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Accuracy</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Free-space</strong></td>
<td style="text-align: left;">Satellite, LOS</td>
<td style="text-align: left;">All</td>
<td style="text-align: left;">Baseline (ideal)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Two-ray</strong></td>
<td style="text-align: left;">Flat terrain, LOS/reflection</td>
<td style="text-align: left;">VHF+</td>
<td style="text-align: left;">$\pm$6 dB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Okumura-Hata</strong></td>
<td style="text-align: left;">Urban/suburban cellular</td>
<td style="text-align: left;">MHz - 2 GHz</td>
<td style="text-align: left;">$\pm$10 dB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>COST-231</strong></td>
<td style="text-align: left;">Urban microcells</td>
<td style="text-align: left;">MHz - 2 GHz</td>
<td style="text-align: left;">$\pm$8 dB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>ITU-R P.1546</strong></td>
<td style="text-align: left;">Broadcast (TV/FM)</td>
<td style="text-align: left;">MHz - 3 GHz</td>
<td style="text-align: left;">$\pm$10 dB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>ITU-R P.368</strong></td>
<td style="text-align: left;">Ground wave</td>
<td style="text-align: left;">LF/MF/HF</td>
<td style="text-align: left;">$\pm$5
dB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Longley-Rice</strong></td>
<td style="text-align: left;">Irregular terrain</td>
<td style="text-align: left;">MHz - 20 GHz</td>
<td style="text-align: left;">$\pm$12 dB</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Baseline loss for
  all propagation modes

- **\[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\]**:
  Rayleigh/Rician fading in NLOS

- **\[\[Atmospheric-Effects-(Ionospheric,-Tropospheric)\]\]**:
  Ionospheric refraction, atmospheric absorption

- **\[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\]**:
  Rain fade at high frequencies

- **\[\[Electromagnetic-Spectrum\]\]**: Frequency-dependent
  propagation behavior

- **\[\[Antenna-Theory-Basics\]\]**: Antenna height extends
  radio horizon

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Propagation mode depends on frequency**.
LF/MF = ground wave, HF = skywave, VHF+ = LOS. Understanding which mode
applies is critical for predicting coverage and designing reliable
links.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
