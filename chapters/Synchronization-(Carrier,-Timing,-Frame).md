---
layout: chapter
title: "Synchronization-(Carrier,-Timing,-Frame)"
chapter: 60
permalink: /chapters/synchronization-(carrier,-timing,-frame)/
---

# Synchronization (Carrier, Timing, Frame)

\[\[Home\]\] **System Implementation**
\[\[Signal-Chain-(End-to-End-Processing)\]\]
\[\[Channel-Equalization\]\]

<div class="center">

------------------------------------------------------------------------

</div>

## \[clock\] For Non-Technical Readers

**Synchronization is like tuning a radio perfectly---the
receiver must match the transmitter's frequency, phase,
and timing, or you just hear noise!**

**The problem - Everything must align**: - Transmitter sends signal
at exact frequency/phase/timing - Signal travels through space (delay,
Doppler shift) - Receiver's clock is slightly different
- If misaligned: Signal is gibberish!

**The three types of sync**:

**1. Carrier Frequency Sync** ( Tuning the radio): -
**Problem**: Receiver's oscillator slightly
different from transmitter - Off by 100 Hz? Signal “wobbles” and
can't be decoded! - **Solution**: Detect frequency
error and adjust local oscillator - **Like**: Fine-tuning old radio
dial to eliminate whistling

**2. Carrier Phase Sync** ( Getting the angle right): -
**Problem**: Even at right frequency, phase can be rotated -
45\$^\circ\$ phase error? All constellation points
rotated! - **Solution**: Use known patterns (pilot symbols) to
measure phase - **Like**: Rotating a map to align with compass

**3. Symbol Timing Sync** (\[timer\] Sampling at the right
moment): - **Problem**: When does each symbol start/end? - Sample
too early/late? Catch transition between symbols! - **Solution**:
Find optimal sampling instant (eye diagram peak) - **Like**:
Jumping rope --- must jump at exactly the right moment!

**4. Frame Sync** ( Finding the start of message): -
**Problem**: Where does packet begin in the stream? -
**Solution**: Send known preamble, receiver searches for it -
**Like**: Finding “Dear Sir” at start of letter

**Real-world examples**:

**Your phone connecting to WiFi**: 1. **Frequency sync**: “Is
this really channel 6 at 2.437 GHz?” 2. **Timing sync**: “When
should I sample each OFDM symbol?” 3. **Frame sync**: “Where does
the packet start?” 4. **Phase sync**: “What's the
phase reference?” - All this happens in milliseconds!

**GPS receiver**: - Must sync to satellite signal - Doppler shift
from moving satellite = frequency offset - Continuously tracking and
adjusting sync - Lose sync \$\rightarrow\$ lose position!

**Why it's hard**: - **Doppler**: Moving
transmitter/receiver shifts frequency - Car at 100 km/h:
~220 Hz shift at 2.4 GHz! - **Oscillator drift**:
Cheap crystals drift with temperature - **Multipath**: Echoes
confuse timing - **Noise**: Makes patterns hard to detect

**How receivers achieve sync**:

**Cold start** (no sync): 1. Search wide frequency range 2. Detect
presence of signal 3. Coarse frequency lock (~kHz
accuracy) 4. Fine frequency lock (~Hz accuracy) 5. Phase
lock 6. Symbol timing lock 7. Frame sync 8. NOW can decode data!

**Tracking** (maintaining sync): - Continuously monitor and adjust
- Phase-locked loop (PLL) tracks frequency/phase - Timing recovery
tracks symbol boundaries - Update 1000s of times per second!

**When sync fails**: - **WiFi**: “Limited connectivity” =
can't achieve frame sync - **TV**: Picture rolls or
has diagonal lines = bad sync - **Old modems**: “Handshake” =
establishing sync - **Satellite**: Brief signal loss = must re-sync
(takes seconds)

