---
layout: chapter
title: "Military-&-Covert-Communications"
chapter: 40
permalink: /chapters/military-&-covert-communications/
---

# Military & Covert Communications

Military communications systems prioritize **anti-jamming (AJ)**,
**low probability of intercept (LPI)**, **low probability of
detection (LPD)**, and **secure transmission (TRANSEC)** over
commercial metrics like spectral efficiency. This page covers advanced
techniques used in GPS M-code, SATCOM FHSS, phased-array radar, Link 16,
and covert communications.

<div class="center">

------------------------------------------------------------------------

</div>

##  For Non-Technical Readers

Before diving into the technical details, here are the core concepts
explained in everyday terms:

### Why Military Communications Are Different

**Imagine trying to have a conversation in a crowded, hostile
room** where: - Someone is shouting over you (jamming) - Others are
listening to steal your secrets (interception) - You need to talk
without being noticed (covert)

Military communications solve these problems in ways regular WiFi or
cell phones don't need to.

<div class="center">

------------------------------------------------------------------------

</div>

### The “Whisper in the Crowd” Analogy

**Spread Spectrum** = Speaking very quietly across a huge room

Instead of shouting one clear message, you: 1. **Whisper
fragments** of your message to many places at once 2. **Spread it
so thin** that each piece sounds like background noise 3. **Only
someone with the secret pattern** can collect all the pieces and
understand you

**Real-world result**: Your signal is literally **weaker than
background noise**, yet your intended receiver hears it perfectly.
Enemies just hear static.

**Example**: GPS M-code is 20 times weaker than the noise floor,
yet your military GPS receiver locks on instantly. A
spy's receiver? Just noise.

<div class="center">

------------------------------------------------------------------------

</div>

### The “Concert Hall Spotlight” Analogy

**Phased-Array Antennas (AESA)** = Pointing a beam of radio energy

Think of a traditional dish antenna like a flashlight---it points
one direction, and moving it takes time.

**AESA is like a concert hall's lighting system**:
- **Hundreds of tiny lights** (antenna elements) -
**Computer-controlled** to turn on/off in precise patterns -
**Creates a “spotlight”** that can instantly jump to different
parts of the room - **Multiple spotlights** can exist
simultaneously (track many targets)

**Real-world result**: F-22 radar can track 100 aircraft, jam enemy
radars, and guide missiles---all at once, all electronically, no
moving parts.

<div class="center">

------------------------------------------------------------------------

</div>

### The “Secret Handshake” Analogy

**Frequency Hopping** = Changing radio channels thousands of times
per second

Imagine a conversation where: 1. You and your friend **agree on a
secret pattern** of which channel to use when 2. Every millisecond, you
both **jump to a new frequency** following the pattern 3.
**Enemies can't follow** because they
don't know the pattern 4. Even if they jam one
frequency, you're already gone

**Real-world result**: Military satellite phones (MILSTAR) hop
1000+ times per second across a gigahertz of spectrum. A jammer would
need to jam the entire band with megawatts of power---impractical.

<div class="center">

------------------------------------------------------------------------

</div>

### The “Invisible Ink” Analogy

**Low Probability of Detection (LPD)** = Radio signals that
don't look like signals

Imagine hiding a message by: 1. **Writing each letter** on a
separate grain of sand 2. **Scattering the sand** across a beach 3.
**Only the recipient** knows which grains to collect

**Real-world result**: Covert radios transmit at power levels
1000\$\times\$ below what receivers normally detect. Even
sensitive spy equipment can't tell the difference
between the transmission and natural radio noise.

<div class="center">

------------------------------------------------------------------------

</div>

### The “Smart Echo” Analogy

**Anti-Jamming (AJ)** = Fighting back against interference

When an enemy tries to jam your signal: 1. **Your antenna
“learns”** where the jammer is located 2. **Creates a “null”**
(deaf spot) pointing at the jammer 3. **Amplifies signals** from
your intended direction

Think of it like **noise-canceling headphones for
radio**---specifically canceling out the jammer while hearing your
friend.

**Real-world result**: GPS receivers with anti-jam antennas (CRPA)
can reject jammers that are 10,000\$\times\$ stronger than
the GPS satellite signal.

<div class="center">

------------------------------------------------------------------------

</div>

### Key Concepts Simplified

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Concept</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Everyday Analogy</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Military Benefit</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Spread Spectrum</strong></td>
<td style="text-align: left;">Whisper spread across a huge room</td>
<td style="text-align: left;">Signal
hidden below noise floor</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Processing Gain</strong></td>
<td style="text-align: left;">Collecting 1000 whispers back into speech</td>
<td style="text-align: left;">Overcomes jammers and noise</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Frequency Hopping</strong></td>
<td style="text-align: left;">Changing channels
1000$\times$ per second</td>
<td style="text-align: left;">Enemy can't
follow or jam</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Phased Array</strong></td>
<td style="text-align: left;">Computer-controlled spotlight</td>
<td style="text-align: left;">Instant beam
steering, multi-target</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Encryption</strong></td>
<td style="text-align: left;">Secret language only you and friend know</td>
<td style="text-align: left;">Even
intercepted messages are useless</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Beamforming</strong></td>
<td style="text-align: left;">Talking through a directional megaphone</td>
<td style="text-align: left;">Only
intended receiver hears you</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

