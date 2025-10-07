---
layout: chapter
title: "Electromagnetic-Spectrum"
chapter: 22
permalink: /chapters/electromagnetic-spectrum/
---

# Electromagnetic Spectrum

\[\[Home\]\] **Foundation**
\[\[Maxwell's-Equations-&-Wave-Propagation\]\]
\[\[Frequency-Shift-Keying-(FSK)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

**The electromagnetic spectrum is like a piano keyboard---but
instead of sound notes, it's frequencies of light and
radio waves.**

**The big picture**: - **Low notes (low frequency)**: Radio,
AM/FM, WiFi, microwaves - **Middle notes**: Infrared (heat you feel
from a fire), visible light (colors we see) - **High notes (high
frequency)**: Ultraviolet, X-rays, gamma rays

**It's all the same thing!** Radio waves, WiFi,
light, X-rays are all electromagnetic waves---just different
frequencies.

**Real-world frequencies**: - **AM radio**: ~1
MHz (long waves, travel far) - **FM radio**: ~100 MHz
(shorter waves, better quality) - **WiFi**: 2.4 GHz or 5 GHz (very
short waves, fast data) - **Visible light**: ~500 THz
(that's 500,000 GHz!) - **X-rays**:
~10\textsuperscript{1}\textsuperscript{8}
Hz (penetrate body)

**Why frequency matters**: - **Low frequency**: Travels far,
penetrates buildings, but needs big antennas - **High frequency**:
Fast data, small antennas, but doesn't travel as far

**Fun fact**: The rainbow you see is less than 1 octave of
frequency! The EM spectrum spans 20+ octaves from radio to gamma rays.

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

The **electromagnetic (EM) spectrum** encompasses all frequencies
of electromagnetic radiation, from extremely low frequency (ELF) radio
waves to ultra-high energy gamma rays. **All EM waves travel at
the speed of light** ($`c \approx 3 \times 10^8`$ m/s in vacuum) and obey
\[\[Maxwell's-Equations-&-Wave-PropagationMaxwell's
equations\]\].

**Key relationship**:

``` math
c = \lambda f
```

Where: - $`c`$ = Speed of light (299,792,458 m/s) - $`\lambda`$ =
Wavelength (meters) - $`f`$ = Frequency (Hz)

**Energy per photon** (quantum perspective):

``` math
E = h f
```

Where $`h = 6.626 \times 10^{-34}`$ J\$\cdot\$s
(Planck's constant)

<div class="center">

------------------------------------------------------------------------

</div>

## Spectrum Bands & Applications

### Radio Frequencies (RF): 3 kHz - 300 GHz

#### **ELF (Extremely Low Frequency): 3 Hz - 3 kHz**

- **Wavelength**: 100,000 km - 100 km

- **Applications**: Submarine communication (penetrates seawater),
  geophysical surveys

- **Propagation**: Earth-ionosphere waveguide, minimal attenuation

- **Example**: 76 Hz US Navy submarine comms

<div class="center">

------------------------------------------------------------------------

</div>

#### **VLF (Very Low Frequency): 3 kHz - 30 kHz**

- **Wavelength**: 100 km - 10 km

- **Applications**: Navigation (LORAN), time signals, lightning
  detection

- **Propagation**: Ground wave, ionospheric reflection

- **Example**: 24 kHz VLF navigation beacon

<div class="center">

------------------------------------------------------------------------

</div>

#### **LF (Low Frequency): 30 kHz - 300 kHz**

- **Wavelength**: 10 km - 1 km

- **Applications**: AM radio (longwave), RFID, aviation beacons

- **Propagation**: Ground wave (stable day/night), ionospheric at
  night

- **Example**: 153 kHz longwave broadcast

<div class="center">

------------------------------------------------------------------------

</div>

#### **MF (Medium Frequency): 300 kHz - 3 MHz**

- **Wavelength**: 1 km - 100 m

- **Applications**: AM radio (broadcast), maritime communication

- **Propagation**: Ground wave (daytime), skywave (nighttime)

- **Example**: 540-1600 kHz AM broadcast band

<div class="center">

------------------------------------------------------------------------

</div>

#### **HF (High Frequency): 3 MHz - 30 MHz**

- **Wavelength**: 100 m - 10 m

- **Applications**: Shortwave radio, amateur radio,
  over-the-horizon radar

- **Propagation**: Ionospheric refraction (skywave), global reach

- **Example**: 14.2 MHz amateur band, intercontinental comms

<div class="center">

------------------------------------------------------------------------

</div>

#### **VHF (Very High Frequency): 30 MHz - 300 MHz**

- **Wavelength**: 10 m - 1 m

- **Applications**: FM radio (88-108 MHz), TV broadcast, aviation,
  marine

- **Propagation**: Line-of-sight (LOS), occasional tropospheric
  ducting

- **Example**: 146 MHz amateur band, 120 MHz air traffic control

<div class="center">

------------------------------------------------------------------------

</div>

#### **UHF (Ultra High Frequency): 300 MHz - 3 GHz**

- **Wavelength**: 1 m - 10 cm

- **Applications**: TV, cellular (GSM/LTE), GPS, WiFi (2.4 GHz),
  Bluetooth

- **Propagation**: LOS, building penetration moderate, rain
  attenuation minimal

- **Example**: 1.575 GHz GPS L1, 2.4 GHz ISM band

<div class="center">

------------------------------------------------------------------------

</div>

#### **SHF (Super High Frequency): 3 GHz - 30 GHz**

- **Wavelength**: 10 cm - 1 cm

- **Applications**: Satellite comms, radar, 5G (3.5 GHz), WiFi (5-6
  GHz), point-to-point links

- **Propagation**: LOS required, rain fade significant, atmospheric
  absorption

- **Example**: 5.8 GHz WiFi, 12 GHz satellite downlink (Ku-band)

<div class="center">

------------------------------------------------------------------------

</div>

#### **EHF (Extremely High Frequency): 30 GHz - 300 GHz**

- **Wavelength**: 1 cm - 1 mm

- **Applications**: mmWave 5G (28/39 GHz), automotive radar (77
  GHz), radio astronomy

- **Propagation**: Severe rain/foliage attenuation, oxygen
  absorption peak @ 60 GHz

- **Example**: 39 GHz 5G, 94 GHz cloud radar

**60 GHz oxygen absorption**: 15 dB/km (used for secure short-range
comms)

<div class="center">

------------------------------------------------------------------------

</div>

### Terahertz (THz) Gap: 300 GHz - 10 THz

- **Wavelength**: 1 mm - 30 \$\mu\$m

- **Applications**: Security imaging, spectroscopy, biomedical
  sensing, **\[\[AID-Protocol-Case-StudyAID
  Protocol\]\]** (1.875 THz)

- **Propagation**: Atmospheric absorption severe
  (H\textsubscript{2}O lines), limited range

- **Technology**: Quantum cascade lasers (QCLs), photoconductive
  switches

- **Status**: “THz gap” (historically difficult to
  generate/detect)

**Key THz features**: - Non-ionizing (safe for biological tissue,
unlike X-rays) - Penetrates clothing, paper, plastics (not metal) - High
spatial resolution (sub-mm) - Strong water absorption (limits biomedical
depth)

**See**: \[\[Terahertz-(THz)-Technology\]\] for detailed
discussion

<div class="center">

------------------------------------------------------------------------

</div>

### Infrared (IR): 300 GHz - 430 THz

#### **Far-IR (FIR): 300 GHz - 20 THz**

- **Wavelength**: 1 mm - 15 \$\mu\$m

- **Applications**: Thermal imaging, astronomy, spectroscopy

- **Source**: Blackbody radiation (room temperature objects peak
  ~10 \$\mu\$m)

#### **Mid-IR (MIR): 20 THz - 120 THz**

- **Wavelength**: 15 \$\mu\$m - 2.5
  \$\mu\$m

- **Applications**: Night vision, chemical sensing (molecular
  fingerprints), CO\textsubscript{2} lasers

#### **Near-IR (NIR): 120 THz - 430 THz**

- **Wavelength**: 2.5 \$\mu\$m - 700 nm

- **Applications**: Fiber optic comms (1550 nm), remote controls,
  biomedical imaging

- **Atmospheric window**: 1.3-1.55 \$\mu\$m (low loss
  in silica fiber)

<div class="center">

------------------------------------------------------------------------

</div>

### Visible Light: 430 THz - 750 THz

- **Wavelength**: 700 nm (red) - 400 nm (violet)

- **Frequencies**:

  - Red: ~430 THz (700 nm)

  - Yellow: ~510 THz (590 nm)

  - Green: ~560 THz (535 nm)

  - Blue: ~670 THz (450 nm)

  - Violet: ~750 THz (400 nm)

- **Applications**: Human vision, optical comms (free-space),
  LiDAR, photovoltaics

- **Energy**: 1.6-3.1 eV per photon (non-ionizing)

**Solar spectrum**: Peaks at ~550 nm (green),
corresponds to peak sensitivity of human eye (photopic vision)

<div class="center">

------------------------------------------------------------------------

</div>

### Ultraviolet (UV): 750 THz - 30 PHz

#### **Near-UV (NUV): 750 THz - 1.5 PHz**

- **Wavelength**: 400 nm - 200 nm

- **Applications**: Sterilization, fluorescence microscopy,
  photolithography

- **Biological effects**: Tanning, vitamin D synthesis, DNA damage
  (UVB)

#### **Far-UV (FUV): 1.5 PHz - 30 PHz**

- **Wavelength**: 200 nm - 10 nm

- **Applications**: Extreme sterilization, plasma diagnostics

- **Absorption**: Strongly absorbed by atmosphere (ozone layer
  blocks \< 290 nm)

**UVC (\< 280 nm)**: Germicidal (destroys DNA/RNA), used
in air/water purification

<div class="center">

------------------------------------------------------------------------

</div>

### X-Rays: 30 PHz - 30 EHz

- **Wavelength**: 10 nm - 0.01 nm

- **Energy**: 100 eV - 100 keV

- **Applications**: Medical imaging, crystallography, security
  screening, astronomy

- **Generation**: Bremsstrahlung (electron deceleration),
  synchrotron radiation

- **Biological effects**: **Ionizing** (breaks chemical bonds,
  causes mutations)

**Soft X-rays** (0.1-10 keV): Water window imaging, biological
samples **Hard X-rays** (10-100 keV): Penetrates tissue, bone
imaging (radiography)

<div class="center">

------------------------------------------------------------------------

</div>

### Gamma Rays: \> 30 EHz

- **Wavelength**: \< 0.01 nm

- **Energy**: \> 100 keV

- **Sources**: Radioactive decay, nuclear reactions, cosmic rays,
  pulsars

- **Applications**: Cancer therapy (radiotherapy), sterilization,
  astrophysics

- **Detection**: Scintillation detectors, Compton scattering

- **Biological effects**: **Highly ionizing** (severe DNA
  damage, cell death)

**Cosmic gamma rays**: Up to TeV energies
(10\textsuperscript{1}\textsuperscript{2}
eV), from supernovae, black holes

<div class="center">

------------------------------------------------------------------------

</div>

## Atmospheric Transmission Windows

**Earth's atmosphere is opaque to most EM
spectrum**. Only certain “windows” allow propagation:

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Band</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Frequency/Wavelength</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Transmission</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Absorbers</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>RF (&lt; 30 GHz)</strong></td>
<td style="text-align: left;">All RF below mmWave</td>
<td style="text-align: left;">Excellent</td>
<td style="text-align: left;">Ionosphere (HF reflection)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>mmWave (30-300 GHz)</strong></td>
<td style="text-align: left;">-10 mm</td>
<td style="text-align: left;">Poor</td>
<td style="text-align: left;">Water vapor, oxygen (60
GHz)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>THz (0.3-10 THz)</strong></td>
<td style="text-align: left;">$\mu$m - 1 mm</td>
<td style="text-align: left;">Very poor</td>
<td style="text-align: left;">Water vapor, CO\textsubscript{2}</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Far-IR</strong></td>
<td style="text-align: left;">-300 $\mu$m</td>
<td style="text-align: left;">Poor</td>
<td style="text-align: left;">H\textsubscript{2}O,
CO\textsubscript{2},
O\textsubscript{3}</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Mid-IR</strong></td>
<td style="text-align: left;">-15 $\mu$m</td>
<td style="text-align: left;">Moderate</td>
<td style="text-align: left;">H\textsubscript{2}O (many lines),
CO\textsubscript{2} (15 $\mu$m)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Near-IR</strong></td>
<td style="text-align: left;">-2.5 $\mu$m</td>
<td style="text-align: left;">Good</td>
<td style="text-align: left;">H\textsubscript{2}O (weak bands)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Visible</strong></td>
<td style="text-align: left;">-700 nm</td>
<td style="text-align: left;">Excellent</td>
<td style="text-align: left;">Rayleigh scattering (sky is
blue)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Near-UV</strong></td>
<td style="text-align: left;">-400 nm</td>
<td style="text-align: left;">Good</td>
<td style="text-align: left;">Ozone (&lt; 320 nm)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>UVC / X-ray / Gamma</strong></td>
<td style="text-align: left;">&lt; 280 nm</td>
<td style="text-align: left;">Blocked</td>
<td style="text-align: left;">Ozone,
O\textsubscript{2},
N\textsubscript{2}</td>
</tr>
</tbody>
</table>

**Implications**: - **Ground-to-satellite comms**: Use RF
(microwaves) or optical (laser comms) - **THz security imaging**:
Indoor only (outdoor = severe H\textsubscript{2}O
absorption) - **Radio astronomy**: “Radio window” (few MHz - 30
GHz) and “optical window” (visible/NIR)

<div class="center">

------------------------------------------------------------------------

</div>

## Ionizing vs Non-Ionizing Radiation

**Critical distinction**:

### Non-Ionizing (\< 3.1 eV, \< 1 PHz)

**Photon energy insufficient to ionize atoms**:

- **RF/Microwave/IR/Visible**: Causes heating (dielectric loss),
  molecular vibration/rotation

- **Biological effects**: Thermal (tissue heating), non-thermal
  (debated, e.g., RF-EMF effects)

- **Safety**: Exposure limits based on specific absorption rate
  (SAR, W/kg)

**Example**: WiFi (2.4 GHz, $`E = hf = 10^{-5}`$ eV)
\$\rightarrow\$ Pure heating, no ionization

<div class="center">

------------------------------------------------------------------------

</div>

### Ionizing (\> 10 eV, \> 2.4 PHz)

**Photon energy sufficient to eject electrons from atoms**:

- **UV (high-energy), X-rays, Gamma rays**: Breaks chemical bonds,
  damages DNA

- **Biological effects**: Mutations, cancer, acute radiation
  syndrome (high dose)

- **Safety**: Exposure limits based on dose (Sieverts, Sv)

**Ionization threshold**: ~10 eV for biological
molecules (double-strand DNA breaks at ~20 eV)

**Example**: X-ray (30 keV) \$\rightarrow\$ Ejects
inner-shell electrons, Compton scattering, DNA damage

<div class="center">

------------------------------------------------------------------------

</div>

## Frequency Allocation & Regulation

**International Telecommunication Union (ITU)** allocates spectrum
globally:

### Key Allocated Bands

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Service</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Regulation</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">AM Radio</td>
<td style="text-align: left;">-1710 kHz</td>
<td style="text-align: left;">Licensed broadcast</td>
</tr>
<tr>
<td style="text-align: left;">FM Radio</td>
<td style="text-align: left;">-108 MHz</td>
<td style="text-align: left;">Licensed broadcast</td>
</tr>
<tr>
<td style="text-align: left;">TV (VHF)</td>
<td style="text-align: left;">-216 MHz</td>
<td style="text-align: left;">Licensed broadcast (analog legacy)</td>
</tr>
<tr>
<td style="text-align: left;">Aviation</td>
<td style="text-align: left;">-137 MHz</td>
<td style="text-align: left;">Regulated (safety of life)</td>
</tr>
<tr>
<td style="text-align: left;">Marine VHF</td>
<td style="text-align: left;">-162 MHz</td>
<td style="text-align: left;">Regulated</td>
</tr>
<tr>
<td style="text-align: left;">Cellular (US)</td>
<td style="text-align: left;">-6000 MHz</td>
<td style="text-align: left;">Licensed (carriers)</td>
</tr>
<tr>
<td style="text-align: left;">GPS</td>
<td style="text-align: left;">-1.575 GHz</td>
<td style="text-align: left;">Protected (military/civilian)</td>
</tr>
<tr>
<td style="text-align: left;">WiFi (2.4 GHz)</td>
<td style="text-align: left;">-2.4835 GHz</td>
<td style="text-align: left;"><strong>ISM band</strong> (unlicensed)</td>
</tr>
<tr>
<td style="text-align: left;">WiFi (5 GHz)</td>
<td style="text-align: left;">-5.850 GHz</td>
<td style="text-align: left;"><strong>U-NII</strong> (unlicensed,
indoor/outdoor rules)</td>
</tr>
<tr>
<td style="text-align: left;">5G mmWave</td>
<td style="text-align: left;">-47 GHz</td>
<td style="text-align: left;">Licensed (auction)</td>
</tr>
<tr>
<td style="text-align: left;">Satellite (Ka)</td>
<td style="text-align: left;">-40 GHz</td>
<td style="text-align: left;">Licensed</td>
</tr>
</tbody>
</table>

**ISM bands** (Industrial, Scientific, Medical): Unlicensed, shared
use, higher interference - 902-928 MHz (US), 2.4-2.5 GHz (global),
5.725-5.875 GHz

<div class="center">

------------------------------------------------------------------------

</div>

## Wavelength vs Antenna Size

**Rule of thumb**: Efficient antennas are typically $`\lambda/2`$
or $`\lambda/4`$ in size.

**Examples**:

| Frequency          | Wavelength   | Typical Antenna                   |
|:-------------------|:-------------|:----------------------------------|
| kHz (LF)           | 2000 m       | 500 m tower (impractical!)        |
| 1 MHz (AM)         | 300 m        | 75 m vertical mast                |
| 100 MHz (FM)       | 3 m          | 1.5 m whip (\$\lambda\$/2 dipole) |
| 1 GHz (cellular)   | 30 cm        | 7.5 cm patch (\$\lambda\$/4)      |
| 10 GHz (satellite) | 3 cm         | 1.5 cm patch array                |
| 300 GHz (mmWave)   | 1 mm         | 0.25 mm array element             |
| 1.875 THz (AID)    | 160 \$\mu\$m | 40 \$\mu\$m                       
                                     aperture (phased array)            |

**Implication**: Higher frequencies enable **smaller antennas
and phased arrays**, but propagation is poorer.

<div class="center">

------------------------------------------------------------------------

</div>

## Spectrum Utilization Trends

### Historical Progression

**1900s**: MF/HF (AM radio, maritime) **1950s**: VHF/UHF (FM,
TV, early mobile) **1990s**: SHF (cellular 2G/3G, WiFi, GPS)
**2010s**: EHF (5G mmWave, 60 GHz WiGig) **2020s**: THz
(security, 6G research, biomedical)

**Driver**: **Spectrum congestion**
\$\rightarrow\$ Move to higher frequencies for bandwidth -
VHF/UHF: Crowded (licensed, competitive) - mmWave: Abundant spectrum
(GHz of bandwidth available) - THz: Virtually unlimited (atmospheric
absorption limits range, but OK for short-range)

<div class="center">

------------------------------------------------------------------------

</div>

## Propagation Characteristics by Band

### Long Wavelengths (LF/MF/HF)

**Advantages**: - Ground wave propagation (stable, follows Earth
curvature) - Ionospheric reflection (HF skywave
\$\rightarrow\$ global reach) - Penetrates buildings,
foliage, water

**Disadvantages**: - Large antennas required - Low bandwidth (kHz)
- Crowded spectrum

<div class="center">

------------------------------------------------------------------------

</div>

### Medium Wavelengths (VHF/UHF)

**Advantages**: - Moderate antenna size - Good building penetration
(lower UHF) - Balanced range vs bandwidth

**Disadvantages**: - Line-of-sight propagation (VHF) - Spectrum
congestion

<div class="center">

------------------------------------------------------------------------

</div>

### Short Wavelengths (SHF/EHF/THz)

**Advantages**: - Huge bandwidth (GHz available) - Small antennas
(phased arrays feasible) - Narrow beams (spatial reuse, security)

**Disadvantages**: - Severe atmospheric attenuation (rain, oxygen,
water vapor) - No building penetration - Requires line-of-sight

**Oxygen absorption**: 60 GHz (15 dB/km)
\$\rightarrow\$ Secure short-range comms (signals
don't travel far) **Water vapor**: THz
(\>100 dB/km) \$\rightarrow\$ Indoor/short-range
only

<div class="center">

------------------------------------------------------------------------

</div>

## Summary Table: Spectrum at a Glance

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
<p>Wavelength</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Key Applications</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Propagation</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Ionizing?</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">ELF</td>
<td style="text-align: left;">Hz - 3 kHz</td>
<td style="text-align: left;">,000 km - 100 km</td>
<td style="text-align: left;">Submarine comms</td>
<td style="text-align: left;">Earth-ionosphere waveguide</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">VLF</td>
<td style="text-align: left;">-30 kHz</td>
<td style="text-align: left;">-10 km</td>
<td style="text-align: left;">Navigation, time signals</td>
<td style="text-align: left;">Ground wave</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">LF</td>
<td style="text-align: left;">-300 kHz</td>
<td style="text-align: left;">-1 km</td>
<td style="text-align: left;">Longwave radio, RFID</td>
<td style="text-align: left;">Ground wave,
ionosphere</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">MF</td>
<td style="text-align: left;">kHz - 3 MHz</td>
<td style="text-align: left;">km - 100 m</td>
<td style="text-align: left;">AM broadcast</td>
<td style="text-align: left;">Ground/skywave</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">HF</td>
<td style="text-align: left;">-30 MHz</td>
<td style="text-align: left;">-10 m</td>
<td style="text-align: left;">Shortwave, amateur</td>
<td style="text-align: left;">Ionospheric refraction</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">VHF</td>
<td style="text-align: left;">-300 MHz</td>
<td style="text-align: left;">-1 m</td>
<td style="text-align: left;">FM, TV, aviation</td>
<td style="text-align: left;">Line-of-sight</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">UHF</td>
<td style="text-align: left;">MHz - 3 GHz</td>
<td style="text-align: left;">m - 10 cm</td>
<td style="text-align: left;">Cellular, WiFi, GPS</td>
<td style="text-align: left;">LOS, some
penetration</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">SHF</td>
<td style="text-align: left;">-30 GHz</td>
<td style="text-align: left;">-1 cm</td>
<td style="text-align: left;">Satellite, 5G, radar</td>
<td style="text-align: left;">LOS, rain fade</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">EHF</td>
<td style="text-align: left;">-300 GHz</td>
<td style="text-align: left;">cm - 1 mm</td>
<td style="text-align: left;">mmWave 5G, radar</td>
<td style="text-align: left;">Severe attenuation</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">THz</td>
<td style="text-align: left;">-10 THz</td>
<td style="text-align: left;">mm - 30 $\mu$m</td>
<td style="text-align: left;">Imaging,
spectroscopy, AID</td>
<td style="text-align: left;">Very limited (H\textsubscript{2}O)</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">Far-IR</td>
<td style="text-align: left;">-120 THz</td>
<td style="text-align: left;">-2.5 $\mu$m</td>
<td style="text-align: left;">Thermal imaging</td>
<td style="text-align: left;">Atmospheric windows</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">Near-IR</td>
<td style="text-align: left;">-430 THz</td>
<td style="text-align: left;">-0.7 $\mu$m</td>
<td style="text-align: left;">Fiber optics,
night vision</td>
<td style="text-align: left;">Good (1.55 $\mu$m window)</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">Visible</td>
<td style="text-align: left;">-750 THz</td>
<td style="text-align: left;">-400 nm</td>
<td style="text-align: left;">Vision, optical comms</td>
<td style="text-align: left;">Excellent</td>
<td style="text-align: left;">No</td>
</tr>
<tr>
<td style="text-align: left;">UV</td>
<td style="text-align: left;">THz - 30 PHz</td>
<td style="text-align: left;">-10 nm</td>
<td style="text-align: left;">Sterilization, lithography</td>
<td style="text-align: left;">Absorbed (ozone)</td>
<td style="text-align: left;"><strong>Yes (high-energy UV)</strong></td>
</tr>
<tr>
<td style="text-align: left;">X-ray</td>
<td style="text-align: left;">PHz - 30 EHz</td>
<td style="text-align: left;">-0.01 nm</td>
<td style="text-align: left;">Medical imaging, crystallography</td>
<td style="text-align: left;">Blocked by atmosphere</td>
<td style="text-align: left;"><strong>Yes</strong></td>
</tr>
<tr>
<td style="text-align: left;">Gamma</td>
<td style="text-align: left;">&gt; 30 EHz</td>
<td style="text-align: left;">&lt; 0.01 nm</td>
<td style="text-align: left;">Radiotherapy,
astrophysics</td>
<td style="text-align: left;">Blocked by atmosphere</td>
<td style="text-align: left;"><strong>Yes</strong></td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Maxwell's-Equations-&-Wave-Propagation\]\]**:
  Mathematical foundation of EM waves

- **\[\[Free-Space-Path-Loss-(FSPL)\]\]**: Frequency-dependent
  propagation loss

- **\[\[Terahertz-(THz)-Technology\]\]**: Applications and
  challenges in THz band

- **\[\[AID-Protocol-Case-Study\]\]**: 1.875 THz carrier for
  neural modulation

- **Antenna Theory**: Design principles for frequency-specific
  antennas (TBD)

- **Atmospheric Propagation**: Absorption, refraction, ducting
  effects (TBD)

<div class="center">

------------------------------------------------------------------------

</div>

**Next**: \[\[Antenna-Theory-Basics\]\] (TBD) - How to design
antennas for different spectrum bands

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