**The sync symbols you've seen**: - **WiFi**:
Preamble at start of packet (sync symbols) - **TV**: Black bar at
edge of picture (sync pulse) - **Old modems**: Screeching sounds =
training sequence for sync!

**Fun fact**: The first few milliseconds of every WiFi packet are
dedicated to synchronization---your device sends known patterns that
both transmitter and receiver recognize, allowing perfect alignment
before data transmission begins!

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

**Synchronization** is critical for coherent
demodulation---receiver must align with transmitter.

**Three types**: 1. **Carrier frequency synchronization**:
Match local oscillator frequency 2. **Carrier phase
synchronization**: Align carrier phase (0\$^\circ\$
reference) 3. **Symbol timing synchronization**: Sample at correct
instants 4. **Frame synchronization**: Identify packet/frame
boundaries

**Failure modes**: - **CFO** (Carrier Frequency Offset)
\$\rightarrow\$ Constellation rotation, ICI -
**Phase error** \$\rightarrow\$ Constellation
rotation - **Timing error** \$\rightarrow\$ ISI,
wrong sample points - **Frame misalignment**
\$\rightarrow\$ Lost packets

<div class="center">

------------------------------------------------------------------------

</div>

## Carrier Frequency Synchronization

### Carrier Frequency Offset (CFO)

**Cause**: LO frequency mismatch between TX and RX

``` math
f_{\text{error}} = f_{\text{LO,RX}} - f_{\text{LO,TX}}
```

**Effect on received signal**:

``` math
r(t) = s(t) e^{j 2\pi \Delta f t} + n(t)
```

Where $`\Delta f`$ = CFO (Hz)

<div class="center">

------------------------------------------------------------------------

</div>

### CFO Impact

**Normalized CFO**: $`\epsilon = \Delta f \cdot T_s`$ (fraction of
symbol rate)

**Effects**:

1.  **Constellation rotation**: Phase rotates $`2\pi \epsilon`$ per
    symbol

2.  **ICI** (Inter-Carrier Interference in OFDM): Subcarriers leak
    into neighbors

3.  **SNR degradation**: Effective SNR loss
    ~$`10 \log_{10}(1 + \text{SNR} \cdot (2\pi\epsilon)^2)`$
    dB

**Example**: 2.4 GHz WiFi, \$\pm\$20 ppm crystal -
CFO: \$\pm\$48 kHz - Symbol rate: 250 ksps
\$\rightarrow\$ $`\epsilon = \pm 0.192`$ (19%!) -
**Must correct** before demodulation

<div class="center">

------------------------------------------------------------------------

</div>

### CFO Estimation Methods

#### 1. Data-Aided (Preamble-Based)

**Transmit known symbols** (preamble, pilot tones)

**Correlate** received with expected:

``` math
\hat{\Delta f} = \frac{1}{2\pi T} \angle \left(\sum_{k} r_k \cdot s_k^*\right)
```

Where: - $`r_k`$ = Received preamble symbol $`k`$ - $`s_k`$ = Known
preamble symbol $`k`$ - $`T`$ = Symbol period

**Range**: $`|\Delta f| < 1/(2T)`$ (ambiguity)

**Accuracy**: $`\sim 10^{-4}`$ of symbol rate

<div class="center">

------------------------------------------------------------------------

</div>

#### 2. Blind (Non-Data-Aided)

**No preamble**, use signal properties

**Method**: Power spectral density peak, cyclostationary features

**Example (MPSK)**:

``` math
\hat{\Delta f} = \frac{1}{2\pi M T} \angle \left(\sum_{k} r_k^M\right)
```

For M-PSK (raise to M-th power removes modulation)

**Range**: $`|\Delta f| < 1/(2MT)`$ (reduced ambiguity)

<div class="center">

------------------------------------------------------------------------

</div>

#### 3. Two-Stage Acquisition

**Coarse acquisition**: \$\pm\$50% symbol rate
(preamble autocorrelation)

