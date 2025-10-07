---
layout: chapter
title: "Complete-Link-Budget-Analysis"
chapter: 19
permalink: /chapters/complete-link-budget-analysis/
---

# Complete Link Budget Analysis

\[\[Home\]\] **Link Budget & System Performance**
\[\[Free-Space-Path-Loss-(FSPL)\]\]
\[\[Signal-to-Noise-Ratio-(SNR)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**Link budget is like a financial budget for radio power---you
start with transmit power, subtract losses, add gains, and see if
there's enough “money” (signal) left at the receiver!**

**The fundamental question**: \> “If I transmit from
HERE to THERE, will the receiver get enough signal?”

**The accounting**:

**START**: Transmit power - Your WiFi router: 100 mW (20 dBm) -
Your phone: 200 mW (23 dBm) - Cell tower: 20 W (43 dBm) - Satellite: 100
W (50 dBm)

**GAINS** (things that help): - **Transmit antenna gain**:
Directional antenna focuses power - WiFi router: +2 dB (omnidirectional)
- Satellite dish: +40 dB (very focused!) - **Receive antenna
gain**: Bigger receiver antenna collects more - Phone: +0 dB (tiny
antenna) - Satellite dish: +35 dB

**LOSSES** (things that hurt): - **Free space path loss**:
Signal spreads out with distance - WiFi (50m): -74 dB - Cell tower (1
km): -100 dB  
- Satellite (36,000 km): -206 dB! - **Obstacles**: Walls, trees,
rain - One wall: -5 dB - Heavy rain: -10 dB - **Cable losses**:
Connectors, imperfect cables - Typical: -1 to -3 dB

**END**: Received signal power - Must be stronger than noise floor!
- Typical requirement: Signal \> Noise + 10 to 20 dB

**Example - WiFi Link Budget**:

    Transmit power:          +20 dBm  (100 mW)
    + Transmit antenna:        +2 dB
    ------------------------------
    EIRP (total radiated):   +22 dBm

    - Free space loss (50m):  -74 dB
    - Wall loss (2 walls):    -10 dB
    ------------------------------
    Received power:          -62 dBm

    Noise floor:             -90 dBm
    SNR:                      28 dB   Good!

**Real-world example - Satellite TV**:

    Satellite transmit:      +50 dBm  (100 W)
    + Satellite antenna:      +35 dB   (huge!)
    - Path loss (36,000 km): -206 dB   (ouch!)
    + Your dish:              +35 dB
    ------------------------------
    Received power:          -86 dBm  (tiny!)

    Noise floor:             -100 dBm
    SNR:                      14 dB    Just enough!

**Why link budget matters**: - **System design**: “Do I need
a bigger antenna?” - **Troubleshooting**: “Why is my signal
weak?” - **Standards**: “What's the maximum
range?” - **Cost optimization**: “Can I use cheaper components?”

**The critical moment**: - If received power \> noise +
margin \$\rightarrow\$ Link works! - If received power
\< noise + margin \$\rightarrow\$ Link fails! -
**Margin**: Extra dB for safety (rain, interference, fading) - Good
design: 10-20 dB margin - Marginal design: 3-5 dB margin (risky!)

**When you see it**: - **WiFi extender ads**: “Extends range
by 20 dB!” (link budget calc) - **Satellite dish size**: Bigger =
more gain = closes link budget - **Cell tower placement**:
Engineers run link budgets for coverage - **“Can you hear me
now?”**: That's a link budget test!

**Fun fact**: The Voyager 1 spacecraft (13+ billion miles away)
transmits at 23 W, but by the time it reaches Earth, the signal is
10^-16 watts---that's 0.0000000000000001 watts!
Only massive 70-meter dishes with careful link budgets can hear it!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Link budget** is a comprehensive accounting of **all gains
and losses** from transmitter to receiver, determining if a communication
link will work.

**Purpose**: Answer the critical question: \> “Will
the receiver get enough signal power to achieve the required data rate
and error rate?”

**Bottom line**:

``` math
P_r = P_t + G_t - L_{\text{total}} + G_r \quad (\text{dBm or dBW})
```

Where all gains/losses are in dB

**Link closes** if: $`P_r > P_{\text{min}}`$ (receiver sensitivity)

**Margin**: $`M = P_r - P_{\text{min}}`$ (dB of safety buffer)

<div class="center">

------------------------------------------------------------------------

</div>

## Link Budget Components

### 1. Transmitter Side

#### Transmitted Power (P_t)

**RF power delivered to antenna** (after all TX losses):

``` math
P_t = P_{\text{amp}} - L_{\text{TX}} \quad (\text{dB})
```

Where: - $`P_{\text{amp}}`$ = Power amplifier output (dBm) -
$`L_{\text{TX}}`$ = TX losses (cables, filters, circulators)

**Example**: WiFi router - PA output: 20 dBm (100 mW) -
Cable/connector loss: 0.5 dB - $`P_t = 20 - 0.5 = 19.5`$ dBm

<div class="center">

------------------------------------------------------------------------

</div>

#### Transmit Antenna Gain (G_t)

**Gain relative to isotropic radiator** (dBi):

**EIRP** (Effective Isotropic Radiated Power):

``` math
\text{EIRP} = P_t + G_t \quad (\text{dBm or dBW})
```

**Example**: - $`P_t = 19.5`$ dBm - $`G_t = 2`$ dBi (WiFi router) -
EIRP = 19.5 + 2 = 21.5 dBm

**Regulatory limits**: FCC limits EIRP (e.g., 36 dBm for 2.4 GHz
WiFi)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Propagation Path

#### Free-Space Path Loss (FSPL)

**Loss due to spherical spreading**:

``` math
L_{\text{FSPL}} = 20\log_{10}(d) + 20\log_{10}(f) + 20\log_{10}\left(\frac{4\pi}{c}\right)
```

**Simplified**:

``` math
L_{\text{FSPL}} = 32.45 + 20\log_{10}(d_{\text{km}}) + 20\log_{10}(f_{\text{MHz}}) \quad (\text{dB})
```

**Example**: WiFi @ 2.4 GHz, 100 m - $`f = 2400`$ MHz, $`d = 0.1`$
km

``` math
L_{\text{FSPL}} = 32.45 + 20\log_{10}(0.1) + 20\log_{10}(2400)
```

``` math
= 32.45 - 20 + 67.6 = 80\ \text{dB}
```

**See**: \[\[Free-Space-Path-Loss-(FSPL)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

#### Atmospheric Absorption

**Oxygen and water vapor absorption** (significant \>
10 GHz):

**Zenith attenuation** (at sea level):

| Frequency | Attenuation (dB/km) | Notes                               |
|:----------|:--------------------|:------------------------------------|
| \< 10 GHz | \< 0.01             | Negligible                          |
| 22.2 GHz  | 0.2                 | H\textsubscript{2}O resonance       |
| 60 GHz    | 15                  | O\textsubscript{2} resonance (peak) |
| 120 GHz   | 2                   | Secondary O\textsubscript{2} line   |
| 183 GHz   | 5                   | H\textsubscript{2}O line            |

**Example**: Ka-band satellite @ 20 GHz,
5\$^\circ\$ elevation (path length ~ 11
km through atmosphere) - Attenuation: ~0.05 dB/km
\$\times\$ 11 km = **0.55 dB**

**See**:
\[\[Atmospheric-Effects-(Ionospheric,-Tropospheric)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

#### Rain Attenuation

**Dominant impairment for satellite Ku/Ka/V-band**:

**ITU-R model**: $`\gamma_R = k \cdot R^{\alpha}`$ (dB/km)

**Example**: Ku-band @ 12 GHz, heavy rain (25 mm/hr), 4 km path - k
= 0.0188, \$\alpha\$ = 1.217 -
$`\gamma_R = 0.0188 \times 25^{1.217} = 1.2`$ dB/km - **Total
loss**: 1.2 \$\times\$ 4 = 4.8 dB

**At 99% availability**: Design for rain rate exceeded 1% of time
(temperate: 12 mm/hr, tropical: 42 mm/hr)

**See**: \[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

#### Other Propagation Effects

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Effect</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Typical Loss</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>When Applicable</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Ionospheric scintillation</strong></td>
<td style="text-align: left;">-20 dB</td>
<td style="text-align: left;">L-band satellite,
equatorial, solar max</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Tropospheric scintillation</strong></td>
<td style="text-align: left;">-2 dB</td>
<td style="text-align: left;">Low elevation,
&gt; 10 GHz</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Polarization mismatch</strong></td>
<td style="text-align: left;">-$\infty$ dB</td>
<td style="text-align: left;">Antenna
misalignment, Faraday rotation</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Multipath fading</strong></td>
<td style="text-align: left;">-30 dB</td>
<td style="text-align: left;">Mobile, urban NLOS</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Foliage loss</strong></td>
<td style="text-align: left;">-1 dB/m</td>
<td style="text-align: left;">Trees, vegetation (VHF/UHF)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Building penetration</strong></td>
<td style="text-align: left;">-20 dB</td>
<td style="text-align: left;">Indoor (depends on freq,
materials)</td>
</tr>
</tbody>
</table>

**See**:
\[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\],
\[\[Wave-Polarization\]\]

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Receiver Side

#### Receive Antenna Gain (G_r)

**Same concept as TX antenna** (reciprocity):

**Example**: WiFi laptop - $`G_r = 0`$ dBi (omnidirectional)

**Directional antenna**: - Parabolic dish: 30-60 dBi (satellite) -
Yagi: 10-15 dBi (TV, point-to-point)

<div class="center">

------------------------------------------------------------------------

</div>

#### Receiver Losses (L_RX)

**Losses between antenna and receiver input**:

- Cable loss: 0.5-3 dB (depends on length, freq, cable type)

- Connector loss: 0.1-0.5 dB per connector

- Filter loss: 0.5-2 dB (bandpass filters)

- Circulator/duplexer loss: 0.5-1 dB

**Example**: Satellite ground station - Cable: 2 dB (long run from
dish to equipment room) - Connectors: 0.3 dB - LNA inline: -40 dB (gain,
not loss!) - **Net**: 2 + 0.3 - 40 = -37.7 dB (LNA provides gain)

<div class="center">

------------------------------------------------------------------------

</div>

#### Receiver Sensitivity (P_min)

**Minimum signal power for acceptable performance**:

``` math
P_{\text{min}} = -174 + 10\log_{10}(B) + \text{NF} + \text{SNR}_{\text{req}} + L_{\text{impl}} \quad (\text{dBm})
```

Where: - **-174 dBm/Hz**: Thermal noise floor at 290 K -
**B**: Bandwidth (Hz) - **NF**: Noise figure (dB) -
**SNR_req**: Required SNR for demodulation (dB) -
**L_impl**: Implementation loss (quantization, imperfect sync,
etc.) ~1-3 dB

**Example**: WiFi 802.11n, 20 MHz channel, QPSK 1/2 - Bandwidth: 20
MHz = 73 dBHz - NF: 6 dB (typical WiFi chipset) - SNR_req: 5 dB (QPSK
with robust FEC) - L_impl: 2 dB -
$`P_{\text{min}} = -174 + 73 + 6 + 5 + 2 = -88`$ dBm

**See**: \[\[Noise-Sources-&-Noise-Figure\]\]

<div class="center">

------------------------------------------------------------------------

</div>

## Complete Link Budget Equation

``` math
P_r = \text{EIRP} - L_{\text{FSPL}} - L_{\text{atm}} - L_{\text{rain}} - L_{\text{other}} + G_r - L_{\text{RX}}
```

**Expanded**:

``` math
P_r = [P_t + G_t] - L_{\text{FSPL}} - L_{\text{atm}} - L_{\text{rain}} - L_{\text{multipath}} - L_{\text{misc}} + [G_r - L_{\text{cable}}]
```

**Link margin**:

``` math
M = P_r - P_{\text{min}}
```

**Design guideline**: $`M \geq 10`$ dB (provides fade margin,
interference tolerance)

<div class="center">

------------------------------------------------------------------------

</div>

## Example 1: WiFi Indoor Link

**Scenario**: 2.4 GHz WiFi, 802.11n, 20 MHz, QPSK 1/2, 50 m indoor

### Transmitter

- PA output: 20 dBm

- Cable loss: 0.5 dB

- **P_t**: 19.5 dBm

- Antenna gain: 2 dBi

- **EIRP**: 21.5 dBm

### Path

- Free-space loss @ 50 m, 2.4 GHz:

``` math
L_{\text{FSPL}} = 32.45 + 20\log_{10}(0.05) + 20\log_{10}(2400) = 32.45 - 26 + 67.6 = 74\ \text{dB}
```

- Wall penetration (2 walls \$\times\$ 5 dB): 10 dB

- **Total path loss**: 74 + 10 = 84 dB

### Receiver

- Antenna gain: 0 dBi (laptop internal)

- Cable loss: 0 dB (integrated)

- **Received power**:

``` math
P_r = 21.5 - 84 + 0 = -62.5\ \text{dBm}
```

### Sensitivity

- Thermal noise: -174 dBm/Hz + 73 dBHz = -101 dBm

- NF: 6 dB

- SNR_req: 5 dB (QPSK 1/2)

- Impl loss: 2 dB

- **P_min**: -101 + 6 + 5 + 2 = -88 dBm

### Margin

``` math
M = -62.5 - (-88) = 25.5\ \text{dB}
```

**Result**: Link **closes comfortably** with 25.5 dB margin
(can tolerate fading, interference)

<div class="center">

------------------------------------------------------------------------

</div>

## Example 2: GEO Satellite Ku-band Downlink

**Scenario**: 12 GHz downlink, 36,000 km slant range, 1 m dish RX,
clear sky

### Transmitter (Satellite)

- Satellite PA: 100 W = 50 dBm

- TX antenna gain: 30 dBi (spot beam)

- **EIRP**: 80 dBm = 80 dBW

### Path

- Distance: 36,000 km

- Frequency: 12 GHz

``` math
L_{\text{FSPL}} = 32.45 + 20\log_{10}(36,000) + 20\log_{10}(12,000)
```

``` math
= 32.45 + 91.1 + 81.6 = 205\ \text{dB}
```

- Atmospheric absorption (5\$^\circ\$ elevation): 0.5
  dB

- Clear-sky rain (0.01 mm/hr): 0.01 dB (negligible)

- Ionospheric scintillation margin: 2 dB

- **Total path loss**: 205 + 0.5 + 0 + 2 = 207.5 dB

### Receiver (Ground Station)

- Dish diameter: 1 m

- Antenna gain (eff 60%):

``` math
G_r = 10\log_{10}\left(0.6 \times \left(\frac{\pi \times 1}{0.025}\right)^2\right) = 10\log_{10}(0.6 \times 1580) = 37.8\ \text{dBi}
```

- LNA noise figure: 0.8 dB (cryogenic)

- Cable loss: 1 dB

- **Net RX gain**: 37.8 - 1 = 36.8 dB

**Received power**:

``` math
P_r = 80 - 207.5 + 36.8 = -90.7\ \text{dBm}
```

### Sensitivity (DVB-S2, QPSK 3/4, 36 MHz bandwidth)

- Bandwidth: 36 MHz = 75.6 dBHz

- Thermal noise: -174 + 75.6 = -98.4 dBm

- NF: 0.8 dB (LNA at antenna)

- SNR_req: 6.5 dB (QPSK 3/4 with LDPC)

- Impl loss: 1.5 dB

- **P_min**: -98.4 + 0.8 + 6.5 + 1.5 = -89.6 dBm

### Margin (Clear Sky)

``` math
M = -90.7 - (-89.6) = -1.1\ \text{dB}
```

**Uh oh!** Link **fails** in clear sky (need higher gain or
more TX power)

**Fix**: Increase dish to 1.8 m - New gain: 37.8 + 20log(1.8) =
42.9 dBi - New $`P_r`$: 80 - 207.5 + 42.9 = -84.6 dBm - **New
margin**: -84.6 - (-89.6) = **5 dB** (marginal)

**With 99% rain margin** (add 5 dB rain attenuation): - $`P_r`$ in
rain: -84.6 - 5 = -89.6 dBm - **Rain margin**: 0 dB (link at
threshold!)

**Better fix**: Use 2.4 m dish - Gain: 47.5 dBi - Clear sky: -80
dBm, margin 10 dB - 99% rain: -85 dBm, margin 5 dB

<div class="center">

------------------------------------------------------------------------

</div>

## Example 3: Cellular LTE (2.6 GHz)

**Scenario**: eNodeB to UE, 2.6 GHz, 10 MHz RB, QPSK 1/2, 5 km
suburban

### Transmitter (Cell Tower)

- PA per antenna: 43 dBm (20 W)

- TX antenna: 17 dBi (sector antenna)

- Cable loss: 2 dB

- **EIRP**: 43 + 17 - 2 = 58 dBm

### Path

- FSPL @ 5 km, 2.6 GHz:

``` math
L_{\text{FSPL}} = 32.45 + 20\log_{10}(5) + 20\log_{10}(2600) = 32.45 + 14 + 68.3 = 115\ \text{dB}
```

- Shadowing margin (suburban log-normal): 8 dB (for 90% coverage)

- Building penetration: 10 dB (indoor UE)

- **Total path loss**: 115 + 8 + 10 = 133 dB

### Receiver (UE)

- Antenna gain: -2 dBi (internal, near body)

- **Received power**:

``` math
P_r = 58 - 133 - 2 = -77\ \text{dBm}
```

### Sensitivity (10 MHz, QPSK 1/2)

- Bandwidth: 10 MHz = 70 dBHz

- Thermal noise: -174 + 70 = -104 dBm

- NF: 9 dB (smartphone front-end)

- SNR_req: 4 dB (QPSK 1/2 Turbo code)

- Impl loss: 2 dB

- **P_min**: -104 + 9 + 4 + 2 = -89 dBm

### Margin

``` math
M = -77 - (-89) = 12\ \text{dB}
```

**Result**: Link **closes** with 12 dB margin (adequate for
mobile fading)

**With Rayleigh fading** (10 dB fade depth @ 10% time): - Faded
$`P_r`$: -77 - 10 = -87 dBm - **Faded margin**: -87 - (-89) = 2 dB
(still works, but error rate increases)

**Diversity RX** (2 antennas, max ratio combining): - Diversity
gain: 5 dB (typical for 2-branch) - Effective $`P_r`$ in fade: -87 + 5 =
-82 dBm - **Margin with diversity**: -82 - (-89) = 7 dB (much
better!)

<div class="center">

------------------------------------------------------------------------

</div>

## Link Budget Table Template

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Parameter</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Symbol</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Value</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Units</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Notes</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>TRANSMITTER</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">TX power (PA)</td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub>amp</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dBm</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">TX losses</td>
<td style="text-align: left;"><span class="math inline"><em>L</em><sub>TX</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Cables, filters</td>
</tr>
<tr>
<td style="text-align: left;">Transmit power</td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub><em>t</em></sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dBm</td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub>amp</sub> − <em>L</em><sub>TX</sub></span></td>
</tr>
<tr>
<td style="text-align: left;">TX antenna gain</td>
<td style="text-align: left;"><span class="math inline"><em>G</em><sub><em>t</em></sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dBi</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><strong>EIRP</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dBm</td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub><em>t</em></sub> + <em>G</em><sub><em>t</em></sub></span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>PROPAGATION</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Distance</td>
<td style="text-align: left;"><span class="math inline"><em>d</em></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">km</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Frequency</td>
<td style="text-align: left;"><span class="math inline"><em>f</em></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Free-space loss</td>
<td style="text-align: left;"><span class="math inline"><em>L</em><sub>FSPL</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">+ 20log(d) +
20log(f)</td>
</tr>
<tr>
<td style="text-align: left;">Atmospheric loss</td>
<td style="text-align: left;"><span class="math inline"><em>L</em><sub>atm</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Rain attenuation</td>
<td style="text-align: left;"><span class="math inline"><em>L</em><sub>rain</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">ITU model</td>
</tr>
<tr>
<td style="text-align: left;">Other losses</td>
<td style="text-align: left;"><span class="math inline"><em>L</em><sub>other</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Multipath, penetration,
etc.</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Total path loss</strong></td>
<td style="text-align: left;"><span class="math inline"><em>L</em><sub>total</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Sum</td>
</tr>
<tr>
<td style="text-align: left;"><strong>RECEIVER</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">RX antenna gain</td>
<td style="text-align: left;"><span class="math inline"><em>G</em><sub><em>r</em></sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dBi</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">RX losses</td>
<td style="text-align: left;"><span class="math inline"><em>L</em><sub>RX</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Cables, connectors</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Received power</strong></td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub><em>r</em></sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dBm</td>
<td style="text-align: left;">EIRP - <span class="math inline"><em>L</em><sub>total</sub></span>
+ <span class="math inline"><em>G</em><sub><em>r</em></sub></span> - <span class="math inline"><em>L</em><sub>RX</sub></span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>PERFORMANCE</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Bandwidth</td>
<td style="text-align: left;"><span class="math inline"><em>B</em></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">MHz</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Thermal noise</td>
<td style="text-align: left;"><span class="math inline"><em>N</em><sub>0</sub></span></td>
<td style="text-align: left;">+ 10log(B)</td>
<td style="text-align: left;">dBm</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Noise figure</td>
<td style="text-align: left;">NF</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Noise power</td>
<td style="text-align: left;"><span class="math inline"><em>N</em></span></td>
<td style="text-align: left;"><span class="math inline"><em>N</em><sub>0</sub></span> + NF</td>
<td style="text-align: left;">dBm</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">Required SNR</td>
<td style="text-align: left;">SNR_req</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">For target BER</td>
</tr>
<tr>
<td style="text-align: left;">Impl loss</td>
<td style="text-align: left;"><span class="math inline"><em>L</em><sub>impl</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Typically 1-3 dB</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Sensitivity</strong></td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub>min</sub></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dBm</td>
<td style="text-align: left;"><span class="math inline"><em>N</em></span> + SNR_req +
<span class="math inline"><em>L</em><sub>impl</sub></span></td>
</tr>
<tr>
<td style="text-align: left;"><strong>MARGIN</strong></td>
<td style="text-align: left;"><span class="math inline"><em>M</em></span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;"><span class="math inline"><em>P</em><sub><em>r</em></sub> − <em>P</em><sub>min</sub></span></td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Fade Margin Design Guidelines

**Clear-sky margin** (no fading): - **Satellite (GEO Ku/Ka)**:
5-10 dB - **Terrestrial LOS**: 10-15 dB - **Mobile (NLOS)**:
15-20 dB

**Rain margin** (satellite): - **Availability**: 99%
\$\rightarrow\$ 5-8 dB, 99.9%
\$\rightarrow\$ 10-15 dB, 99.99%
\$\rightarrow\$ 20-30 dB - **Frequency**: Ku-band:
3-10 dB, Ka-band: 10-20 dB

**Multipath fading margin**: - **Rayleigh fading**: 20-30 dB
for 90% location reliability - **Rician K=6 dB**: 10-15 dB

**Total design margin**:

``` math
M_{\text{total}} = M_{\text{clear}} + M_{\text{rain}} + M_{\text{fade}}
```

**Trade-off**: Higher margin \$\rightarrow\$ More
expensive (bigger antennas, more power)

<div class="center">

------------------------------------------------------------------------

</div>

## Adaptive Techniques

**Adaptive Coding and Modulation (ACM)**:

**Concept**: Change modulation/code rate based on channel
conditions

**Example**: DVB-S2X satellite - Clear sky: 32APSK 9/10
\$\rightarrow\$ 3.5 bits/symbol, needs C/N = 16 dB - Light
rain: 8PSK 3/4 \$\rightarrow\$ 2.25 bits/symbol, needs C/N
= 11 dB - Heavy rain: QPSK 1/2 \$\rightarrow\$ 1
bit/symbol, needs C/N = 4 dB

**Benefit**: Maximize throughput when conditions good, maintain
connectivity when conditions poor

<div class="center">

------------------------------------------------------------------------

</div>

## Link Availability

**Probability link meets performance requirement**:

``` math
\text{Availability} = \frac{\text{Time link works}}{\text{Total time}} \times 100\%
```

**Target availability** (depends on application): - **Data
networks**: 99.9% (8.76 hours/year downtime) - **Voice**: 99.99%
(52.6 minutes/year) - **Mission-critical**: 99.999% (5.26
minutes/year)

**Dominated by rain** (for satellite Ku/Ka-band):

**ITU rain statistics**: - Temperate: 12 mm/hr exceeded 1% of time
(3.65 days/year) - Tropical: 42 mm/hr exceeded 1% of time

**Design procedure**: 1. Choose target availability (e.g., 99.9%)
2. Find rain rate exceeded 0.1% of time (e.g., 25 mm/hr temperate) 3.
Calculate rain attenuation for that rain rate 4. Ensure link margin
\> rain attenuation

<div class="center">

------------------------------------------------------------------------

</div>

## Summary

**Link budget essentials**:

1.  **EIRP** = TX power + TX gain (dBm)

2.  **Path loss** = FSPL + atmospheric + rain + other (dB)

3.  **RX power** = EIRP - path loss + RX gain - RX losses (dBm)

4.  **Sensitivity** = Noise floor + NF + SNR_req + impl loss (dBm)

5.  **Margin** = RX power - sensitivity (dB, must be positive!)

**Design targets**: - Clear-sky margin: 10+ dB - Rain margin: 5-20
dB (depends on frequency, availability) - Total margin: 15-30 dB typical

**Adaptive techniques** (ACM, diversity) improve spectral
efficiency and availability.

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Dominant loss
  mechanism

- **\[\[Signal-to-Noise-Ratio-(SNR)\]\]**: Determines required
  C/N

- **\[\[Noise-Sources-&-Noise-Figure\]\]**: RX sensitivity
  calculation

- **\[\[Energy-Ratios-(Es-N0-and-Eb-N0)\]\]**: Alternative SNR
  metrics

- **\[\[Weather-Effects-(Rain-Fade,-Fog-Attenuation)\]\]**:
  Rain margin design

- **\[\[Multipath-Propagation-&-Fading-(Rayleigh,-Rician)\]\]**:
  Fade margin for mobile

- **\[\[Bit-Error-Rate-(BER)\]\]**: Performance metric vs SNR

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Link budget is systematic accounting of
all gains/losses from TX to RX.** Start with EIRP, subtract path losses,
add RX gain, compare to sensitivity. Margin = difference. Design for
10-30 dB total margin to handle fading, rain, interference. Adaptive
techniques maximize throughput while maintaining connectivity.

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