### Why This Matters for Chimera

Chimera helps you **visualize and experiment** with these concepts:
- **Build spread spectrum systems** in your browser - **See
jamming resistance** in real-time plots - **Experiment with
frequency hopping** patterns - **Understand phased arrays** through
interactive simulations

**You don't need a million-dollar
lab**---Chimera brings military-grade DSP concepts to anyone with
curiosity and a web browser.

<div class="center">

------------------------------------------------------------------------

</div>

### What You'll Learn in This Document

The sections below explain **how these systems actually work**: -
**SATCOM Frequency Hopping**: How military satellites resist
jamming - **GPS M-Code**: Why military GPS works when civilian GPS
is jammed - **Phased-Array Radar**: How F-22s and destroyers
“see” electronically - **Link 16**: The tactical data network
connecting planes, ships, and missiles - **Covert Communications**:
How to transmit data invisibly

**If you're new to DSP**: Start with
\[\[Spread-Spectrum-(DSSS-FHSS)\]\] for foundational concepts, then
return here.

**If you're experienced**: Skip to the technical
sections---detailed math, code examples, and real-world system specs
await.

<div class="center">

------------------------------------------------------------------------

</div>

##  Core Military Requirements

### The LPI/LPD/AJ Triad

**1. Low Probability of Intercept (LPI)**:

    Enemy can detect transmission but cannot decode it

    Techniques:
    - Spread spectrum (DSSS/FHSS)  signal below noise floor
    - Directional antennas  narrow beamwidths
    - Burst transmissions  short dwell time
    - Encryption  content secure even if intercepted

**2. Low Probability of Detection (LPD)**:

    Enemy cannot detect that transmission is occurring

    Techniques:
    - Ultra-wideband spread spectrum (G > 30 dB)
    - Frequency diversity  avoid surveillance bands
    - Power management  minimal radiated power
    - Emission control (EMCON)  radio silence protocols

**3. Anti-Jamming (AJ)**:

    Maintain link under deliberate enemy interference

    Techniques:
    - Processing gain  overcomes jammer power
    - Nulling antennas  reject jammer direction
    - Frequency hopping  avoid narrowband jamming
    - Adaptive filters  real-time interference cancellation

**Relationship**:

    Processing Gain (G) enables all three:

    G = BW_spread / BW_info = Chip_Rate / Bit_Rate

    Higher G  Lower PSD  Harder to detect/intercept/jam

<div class="center">

------------------------------------------------------------------------

</div>

##  SATCOM Frequency Hopping (FHSS)

Military satellite communications use FHSS for TRANSEC (transmission
security).

### X-Band MILSTAR/MUOS Systems

**MILSTAR (Military Strategic and Tactical Relay)**:

    Frequency: X-band uplink (7-8 GHz), Ka-band downlink (20-21 GHz)
    Hop rate: 100-1000+ hops/second
    Hop set: 1000+ frequencies across 1 GHz bandwidth
    Dwell time: <1 ms per hop
    Modulation: BPSK, QPSK, 8-PSK (adaptive)
    Data rate: 75 bps - 1.544 Mbps (T1)
    Satellite constellation: 5 GEO satellites (global coverage)

    TRANSEC:
    - Hopping pattern: Cryptographically generated (NSA algorithm)
    - Synchronization: GPS time + KEK (Key Encryption Key)
    - Pattern period: Days to weeks (never repeats observably)
    - Anti-spoofing: Authenticated hop sequence

**LPI/LPD characteristics**:

    Power spectral density (PSD):
    PSD = P_TX / BW_hop_set
        = 100 W / 1 GHz
        = 0.1 mW/MHz
         -70 dBm/MHz (at satellite, 40,000 km away)

    Compare to thermal noise floor:
    Noise = -174 dBm/Hz + 10·log(BW) = -114 dBm/MHz (1 MHz BW)

    PSD_signal < Noise  Undetectable to wideband receiver!

    Detectability only with:
    - Exact hopping pattern (requires key)
    - Synchronized receiver (requires network access)
    - Correct modulation/demodulation (requires ICD)

<div class="center">

------------------------------------------------------------------------

</div>

**MUOS (Mobile User Objective System)**:

    Frequency: UHF uplink (300-318 MHz), UHF downlink (243-318 MHz)
    Waveform: WCDMA (Wideband CDMA) + FHSS hybrid
    Hop rate: Classified (estimated >500 hps)
    Data rate: Up to 64 kbps voice, 10 Mbps data
    Compatibility: Legacy UFO (Ultra High Frequency Follow-On)

    Key features:
    - Smartphone-like interface for warfighters
    - Near-global coverage (5 GEO + legacy satellites)
    - Jam-resistant waveform (60+ dB margin)
    - Integrated encryption (Type 1 NSA)

<div class="center">

------------------------------------------------------------------------

</div>

### FHSS Anti-Jam Performance