**Fine tracking**: \$\pm\$0.1% (PLL,
decision-directed)

**Example (WiFi 802.11a)**: - Short preamble: Coarse CFO
(\$\pm\$100 kHz range) - Long preamble: Fine CFO
(\$\pm\$1 kHz accuracy)

<div class="center">

------------------------------------------------------------------------

</div>

### CFO Correction

**Digital correction** (after downconversion):

``` math
r_{\text{corrected}}[n] = r[n] \cdot e^{-j 2\pi \hat{\epsilon} n}
```

**Analog correction**: Adjust VCO frequency (AFC, Automatic
Frequency Control)

**Hybrid**: Coarse analog, fine digital

<div class="center">

------------------------------------------------------------------------

</div>

## Carrier Phase Synchronization

### Phase Offset

**After CFO correction**, residual phase error $`\theta`$:

``` math
r(t) = s(t) e^{j\theta} + n(t)
```

**Effect**: Constellation rotates by $`\theta`$

**Tolerance**: - **BPSK**:
\$\pm\$90\$^\circ\$ (ambiguity,
differential coding helps) - **QPSK**:
\$\pm\$45\$^\circ\$ - **16-QAM**:
\$\pm\$22.5\$^\circ\$ - **256-QAM**:
\$\pm\$2.8\$^\circ\$ (very sensitive!)

<div class="center">

------------------------------------------------------------------------

</div>

### Phase-Locked Loop (PLL)

**Classic analog/digital feedback loop**:

    Input --> [Phase      --> [Loop    --> [VCO/NCO] --> Local
               Detector]      Filter]                    Carrier
                                                           |
                  +--------------------<--------------------+

**Components**: 1. **Phase detector**: Measure phase error
(mixer + LPF) 2. **Loop filter**: 2nd-order (PI controller) 3.
**VCO/NCO**: Voltage/Numerically Controlled Oscillator

<div class="center">

------------------------------------------------------------------------

</div>

#### Loop Dynamics

**2nd-order PLL**:

``` math
H(s) = \frac{2\zeta\omega_n s + \omega_n^2}{s^2 + 2\zeta\omega_n s + \omega_n^2}
```

Where: - $`\omega_n`$ = Natural frequency (rad/s) - $`\zeta`$ = Damping
factor (0.707 critical)

**Loop bandwidth** $`B_L \approx \omega_n`$ (for
$`\zeta \approx 0.7`$)

**Trade-off**: - **Narrow BW** ($`B_L < 0.01 R_s`$): Better
noise rejection, slower acquisition - **Wide BW**
($`B_L > 0.1 R_s`$): Faster acquisition, more noise

<div class="center">

------------------------------------------------------------------------

</div>

### Costas Loop

**For suppressed-carrier modulation** (BPSK, QPSK)

**Structure**:

               cos(t+)
                    |
    Input --> [×] --> [LPF] --> I(t) --\
              [×] --> [LPF] --> Q(t) ---+--> [Phase  --> [Loop   --> [VCO]
               |                         |    Detector]     Filter]      |
          -sin(t+)                     |                               |
               ^                         |                               |
               +-------------------------+-------------------------------+

**Phase detector**: $`e = I \cdot Q`$ (for BPSK)

**QPSK**: $`e = \text{sign}(I) \cdot Q - I \cdot \text{sign}(Q)`$

**Advantage**: Tracks phase without pilot carrier (bandwidth
efficient)

<div class="center">

------------------------------------------------------------------------

</div>

### Decision-Directed Phase Tracking

**Use decoded symbols** as phase reference:

``` math
e[n] = \angle(r[n] \cdot \hat{s}[n]^*)
```

Where $`\hat{s}[n]`$ = Decoded symbol (nearest constellation point)

**Update**:

``` math
\hat{\theta}[n+1] = \hat{\theta}[n] + \mu \cdot e[n]
```

**Step size** $`\mu`$: Small (~0.01) for stability

