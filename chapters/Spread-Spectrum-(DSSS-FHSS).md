---
layout: chapter
title: "Spread-Spectrum-(DSSS-FHSS)"
chapter: 59
permalink: /chapters/spread-spectrum-(dsss-fhss)/
---

# Spread Spectrum (DSSS/FHSS)

##  For Non-Technical Readers

**Spread spectrum is like whispering your secret across 100
different frequencies at once---eavesdroppers hear random noise, but
your friend with the right “key” combines all pieces to hear your
message perfectly!**

**The counterintuitive idea**: - **Normal radio**: Use narrow
frequency band \$\rightarrow\$ Efficient but vulnerable -
**Spread spectrum**: Spread signal across WIDE band
\$\rightarrow\$ “Wastes” bandwidth but gains
superpowers!

**Three magic superpowers**:

**1. Stealth** (Military origin): - Signal spread so thin it looks
like background noise - Enemy can't detect
you're transmitting - Can't jam what you
can't find!

**2. Anti-jamming** : - Jammer tries to block you
\$\rightarrow\$ You're on 100 frequencies
- They can only jam a few \$\rightarrow\$ Other 95 get
through! - Your receiver combines the survivors
\$\rightarrow\$ Message intact

**3. Many users share spectrum** (CDMA): - Everyone transmits at
same time, same band - Each person has unique spreading code - Your
phone filters out everyone else's signal - Like 20
conversations in one room, different languages!

**Two main flavors**:

**DSSS (Direct Sequence Spread Spectrum)** - Used in GPS, CDMA:

**Simple analogy - Speaking in code**: - Want to send: “HI” (2
letters) - DSSS: Replace each letter with 100-letter code word - “H”
\$\rightarrow\$ “AJFKELQPZMVBX\ldots{}”
(100 random letters) - “I” \$\rightarrow\$
“QZMVPLAJFKEBX\ldots{}” (different 100 letters) -
Transmit: 200 letters instead of 2! - **Your friend knows the
code** \$\rightarrow\$ decodes back to “HI” -
**Eavesdropper hears**: Random gibberish

**Real GPS example**: - GPS sends 1 bit - DSSS multiplies by
1023-chip code (C/A code) - 1 bit \$\rightarrow\$ 1023
chips = 1000\$\times\$ wider bandwidth! - Your GPS
receiver knows the code \$\rightarrow\$ extracts bit -
Jammer tries to interfere \$\rightarrow\$ Processing gain
overcomes it

**FHSS (Frequency Hopping Spread Spectrum)** - Used in Bluetooth,
military:

**Simple analogy - Hopscotch communication**: - Instead of one
frequency, hop between 100 frequencies - Pattern: Freq 23
\$\rightarrow\$ 67 \$\rightarrow\$ 12
\$\rightarrow\$ 89 \$\rightarrow\$
45\ldots{} (changes 1000\$\times\$ per
second!) - **Your friend knows hop pattern**
\$\rightarrow\$ follows you, receives message -
**Eavesdropper**: By time they tune to Freq 23,
you're on 89! - **Jammer**: Can't
jam all frequencies at once

**Real Bluetooth example**: - 79 channels between 2.4-2.48 GHz -
Hops 1600 times per second (every 625 \$\mu\$s) -
Pseudorandom sequence (appears random, but deterministic) - Paired
devices know hop pattern \$\rightarrow\$ stay synchronized
- Interference on one channel? Just skip it!

**Real-world examples you use daily**:

**GPS** (DSSS): - Satellites transmit at 1575 MHz - Spread across 2
MHz bandwidth (1000\$\times\$ wider than data rate!) -
**Processing gain**: 30 dB \$\rightarrow\$ Works even
below noise floor! - This is why GPS works indoors (barely) and
everywhere

**WiFi** (DSSS for 802.11b): - 11 Mbps data rate - Spread across 22
MHz (Barker code or CCK) - Older WiFi standard, mostly replaced by OFDM

