---
layout: chapter
title: "OFDM-&-Multicarrier-Modulation"
chapter: 44
permalink: /chapters/ofdm-&-multicarrier-modulation/
---

# OFDM & Multicarrier Modulation

##  For Non-Technical Readers

**OFDM is like splitting a highway into many lanes---if one
lane has an accident (interference), the other lanes keep traffic
flowing!**

**The problem OFDM solves**: - Sending data fast on one channel =
short pulses = easily disrupted by echoes/reflections -
It's like trying to drive 100 mph on a narrow
road---one pothole ruins everything!

**The OFDM solution**: - Split data across **hundreds or
thousands** of narrow “lanes” (subcarriers) - Each lane moves slowly
(easier to handle) - If one lane fades or gets interference, you still
have 999 others working!

**Real-world example - WiFi**: - **WiFi 5 (802.11ac)**: Uses
52-468 subcarriers - **WiFi 6 (802.11ax)**: Uses up to 1960
subcarriers! - Each subcarrier is only 78 kHz wide (vs 20-160 MHz total
channel) - It's like delivering packages: 1 huge truck
(risky!) vs 100 small vans (resilient!)

**Why it's everywhere**: - **WiFi**: All
modern WiFi uses OFDM - **4G/5G**: LTE and 5G NR are OFDM-based -
**Digital TV**: DVB-T uses OFDM for broadcast - **DSL**: Even
wired broadband uses OFDM (DMT variant)!

**How you experience it**: WiFi works in your house even with
walls/furniture blocking some frequencies---OFDM automatically uses
the clear subcarriers and avoids the blocked ones.

**Fun fact**: OFDM uses a clever math trick (FFT) to pack
subcarriers so tightly they overlap without
interfering---it's called “orthogonality” (like
fingers interlaced).

<div class="center">

------------------------------------------------------------------------

</div>

**Orthogonal Frequency-Division Multiplexing (OFDM)** is a
multicarrier modulation technique that divides a wideband channel into
many narrow, orthogonal subcarriers. It has become the foundation of
modern wireless standards including WiFi (802.11a/g/n/ac/ax), LTE, 5G
NR, and DVB-T.

<div class="center">

------------------------------------------------------------------------

</div>

##  The Core Concept

**Single-carrier problem**: High-speed data
\$\rightarrow\$ short symbol duration
\$\rightarrow\$ susceptible to multipath fading and
intersymbol interference (ISI).

**OFDM solution**: Divide spectrum into N narrow subcarriers
\$\rightarrow\$ each carries low-rate data
\$\rightarrow\$ longer symbol duration
\$\rightarrow\$ robust against multipath.

    Single Carrier (100 Mbps):
    ||  Wide, fast, ISI-prone
          OFDM Transformation 
    Multi-carrier (100 Mbps total):
    |||||||||||||||||  N narrow, slow, ISI-resistant
     1 2 3 4 ... N subcarriers

<div class="center">

------------------------------------------------------------------------

</div>

##  Mathematical Foundation

### Orthogonality Condition

Subcarriers are **orthogonal** when their frequencies are spaced by
1/T:

    f = f + k·f

    where:
    - f = center frequency
    - k = subcarrier index (0, 1, 2, ..., N-1)
    - f = subcarrier spacing = 1/T_symbol
    - T_symbol = OFDM symbol duration