**Works after initial acquisition** (preamble-based)

<div class="center">

------------------------------------------------------------------------

</div>

## Symbol Timing Synchronization

### Timing Offset

**Sample at wrong instant** \$\rightarrow\$ ISI,
degraded SNR

**Optimal sampling**: Peak of matched filter output (zero ISI
point)

**Timing error** $`\tau`$: Offset from optimal (fraction of symbol
period)

<div class="center">

------------------------------------------------------------------------

</div>

### Early-Late Gate

**Classic timing recovery** (Mueller & Müller algorithm):

**Sample at 3 points**: Early, On-time ($`t_k`$), Late

``` math
e_k = \text{sign}(r[t_k - T/2]) \cdot r[t_k] - \text{sign}(r[t_k + T/2]) \cdot r[t_k]
```

**Update**:

``` math
\hat{\tau}[k+1] = \hat{\tau}[k] - \mu \cdot e_k
```

**Advantage**: Works with any signal (blind)

<div class="center">

------------------------------------------------------------------------

</div>

### Gardner Timing Error Detector

**Improved early-late** for bandlimited signals:

``` math
e_k = (r[t_k] - r[t_{k-1}]) \cdot r[t_k - T/2]
```

**Where**: - $`r[t_k]`$ = Current sample - $`r[t_{k-1}]`$ =
Previous symbol sample - $`r[t_k - T/2]`$ = Mid-point sample

**Advantage**: Better performance, still blind

<div class="center">

------------------------------------------------------------------------

</div>

### Maximum Likelihood (ML) Timing

**Data-aided** (preamble):

**Find** $`\hat{\tau}`$ that maximizes:

``` math
\Lambda(\tau) = \left|\sum_{k} r[t_k + \tau] \cdot s_k^*\right|^2
```

**Implementation**: Interpolate and search
(\$\pm\$0.5 symbol period)

**Accuracy**: Sub-sample (~0.01 symbol period)

<div class="center">

------------------------------------------------------------------------

</div>

### Timing Loop

**Similar to PLL**:

    Input --> [Timing Error --> [Loop    --> [NCO/    --> Sample
               Detector]         Filter]      Interp]    Clock
                                                 |
                  +---------------<---------------+

**NCO**: Numerically Controlled Oscillator (adjusts sampling phase)

**Interpolator**: Polyphase filter (fractional delay)

<div class="center">

------------------------------------------------------------------------

</div>

## Frame Synchronization

### Purpose

**Identify** packet/frame start in continuous bit stream

**Required for**: - Header decoding (length, MCS) - Payload
extraction - Retransmission (ARQ)

<div class="center">

------------------------------------------------------------------------

</div>

### Preamble Detection

**Transmit known pattern** at start of frame

**Receiver correlates**:

``` math
C[n] = \sum_{k=0}^{L-1} r[n+k] \cdot p[k]^*
```

Where: - $`p[k]`$ = Preamble (length $`L`$) - $`r[n]`$ = Received signal

**Threshold**:

``` math
|C[n]| > \gamma \quad \Rightarrow \quad \text{Frame detected at } n
```

**Threshold** $`\gamma`$: Balance false alarm vs missed detection

<div class="center">

------------------------------------------------------------------------

</div>

### Auto-Correlation (WiFi Example)

**Short preamble**: 16-sample pattern, repeated 10 times

**Auto-correlate** with delayed version:

``` math
R[n] = \sum_{k=0}^{15} r[n+k] \cdot r[n+k-16]^*
```

**Peak** when aligned \$\rightarrow\$ Frame start

**Advantage**: No stored template (self-synchronizing)

<div class="center">

------------------------------------------------------------------------

</div>

### Barker Code

**Binary sequence** with ideal autocorrelation:

**11-bit Barker**: +1 +1 +1 \$-\$1 \$-\$1 \$-\$1 +1 \$-\$1 \$-\$1
+1 \$-\$1