**Bluetooth** (FHSS): - Hops 1600 times/second across 79 channels -
**Interference avoidance**: Microwave oven blocks some channels?
Skip them! - **Multiple devices**: Different hop patterns, no
collision - This is why Bluetooth “pairs” (exchanges hop sequence)

**CDMA cell phones** (DSSS): - All users transmit simultaneously,
same band - Each user: unique spreading code (Walsh codes) - Tower
separates users by code (not frequency/time!) - Retired in US (Verizon),
still used in some countries

**Military radios** (Both DSSS & FHSS): - Can't be
jammed (spread too wide) - Can't be detected (looks like
noise) - Can't be intercepted (need secret code) - Some
systems hop 10,000+ times per second!

**The math magic - Processing gain**:

**Shannon says**: Can trade bandwidth for SNR

    More bandwidth  Can work at lower SNR

**Example**: - Narrowband needs: 10 dB SNR - Spread
100\$\times\$ wider \$\rightarrow\$ Only
need: -20 dB SNR! - **Can receive signals weaker than noise!**

**Processing gain** = 10 \$\times\$
log\textsubscript{1}\textsubscript{0}(Spread
factor) - Spread 100\$\times\$
\$\rightarrow\$ 20 dB gain - Spread
1000\$\times\$ \$\rightarrow\$ 30 dB gain
(GPS) - This is why GPS works indoors!

**Why “spread” helps against jamming**:

**Scenario**: Enemy jammer - Jammer power: 100 W across 1 MHz -
Your signal: 1 W spread across 100 MHz - At each 1 MHz slice: Your
signal = 0.01 W - **Looks like**: Jammer
100\$\times\$ stronger! - **But**: Your receiver
de-spreads \$\rightarrow\$ combines 100 slices -
**Result**: Your signal = 1 W, Jammer still 100 W in 1 slice -
**Effective**: 10:1 ratio \$\rightarrow\$ You win!

**The coding requirement**:

**Both sides must know**: - **DSSS**: The spreading code
(sequence of chips) - **FHSS**: The hopping pattern (sequence of
frequencies)

**Synchronization critical**: - Receiver must align perfectly with
transmitter - GPS: Searches for code phase (expensive!) - Bluetooth:
Pairing exchanges hop pattern + timing

**Trade-offs**:

**Advantages**: - Interference resistance - Anti-jamming -
Privacy/security - Multiple access (CDMA) - Multipath resistance - Works
below noise floor

**Disadvantages**: - “Wastes” bandwidth
(100-1000\$\times\$ more!) - Complex processing (high
power consumption) - Synchronization required (acquisition time) -
Near-far problem (CDMA)

**Historical origin - WWII innovation**:

**Hedy Lamarr** (yes, the Hollywood actress!): - Co-invented
frequency hopping (1942) - **Purpose**: Torpedo control immune to
jamming - Patent ignored until 1960s - **Now**: Foundation of
Bluetooth, WiFi, military comms - She was brilliant engineer + movie
star!

**Fun fact**: GPS signals arriving at Earth are about **-130
dBm** (10^-16 watts), which is **20 dB below the noise
floor**---weaker than the background noise! Only because of DSSS
spread spectrum with 30 dB processing gain can your phone extract the
signal. It's like hearing a whisper in a crowded stadium
by having 1000 microphones and combining them perfectly!

<div class="center">

------------------------------------------------------------------------

</div>

**Spread spectrum** techniques intentionally spread a narrowband
signal across a much wider bandwidth. Originally developed for military
anti-jamming communications, spread spectrum now powers GPS, Bluetooth,
WiFi, CDMA cellular, and countless other systems.

<div class="center">

------------------------------------------------------------------------

</div>

##  Core Philosophy

**Conventional wisdom**: Use minimal bandwidth to maximize spectral
efficiency.