**Orthogonality integral**:

    ^{T} exp(j2·f·t) · exp(-j2·f·t) dt = { T  if k = m
                                             { 0  if k  m

This ensures subcarriers don't interfere despite
**spectral overlap**.

<div class="center">

------------------------------------------------------------------------

</div>

### IFFT/FFT Implementation

**Key insight**: OFDM modulation/demodulation is mathematically
equivalent to Inverse Fast Fourier Transform (IFFT) and FFT.

**Transmitter (IFFT)**:

    x[n] = (1/N) · ^(N-1) X · exp(j2kn/N)

    where:
    - X = complex data symbol on subcarrier k (from QAM/PSK constellation)
    - x[n] = time-domain OFDM sample
    - N = number of subcarriers (typically 64, 128, 256, 512, 1024, 2048)

**Receiver (FFT)**:

    Y = (1/N) · ^(N-1) y[n] · exp(-j2kn/N)

    where:
    - y[n] = received time-domain samples
    - Y = recovered symbol on subcarrier k

**Computational advantage**: FFT reduces complexity from
O(N\textsuperscript{2}) to O(N log N).

<div class="center">

------------------------------------------------------------------------

</div>

##  OFDM System Architecture

### Transmitter Block Diagram

    Data bits
       
    Serial-to-Parallel Converter (splits into N streams)
       
    QAM/PSK Mapper (maps each stream to constellation point)
       
    Pilot Insertion & Subcarrier Mapping
       
    IFFT (N-point)
       
    Add Cyclic Prefix (CP)
       
    Parallel-to-Serial Converter
       
    D/A Converter & RF Upconversion
       
    Antenna

### Receiver Block Diagram

    Antenna
       
    RF Downconversion & A/D Converter
       
    Serial-to-Parallel Converter
       
    Remove Cyclic Prefix
       
    FFT (N-point)
       
    Channel Estimation & Equalization (per-subcarrier)
       
    QAM/PSK Demapper
       
    Parallel-to-Serial Converter
       
    Data bits

<div class="center">

------------------------------------------------------------------------

</div>

##  Cyclic Prefix (CP)

The **cyclic prefix** is OFDM's defense against
multipath-induced ISI.

### What Is It?

Copy the **last L samples** of the OFDM symbol and prepend them:

    Original OFDM symbol (N samples):
    [s s s ... s_(N-2) s_(N-1)]

    With CP (N+L samples):
    [s_(N-L) ... s_(N-1) | s s s ... s_(N-2) s_(N-1)]
     +--- CP (L) ----+     +---- Original Symbol (N) ----+

### Why Does It Work?

**Problem**: Multipath creates delayed copies of the signal
\$\rightarrow\$ samples from adjacent symbols overlap
(ISI).

**Solution**: CP acts as a **guard interval**: - If delay
spread \< CP duration, ISI from previous symbol falls entirely
within the CP - Receiver discards CP \$\rightarrow\$ only
clean samples remain - CP makes **linear convolution appear as
circular convolution** \$\rightarrow\$ simple
per-subcarrier equalization

### CP Overhead

    Overhead = L / (N + L)

    Example (WiFi 802.11a):
    - N = 64 subcarriers
    - L = 16 samples (CP)
    - Overhead = 16/80 = 20% (loss in spectral efficiency)

    Tradeoff:
    - Longer CP  more robust to delay spread
    - Longer CP  higher overhead (lower data rate)

<div class="center">

------------------------------------------------------------------------

</div>

##  OFDM Parameters

### Key Design Choices

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
<p>Typical Values</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Impact</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">FFT Size</td>
<td style="text-align: left;">N</td>
<td style="text-align: left;">-2048</td>
<td style="text-align: left;">Granularity, latency</td>
</tr>
<tr>
<td style="text-align: left;">Subcarrier Spacing</td>
<td style="text-align: left;"><span class="math inline"><em>Δ</em><em>f</em></span></td>
<td style="text-align: left;">kHz (LTE), 312.5 kHz (WiFi)</td>
<td style="text-align: left;">Doppler tolerance</td>
</tr>
<tr>
<td style="text-align: left;">Symbol Duration</td>
<td style="text-align: left;"><span class="math inline"><em>T</em><sub>symbol</sub></span></td>
<td style="text-align: left;"><span class="math inline">1/<em>Δ</em><em>f</em></span></td>
<td style="text-align: left;">ISI
resistance</td>
</tr>
<tr>
<td style="text-align: left;">CP Length</td>
<td style="text-align: left;">L</td>
<td style="text-align: left;">N/4, N/8, N/16</td>
<td style="text-align: left;">Delay spread tolerance</td>
</tr>
<tr>
<td style="text-align: left;">Bandwidth</td>
<td style="text-align: left;">BW</td>
<td style="text-align: left;"><span class="math inline"><em>N</em> ⋅ <em>Δ</em><em>f</em></span></td>
<td style="text-align: left;">Throughput</td>
</tr>
</tbody>
</table>

### Example: LTE

    Configuration:
    - FFT Size: 1024 (20 MHz BW) or 512 (10 MHz)
    - Subcarrier Spacing: 15 kHz
    - Symbol Duration: 66.67 s
    - CP (normal): 4.69 s (first symbol), 5.21 s (others)
    - 12 subcarriers per Resource Block (180 kHz)
    - 7 OFDM symbols per slot (0.5 ms)

<div class="center">

------------------------------------------------------------------------

</div>

##  Pilot Subcarriers & Channel Estimation

Not all subcarriers carry data---some are **pilots** for
channel estimation.

### Pilot Types

**1. Scattered Pilots** (time + frequency diversity):

    Subcarrier
        
        | D D D P D D D P D D D P     Symbol 4
        | D D P D D D P D D D P D     Symbol 3
        | D P D D D P D D D P D D     Symbol 2
        | P D D D P D D D P D D D     Symbol 1
        +--------------------------> Time
         (P = Pilot, D = Data)

**2. Continual Pilots** (phase/frequency tracking):

    Fixed subcarriers (e.g., k = -21, -7, 7, 21 in WiFi) always carry pilots.

**3. Preamble/Training Symbols**:

    First OFDM symbol(s) in a frame are all pilots for initial synchronization.

### Channel Estimation

**Per-subcarrier channel model**:

    Y = H · X + N

    where:
    - H = complex channel gain on subcarrier k
    - X = transmitted symbol
    - Y = received symbol
    - N = noise

**Estimation process**: 1. Transmitter sends known pilots
P\textsubscript{k} 2. Receiver measures
Y\textsubscript{k} =
H\textsubscript{k}\$\cdot\$P\textsubscript{k}
+ N\textsubscript{k} 3. Estimate:
\\{H}\textsubscript{k} =
Y\textsubscript{k} / P\textsubscript{k}
4. Interpolate \\{H}\textsubscript{k}
across data subcarriers (2D interpolation) 5. Equalize data:
X\textsubscript{k} = Y\textsubscript{k}
/ \\{H}\textsubscript{k}

<div class="center">

------------------------------------------------------------------------

</div>

##  Multipath & Frequency-Selective Fading

### Why OFDM Excels in Multipath

**Single-carrier**: Entire bandwidth experiences
**frequency-selective fading** \$\rightarrow\$ deep
nulls can wipe out signal.

**OFDM**: Channel appears **flat** within each narrow
subcarrier \$\rightarrow\$ only some subcarriers fade
deeply, others remain strong.

    Frequency Response (Multipath Channel):
    Magnitude
        
        |  ___       ___
        | |   |     |   |___       Single-carrier spans entire BW
        | |   |_____|       |        (suffers deep null)
        |_|___|_____________|___ Frequency
                       
           |   |   |   |   |
         OFDM subcarriers (most unaffected, a few degraded)

**Per-subcarrier equalization**:

    X = Y / H  (simple division per subcarrier)

Much simpler than **time-domain equalization** (which requires
complex filters).

<div class="center">

------------------------------------------------------------------------

</div>

##  Peak-to-Average Power Ratio (PAPR)

### The OFDM Challenge

**Problem**: When N subcarriers add constructively, instantaneous
power spikes far above average.

    PAPR = Peak Power / Average Power

    Theoretical worst case: PAPR = N (e.g., 20 dB for N=100)
    Typical OFDM: PAPR  10-13 dB (3-5 dB worse than single-carrier)

### Why It Matters

- **Power Amplifier (PA) must operate in linear region**
  \$\rightarrow\$ inefficient (backed-off from saturation)

- High PAPR \$\rightarrow\$ PA must handle peaks
  \$\rightarrow\$ more expensive, power-hungry RF hardware

- Non-linear PA \$\rightarrow\$ intermodulation
  distortion, spectral regrowth

### PAPR Reduction Techniques

**1. Clipping & Filtering**:

    Clip peaks at threshold  filter out-of-band distortion  slight BER degradation

**2. Tone Reservation**:

    Reserve some subcarriers to generate "anti-peaks" that cancel large peaks.

**3. Selective Mapping (SLM)**:

    Generate multiple OFDM symbols with different phase rotations  choose one with lowest PAPR.

**4. Partial Transmit Sequence (PTS)**:

    Divide subcarriers into blocks  optimize phase per block to minimize PAPR.

**Tradeoff**: PAPR reduction adds complexity, may reduce spectral
efficiency or increase BER.

<div class="center">

------------------------------------------------------------------------

</div>

##  Synchronization Challenges

OFDM is **sensitive** to timing and frequency offsets.

### Timing Offset

**Consequence**: If FFT window is misaligned: - Within CP: No ISI,
but phase rotation per subcarrier - Beyond CP: ISI from adjacent symbols

**Solution**: Preamble correlation, CP-based timing metrics.

### Carrier Frequency Offset (CFO)

**Consequence**: Subcarriers lose orthogonality
\$\rightarrow\$ Inter-Carrier Interference (ICI).

    CFO = f / f_subcarrier

    Example:
    - 1 kHz offset on 15 kHz subcarrier spacing  CFO = 0.067
    - Causes ~0.2 dB SNR loss

**Solution**: 1. **Coarse CFO estimation**: Preamble
autocorrelation (range:
\$\pm\$\$\Delta\$f_subcarrier/2) 2.
**Fine CFO tracking**: Continual pilots

### Sampling Clock Offset (SCO)

**Consequence**: Slow drift in FFT window position
\$\rightarrow\$ phase rotation accumulates over time.

**Solution**: Track phase of continual pilots
\$\rightarrow\$ adjust sampling clock or compensate
digitally.

<div class="center">

------------------------------------------------------------------------

</div>

##  OFDM in Real-World Standards

### WiFi 802.11a/g/n/ac/ax

**802.11a/g (54 Mbps)**:

    - FFT Size: 64
    - Used Subcarriers: 52 (48 data + 4 pilots)
    - Subcarrier Spacing: 312.5 kHz
    - Bandwidth: 20 MHz
    - Modulation: BPSK, QPSK, 16-QAM, 64-QAM

**802.11n (600 Mbps)**:

    - Up to 4×4 MIMO-OFDM
    - 40 MHz channels (108 data subcarriers)
    - Short Guard Interval: 400 ns (vs. 800 ns)

**802.11ax (WiFi 6, 9.6 Gbps)**:

    - OFDMA (multi-user OFDM): allocate subcarriers to different users
    - 1024-QAM, 160 MHz channels
    - MU-MIMO (8×8)

<div class="center">

------------------------------------------------------------------------

</div>

### LTE & 5G NR

**LTE Downlink**:

    - SC-FDMA uplink (low PAPR variant)
    - 15 kHz subcarrier spacing
    - 1.4, 3, 5, 10, 15, 20 MHz bandwidths
    - CP-OFDM with MIMO (up to 8×8)

**5G NR**:

    - Scalable numerology: f = 15, 30, 60, 120, 240 kHz
      (higher spacing for mmWave  shorter symbols  Doppler tolerance)
    - Massive MIMO (64+ antennas)
    - Flexible frame structure (dynamic TDD)

<div class="center">

------------------------------------------------------------------------

</div>

### DVB-T/T2 (Digital Video Broadcasting - Terrestrial)

**DVB-T**:

    - FFT: 2048 or 8192
    - Guard intervals: 1/4, 1/8, 1/16, 1/32
    - Optimized for high-mobility (trains, cars)
    - COFDM (Coded OFDM with interleaving)

**DVB-T2** (next-gen):

    - Up to 256-QAM
    - LDPC + BCH FEC
    - Rotated constellations (diversity against deep fades)

<div class="center">

------------------------------------------------------------------------

</div>

##  Spectral Efficiency Analysis

### Calculation

    Spectral Efficiency (SE) = R / BW  bits/s/Hz

    where:
    R = N_data · log(M) · (1 - CP_overhead) / T_symbol

    Example (LTE 20 MHz):
    - N_data = 1200 subcarriers (100 RBs × 12)
    - M = 64 (64-QAM  6 bits/symbol)
    - CP overhead = 7%
    - T_symbol = 66.67 s

    SE = 1200 · 6 · 0.93 / (66.67×10 · 20×10)
       = 6696 / 1.33 = 5.0 bits/s/Hz

    (Theoretical peak with MIMO: 30 bits/s/Hz for 4×4 spatial streams)

<div class="center">

------------------------------------------------------------------------

</div>

##  OFDM vs. Single-Carrier

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Aspect</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>OFDM</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Single-Carrier</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>ISI Robustness</strong></td>
<td style="text-align: left;">Excellent (CP + long symbols)</td>
<td style="text-align: left;">Requires
complex equalizer</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Frequency-Selective Fading</strong></td>
<td style="text-align: left;">Simple per-subcarrier EQ</td>
<td style="text-align: left;">Time-domain EQ (adaptive filter)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>PAPR</strong></td>
<td style="text-align: left;">High (~10-13 dB)</td>
<td style="text-align: left;">Low (~3-5
dB)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Spectral Efficiency</strong></td>
<td style="text-align: left;">Moderate (CP overhead)</td>
<td style="text-align: left;">Higher (no
CP)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Implementation</strong></td>
<td style="text-align: left;">FFT/IFFT (efficient)</td>
<td style="text-align: left;">FIR filters
(complex)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Doppler Sensitivity</strong></td>
<td style="text-align: left;">Moderate (ICI from CFO)</td>
<td style="text-align: left;">Lower</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Best For</strong></td>
<td style="text-align: left;">Wideband, fixed/low-mobility</td>
<td style="text-align: left;">Narrowband,
high-mobility</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

##  Advanced OFDM Variants

### OFDMA (Orthogonal Frequency-Division Multiple Access)

**Concept**: Assign different subcarriers to different users.

    User 1: Subcarriers 0-15
    User 2: Subcarriers 16-31
    User 3: Subcarriers 32-47
    ...

    Advantages:
    - Multi-user diversity
    - Flexible resource allocation
    - Uplink/downlink efficiency

**Used in**: LTE, 5G NR, WiFi 6 (802.11ax).

<div class="center">

------------------------------------------------------------------------

</div>

### SC-FDMA (Single-Carrier FDMA)

**Motivation**: Lower PAPR for mobile devices (saves battery).

**Method**: DFT-spread OFDM:

    Data  DFT  Subcarrier Mapping  IFFT  CP

**Effect**: Maintains OFDM benefits but with **3-5 dB lower
PAPR**.

**Used in**: LTE uplink, 5G NR uplink option.

<div class="center">

------------------------------------------------------------------------

</div>

### Filter-Bank Multicarrier (FBMC)

**Improvement**: Replace rectangular pulse (sinc spectrum) with
well-designed filters \$\rightarrow\$ reduced out-of-band
emissions.

**Advantage**: No CP needed \$\rightarrow\$ higher
spectral efficiency.

**Disadvantage**: More complex, incompatible with MIMO (without
workarounds).

**Status**: Considered for 5G but not adopted (OFDM with windowing
chosen instead).

<div class="center">

------------------------------------------------------------------------

</div>

##  Python Implementation Example

### Basic OFDM Transmitter

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

### Basic OFDM Receiver

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

##  Performance Analysis

### BER in AWGN Channel

For OFDM with M-QAM modulation on each subcarrier:

    BER  (4/log(M)) · (1 - 1/M) · Q((3·log(M)·SNR / (M-1)))

    where Q(x) = Gaussian Q-function

    Example (16-QAM OFDM at SNR = 20 dB):
    BER  10 (without coding)
    BER  10 (with rate-1/2 LDPC)

### Frequency-Selective Channel

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

##  When to Use OFDM

### OFDM is Ideal For:

**Wideband channels** (\> 1 MHz) with
frequency-selective fading  
**Multipath-rich environments** (urban, indoor)  
**Fixed or low-mobility users** (\< 120 km/h)  
**Multiple users** needing flexible resource allocation (OFDMA)  
**High spectral efficiency** requirements

### Avoid OFDM For:

**Power-constrained devices** (high PAPR
\$\rightarrow\$ inefficient PA)  
**High-mobility** (Doppler \$\rightarrow\$ severe
ICI)  
**Narrowband channels** (CP overhead too high)  
**Non-linear channels** (PAPR sensitive to distortion)

<div class="center">

------------------------------------------------------------------------

</div>

##  Further Reading

### Textbooks

- **Prasad**, *OFDM for Wireless Communications Systems* -
  Comprehensive treatment

- **Cho et al.**, *MIMO-OFDM Wireless Communications with
  MATLAB* - Practical implementation

- **Goldsmith**, *Wireless Communications* (Chapter 13) -
  Theoretical foundation

### Standards Documents

- **IEEE 802.11-2020**: WiFi OFDM/OFDMA specifications

- **3GPP TS 36.211**: LTE Physical Layer (OFDM parameters)

- **3GPP TS 38.211**: 5G NR Physical Layer (scalable OFDM)

### Related Topics

- \[\[MIMO-&-Spatial-Multiplexing\]\] - Combining OFDM with
  multiple antennas

- \[\[Channel-Equalization\]\] - Frequency-domain equalization in
  OFDM

- \[\[Adaptive-Modulation-&-Coding-(AMC)\]\] - Per-subcarrier link
  adaptation

- \[\[Synchronization-(Carrier,-Timing,-Frame)\]\] - OFDM sync
  techniques

- \[\[Real-World-System-Examples\]\] - LTE, 5G, WiFi implementations

<div class="center">

------------------------------------------------------------------------

</div>

**Summary**: OFDM transforms wideband frequency-selective channels
into many narrowband flat-fading channels, enabling simple equalization
and high spectral efficiency. The FFT/IFFT makes it computationally
efficient, while the cyclic prefix provides ISI immunity. Despite high
PAPR and synchronization sensitivity, OFDM dominates modern wireless due
to its robustness in multipath environments and natural fit for MIMO and
multi-user scenarios.