**Autocorrelation peak**: 11 (sidelobes \$\leq\$1)

**Used in**: 802.11b (1-2 Mbps DSSS)

<div class="center">

------------------------------------------------------------------------

</div>

### Frame Structure Example (WiFi 802.11a)

    [Short Preamble (8 s)] [Long Preamble (8 s)] [SIGNAL (4 s)] [DATA]
            |                        |                      |
       CFO coarse              CFO fine, channel est    Rate, length
       AGC setting              Timing sync

**Short preamble**: 10\$\times\$ repetition (1.6
\$\mu\$s pattern) - AGC settling - Coarse CFO
(\$\pm\$100 kHz) - Frame detection

**Long preamble**: 2\$\times\$ known symbols (3.2
\$\mu\$s each) - Fine CFO (\$\pm\$1 kHz) -
Channel estimation (64 subcarriers) - Symbol timing

<div class="center">

------------------------------------------------------------------------

</div>

## Practical System Examples

### 1. GPS L1 C/A Acquisition

**Challenge**: Signal below noise floor (\$-\$130 dBm)

**C/A code**: 1023-chip Gold code, 1.023 MHz (1 ms period)

**Acquisition**: 1. **Coarse search**: \$\pm\$5
kHz Doppler, 0.5-chip spacing 2. **FFT-based**: Correlate in
frequency domain (fast) 3. **Threshold**: SNR \> 10 dB
after integration

**Time**: 0.1-1 second (cold start), 1-10 ms (hot start)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. LTE Cell Search

**PSS** (Primary Synchronization Signal): Detect slot timing, cell
ID (mod 3)

**SSS** (Secondary Synchronization Signal): Frame timing, cell ID
(504 total)

**Steps**: 1. **PSS detection**: 3 Zadoff-Chu sequences,
correlate every 0.5 ms 2. **Coarse CFO**: From PSS phase 3.
**SSS detection**: 168 sequences (2 per cell group) 4. **Fine
CFO**: From SSS 5. **PBCH decode**: Master Info Block (bandwidth,
frame number)

**Time**: ~100 ms (initial), ~10 ms
(handover)

<div class="center">

------------------------------------------------------------------------

</div>

### 3. DVB-S2 Satellite Receiver

**Coarse CFO**: \$\pm\$500 kHz (Doppler, LNB drift)

**Timing offset**: \$\pm\$100 ppm

**Acquisition**: 1. **PLHEADER**: 90-symbol pilot block (start
of frame) 2. **Coarse timing**: Sliding correlation 3. **Fine
CFO/phase**: Pilot symbols every 16 data symbols 4. **Tracking**:
Decision-directed on pilots

**Time**: ~1 second (blind search),
~100 ms (known frequency)

<div class="center">

------------------------------------------------------------------------

</div>

## Synchronization Errors

### CFO Impact

**Small CFO** ($`\epsilon = 0.01`$): - Constellation rotates
3.6\$^\circ\$ per symbol (10 symbols
\$\rightarrow\$ 36\$^\circ\$) - QPSK: OK
(\$\pm\$45\$^\circ\$ tolerance) -
256-QAM: **Fails**
(\$\pm\$2.8\$^\circ\$ tolerance)

**Large CFO** ($`\epsilon = 0.2`$): - OFDM: ICI dominates, 10+ dB
loss

<div class="center">

------------------------------------------------------------------------

</div>

### Phase Noise

**Oscillator jitter** causes random phase variation:

``` math
\phi_n[k] \sim \mathcal{N}(0, \sigma_\phi^2)
```

**Effect**: Constellation spreading

**Tolerance**: - **QPSK**:
~10\$^\circ\$ RMS - **64-QAM**:
~2\$^\circ\$ RMS - **1024-QAM**:
~0.5\$^\circ\$ RMS

**Mitigation**: Pilot-based tracking (common phase error
estimation)

<div class="center">

------------------------------------------------------------------------

</div>