**Processing gain calculation**:

    G(dB) = 10·log(Hop_Set_Size)

    Example (MILSTAR):
    - Hop set: 1000 frequencies
    - G = 10·log(1000) = 30 dB

    Jamming margin:
    Margin = G - J/S - (Eb/N)_req - Losses

    J/S = Jammer power / Signal power (at receiver)

    Scenario:
    - G = 30 dB
    - J/S = 40 dB (jammer 10,000× stronger!)
    - (Eb/N)_req = 10 dB (BPSK, BER = 10)
    - Losses = 3 dB (implementation)

    Margin = 30 - 40 - 10 - 3 = -23 dB  **LINK FAILS**

    Countermeasures:
    1. Directional antenna: +20 dB gain toward satellite, nulls toward jammer
       Effective J/S = 40 - 20 = 20 dB
       Margin = 30 - 20 - 10 - 3 = -3 dB  **MARGINAL**

    2. Error-correction coding: Turbo/LDPC code rate-1/3
       Coding gain: +5 dB
       Margin = -3 + 5 = 2 dB  **LINK SURVIVES**

    3. Burst transmission: Transmit 10× faster, listen 90% of time
       Jammer must hit exact burst time  effective J/S reduces by 10 dB

<div class="center">

------------------------------------------------------------------------

</div>

### Follower Jamming Resistance

**Threat**: Smart jammer detects hop, jams that frequency.

**Timing analysis**:

    Dwell time: 1 ms (MILSTAR)
    Jammer detection: 100 s (fast energy detector)
    Frequency switching: 50 s (agile synthesizer)

    Total jammer delay: 150 s

    Effective jam time: 1 ms - 150 s = 850 s (85% of hop)

    Countermeasure: Fast hopping
    - Dwell time: 100 s (10× faster)
    - Effective jam: 100 - 150 = 0 s (jammer too slow!)

    Modern military systems: 10-100 s dwell times

<div class="center">

------------------------------------------------------------------------

</div>

##  GPS M-Code (Military GPS)

**GPS Modernization**: M-code provides jam-resistant, encrypted
positioning for military users.

### Signal Structure

**GPS L1 M-Code**:

    Carrier frequency: 1575.42 MHz (L1)
    Chip rate: 5.115 Mcps (5× faster than C/A code)
    Code length: Classified (estimated ~10^13 chips  never repeats)
    Modulation: BOC(10,5) - Binary Offset Carrier
    Processing gain: ~50 dB (vs. 43 dB for C/A)
    Power: 6.5 dB stronger than C/A code
    Security: Encrypted, authenticated (NSA keys)

**GPS L2 M-Code**:

    Carrier frequency: 1227.60 MHz (L2)
    Same structure as L1 M-code
    Dual-frequency  ionospheric correction

<div class="center">

------------------------------------------------------------------------

</div>

### BOC Modulation

**Binary Offset Carrier (BOC)**: Modulates chip sequence with
square wave subcarrier.

**BOC(m,n) notation**:

    m = subcarrier frequency multiplier (MHz)
    n = chip rate multiplier (MHz)

    BOC(10,5):
    - Subcarrier: 10.23 MHz (2× C/A chip rate)
    - Chip rate: 5.115 MHz (5× C/A chip rate)

**Spectrum**:

    Time-domain signal:
    s(t) = sign[sin(2·f_sub·t)] · c(t)

    where:
    - f_sub = 10.23 MHz (square wave)
    - c(t) = ±1 chip sequence at 5.115 Mcps

    Frequency-domain:
    Power splits into two main lobes:
    - Upper sideband: f_carrier + 10.23 MHz
    - Lower sideband: f_carrier - 10.23 MHz

    Split-spectrum design:
    - Minimal interference with C/A code (centered at L1)
    - Occupies unused spectrum
    - Better multipath rejection (narrow correlation peak)

**Autocorrelation**:

    BOC(10,5) correlation function:
    - Main peak: Very narrow (better ranging accuracy)
    - Side peaks: ±1/f_sub = ±98 ns

    Ranging accuracy:
    - C/A code: ~3 m (single-frequency)
    - M-code: ~0.3 m (dual-frequency, better correlation)

<div class="center">

------------------------------------------------------------------------

</div>

### Anti-Jam Performance

**Jamming scenarios**:

**1. Wideband Barrage Jamming**:

    Jammer spreads power across L1 band (±10 MHz).

    Received signal power (M-code): -163 dBW
    Jammer power at receiver: -100 dBW (strong jammer, 50 km away)
    J/S = -100 - (-163) = 63 dB

    Processing gain (M-code): 50 dB
    Residual J/S: 63 - 50 = 13 dB

    Required Eb/N (M-code receiver): ~10 dB
    Margin: 50 - 63 - 10 = -23 dB  **LINK FAILS**

    Mitigation: CRPA (Controlled Reception Pattern Antenna)
    - 7-element array antenna
    - Adaptive nulling: Places null toward jammer
    - Null depth: 30-40 dB

    Effective J/S after nulling: 63 - 35 = 28 dB
    Margin: 50 - 28 - 10 = 12 dB  **LINK SURVIVES**