**Spread spectrum approach**: **Deliberately waste bandwidth**
to gain: - **Low Probability of Intercept (LPI)**: Signal appears
as noise to unintended receivers - **Low Probability of Detection
(LPD)**: Hard to detect presence of transmission - **Anti-jamming
(AJ)**: Processing gain overcomes interference - **Multiple
access**: Many users share same band (CDMA) - **Multipath
resistance**: Wideband signals resolve path delays

**Shannon's insight**: Trading bandwidth for SNR is
mathematically sound:

    C = B · log(1 + SNR)

    Increase B by 100×  can tolerate SNR 100× lower (20 dB worse!)

<div class="center">

------------------------------------------------------------------------

</div>

##  Processing Gain

The fundamental metric for spread spectrum performance.

### Definition

    Processing Gain (G) = Spread Bandwidth / Information Bandwidth
                          = BW_spread / BW_info
                          = Chip Rate / Bit Rate

    In dB:
    G(dB) = 10 · log(BW_spread / BW_info)

### Physical Meaning

**Processing gain = SNR improvement after despreading**:

    SNR_output = SNR_input + G(dB)

    Example:
    - Input SNR: -10 dB (signal 10× weaker than noise!)
    - Processing gain: 30 dB (spread by 1000×)
    - Output SNR: 20 dB (clean signal)

**At receiver**: - Desired signal: Despread
\$\rightarrow\$ collapses to narrowband
\$\rightarrow\$ **gains
G\textsubscript{p}** - Noise/interference: Remains spread
\$\rightarrow\$ filtered out \$\rightarrow\$
**loses G\textsubscript{p}**

<div class="center">

------------------------------------------------------------------------

</div>

##  Direct Sequence Spread Spectrum (DSSS)

### How DSSS Works

**Transmitter**: 1. Data bit (slow): \$\pm\$1 at rate
R\_b 2. Multiply by **spreading code** (fast): \$\pm\$1
sequence at rate R \>\> R\_b 3. Result: Wideband
“chips” transmitted

    Data bit:         1        0        1
                    +----+   +----+   +----+
                    |    |___|    |___|    |
                    
    Spreading code: 1 0 1 1 0 1 0 0 1 1 1 0 ...
                    ++ ++++ ++ ++++++++ ++  (fast chips)
                    
    TX signal:      Product of data × code

**Key parameters**:

    - Chip rate (R): e.g., 10 Mcps (chips/second)
    - Bit rate (R_{b}): e.g., 10 kbps
    - Spreading factor (SF): R/R_{b} = 1000
    - Processing gain: 10·log(1000) = 30 dB

<div class="center">

------------------------------------------------------------------------

</div>

### Spreading Codes (PN Sequences)

**Requirements**: - **Pseudorandom**: Appears random but
deterministic (generated from seed) - **Autocorrelation**: Sharp
peak at zero lag, low elsewhere - **Cross-correlation**: Low
correlation between different codes (for CDMA) - **Balance**: Equal
number of 1s and 0s

**Common codes**:

**1. Maximal-Length Sequences (m-sequences)**:

    Generated by Linear Feedback Shift Register (LFSR):

       +-----+  +-----+  +-----+
       | D  || D  || D  | Output
       +----+  +-----+  +----+
          |                  |
          +-----------------+
             (XOR feedback)

    Properties:
    - Period: 2 - 1 (for n-stage LFSR)
    - Example: 7-stage  period = 127 chips
    - Good autocorrelation, poor cross-correlation

**2. Gold Codes**:

    XOR two m-sequences with specific phase shifts

    Gold Code = m-seq  m-seq

    Properties:
    - Set of 2 + 1 codes (from n-stage LFSR)
    - Good autocorrelation AND cross-correlation
    - Used in GPS C/A code (1023-chip Gold codes)

**3. Walsh-Hadamard Codes**:

    Orthogonal codes (zero cross-correlation):

    H = [1]

    H = [1  1]     H = [1  1  1  1]
         [1 -1]          [1 -1  1 -1]
                         [1  1 -1 -1]
                         [1 -1 -1  1]

    Properties:
    - Perfectly orthogonal (theoretical CDMA)
    - Length = powers of 2
    - Used in IS-95 CDMA (64-chip Walsh)