### Timing Jitter

**Clock instability** \$\rightarrow\$ Sampling time
variation

**Effect**: Effective SNR loss

``` math
\text{SNR}_{\text{eff}} = \text{SNR} \cdot \text{sinc}^2(\pi \sigma_\tau)
```

Where $`\sigma_\tau`$ = RMS timing error (fraction of symbol period)

**Example**: $`\sigma_\tau = 0.1`$ \$\rightarrow\$
0.4 dB loss

<div class="center">

------------------------------------------------------------------------

</div>

## Design Guidelines

### 1. Choose Loop Bandwidth

**Narrow** ($`B_L < 0.01 R_s`$): - High SNR scenarios - Low phase
noise - Stationary channel

**Wide** ($`B_L > 0.1 R_s`$): - Low SNR - High Doppler (mobile) -
Fast acquisition needed

**Typical**: $`B_L \approx 0.01 - 0.05 R_s`$ (compromise)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Preamble Design

**Length**: Trade-off overhead vs accuracy - **Short** (10-50
symbols): Low overhead, lower SNR threshold - **Long** (100+
symbols): Better accuracy, higher overhead

**Pattern**: Good autocorrelation (low sidelobes) -
**Pseudorandom**: LFSR, Gold codes - **Constant amplitude**:
CAZAC (Zadoff-Chu), reduce PAPR

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Pilot Density

**OFDM subcarrier pilots**: - **Sparse** (1/12 subcarriers):
Low overhead, slower tracking - **Dense** (1/4 subcarriers): Fast
tracking, high overhead

**Time-domain pilots** (every N symbols): - WiFi:
~4-symbol pilot OFDM per packet - LTE: CRS every symbol (4
subcarriers per 12)

<div class="center">

------------------------------------------------------------------------

</div>

## Synchronization Sequence

**Typical receiver startup**:

1.  **AGC**: Adjust gain (10-100 \$\mu\$s)

2.  **Coarse CFO**: Preamble autocorrelation
    (\$\pm\$10% symbol rate)

3.  **Frame detect**: Cross-correlation with preamble

4.  **Fine CFO**: Preamble phase (\$\pm\$0.1% symbol
    rate)

5.  **Symbol timing**: Early-late gate or correlator peak

6.  **Phase tracking**: PLL or decision-directed

7.  **Channel estimation**: Known pilots/preamble

8.  **Data demodulation**: Begin

**Total time**: 0.1-10 ms (packet systems), 0.1-1 s (initial cell
search)

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Signal-Chain-(End-to-End-Processing)\]\]**: Overall
  system flow

- **\[\[Channel-Equalization\]\]**: Frequency-selective fading
  correction

- **\[\[OFDM-&-Multicarrier-Modulation\]\]**: Pilot-based sync

- **\[\[QPSK-Modulation\]\]**: Phase tracking for PSK

- **\[\[Bit-Error-Rate-(BER)\]\]**: Performance with sync
  errors

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Synchronization aligns receiver with
transmitter in frequency, phase, timing, and frame.** CFO
(\$\pm\$20-50 ppm typical) causes constellation
rotation---correct with preamble correlation. Phase tracking uses
PLL (Costas loop) or decision-directed feedback. Symbol timing recovery
via early-late gate (Gardner algorithm). Frame sync via preamble
correlation (Barker codes, CAZAC). WiFi: Short preamble (CFO coarse +
AGC) \$\rightarrow\$ Long preamble (CFO fine + channel
est). GPS: Gold code correlation below noise floor. LTE: PSS/SSS for
cell search (~100 ms cold start). Loop bandwidth
trade-off: Narrow (better noise) vs Wide (faster acquisition). Pilot
symbols (OFDM) enable continuous tracking. Synchronization errors
degrade BER: 256-QAM needs
\$\pm\$2.8\$^\circ\$ phase, \<1%
CFO, \<0.1T timing. Critical for coherent demodulation!

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