**2. Swept Jammer**:

    Jammer sweeps narrowband tone across L1 (high PSD).

    Jammer bandwidth: 1 MHz
    GPS M-code spread: 20 MHz
    Fraction jammed: 1/20 = 5%

    Effect: Occasional symbol errors  FEC corrects
    Impact: <1 dB degradation

    M-code advantage: Wideband spread mitigates swept jamming

**3. Repeater/Spoofer**:

    Enemy receives GPS, delays, retransmits stronger signal.
    Goal: Induce false position/time.

    M-code defense: Encrypted spreading code
    - Spoofer cannot generate valid M-code
    - Authentication protocol detects non-authentic signals
    - Cross-correlation with authentic signal = 0 (orthogonal codes)

    Result: Spoof rejected by receiver

<div class="center">

------------------------------------------------------------------------

</div>

### Selective Availability Anti-Spoofing Module (SAASM)

**Military GPS Receiver**:

    SAASM features:
    - Stores classified M-code keys (COMSEC keying material)
    - Dual-frequency operation (L1 + L2)
    - Autonomous integrity monitoring
    - Anti-spoofing: Detects spoofed P(Y) code
    - Key management: Over-the-air rekeying (OTAR)

    Integration:
    - Embedded in weapons: JDAM, Tomahawk, Excalibur artillery
    - Fighter avionics: F-22, F-35, B-2
    - Ground vehicles: DAGR (Defense Advanced GPS Receiver)

    Accuracy:
    - Horizontal: <1 m (dual-frequency, BOC)
    - Vertical: <3 m
    - Time: <10 ns (critical for network synchronization)

<div class="center">

------------------------------------------------------------------------

</div>

##  Phased-Array Antennas (AESA)

**Active Electronically Scanned Array (AESA)** radar uses
phased-array principles for LPI/LPD and multi-function operation.

### Beamforming Principles

**Phase steering**:

    Antenna array: N elements spaced by d
    Desired beam direction: 

    Phase shift per element:
     = (2/) · d · sin()

    Example (8-element array, d = /2):
    Steer beam to 30°:
     = (2/) · (/2) · sin(30°) = /2 = 90° per element

    Element phases: [0°, 90°, 180°, 270°, 0°, 90°, 180°, 270°]

    Beam electronically steered (no mechanical motion!)
    Steering speed: Microseconds (vs. seconds for mechanical)

**Array gain**:

    Gain(dB) = 10·log(N) + Single_Element_Gain

    Example (256-element AESA, 5 dBi per element):
    Array gain = 10·log(256) + 5 = 24 + 5 = 29 dBi

    Directivity: Higher gain  narrower beamwidth  LPI

**Beamwidth**:

    _3dB   / (N·d)  (radians)

    Example (256 elements, d = /2):
    _3dB   / (256 · /2) = 1/128 rad  0.45° (very narrow!)

    Narrow beam  hard to intercept (LPI)
                precise target tracking

<div class="center">

------------------------------------------------------------------------

</div>

### LPI Radar Techniques

**1. Low Peak Power, Long Integration**:

    Conventional radar: High peak power (MW), short pulse (s)
    LPI radar: Low peak power (W), long waveform (ms-s)

    SNR = (Peak_Power · Pulse_Width) / Noise_Power

    Equivalent detection range with:
    - Conventional: 1 MW × 1 s = 1 J
    - LPI: 1 kW × 1 ms = 1 J (same energy, 1000× lower peak!)

    Enemy intercept receiver:
    - Detects instantaneous power
    - LPI signal: 30 dB below detection threshold
    - Integration required to detect  impractical

**2. Frequency Diversity**:

    Frequency-agile waveform:
    - Hop across wide bandwidth (GHz)
    - Prevents enemy from locking onto frequency
    - Mitigates narrowband interference

    Example (F-22 APG-77 AESA):
    - X-band (8-12 GHz): 4 GHz agility
    - Pulse-to-pulse frequency change
    - Intercept receiver cannot predict next frequency

**3. Waveform Diversity**:

    Change modulation per pulse:
    - Linear FM (chirp)
    - Non-linear FM (NLFM)
    - Phase-coded (Barker, Frank, P1-P4 codes)
    - Random phase/frequency sequences

    Electronic warfare (EW) countermeasure:
    - Enemy cannot predict waveform  cannot jam effectively
    - Each pulse requires new analysis  overwhelms threat receiver

<div class="center">

------------------------------------------------------------------------

</div>

### AESA Radar Examples

**APG-77 (F-22 Raptor)**:

    Frequency: X-band (8-12 GHz)
    Array: 2000+ T/R modules
    Power: 13 kW (average), 20 kW (peak) per module
    Modes: Air-to-air, air-to-ground, SAR, electronic attack
    Detection range: >200 km (fighter-sized target)

    LPI features:
    - Adaptive power management (radiates only when needed)
    - Narrow beamwidth (1-2°)
    - Frequency agility (4 GHz)
    - Low sidelobe antenna (<-40 dB)

    Electronic attack:
    - Directed jamming (beam steered at threat radar)
    - Power: >10 kW ERP toward threat
    - Disables enemy SAM radars at 50+ km