<div class="center">

------------------------------------------------------------------------

</div>

### DSSS Receiver (Matched Filter)

**Despreading**:

    RX signal = (Data × Code) + Noise
              Multiply by same code
             = Data × Code × Code + Noise × Code
             = Data × 1 + Noise × Code
             = Data + (Noise spread across bandwidth)
              Integrate over chip period
             = Data (narrowband) + Filtered noise (reduced by G)

**Correlation receiver**:

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

### DSSS Example: GPS C/A Code

**GPS L1 C/A (Coarse/Acquisition)**:

    Carrier: 1575.42 MHz
    Chip rate: 1.023 Mcps
    Code: 1023-chip Gold code (repeats every 1 ms)
    Bit rate: 50 bps (navigation message)
    Processing gain: 10·log(1.023 MHz / 50 Hz) = 43 dB

    Each satellite: Unique Gold code
    - SV 1: PRN 1 (specific Gold code)
    - SV 2: PRN 2 (different Gold code)
    - ... 32 satellites

    Reception:
    - Signal at antenna: -130 dBm (20 dB below noise floor!)
    - After despreading: -87 dBm (above noise)
    - C/N (carrier-to-noise density): 45 dB-Hz (typical)

**Code generation** (PRN 1 example):

    G1 LFSR: taps [3, 10] (1-indexed)
    G2 LFSR: taps [2, 3, 6, 8, 9, 10]
    PRN 1 = G1  (G2 delayed by specific phase)

    Result: 1023-chip sequence, e.g.:
    1 1 0 1 0 1 1 0 0 0 1 0 1 0 1 ... (repeats)

<div class="center">

------------------------------------------------------------------------

</div>

### CDMA (Code Division Multiple Access)

**Concept**: Multiple users transmit simultaneously on same
frequency, distinguished by spreading codes.

    User 1: Data × Code ----+
    User 2: Data × Code ----+   Channel  Receiver
    User 3: Data × Code ----+

    Receiver (for User 1):
    RX × Code  Integrates  Extracts Data
               (Code, Code appear as noise due to low cross-correlation)

**Capacity (IS-95 CDMA)**:

    N_users  (G / (Eb/N)_required) · (1 + F)

    where:
    - G = processing gain
    - (Eb/N)_required = SNR needed for target BER
    - F = frequency reuse factor (typically 0.6-0.85)

    Example:
    - G = 21 dB (126)
    - (Eb/N)_required = 7 dB (5) for 1% BER
    - F = 0.67
    - N_users  126 / 5 × 1.67  42 users per cell

<div class="center">

------------------------------------------------------------------------

</div>

##  Frequency Hopping Spread Spectrum (FHSS)

### How FHSS Works

**Transmitter**: Rapidly switches carrier frequency according to a
pseudorandom pattern.

    Time 
    Frequency
        
    f  |                
    f  |            
    f  |                   
    f  |               
    f  |                      
        +-------------------------

    Each block = "hop" (dwell time)
    Pattern known only to TX/RX

**Key parameters**:

    - Hop rate: e.g., 1600 hops/second (Bluetooth)
    - Dwell time: Time per frequency (e.g., 625 s)
    - Hop set: Available frequencies (e.g., 79 channels)
    - Hop sequence: Pseudorandom pattern

<div class="center">

------------------------------------------------------------------------

</div>

### FHSS Variants

**1. Fast Hopping (FH)**:

    Multiple hops per data symbol

    Example:
    Symbol duration: 10 ms
    Hop duration: 1 ms
     10 hops per symbol

    Advantage: Diversity against narrowband interference

**2. Slow Hopping (SH)**:

    Multiple symbols per hop

    Example:
    Hop duration: 10 ms
    Symbol duration: 1 ms
     10 symbols per hop

    Advantage: Simpler synchronization

<div class="center">

------------------------------------------------------------------------

</div>

### FHSS Example: Bluetooth

