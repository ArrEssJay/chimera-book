---
layout: chapter
title: "MIMO-&-Spatial-Multiplexing"
chapter: 37
permalink: /chapters/mimo-&-spatial-multiplexing/
---

# MIMO & Spatial Multiplexing

##  For Non-Technical Readers

**MIMO is like having multiple conversations in the same
room---each person talks to their own partner, and everyone gets
through faster!**

**What is MIMO?** **M**ultiple **I**nput,
**M**ultiple **O**utput = Multiple antennas on both
transmitter and receiver

**The magic trick**: 1. Your WiFi router has 3 antennas 2. Your
laptop has 3 antennas 3. All 3 can send/receive **simultaneously**
on the same frequency! 4. Result: **3\$\times\$
faster** than single antenna

**Real-world example - WiFi**: - **1\$\times\$1
(no MIMO)**: 1 antenna, 150 Mbps - **2\$\times\$2
MIMO**: 2 antennas, 300 Mbps - **4\$\times\$4 MIMO**:
4 antennas, 600 Mbps - **8\$\times\$8 MIMO** (WiFi
6): 8 antennas, 1200+ Mbps!

**How does it work?** - Signals bounce off walls/furniture
differently for each antenna - Receiver uses math to “unmix” the
overlapping signals - It's like picking out one
conversation in a crowded party---your brain does it with sound,
MIMO does it with radio waves

**When you see it**: - **“AC1900” WiFi**: Usually means
3\$\times\$3 MIMO - **5G phone**: Has 4+ antennas for
MIMO - **Your router's multiple antennas**:
That's MIMO hardware!

**Fun fact**: Massive MIMO (64+ antennas!) is why 5G base stations
look like big panels instead of simple poles.

<div class="center">

------------------------------------------------------------------------

</div>

**Multiple-Input Multiple-Output (MIMO)** uses multiple antennas at
both transmitter and receiver to dramatically increase data rates and
reliability. MIMO is the technological breakthrough that powers modern
wireless: WiFi 4/5/6/7, LTE, 5G, and beyond.

**Key insight**: The wireless channel is not a
scalar---it's a **matrix**. Multiple spatial
paths can carry independent data streams simultaneously.

<div class="center">

------------------------------------------------------------------------

</div>

##  The MIMO Revolution