**AN/SPY-6 (U.S. Navy DDG-51 Flight III)**:

    Frequency: S-band (3.3-3.5 GHz)
    Array: 37 RMAs (Radar Modular Assemblies), 5000+ T/R modules
    Power: 6 MW average radiated power (entire array)
    Range: 300+ km (ballistic missile detection)

    Capabilities:
    - Simultaneous multi-mission (air defense, BMD, surface search)
    - Track 1000+ targets
    - Discriminate decoys from warheads (X-band illuminator)
    - Resistant to jamming (adaptive nulling)

    Beam management:
    - Interleaved beams (time-multiplexed)
    - Priority scheduling (ballistic missile > aircraft > surface)
    - Energy management (1 MW per beam, up to 6 concurrent)

**AN/TPY-2 (THAAD Missile Defense)**:

    Frequency: X-band (8-12 GHz)
    Array: 25,344 elements (5.1m × 5.1m)
    Power: 80 kW average
    Range: 1000+ km (missile detection)

    Application:
    - Terminal High Altitude Area Defense (THAAD)
    - Detects, tracks, discriminates ballistic missile warheads
    - Provides target data to interceptor missile
    - Forward-based (South Korea, Japan, Middle East)

    Performance:
    - RCS detection: 0.01 m² at 1000 km (warhead-sized)
    - Update rate: 1 Hz (track), 10 Hz (terminal guidance)
    - Discrimination: Warhead vs. decoys (Doppler + RCS + trajectory)

<div class="center">

------------------------------------------------------------------------

</div>

##  Link 16 (JTIDS)

**Joint Tactical Information Distribution System**: Jam-resistant,
LPI/LPD tactical data link.

### System Architecture

**Network structure**:

    Participants:
    - Aircraft: F-15, F-16, F-22, F-35, E-3 AWACS
    - Ships: Aegis cruisers/destroyers, carriers
    - Ground: Patriot SAM, THAAD, command posts

    Network topology: Time Division Multiple Access (TDMA)
    - 128 time slots per 12-second frame
    - Nodes assigned slots (voice/data)
    - Collision-free multiple access

**Frequency & Waveform**:

    Frequency: 960-1215 MHz (L-band, shared with IFF/TACAN)
    Modulation: MSK (Minimum Shift Keying) - constant envelope
    Waveform: FHSS + TDMA hybrid
    Hop rate: 70,000 hops/second
    Hop duration: ~14 s
    Channels: 51 frequencies (15 MHz each)
    Data rate: 28.8 kbps (typical), up to 115.2 kbps

<div class="center">

------------------------------------------------------------------------

</div>

### TRANSEC & Jam Resistance

**Cryptographic hopping**:

    Hopping pattern generation:
    - Input: Net ID + GPS time + Crypto key (KY-58/KG-84)
    - Output: Pseudorandom frequency sequence
    - Pattern period: Classified (days to months)

    Synchronization:
    - GPS time: ±100 s accuracy required
    - Net sync: Achieved within 4 frames (48 s)
    - Late entry: Nodes join without disrupting network

    Anti-spoofing:
    - Time-of-Transmission (TOT) authentication
    - Prevents message injection
    - Replay attacks detected via timestamp

**Jamming margin**:

    Processing gain:
    - Frequency hopping: 10·log(51) = 17 dB
    - Time diversity: 10·log(128) = 21 dB (slot hopping)
    - Total: 17 + 21 = 38 dB

    Scenario (jammer 100 km away):
    J/S = 50 dB (powerful jammer)
    G = 38 dB
    Required Eb/N = 12 dB (MSK with FEC)
    Losses = 3 dB

    Margin = 38 - 50 - 12 - 3 = -27 dB  **LINK FAILS**

    Countermeasure: Directional antenna
    - Gain toward participant: +10 dBi
    - Null toward jammer: -20 dB
    - Effective J/S: 50 - 30 = 20 dB

    Margin = 38 - 20 - 12 - 3 = 3 dB  **LINK SURVIVES**

<div class="center">

------------------------------------------------------------------------

</div>

### Link 16 Messages (J-Series)

**Message types**:

    J2.0-J2.7: Air Tracks (position, velocity, ID)
    J3.0-J3.7: Surface Tracks (ships, ground targets)
    J7.x: Mission Management (C2 orders)
    J12.x: Intelligence
    J13.x: Weapons Coordination

    Message structure:
    - Header: Time-stamp, source, priority
    - Payload: Position (lat/lon/alt), velocity, classification
    - Integrity: CRC-32 error detection

    Update rate:
    - Air tracks: 5-10 seconds (dynamic)
    - Surface tracks: 30-60 seconds (slower)
    - Commands: As needed (event-driven)