**Bluetooth Classic (BR/EDR)**:

    Frequency: 2.4 GHz ISM band
    Hop set: 79 channels (1 MHz spacing, 2.402-2.480 GHz)
    Hop rate: 1600 hops/second
    Dwell time: 625 s
    Modulation: GFSK (Gaussian FSK)
    Data rate: 1 Mbps (BR), 2-3 Mbps (EDR)

    Hopping pattern:
    - Derived from master device address + clock
    - Pseudorandom over all 79 channels
    - Adaptive Frequency Hopping (AFH): Avoids WiFi channels

    Multi-user:
    - Piconet: Master + up to 7 slaves
    - Each piconet: Unique hopping pattern
    - Scatternets: Overlapping piconets

<div class="center">

------------------------------------------------------------------------

</div>

### FHSS vs. DSSS

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Aspect</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>DSSS</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>FHSS</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>Spreading Method</strong></td>
<td style="text-align: left;">Multiply by fast code</td>
<td style="text-align: left;">Hop carrier
frequency</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Bandwidth</strong></td>
<td style="text-align: left;">Continuous wide</td>
<td style="text-align: left;">Instantaneous narrow, wide over
time</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Processing Gain</strong></td>
<td style="text-align: left;">Chip rate / Bit rate</td>
<td style="text-align: left;">Hop set size</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Anti-Jam</strong></td>
<td style="text-align: left;">High (averages interference)</td>
<td style="text-align: left;">Moderate (avoids
interference)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Multipath</strong></td>
<td style="text-align: left;">Good (path resolution)</td>
<td style="text-align: left;">Poor (frequency-flat per
hop)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Complexity</strong></td>
<td style="text-align: left;">Moderate (correlator)</td>
<td style="text-align: left;">Low (frequency
synthesizer)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Multiple Access</strong></td>
<td style="text-align: left;">CDMA (code separation)</td>
<td style="text-align: left;">FDMA/TDMA (time/freq
separation)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Near-Far Problem</strong></td>
<td style="text-align: left;">Severe (power control needed)</td>
<td style="text-align: left;">Minimal</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Standards</strong></td>
<td style="text-align: left;">GPS, CDMA, WiFi DSSS (legacy)</td>
<td style="text-align: left;">Bluetooth, military
TRANSEC</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

##  Military Applications

Spread spectrum was **born for military use** (1940s-1950s).

### Low Probability of Intercept (LPI)

**Goal**: Enemy cannot detect transmission.

    Signal power spread across wide bandwidth:
    Power Spectral Density (PSD)  Power / Bandwidth

    Example:
    - Narrowband: 1 W / 10 kHz = 100 mW/kHz (easily detected)
    - DSSS spread: 1 W / 10 MHz = 0.1 mW/kHz (below noise floor!)

    Detection threshold:
    PSD_signal < PSD_noise  undetectable to wideband receiver

**Processing gain provides concealment**:

    If G = 30 dB, signal can be 30 dB below noise and still decoded.
    Enemy without spreading code sees only noise.

<div class="center">

------------------------------------------------------------------------

</div>

### Low Probability of Detection (LPD)

**Goal**: Enemy cannot tell if transmission is occurring.

**Techniques**: 1. **Below noise floor**: PSD \<
thermal noise (-174 dBm/Hz) 2. **Randomized patterns**: Avoid
periodic structures 3. **Frequency diversity**: FHSS over wide
bands 4. **Short bursts**: Minimize dwell time

**Example: MILSTAR FHSS**:

    - X-band (7-8 GHz) satellite uplink
    - Hops across 1 GHz bandwidth
    - Dwell time: <1 ms
    - Total detection probability: <1% for enemy wideband receiver

<div class="center">

------------------------------------------------------------------------

</div>

### Anti-Jamming (AJ)

**Jamming scenarios**:

**1. Barrage Jamming** (wideband noise):

    Jammer spreads power across entire band  processing gain helps:

    J/S = Jammer Power / Signal Power (at antenna)
    J/S_despread = (J/S) / G (after despreading)

    Example:
    - J/S = 20 dB (jammer 100× stronger)
    - G = 30 dB
    - J/S_despread = 20 - 30 = -10 dB (signal 10× stronger than jammer!)

    Margin = G - J/S - (Eb/N)_required
            = 30 - 20 - 7 = 3 dB (link survives)

**2. Partial-Band Jamming**:

    Jammer concentrates on fraction  of bandwidth:
    PSD_jammer increases by 1/  FHSS excels (hops to unjammed frequencies)

    DSSS: Averages jammer over full bandwidth  degradation proportional to 
    FHSS: Hops avoid jammer (1-) fraction of time  better performance

**3. Follower Jamming** (FHSS target):

    Jammer tries to detect hop and jam that frequency.
    Countermeasure: Fast hopping (enemy can't track) + adaptive hopping

<div class="center">

------------------------------------------------------------------------

</div>

### GPS M-Code (Military)

**GPS L1/L2 M-Code** (post-2005):

    Modulation: BOC(10,5) - Binary Offset Carrier
    Chip rate: 5.115 Mcps (vs. 1.023 Mcps for C/A)
    Processing gain: ~50 dB (vs. 43 dB for C/A)
    Security: Encrypted, authenticated (NSA-controlled keys)

    BOC modulation:
    - Square wave subcarrier at 10.23 MHz (double-sideband)
    - Spread by 5.115 Mcps code
    - Split-spectrum: Power at ±10.23 MHz from carrier
    - Advantage: Minimal interference with C/A code (different spectrum)

    Anti-jam margin:
    - Jammer-to-signal ratio (J/S): Up to 60 dB tolerated
    - Allows GPS reception even under strong jamming
    - Critical for precision-guided weapons, military aviation

**Example**:

    Received signal power: -163 dBW (M-code)
    Jammer power at receiver: -100 dBW (stronger!)
    J/S = -100 - (-163) = 63 dB

    Processing gain: 50 dB
    Residual J/S after despreading: 63 - 50 = 13 dB
    Required (Eb/N): 10 dB (M-code robust modulation)

    Margin: 50 - 63 - 10 = -23 dB  **LINK FAILS**

    Countermeasure: Directional antenna (20 dB gain toward sky, null toward jammer)
    Effective J/S: 63 - 20 = 43 dB
    Margin: 50 - 43 - 10 = -3 dB  **MARGINAL**

    Additional: Adaptive antenna array (CRPA)  30-40 dB jamming suppression

<div class="center">

------------------------------------------------------------------------

</div>

### Link 16 (JTIDS - Joint Tactical Information Distribution System)

**NATO/US military data link** for coordinated operations.

**Architecture**:

    Frequency: 960-1215 MHz (L-band)
    Modulation: MSK (Minimum Shift Keying) - constant envelope
    Waveform: 51 frequency channels, FHSS + TDMA
    Hop rate: 70,000 hops/second (14.3 s per hop)
    Security: Time-varying encryption (KG-40 key generator)
    Data rate: 31.6 kbps (voice), 57.6-115.2 kbps (data)

    Network:
    - TDMA: 128 time slots per 12 seconds
    - Each participant assigned slots
    - Collision-free multiple access
    - Nodes: Aircraft, ships, ground stations

**TRANSEC (Transmission Security)**:

    Hopping pattern: Cryptographically secured
    - Changes every 12 seconds (epoch)
    - Synchronized via GPS time
    - Enemy cannot predict next hop

    Result:
    - LPI/LPD: Signal appears as brief noise burst
    - AJ: Hops faster than jammer can follow
    - Covertness: No fixed frequency to monitor

**Applications**:

    - Fighter jets: Share target tracks (Link 16 "picture")
    - AWACS: Distribute surveillance data
    - Aegis ships: Coordinate air defense
    - Ground units: Tactical situational awareness

<div class="center">

------------------------------------------------------------------------

</div>

##  Commercial Applications

### WiFi 802.11b (DSSS Legacy)

**1999-era WiFi**:

    Frequency: 2.4 GHz ISM
    Chip rate: 11 Mcps (Barker code)
    Bit rate: 1-11 Mbps
    Spreading: 11-chip Barker sequence (for 1-2 Mbps)
    Processing gain: 10.4 dB (11 Mcps / 1 Mbps)

    Barker Code (length 11):
    +1 -1 +1 +1 -1 +1 +1 +1 -1 -1 -1

    Autocorrelation:
    Peak: 11 (at zero lag)
    Sidelobes: 1 (excellent!)

    Higher rates (5.5, 11 Mbps):
    - CCK (Complementary Code Keying) - not true DSSS
    - Phase modulation with 8-chip codes

**Obsolescence**:

    802.11g (2003): OFDM replaces DSSS (higher spectral efficiency)
    Legacy DSSS: Still supported for backward compatibility

<div class="center">

------------------------------------------------------------------------

</div>

### LoRa (Long Range)

**IoT spread spectrum** for low-power wide-area networks.

    Modulation: Chirp Spread Spectrum (CSS) - not DSSS or FHSS!
    Frequencies: 902-928 MHz (US), 863-870 MHz (EU)
    Bandwidth: 125, 250, 500 kHz
    Spreading Factor: 7-12 (SF7 = 128 chips/symbol, SF12 = 4096)

    Processing gain:
    G = 10·log(SF) = 8.5-10.8 dB (SF7-SF12)

    Range: Up to 15 km rural, 2-5 km urban
    Data rate: 0.3-50 kbps (inversely proportional to SF)
    Power: <100 mW TX, <50 mA RX
    Battery life: Years on coin cell

**Chirp modulation**:

    Frequency sweeps linearly over bandwidth:

    f(t) = f + (BW/T)·t

    Up-chirp:    (frequency increases)
    Down-chirp:  (frequency decreases)

    Data encoded by initial frequency offset:
    Symbol value = starting frequency of chirp

    Advantage: Robust to Doppler, multipath, noise (like DSSS benefits)

<div class="center">

------------------------------------------------------------------------

</div>

##  Performance Analysis

### BER in AWGN Channel (DSSS-BPSK)

    BER = Q((2·Eb/N))

    where:
    Eb/N = (Signal Power / Bit Rate) / (Noise Power / Bandwidth)
          = (S/N) · (BW / Bit Rate)
          = (S/N) · G

    Example:
    - S/N = -10 dB (0.1 linear) - signal below noise!
    - G = 30 dB (1000 linear)
    - Eb/N = 0.1 × 1000 = 100 (20 dB)
    - BER = Q(40)  Q(6.3)  10¹ (excellent!)

<div class="center">

------------------------------------------------------------------------

</div>

### Jamming Margin

    Jamming Margin (dB) = G - (J/S) - (Eb/N)_req - Losses

    where:
    - G = processing gain
    - J/S = jammer-to-signal ratio
    - (Eb/N)_req = required SNR for target BER
    - Losses = implementation losses (typically 2-3 dB)

    Positive margin  link survives jamming
    Negative margin  link fails

    Example (GPS C/A):
    - G = 43 dB
    - J/S = 40 dB (jammer at receiver)
    - (Eb/N)_req = 10 dB (for BER = 10)
    - Losses = 2 dB
    - Margin = 43 - 40 - 10 - 2 = -9 dB  **LINK FAILS**

    Mitigation: Directional antenna (+20 dB toward satellite)
    Effective J/S = 40 - 20 = 20 dB
    Margin = 43 - 20 - 10 - 2 = 11 dB  **LINK SURVIVES**

<div class="center">

------------------------------------------------------------------------

</div>

##  Python Implementation Examples

### DSSS Transmitter & Receiver

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

### FHSS Simulator

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

##  Theoretical Foundations

### Shannon Capacity with Spread Spectrum

For spread bandwidth B_spread and information bandwidth B_info:

    C_spread = B_spread · log(1 + S/(N·B_spread))
    C_info = B_info · log(1 + S/(N·B_info))

    Ratio:
    C_spread / C_info = (B_spread/B_info) · log(1 + S/(N·B_spread)) 
                                            / log(1 + S/(N·B_info))

    For low SNR (S << N·B_spread):
    log(1 + x)  x/ln(2)  for small x

    C_spread  C_info (capacity preserved!)

    Interpretation: Spreading doesn't reduce capacity if SNR is low.
    Military sweet spot: Spread to go below noise floor while maintaining data rate.

<div class="center">

------------------------------------------------------------------------

</div>

##  Advantages & Disadvantages

### Advantages

**Anti-jamming**: Processing gain overcomes interference  
**LPI/LPD**: Signal hidden in noise  
**Multiple access**: CDMA allows many users  
**Multipath resistance** (DSSS): Resolves path delays  
**Privacy**: Eavesdropping requires spreading code  
**Coexistence**: Graceful degradation with other systems

### Disadvantages

**Bandwidth inefficient**: Uses far more spectrum than narrowband  
**Complex synchronization**: Receiver must align code/frequency  
**Near-far problem** (DSSS CDMA): Strong users drown weak ones  
**Processing overhead**: Correlators, frequency synthesizers  
**Power control critical**: Especially for CDMA

<div class="center">

------------------------------------------------------------------------

</div>

##  Further Reading

### Textbooks

- **Simon et al.**, *Spread Spectrum Communications Handbook*
  - Comprehensive reference (military focus)

- **Peterson, Ziemer, Borth**, *Introduction to Spread
  Spectrum Communications* - Accessible introduction

- **Viterbi**, *CDMA: Principles of Spread Spectrum
  Communication* - From inventor of CDMA

### Standards & External Resources

- **IS-95**: CDMA cellular (Qualcomm standard)

- **[IS-GPS-200M](https://www.gps.gov/technical/icwg/IS-GPS-200M.pdf)**:
  GPS signal specifications (C/A, P(Y), M codes) - Official U.S.
  specification

- **[Navipedia
  GPS Signals](https://gssc.esa.int/navipedia/index.php?title=GPS_Signal_Plan)**: ESA technical reference for GPS/GNSS

- **MIL-STD-188-181**: US military FHSS standard

- **IEEE 802.15.1**: Bluetooth FHSS specifications

- **[sigidwiki
  Spread Spectrum](https://www.sigidwiki.com/wiki/Category:Spread_Spectrum)**: Real-world spread spectrum signal examples

### Military Resources

- **Poisel**, *Introduction to Communication Electronic
  Warfare Systems* - EW perspective

- **Torrieri**, *Principles of Spread-Spectrum Communication
  Systems* - Modern military focus

- **COMSEC manuals**: Classified (NSA) - operational TRANSEC

### Related Topics

- \[\[Shannon's-Channel-Capacity-Theorem\]\] -
  Theoretical foundation

- \[\[Military-&-Covert-Communications\]\] - LPI/LPD systems, GPS
  M-code

- \[\[CDMA (coming soon)\]\] - Code Division Multiple Access

- \[\[Synchronization-(Carrier,-Timing,-Frame)\]\] - Code
  acquisition and tracking

- \[\[Real-World-System-Examples\]\] - GPS, Bluetooth, WiFi,
  military systems

<div class="center">

------------------------------------------------------------------------

</div>

**Summary**: Spread spectrum trades bandwidth for robustness. DSSS
multiplies data by fast pseudorandom codes to spread across wide
bandwidths, gaining processing gain that enables anti-jamming and covert
communications. FHSS rapidly hops between frequencies to avoid
interference. Originally military technologies (GPS, Link 16), spread
spectrum now underpins consumer wireless (WiFi, Bluetooth) and IoT
(LoRa). Processing gain = SNR improvement = anti-jam capability. The
lower the PSD, the harder to detect---spread spectrum is the
foundation of stealth communications.