### Before MIMO (SISO - Single-Input Single-Output)

    TX Antenna )))  ···  (((  RX Antenna
                   
              Single path
              
    Capacity: C = B · log(1 + SNR)  bits/s

<div class="center">

------------------------------------------------------------------------

</div>

### With MIMO (nT \$\times\$ nR Configuration)

    TX Ant 1 )))    (((  RX Ant 1
    TX Ant 2 )))    (((  RX Ant 2
    TX Ant 3 )))    (((  RX Ant 3
                  
            Multiple spatial paths
            (each can carry data!)

    Capacity: C  min(nT, nR) · B · log(1 + SNR)  bits/s

**Multiplier**: Capacity grows **linearly** with min(nT, nR)
antennas!

**Example**:

    4×4 MIMO vs. SISO (same power, bandwidth, SNR):
    - SISO: 20 Mbps
    - 4×4 MIMO: 80 Mbps (4× improvement!)

<div class="center">

------------------------------------------------------------------------

</div>

##  MIMO Channel Model

### Matrix Representation

    y = H·x + n

    where:
    - x = [x, x, ..., x_nT]^{T} : transmitted vector (nT × 1)
    - y = [y, y, ..., y_nR]^{T} : received vector (nR × 1)
    - H = channel matrix (nR × nT)
    - n = noise vector (nR × 1)

    Channel matrix H:
         From TX antennas 
         +                    +
      To | h  h  ...  h|
      RX | h  h  ...  h|
    Ants |                |
         | h_{r} h_{r} ...  h_{r}|
         +                    +

    h_{i} = complex channel gain from TX antenna j to RX antenna i

<div class="center">

------------------------------------------------------------------------

</div>

### Channel Characteristics

**Rich scattering** (urban, indoor):

    H = well-conditioned matrix (many independent paths)
     Full spatial multiplexing possible
     Capacity  min(nT, nR) streams

**Line-of-sight** (rural, outdoor):

    H  rank-1 matrix (single dominant path)
     Limited multiplexing gain
     Capacity  1 stream (but diversity gain remains)

**Condition number**:

     = _max / _min  (ratio of largest to smallest singular value)

      1: Ideal MIMO (all paths equally strong)
     >> 1: Poor MIMO (paths correlated)

<div class="center">

------------------------------------------------------------------------

</div>

##  MIMO Gains (The “Three M's”)

MIMO provides three distinct types of gains:

### 1. Array Gain

**Concept**: Coherently combine signals from multiple antennas
\$\rightarrow\$ increase SNR.

    SNR_MIMO = SNR_SISO + 10·log(nR)  dB

    Example (4 RX antennas):
    Array gain = 10·log(4) = 6 dB

    Physical interpretation:
    - 4 antennas collect 4× more power
    - SNR improves by 4× (6 dB)
    - Like having a more sensitive receiver

**Note**: Requires **coherent combining** (Maximum Ratio
Combining - MRC).

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Diversity Gain

**Concept**: Combat fading by having multiple independent paths.

**Problem**: Fading causes signal to drop unpredictably.

    Single antenna: P(deep fade) = p

    Multiple antennas:
    P(all fade simultaneously) = p^nD  (where nD = diversity order)

    Example (4 antennas, p = 0.1):
    - SISO: 10% chance of fade
    - 4-branch diversity: (0.1)^4 = 0.01% chance all fade

**Diversity order**:

    nD  nT × nR  (maximum)

    Achieved through:
    - Space diversity (multiple antennas)
    - Time diversity (interleaving, retransmissions)
    - Frequency diversity (OFDM, spread spectrum)

**Benefit**: Reduces outage probability, increases reliability.

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Multiplexing Gain (Spatial Multiplexing)

**Concept**: Transmit **independent data streams** on each
antenna simultaneously.

    Multiplexing gain: min(nT, nR) parallel streams

    Data rate multiplier = min(nT, nR)

    Example (4×4 MIMO):
    - Stream 1 on TX Ant 1: "Hello"
    - Stream 2 on TX Ant 2: "World"
    - Stream 3 on TX Ant 3: "From"
    - Stream 4 on TX Ant 4: "MIMO"

    All transmitted at same time, same frequency!

    Receiver separates streams using channel matrix H.

**This is the headline MIMO gain** that enables gigabit wireless.

<div class="center">

------------------------------------------------------------------------

</div>

##  MIMO Techniques

### Spatial Multiplexing (SM)

**Goal**: Maximize data rate.

**Transmitter**: Split data into nT streams, transmit
simultaneously.

**Receiver**: Separate streams by exploiting spatial signatures.

    Detection methods:

    1. Zero-Forcing (ZF):
       x = (H^H·H)^(-1)·H^H·y
       
       Nulls interference but amplifies noise.

    2. MMSE (Minimum Mean Square Error):
       x = (H^H·H + ²I)^(-1)·H^H·y
       
       Balances interference and noise.

    3. Maximum Likelihood (ML):
       x = argmin_x ||y - H·x||²
       
       Optimal but exponentially complex (test all possibilities).

    4. Successive Interference Cancellation (SIC):
       Decode strongest stream first, subtract, repeat.
       
       Used in V-BLAST architecture.

<div class="center">

------------------------------------------------------------------------

</div>

### Transmit Beamforming (TxBF)

**Goal**: Focus energy toward specific receiver(s).

**Method**: Apply precoding weights to create constructive
interference at receiver.

    Transmit signal: x = W·s

    where:
    - s = data streams
    - W = precoding matrix (nT × nS, where nS  nT)

    Beamforming vector (single stream):
    w = v  (principal right singular vector of H)

    Result: Maximum SNR at receiver (array gain + beamforming gain).

**Types**:

**1. Eigenbeamforming** (SVD-based):

    H = U··V^H  (Singular Value Decomposition)

    Precoder: W = V (right singular vectors)
    Combiner: U^H (left singular vectors)

    Result: Decomposes MIMO channel into parallel SISO channels:
    y_eff = ·s + n'

    Each stream sees gain _{i} (singular value).

**2. Zero-Forcing Beamforming** (MU-MIMO):

    Multiple users, each with 1 antenna.
    Design W so that:
    H·W = [0 ... 1 ... 0]  (only user k receives signal)

    W = H^H·(H·H^H)^(-1)

    Eliminates inter-user interference (at cost of noise amplification).

<div class="center">

------------------------------------------------------------------------

</div>

### Diversity Combining

**Goal**: Maximize reliability (minimize BER).

**Transmit Diversity** (Alamouti Code):

    2×1 MIMO: 2 TX antennas, 1 RX antenna

    Time:    t        t
    TX1:    +s       -s*
    TX2:    +s       +s*

    Receiver combines:
    r = h·s + h·s + n
    r = -h·s* + h·s* + n

    Solve for s, s:
     = h*·r + h·r*    SNR = (|h|² + |h|²)·Es/N
     = h*·r - h·r*    SNR = (|h|² + |h|²)·Es/N

    Diversity order: 2 (full transmit diversity)
    No channel knowledge at TX required!

**Properties**: - Orthogonal space-time block code (OSTBC) - Rate =
1 (1 symbol per time slot) - Generalizes to higher dimensions but with
rate loss

**Receive Diversity** (MRC - Maximum Ratio Combining):

    nR receive antennas, combine optimally:

    y = _{i} h_{i}*·r_{i}

    SNR = _{i} |h_{i}|²·Es/N  (sum of branch SNRs)

    Diversity order: nR

<div class="center">

------------------------------------------------------------------------

</div>

### Hybrid Schemes

**Goal**: Balance multiplexing and diversity.

**Example**: 4\$\times\$4 MIMO

    Option 1: 4 spatial streams (max rate, min diversity)
    Option 2: 2 spatial streams, each with 2-branch diversity
    Option 3: 1 spatial stream, full 16-branch diversity

    IEEE 802.11n: Adaptive based on channel quality.

<div class="center">

------------------------------------------------------------------------

</div>

##  Massive MIMO

**Definition**: Large number of antennas (64-256+) at base station,
serving many users.

### Key Principles

**1. Channel Hardening**:

    As nT  :
    (1/nT)·H^H·H  I  (identity matrix)

    Fading averages out  channel becomes deterministic!

**2. Favorable Propagation**:

    User channels become orthogonal:
    H^H·H  diagonal

    Simple linear processing (MRC/MRT) becomes near-optimal.

**3. Array Gain Scales**:

    SNR  nT

    Example (128 TX antennas):
    Array gain = 10·log(128) = 21 dB
    Can reduce TX power per antenna by 128× while maintaining coverage!

<div class="center">

------------------------------------------------------------------------

</div>

### Massive MIMO in 5G NR

    Base station:
    - 64-256 antenna elements
    - Typically 32-64 ports (virtualized)
    - Beamforming in both azimuth and elevation

    UE (user):
    - 2-4 antennas
    - Operates in TDD mode (channel reciprocity)

    Benefits:
    - 10× spectral efficiency (vs. LTE)
    - 100× energy efficiency (W/bit)
    - Serve 10-20 users per cell simultaneously (MU-MIMO)

    Example (3.5 GHz, 100 MHz BW, 64 antennas):
    - Peak throughput: 5 Gbps (single user)
    - Aggregate: 20 Gbps (multi-user)

**Challenges**: - **Pilot contamination**: Adjacent cells use
same pilot sequences \$\rightarrow\$ interference -
**Hardware complexity**: 64+ RF chains, calibration - **CSI
acquisition**: Overhead for channel estimation

<div class="center">

------------------------------------------------------------------------

</div>

##  MIMO Capacity

### Ergodic Capacity (Shannon Limit)

**Water-filling**:

    C = _{i} B·log(1 + _{i}·P/²)

    where:
    - _{i} = eigenvalues of H^H·H
    - P = total transmit power
    - Allocate power proportional to channel strength (water-filling)

    With equal power allocation:
    C  min(nT, nR)·B·log(1 + (nR/nT)·SNR)

**IID Rayleigh Channel** (rich scattering):

    E[C] = min(nT, nR)·B·log(e·SNR)  (high SNR)

    Example (4×4 MIMO, 20 MHz, SNR = 20 dB):
    C  4 × 20 MHz × log(100) = 533 Mbps

    Compare SISO (1×1):
    C  20 MHz × log(100) = 133 Mbps

    MIMO gain: 4× capacity!

<div class="center">

------------------------------------------------------------------------

</div>

### Outage Capacity (Fading Channels)

    C_outage() = max{R : P(C < R)  }

    where  = outage probability (e.g., 1%)

    Diversity reduces outage:
    - SISO 1% outage: Need SNR = 20 dB for C = 1 bps/Hz
    - 4×4 MIMO 1% outage: Need SNR = 10 dB for C = 4 bps/Hz

    Net result: 10 dB SNR reduction + 4× rate increase!

<div class="center">

------------------------------------------------------------------------

</div>

##  MIMO in Standards

### WiFi Evolution

**802.11n (WiFi 4, 2009)**:

    MIMO: 1×1, 2×2, 3×3, 4×4
    Bandwidth: 20, 40 MHz
    Modulation: Up to 64-QAM
    Spatial streams: Max 4
    Peak rate: 600 Mbps (4×4, 40 MHz, 64-QAM)

    Techniques:
    - Spatial multiplexing (SM)
    - Space-time block coding (STBC) - Alamouti
    - Transmit beamforming (TxBF)

**802.11ac (WiFi 5, 2013)**:

    MIMO: Up to 8×8
    Bandwidth: 20, 40, 80, 160 MHz
    Modulation: 256-QAM
    MU-MIMO: Downlink (up to 4 users)
    Peak rate: 6.9 Gbps (8×8, 160 MHz, 256-QAM)

**802.11ax (WiFi 6, 2019)**:

    MIMO: Up to 8×8
    MU-MIMO: Downlink + Uplink (up to 8 users)
    OFDMA: Multi-user on subcarrier groups
    Spatial reuse: Coordinated interference management
    Peak rate: 9.6 Gbps

    Key innovation: Simultaneous UL/DL multi-user

**802.11be (WiFi 7, 2024)**:

    MIMO: Up to 16×16
    Bandwidth: Up to 320 MHz
    Modulation: 4096-QAM
    Multi-link operation (MLO): Simultaneous bands
    Peak rate: 46 Gbps

<div class="center">

------------------------------------------------------------------------

</div>

### LTE & 5G NR

**LTE (4G)**:

    Release 8 (2009):
    - 2×2, 4×4 MIMO (downlink)
    - Peak: 150 Mbps (2×2), 300 Mbps (4×4)

    Release 10 (LTE-Advanced, 2011):
    - 8×8 MIMO
    - Carrier aggregation (up to 100 MHz)
    - MU-MIMO (4 users)
    - Peak: 1 Gbps

    Release 13 (LTE-Pro, 2016):
    - Massive MIMO (up to 128 TX antennas)
    - 3D beamforming (elevation + azimuth)
    - Peak: 3 Gbps

**5G NR (5G)**:

    FR1 (Sub-6 GHz):
    - Massive MIMO: 64-256 antennas (BS), 2-4 (UE)
    - MU-MIMO: 12+ users simultaneously
    - Beamforming: Hybrid analog/digital
    - Peak: 5 Gbps

    FR2 (mmWave, 24-52 GHz):
    - Ultra-massive MIMO: 256+ antenna elements
    - Beamforming essential (overcome path loss)
    - Beam management: Sweeping, tracking
    - Peak: 20 Gbps

    Techniques:
    - mMIMO with ZF/MMSE precoding
    - CSI-RS (Channel State Information Reference Signal)
    - SRS (Sounding Reference Signal) for uplink CSI
    - Codebook-based and CSI feedback

<div class="center">

------------------------------------------------------------------------

</div>

##  Advanced MIMO Concepts

### Multi-User MIMO (MU-MIMO)

**Concept**: Base station with nT antennas serves K users (K
\$\leq\$ nT) simultaneously.

    Downlink:
    BS: nT antennas  K users (each with 1 antenna)

    Channel:
        + h^{T} +
    H = | h^{T} |  (K × nT)
        |    |
        + h^{T} +

    Precoding:
    x = W·s  (nT × 1)

    where W designed to null inter-user interference.

    Capacity (sum rate):
    C_sum =  B·log(1 + SINR)

**Advantage over SU-MIMO**: - Single-antenna devices can benefit
from MIMO - No spatial multiplexing at UE required - Aggregate
throughput scales with number of users

<div class="center">

------------------------------------------------------------------------

</div>

### Coordinated Multi-Point (CoMP)

**Concept**: Multiple base stations coordinate to serve users.

    Types:

    1. Joint Transmission (JT):
       Multiple BSs transmit same data (coherent combining at UE)
        Diversity gain, extended coverage

    2. Coordinated Scheduling/Beamforming (CS/CB):
       BSs coordinate to minimize interference
        Improved SINR at cell edges

    3. Dynamic Point Selection (DPS):
       UE dynamically switches serving BS
        Load balancing

**5G implementation**: Network slicing + CoMP for ultra-reliable
low-latency (URLLC).

<div class="center">

------------------------------------------------------------------------

</div>

### Full-Duplex MIMO

**Concept**: Transmit and receive simultaneously on same frequency.

**Challenge**: Self-interference (TX power
\>\> RX power, 100+ dB difference).

**Solutions**: 1. **Analog cancellation**: Circulators,
cross-polarization 2. **Digital cancellation**: Subtract TX signal
digitally 3. **MIMO spatial cancellation**: Null TX in RX
directions

**Benefit**: 2\$\times\$ spectral efficiency (in
theory).

**Status**: Active research, not yet in standards (SI cancellation
still insufficient).

<div class="center">

------------------------------------------------------------------------

</div>

##  Performance Analysis

### BER with MIMO

**Alamouti 2\$\times\$1 (BPSK)**:

    BER = Q((2·(|h|² + |h|²)·Eb/N))

    Average over Rayleigh fading:
    BER  [1/(4·Eb/N)]²  (high SNR, diversity order = 2)

    Compare SISO:
    BER  1/(4·Eb/N)    (diversity order = 1)

    At BER = 10³:
    - SISO: Requires Eb/N  24 dB
    - Alamouti: Requires Eb/N  12 dB
     12 dB diversity gain!

<div class="center">

------------------------------------------------------------------------

</div>

### Spatial Multiplexing (ZF Receiver)

    BER depends on post-detection SNR of each stream:

    SNR_{i} = _{i}²·P / (²·||[(H^H·H)^(-1)]_{i}_{i}||²)

    where _{i} = i-th singular value of H

    For i.i.d. Rayleigh channel (4×4):
    E[BER]  10³ at SNR  20 dB (64-QAM, rate-1/2 FEC)

    Outage: If channel is poorly conditioned, one stream fails.

<div class="center">

------------------------------------------------------------------------

</div>

##  Python Implementation Example

### MIMO Spatial Multiplexing Simulation

<div class="Shaded">

<div class="Highlighting">

</div>

</div>

<div class="center">

------------------------------------------------------------------------

</div>

##  When to Use MIMO

### MIMO Excels:

**Rich scattering** (urban, indoor environments)  
**High data rate** requirements (gigabit wireless)  
**Multi-user scenarios** (many devices per AP/BS)  
**Coverage extension** (diversity, beamforming)  
**Spectral efficiency** (limited spectrum available)

### MIMO Struggles:

**Line-of-sight channels** (rank-deficient H matrix)  
**High mobility** (channel changes faster than CSI update)  
**Low SNR** (spatial multiplexing requires moderate SNR)  
**Small form factors** (antenna spacing \<
\$\lambda\$/2 \$\rightarrow\$ correlation)

<div class="center">

------------------------------------------------------------------------

</div>

##  Further Reading

### Textbooks

- **Tse & Viswanath**, *Fundamentals of Wireless
  Communication* - Rigorous treatment of MIMO capacity

- **Paulraj, Nabar, Gore**, *Introduction to Space-Time
  Wireless Communications* - Comprehensive MIMO theory

- **Cho et al.**, *MIMO-OFDM Wireless Communications with
  MATLAB* - Practical implementation

### Key Papers

- **Foschini & Gans** (1998): “On Limits of Wireless
  Communications\ldots{}” - Spatial multiplexing
  foundation

- **Telatar** (1999): “Capacity of Multi-antenna Gaussian
  Channels” - MIMO capacity theory

- **Alamouti** (1998): “A Simple Transmit Diversity Technique” -
  Space-time block codes

### Standards

- **IEEE 802.11n/ac/ax**: WiFi MIMO specifications

- **3GPP TS 36.211/38.211**: LTE/5G physical layer (MIMO details)

- **3GPP TR 38.802**: 5G massive MIMO study

### Related Topics

- \[\[OFDM-&-Multicarrier-Modulation\]\] - MIMO-OFDM combination

- \[\[Beamforming (coming soon)\]\] - Advanced spatial processing

- \[\[Channel-Equalization\]\] - MIMO detection algorithms

- \[\[Real-World-System-Examples\]\] - LTE, 5G, WiFi implementations

- \[\[Adaptive-Modulation-&-Coding-(AMC)\]\] - Per-stream
  adaptation

<div class="center">

------------------------------------------------------------------------

</div>

**Summary**: MIMO transforms wireless communications by exploiting
spatial dimension. Multiple antennas create a matrix channel with
multiple eigenmodes---each eigenmode can carry an independent data
stream. Spatial multiplexing delivers linear capacity scaling with
min(nT, nR), while diversity combining improves reliability. Beamforming
focuses energy and mitigates interference. Modern wireless (WiFi 6/7, 5G
NR) relies on MIMO for multi-gigabit rates and serves many users
simultaneously (MU-MIMO). Massive MIMO (64-256 antennas) in 5G base
stations achieves extraordinary spectral and energy efficiency through
favorable propagation and channel hardening. MIMO is not just an
improvement---it's a paradigm shift.