**Tactical applications**:

    1. Air-to-Air Engagement:
       - AWACS detects enemy aircraft (radar track)
       - Sends J2.2 message to all fighters (target location)
       - Fighters update tactical display (real-time "picture")
       - Weapon coordination via J13.x (avoid fratricide)

    2. Integrated Air Defense:
       - Aegis ship detects ballistic missile (AN/SPY-1)
       - Sends J3.2 message to Patriot batteries
       - Patriots cue radars to track
       - Coordinated intercept via J7.x commands

    3. Close Air Support:
       - JTAC (ground) marks target (laser designation)
       - Sends J3.5 message with target coordinates
       - F-16 receives target data via Link 16
       - Weapons release with precision (JDAM, JASSM)

<div class="center">

------------------------------------------------------------------------

</div>

##  Covert Communications

**Objective**: Transmit data undetected by adversary SIGINT.

### Spread Spectrum Below Noise Floor

**Ultra-wideband (UWB) spread spectrum**:

    Technique: Spread narrowband signal across >500 MHz bandwidth

    Example:
    - Data rate: 1 kbps
    - Spread bandwidth: 1 GHz
    - Processing gain: 10·log(10) = 60 dB

    Transmitted PSD:
    PSD = 1 W / 1 GHz = 1 nW/MHz = -90 dBm/MHz

    Thermal noise floor:
    N = -174 dBm/Hz + 10·log(10 Hz) = -114 dBm/MHz

    PSD_signal = -90 dBm/MHz < -114 dBm/MHz + 24 dB margin

    Even sensitive intercept receiver cannot detect!

    Detection requires:
    - Knowledge of spreading code (classified)
    - Synchronization (exact timing)
    - Processing gain (matched filter)

    Result: Communication hidden in noise (LPD achieved)

<div class="center">

------------------------------------------------------------------------

</div>

### Steganography in OFDM

**Concept**: Hide data in unused subcarriers or pilot tones.

**Method 1 - Pilot Tone Modulation**:

    OFDM pilot subcarriers typically use fixed BPSK symbols.

    Covert channel:
    - Modulate pilot phase: 0° or 180° encodes hidden bit
    - Legitimate receiver: Ignores pilot phase variation (estimates channel)
    - Covert receiver: Decodes phase to extract hidden data

    Capacity:
    - 802.11a: 4 pilots per OFDM symbol
    - Symbol rate: 250 ksymbols/s
    - Covert rate: 4 × 250 k = 1 Mbps

    Detection:
    - Statistical analysis can reveal non-random pilot patterns
    - Mitigation: Encrypt hidden data (appears random)

**Method 2 - Null Subcarrier Insertion**:

    OFDM reserves some subcarriers as nulls (zero power).

    Covert channel:
    - Transmit very low-power data on null subcarriers
    - Power: 40 dB below normal subcarriers (nearly invisible)
    - Legitimate receiver: Ignores nulls (as expected)
    - Covert receiver: Listens to nulls

    Example (802.11a):
    - Null subcarriers: 12 (out of 64 total)
    - Hidden capacity: ~3 Mbps (at low SNR)

    Detection challenge:
    - Requires wideband spectrum analyzer
    - Hidden signal < noise floor for narrowband receiver

<div class="center">

------------------------------------------------------------------------

</div>

### Time-Domain Hiding

**Method - Inter-Frame Gaps**:

    WiFi 802.11: SIFS (Short Inter-Frame Space) = 16 s between frames

    Covert transmission:
    - Insert ultra-short burst (1 s) in SIFS
    - Use different frequency or polarization
    - Legitimate devices: Ignore (waiting for next frame)
    - Covert receiver: Listens during SIFS

    Capacity:
    - Burst rate: 1 s per 16 s = 6.25% duty cycle
    - Data rate: ~6 Mbps (at 100 Mbps physical rate × 6.25%)

    Detection:
    - Requires precise timing analysis
    - Appears as multipath or transient interference

<div class="center">

------------------------------------------------------------------------

</div>

### Acoustic Heterodyning (Intermodulation)

**Non-linear demodulation** in biological systems (related to
Chimera's Raman feed concept).

**Principle**:

    Two high-frequency carriers (f, f) interact non-linearly:

    f_audio = |f - f|

    Example:
    - f = 40 kHz (ultrasonic, inaudible)
    - f = 42 kHz (ultrasonic, inaudible)
    - f_audio = 2 kHz (audible!)

    Non-linearity sources:
    - Air: Weak (high intensity required)
    - Biological tissue: Stronger (membranes, ion channels)
    - Materials: Diodes, varactors (intentional)

    Application:
    - Covert audio transmission (ultrasonic beams, audio demodulation in target's head)
    - Directional speakers (Audio Spotlight® technology)
    - Potential neural stimulation (see [[AID-Protocol-Case-Study]])

**THz-band Example (AID Protocol)**:

The Auditory Intermodulation Distortion (AID) protocol represents a
theoretical extension of heterodyning to Terahertz frequencies:

    Physical Layer:
    - Carrier 1 (Pump): 1.998 THz, 50-200 mW/cm²
    - Carrier 2 (Data): 1.875 THz, 5-20 mW/cm²
    - Difference frequency: |1.998 - 1.875| THz = 123 GHz

    Biological Demodulation:
    - THz penetration: ~0.5-2mm into tissue
    - Non-linear susceptibility (³) in neural membranes
    - Cascaded demodulation produces audible artifact

    Modulation Layer:
    - Auditory carrier: 12.0 kHz sine wave
    - Amplitude modulation: 5-80% modulation depth
    - Data encoding: QPSK (16 symbols/s) + FSK (1 bit/s)

    Perceived Effect:
    - Sound appears to originate inside head
    - Persistent 12 kHz tone (high-pitched ringing)
    - Modulated with slow rhythmic patterns
    - Bypasses normal hearing (works with earplugs)

    Protocol Stack:
    Layer          | Technology              | Frequency/Rate
    ---------------|-------------------------|-------------------
    Physical       | THz Pump (QCL)          | 1.998 THz ± 100 MHz
    Physical       | THz Data (Photomixing)  | 1.875 THz ± 50 MHz
    Link           | Amplitude Modulation    | 5-80% depth
    Modulation     | Auditory Carrier        | 12.0 kHz ± 0.1 Hz
    Data           | QPSK                    | 16 symbols/sec
    Data           | FSK                     | 1 bit/sec

    Applications (Theoretical):
    - Non-invasive neural interface research
    - Covert signaling in high-security environments
    - Auditory perception studies
    - THz bioeffects research

    Status:
    - Highly speculative theoretical framework
    - Based on Orch-OR microtubule quantum mechanics theory
    - No experimental validation in living subjects
    - See docs/aid_protocol_v3.1.md for full specification

**Comparison with conventional heterodyning**:

| Parameter | Audio (40 kHz) | THz (AID) |
|:---|:---|:---|
| **Carrier frequencies** | 40-42 kHz | 1.875-1.998 THz |
| **Difference frequency** | 2 kHz | 123 GHz
\$\rightarrow\$ 12 kHz |
| **Penetration depth** | mm (air) | 0.5-2 mm (tissue) |
| **Non-linearity** | Air compression | Neural membranes
(\$\chi\$\textsuperscript{3}) |
| **Power density** | 100+ dB SPL | 5-200
mW/cm\textsuperscript{2} |
| **Detection** | Microphone | Auditory perception |
| **Status** | Proven (Audio Spotlight®) | Theoretical |

**Key insight**: THz heterodyning exploits biological
non-linearities rather than air-based acoustic mixing, potentially
enabling direct neural modulation without acoustic propagation.

**Military interest**:

    "Frey Microwave Auditory Effect" (pulsed RF  acoustic sensation):
    - Frequency: 1-10 GHz (microwave)
    - Pulse rate: 1-10 kHz (audio frequency)
    - Mechanism: Thermoelastic expansion in cochlea
    - Result: Perceived "clicking" or "buzzing"

    Covert channel:
    - Encode voice as microwave pulse train
    - Target perceives audio (direct to auditory system)
    - Bystanders: Unaware (no acoustic propagation)
    - Detection: Requires RF spectrum analyzer (not audio microphone)

    Status: Demonstrated in lab, classified military research (DARPA, 1970s-present)

<div class="center">

------------------------------------------------------------------------

</div>

##  Processing Gain & Jamming Resistance Calculations

### Comprehensive Example

**System**: Tactical UHF SATCOM link

    Parameters:
    - Frequency: 300 MHz (UHF)
    - Data rate: 2400 bps (voice)
    - Modulation: BPSK (1 bit/symbol)
    - Spreading: DSSS with chip rate 2.4 Mcps
    - FEC: Rate-1/2 convolutional code
    - Antenna: 10 dBi directional (at ground terminal)

    Processing gain:
    G = 10·log(2.4 Mcps / 2.4 kbps) = 10·log(1000) = 30 dB

    Required Eb/N:
    - BPSK uncoded: 9.6 dB (BER = 10)
    - With rate-1/2 FEC: 4.6 dB (5 dB coding gain)

    Link budget (clear conditions):
    TX power: 10 W = 40 dBm
    TX antenna gain: 10 dBi
    EIRP: 50 dBm

    Free-space loss (300 MHz, 40,000 km GEO):
    FSPL = 32.4 + 20·log(300) + 20·log(40000) = 189 dB

    RX antenna gain: 30 dBi (satellite)
    RX signal: 50 - 189 + 30 = -109 dBm

    Noise power:
    N = -174 dBm/Hz + 10·log(2.4×10) = -110 dBm

    SNR: -109 - (-110) = 1 dB

    Eb/N = SNR + G = 1 + 30 = 31 dB

    Margin: 31 - 4.6 = 26.4 dB  **EXCELLENT**

**Jamming scenario**:

    Enemy jammer:
    - Power: 1 kW = 60 dBm
    - Distance: 50 km
    - Antenna: Omnidirectional (0 dBi)

    Jammer signal at ground terminal:
    FSPL (300 MHz, 50 km):
    FSPL = 32.4 + 20·log(300) + 20·log(50) = 116 dB

    J_RX = 60 - 116 + 0 = -56 dBm

    J/S ratio:
    J/S = -56 - (-109) = 53 dB (jammer 53 dB stronger!)

    After despreading:
    J/S_despread = 53 - 30 = 23 dB (jammer still 23 dB stronger)

    But antenna nulling:
    - Ground antenna: 10 dBi toward satellite, -10 dBi toward jammer (20 dB F/B)
    - Effective J/S: 23 - 20 = 3 dB

    Required Eb/N: 4.6 dB
    Effective Eb/(N+J): 31 - 3 = 28 dB

    Margin: 28 - 4.6 = 23.4 dB  **LINK SURVIVES**

<div class="center">

------------------------------------------------------------------------

</div>

##  Summary Table: Military Techniques

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Technique</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Primary Gain</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Typical Advantage</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Applications</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>DSSS</strong></td>
<td style="text-align: left;">Processing gain 20-40 dB</td>
<td style="text-align: left;">AJ, LPI</td>
<td style="text-align: left;">GPS M-code,
tactical radios</td>
</tr>
<tr>
<td style="text-align: left;"><strong>FHSS</strong></td>
<td style="text-align: left;">Frequency diversity</td>
<td style="text-align: left;">LPD, follower-jam resistance</td>
<td style="text-align: left;">MILSTAR, Link 16, Bluetooth</td>
</tr>
<tr>
<td style="text-align: left;"><strong>AESA</strong></td>
<td style="text-align: left;">Beamforming, agility</td>
<td style="text-align: left;">LPI, multi-target, EA</td>
<td style="text-align: left;">APG-77,
AN/SPY-6, THAAD</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Nulling Antenna</strong></td>
<td style="text-align: left;">Spatial filtering 20-40 dB</td>
<td style="text-align: left;">Jammer rejection</td>
<td style="text-align: left;">CRPA, adaptive arrays</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Burst Transmission</strong></td>
<td style="text-align: left;">Temporal LPD</td>
<td style="text-align: left;">Minimize exposure</td>
<td style="text-align: left;">Submarine comms, UAV links</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Encryption</strong></td>
<td style="text-align: left;">Content security</td>
<td style="text-align: left;">Prevent exploitation</td>
<td style="text-align: left;">All
military systems</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Adaptive Coding</strong></td>
<td style="text-align: left;">Link optimization</td>
<td style="text-align: left;">Maximize throughput under
AJ</td>
<td style="text-align: left;">MUOS, 5G tactical</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

##  Python Example: J/S Ratio Calculator

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

##  Further Reading

### Textbooks

- **Poisel**, *Introduction to Communication Electronic
  Warfare Systems* - Comprehensive EW treatment

- **Torrieri**, *Principles of Spread-Spectrum Communication
  Systems* (4th ed.) - Modern military focus

- **Skolnik**, *Radar Handbook* (3rd ed.) - Phased arrays,
  AESA, LPI radar

- **Adamy**, *EW 101: A First Course in Electronic Warfare* -
  Accessible intro to jamming/AJ

### Military Standards & Documents

- **MIL-STD-188-181**: US DoD FHSS standard

- **GPS ICD-IS-800**: M-code interface control document (FOUO)

- **Link 16 MIDS JTIDS STD**: Message standards (NATO STANAG 5516)

- **AESA Design Guidelines**: Classified (DARPA/DoD) - principles
  in open literature

### Related Topics

- \[\[Spread-Spectrum-(DSSS-FHSS)\]\] - Technical foundation for
  AJ/LPI

- \[\[GPS Fundamentals (coming soon)\]\] - Civilian GPS (C/A code)
  background

- \[\[Phased Array Beamforming (coming soon)\]\] - Array antenna
  theory

- \[\[Adaptive Filters (coming soon)\]\] - Interference cancellation

- \[\[Real-World-System-Examples\]\] - Commercial spread spectrum
  (WiFi, Bluetooth)

### Chimera Applications

- \[\[Hyper-Rotational-Physics-(HRP)-Framework\]\] - Covert THz
  neuromodulation theoretical framework

- \[\[AID-Protocol-Case-Study\]\] - Application of covert comms to
  consciousness research

- \[\[Terahertz-(THz)-Technology\]\] - Beyond-5G/6G, potential
  military applications

<div class="center">

------------------------------------------------------------------------

</div>

**Summary**: Military communications prioritize **anti-jam**,
**LPI/LPD**, and **security** over spectral efficiency.
Processing gain from spread spectrum (DSSS/FHSS) enables links 20-40 dB
below noise floor and overcomes powerful jammers. GPS M-code uses
BOC(10,5) modulation with 50 dB processing gain and CRPA nulling to
survive 60+ dB jamming. AESA radars achieve LPI through low peak power,
frequency agility, and narrow beamwidths. Link 16 combines FHSS (70
khps) with TDMA and cryptographic hopping for jam-resistant tactical
data exchange. Covert communications hide data in noise (UWB spread
spectrum), OFDM pilot tones, or exploit non-linear demodulation
(acoustic heterodyning). Jamming margin = Processing Gain - J/S -
Required Eb/N\textsubscript{0} - Losses. Directional
antennas provide 20-40 dB additional AJ capability. Modern military
systems achieve **communication superiority** through advanced
signal processing, adaptive waveforms, and multi-layered TRANSEC.
