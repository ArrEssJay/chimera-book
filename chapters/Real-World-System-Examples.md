---
layout: chapter
title: "Real-World-System-Examples"
chapter: 54
permalink: /chapters/real-world-system-examples/
---

# Real-World System Examples

\[\[Home\]\] **System Implementation**
\[\[Channel-Equalization\]\]
\[\[Signal-Chain-(End-to-End-Processing)\]\]

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

This page provides **end-to-end analysis** of real communication
systems, showing how all concepts integrate.

**Systems covered**: 1. **WiFi 802.11n/ac** (Wireless LAN) 2.
**LTE** (4G Cellular) 3. **DVB-S2X** (Satellite TV) 4.
**GPS L1 C/A** (Navigation) 5. **Bluetooth 5.0** (Personal
Area Network) 6. **LoRaWAN** (IoT Long Range)

Each example includes: modulation, coding, link budget, sync,
equalization, and performance.

<div class="center">

------------------------------------------------------------------------

</div>

## 1. WiFi 802.11n (300 Mbps)

### System Parameters

**Standard**: IEEE 802.11n (2009)

**Frequency**: 2.4 GHz or 5 GHz

**Bandwidth**: 20 MHz or 40 MHz

**MIMO**: 2\$\times\$2, 3\$\times\$3,
or 4\$\times\$4

**Modulation**: BPSK to 64-QAM (per subcarrier)

**Coding**: Convolutional (K=7, rate 1/2, 2/3, 3/4, 5/6)

**Multiple access**: CSMA/CA (carrier sense)

<div class="center">

------------------------------------------------------------------------

</div>

### PHY Layer (OFDM)

**Subcarriers**: - **20 MHz**: 64 total (52 data, 4 pilots, 8
guard) - **40 MHz**: 128 total (108 data, 6 pilots, 14 guard)

**FFT size**: 64 (20 MHz), 128 (40 MHz)

**Subcarrier spacing**: 312.5 kHz

**Symbol duration**: 3.2 \$\mu\$s (data) + 0.8
\$\mu\$s (guard) = 4 \$\mu\$s

**Guard interval**: 0.8 \$\mu\$s (1/4 symbol)
\$\rightarrow\$ Handles 200 ns delay spread

<div class="center">

------------------------------------------------------------------------

</div>

### Frame Structure

    [Preamble] [SIGNAL] [Data Field]
        |         |          |
      20 s     4 s    Variable

**Legacy preamble** (20 \$\mu\$s): - Short training
(8 \$\mu\$s): AGC, coarse CFO - Long training (8
\$\mu\$s): Fine CFO, channel estimation - SIGNAL field (4
\$\mu\$s): Rate, length (BPSK, rate 1/2)

**HT preamble** (for 802.11n): - HT-SIG (8 \$\mu\$s):
MCS, bandwidth, MIMO streams - HT-LTF (4 \$\mu\$s
\$\times\$ Nss): Channel estimation per spatial stream

<div class="center">

------------------------------------------------------------------------

</div>

### Modulation & Coding Schemes (MCS)

**20 MHz, 1 spatial stream**:

| MCS | Modulation | Code Rate | Data Rate (Mbps) | Usage                 |
|:----|:-----------|:----------|:-----------------|:----------------------|
|     | BPSK       | 1/2       | 6.5              | Max range, poor SNR   |
| 1   | QPSK       | 1/2       | 13               | Long range            |
| 2   | QPSK       | 3/4       | 19.5             |                       |
| 3   | 16-QAM     | 1/2       | 26               | Medium range          |
| 4   | 16-QAM     | 3/4       | 39               |                       |
| 5   | 64-QAM     | 2/3       | 52               | Short range, good SNR |
| 6   | 64-QAM     | 3/4       | 58.5             |                       |
| 7   | 64-QAM     | 5/6       | 65               | Max throughput        |

**40 MHz, 2 spatial streams**: 2\$\times\$ data rate
\$\rightarrow\$ 150 Mbps (MCS 15)

**40 MHz, 4 spatial streams**: 4\$\times\$ data rate
\$\rightarrow\$ 600 Mbps (MCS 31, 64-QAM 5/6)

<div class="center">

------------------------------------------------------------------------

</div>

### Link Budget (Indoor, 20 MHz)

**Transmitter**: - TX power: +20 dBm (100 mW) - Antenna gain: +2
dBi (omnidirectional) - EIRP: +22 dBm

**Path Loss** (10 m indoor, 2.4 GHz): - Free space: 40 dB - Wall
penetration: 5 dB (1 wall) - **Total path loss**: 45 dB

**Receiver**: - RX antenna gain: +2 dBi - Noise figure: 6 dB -
Noise floor: -174 + 73 + 6 = -95 dBm (20 MHz)

**Received signal**: - P_r = 22 - 45 + 2 = **-21 dBm**

**SNR**: -21 - (-95) = **74 dB** (excellent!)

**MCS**: Can use MCS 7 (64-QAM 5/6, requires ~25 dB
SNR)

**Data rate**: 65 Mbps

<div class="center">

------------------------------------------------------------------------

</div>

### Synchronization

**CFO tolerance**: \$\pm\$20 ppm - @ 2.4 GHz:
\$\pm\$48 kHz - Subcarrier spacing: 312.5 kHz - Normalized
CFO: \$\pm\$0.15 (15%)

**Correction**: 1. **Coarse CFO**: Short preamble
autocorrelation (\$\pm\$156 kHz range) 2. **Fine
CFO**: Long preamble phase difference (\$\pm\$10 kHz
accuracy) 3. **Tracking**: Pilot subcarriers (every OFDM symbol)

**Timing**: Long preamble correlation peak

**Channel estimation**: Long preamble (2 known OFDM symbols)

<div class="center">

------------------------------------------------------------------------

</div>

### Equalization

**Per-subcarrier** (flat fading assumption):

``` math
\hat{S}_k = \frac{R_k}{H_k}
```

**Pilot tracking**: 4 pilots per 52 subcarriers - Linear
interpolation (frequency) - Common phase error (CPE) correction

**MIMO** (2\$\times\$2): MMSE equalizer

``` math
\hat{\mathbf{S}} = (\mathbf{H}^H \mathbf{H} + \sigma^2 \mathbf{I})^{-1} \mathbf{H}^H \mathbf{R}
```

**Complexity**: 2\$\times\$2 matrix inversion per
subcarrier (52 times per symbol)

<div class="center">

------------------------------------------------------------------------

</div>

### Performance

**Range** (2.4 GHz, 1 stream): - **MCS 7 (65 Mbps)**: 10-20 m
indoor - **MCS 4 (39 Mbps)**: 30-50 m indoor - **MCS 0 (6.5
Mbps)**: 100+ m outdoor (line-of-sight)

**Throughput** (MAC overhead ~30%): - PHY 65 Mbps
\$\rightarrow\$ MAC ~45 Mbps (TCP)

**Latency**: 1-5 ms (CSMA backoff + processing)

<div class="center">

------------------------------------------------------------------------

</div>

## 2. LTE (100 Mbps, Cat 3)

### System Parameters

**Standard**: 3GPP Release 8 (2008)

**Frequency**: 700-2600 MHz (various bands)

**Bandwidth**: 1.4, 3, 5, 10, 15, 20 MHz

**Downlink**: OFDMA (Orthogonal Frequency Division Multiple Access)

**Uplink**: SC-FDMA (Single Carrier FDMA, lower PAPR)

**Modulation**: QPSK, 16-QAM, 64-QAM (adaptive per user)

**Coding**: Turbo codes (K=4, rate 1/3, punctured)

**MIMO**: 2\$\times\$2, 4\$\times\$4
(downlink)

<div class="center">

------------------------------------------------------------------------

</div>

### Resource Grid

**Resource Block (RB)**: 12 subcarriers \$\times\$ 7
OFDM symbols (0.5 ms slot)

**Subcarrier spacing**: 15 kHz

**RB bandwidth**: 180 kHz

**20 MHz bandwidth**: 100 RBs (1200 subcarriers)

**OFDM symbol**: 66.7 \$\mu\$s (normal CP)

**Frame**: 10 ms (10 subframes, 20 slots)

<div class="center">

------------------------------------------------------------------------

</div>

### Modulation & Coding

**MCS table** (QPSK to 64-QAM):

| MCS | Modulation | Code Rate | Spectral Eff. | Usage             |
|:----|:-----------|:----------|:--------------|:------------------|
|     | QPSK       | 0.08      | 0.15          | Cell edge         |
| 5   | QPSK       | 0.37      | 0.74          |                   |
| 10  | 16-QAM     | 0.48      | 1.91          | Mid-cell          |
| 15  | 16-QAM     | 0.74      | 2.96          |                   |
| 20  | 64-QAM     | 0.55      | 3.32          | Near base station |
| 25  | 64-QAM     | 0.85      | 5.12          |                   |
| 28  | 64-QAM     | 0.93      | 5.55          | Max throughput    |

**Adaptive MCS**: eNB (base station) selects based on CQI (Channel
Quality Indicator) reports

<div class="center">

------------------------------------------------------------------------

</div>

### Link Budget (Downlink, 2 GHz, 20 MHz)

**eNodeB** (base station): - TX power: +46 dBm (40 W, macrocell) -
Antenna gain: +17 dBi (sector antenna, 3-sector site) - Cable loss: -3
dB - EIRP: +60 dBm

**Path Loss** (urban, 1 km): - Free space: 92 dB - Urban clutter:
20 dB - Building penetration: 15 dB (indoor UE) - **Total**: 127 dB

**UE** (user equipment): - RX antenna gain: 0 dBi (phone,
omnidirectional) - Noise figure: 9 dB - Noise floor: -174 + 73 + 9 = -92
dBm (20 MHz)

**Received signal**: - P_r = 60 - 127 + 0 = **-67 dBm**

**SNR**: -67 - (-92) = **25 dB**

**MCS**: 64-QAM, rate 0.7 (MCS 23)

**Data rate** (100 RBs, 2\$\times\$2 MIMO): - 100 RB
\$\times\$ 12 subcarriers \$\times\$ 7
symbols \$\times\$ 6 bits \$\times\$ 2
layers / 0.5 ms - = 100,800 bits / 0.5 ms = **201.6 Mbps**
(physical) - With code rate 0.7 and overhead:
~**100 Mbps** (MAC)

<div class="center">

------------------------------------------------------------------------

</div>

### Synchronization & Cell Search

**Steps**:

1.  **PSS detection** (Primary Sync Signal):

    - 3 Zadoff-Chu sequences (cell ID mod 3)

    - Every 5 ms

    - Coarse timing (\$\pm\$5 ms ambiguity)

    - Coarse CFO (from PSS phase)

2.  **SSS detection** (Secondary Sync Signal):

    - 168 sequences (cell ID = 0-503)

    - Frame timing (resolve 5 ms ambiguity)

    - Cell ID fully determined

3.  **PBCH decode** (Physical Broadcast Channel):

    - Master Information Block (MIB)

    - Bandwidth, PHICH config, frame number

    - QPSK, rate 1/48 (very robust)

**Time**: ~100 ms (cold start), ~10 ms
(known frequency)

<div class="center">

------------------------------------------------------------------------

</div>

### Channel Estimation

**Cell-Specific Reference Signals (CRS)**: - 4 pilots per RB per
OFDM symbol (port 0) - 8 pilots for 2\$\times\$2 MIMO
(ports 0, 1)

**Estimation**: - LS per pilot: $`\hat{H}_p = R_p / S_p`$ - Wiener
interpolation (frequency + time) - Averaging over multiple OFDM symbols
(4 ms)

**Tracking**: Phase/frequency drift (up to 300 km/h Doppler)

<div class="center">

------------------------------------------------------------------------

</div>

### Equalization (Downlink)

**Frequency domain** (per subcarrier):

``` math
\hat{S}_k = \frac{H_k^*}{|H_k|^2 + \sigma^2} R_k \quad (\text{MMSE})
```

**MIMO** (2\$\times\$2): Per-subcarrier matrix
inversion

**Interference**: ICIC (Inter-Cell Interference Coordination)

<div class="center">

------------------------------------------------------------------------

</div>

### Performance

**Throughput** (Cat 3, 2\$\times\$2 MIMO, 20 MHz): -
**Peak**: 100 Mbps (downlink), 50 Mbps (uplink) - **Average**:
30-50 Mbps (loaded cell)

**Latency**: - Control plane: ~50 ms (idle
\$\rightarrow\$ active) - User plane: ~10 ms
(round-trip)

**Range**: - **Macrocell**: 5-15 km (rural), 1-3 km (urban) -
**Small cell**: 100-500 m

**Handover**: ~50 ms (seamless at \< 300
km/h)

<div class="center">

------------------------------------------------------------------------

</div>

## 3. DVB-S2X (Satellite TV, 4K UHD)

### System Parameters

**Standard**: ETSI EN 302 307-2 (2014)

**Frequency**: Ku-band (10.7-12.75 GHz downlink)

**Bandwidth**: 36 MHz (transponder)

**Modulation**: QPSK, 8PSK, 16APSK, 32APSK (ACM, Adaptive Coding &
Modulation)

**Coding**: LDPC + BCH (outer)

**Multiple access**: TDM (Time Division Multiplex, single carrier
per transponder)

<div class="center">

------------------------------------------------------------------------

</div>

### Frame Structure

**PLFRAME** (Physical Layer Frame): - PLHEADER (90 symbols): Frame
sync, MODCOD (modulation + code rate) - Pilots: 36 symbols every 1440
data symbols - Data: 16,200 or 64,800 bits (FECFRAME)

**Super-frame**: VCM (Variable Coding & Modulation) allows
different MODCOD per frame

<div class="center">

------------------------------------------------------------------------

</div>

### Modulation & Coding

**MODCOD table** (examples):

| MODCOD | Modulation | Code Rate | Spectral Eff. | C/N Req. (dB) |
|:-------|:-----------|:----------|:--------------|:--------------|
|        | QPSK       | 1/4       | 0.49          | -2.3          |
| 6      | QPSK       | 3/4       | 1.49          | +4.0          |
| 11     | 8PSK       | 2/3       | 2.00          | +7.9          |
| 17     | 8PSK       | 9/10      | 2.69          | +12.7         |
| 23     | 16APSK     | 5/6       | 3.32          | +14.4         |
| 28     | 32APSK     | 9/10      | 4.48          | +18.4         |

**ACM**: Switch MODCOD based on rain fade - Clear sky: 32APSK 9/10
(max throughput) - Light rain: 8PSK 3/4 - Heavy rain: QPSK 1/2

<div class="center">

------------------------------------------------------------------------

</div>

### Link Budget (GEO, Ku-Band, 4K UHD)

**Satellite**: - TX power: +50 dBW (100 kW EIRP, 100 W transponder)
- Antenna gain: +35 dBi (spot beam) - EIRP: +85 dBW

**Path Loss** (GEO, 36,000 km, 12 GHz): - FSPL: 205.6 dB

**Ground Station**: - Dish size: 0.6 m (residential) - Antenna
gain: +37.4 dBi (60% efficiency) - Pointing loss: -0.5 dB - RX gain:
+36.9 dBi - LNB noise temp: 50 K (NF \$\approx\$ 0.7 dB) -
System temp: 150 K (sky + LNB) - G/T: +13.1 dB/K

**Received C/N** (Carrier-to-Noise): - C = 85 - 205.6 + 36.9 =
**-83.7 dBW** - N = -228.6 + 10log(36e6) + 10log(150) =
**-147.3 dBW** - **C/N = 63.6 dB** (clear sky, theoretical)

**With rain** (5 dB rain fade @ 12 GHz, 0.01% time): - C/N = 63.6
- 5 = **58.6 dB** (still excellent!)

**MODCOD selection**: - Clear sky: 32APSK 9/10 (requires 18.4 dB
C/N) - Rain: 8PSK 2/3 (requires 7.9 dB C/N)

**Data rate**: - 32APSK 9/10: 36 MHz \$\times\$ 4.48
= **161 Mbps** - Enough for 4K UHD (50 Mbps HEVC) + multiple HD
channels

<div class="center">

------------------------------------------------------------------------

</div>

### Synchronization

**PLHEADER** (90 symbols): - Known pattern (SOF, Start of Frame) -
Correlate for frame sync - Acquire in ~1 second (blind
search \$\pm\$500 kHz CFO)

**Pilot symbols**: Every 16 data symbols (distributed) -
Phase/frequency tracking - Common phase error (CPE) correction

<div class="center">

------------------------------------------------------------------------

</div>

### Equalization

**Single carrier** (not OFDM): - Phase noise dominant (satellite
oscillator, ground LNB) - Decision-directed phase tracking - Pilot-aided
(every 16 symbols)

**Channel**: Mostly flat (GEO, line-of-sight, no multipath)

<div class="center">

------------------------------------------------------------------------

</div>

### Performance

**Availability**: 99.7% (0.3% outage in heavy rain)

**Latency**: ~600 ms (round-trip to GEO and back)

**Throughput**: 80-160 Mbps (depends on MODCOD, ACM)

**Spectral efficiency**: 1.5-4.5 bits/sec/Hz

<div class="center">

------------------------------------------------------------------------

</div>

## 4. GPS L1 C/A (Civilian Navigation)

### System Parameters

**Standard**: IS-GPS-200 (US DoD)

**Frequency**: L1 = 1575.42 MHz

**Bandwidth**: 2.046 MHz (C/A code)

**Modulation**: BPSK (data) on DSSS (Direct Sequence Spread
Spectrum)

**Spreading**: 1.023 Mcps (C/A Gold code, 1023 chips)

**Data rate**: 50 bps (navigation message)

**Code rate**: None (no FEC on nav message, 1/2 rate implied by
chip parity in modern receivers)

<div class="center">

------------------------------------------------------------------------

</div>

### Signal Structure

**C/A code**: 1023-chip Gold code (repeats every 1 ms) - Unique
code per satellite (32 satellites, ~30 visible codes) -
Chip rate: 1.023 Mcps - Chip duration: ~977 ns

**Navigation data**: 50 bps - 20 ms per bit (20 C/A code
repetitions) - Preamble, ephemeris, almanac

**Spreading**:

``` math
s(t) = d(t) \cdot c(t) \cdot \cos(2\pi f_L1 t)
```

Where: - $`d(t)`$ = Navigation data (\$\pm\$1) - $`c(t)`$
= C/A code (\$\pm\$1, 1.023 Mcps)

<div class="center">

------------------------------------------------------------------------

</div>

### Link Budget

**Satellite** (MEO, 20,200 km): - TX power: +27 dBW (500 W
spacecraft, 50 W to L1) - Antenna gain: +13 dBi (earth-facing) - EIRP:
+40 dBW

**Path Loss** (1.575 GHz, 20,200 km): - FSPL: 184 dB

**Receiver** (handheld): - Antenna gain: +3 dBi (patch antenna) -
Cable loss: -2 dB - RX gain: +1 dBi - Noise figure: 3 dB - Noise floor:
-174 + 63 + 3 = -108 dBm (2 MHz)

**Received signal**: - P_r = 40 - 184 + 1 = **-143 dBm**

**SNR** (before despreading): -143 - (-108) = **-35 dB**

**Processing gain** (despreading): - G_p = 10log(1.023e6 / 50) =
**43 dB**

**SNR after despreading**: -35 + 43 = **+8 dB**

**Enough for**: BER
~10\textsuperscript{-}\textsuperscript{5}
(BPSK @ 8 dB Eb/N0)

<div class="center">

------------------------------------------------------------------------

</div>

### Acquisition & Tracking

**Acquisition** (cold start):

1.  **Search space**:

    - Doppler: \$\pm\$5 kHz (satellite motion)

    - Code phase: 0-1022 chips (1 ms uncertainty)

    - Total: 5000 \$\times\$ 1023 = **5.1 million
      hypotheses**

2.  **FFT-based search**:

    - Correlate 1 ms of signal with local code (FFT)

    - Sweep Doppler (500 Hz steps)

    - **Time**: ~1 second per satellite (parallel
      correlators)

3.  **Threshold**: Peak exceeds noise floor by 10 dB
    \$\rightarrow\$ Satellite acquired

**Tracking**:

- **DLL** (Delay-Locked Loop): Code phase (\$\pm\$0.5
  chip)

- **PLL** (Phase-Locked Loop): Carrier phase (sub-wavelength,
  ~19 cm)

- **FLL** (Frequency-Locked Loop): Doppler
  (\$\pm\$0.1 Hz)

**Update**: 1 kHz (1 ms integration)

<div class="center">

------------------------------------------------------------------------

</div>

### Navigation Solution

**Minimum 4 satellites**: Solve for (x, y, z, clock bias)

**Pseudorange** (from code phase):

``` math
\rho_i = c \cdot \Delta t_i = \sqrt{(x - x_i)^2 + (y - y_i)^2 + (z - z_i)^2} + c \cdot b
```

Where: - $`\rho_i`$ = Measured pseudorange to satellite $`i`$ -
$`(x, y, z)`$ = User position - $`(x_i, y_i, z_i)`$ = Satellite position
(from ephemeris) - $`b`$ = User clock bias

**Solve** (least squares, iterative):

``` math
\mathbf{p} = (\mathbf{H}^T \mathbf{H})^{-1} \mathbf{H}^T \Delta\boldsymbol{\rho}
```

**Accuracy**: - **Horizontal**: 5-10 m (standalone,
unencrypted C/A) - **With DGPS**: 1-3 m (differential corrections)
- **With RTK**: 1-10 cm (carrier phase, short baseline)

<div class="center">

------------------------------------------------------------------------

</div>

### Performance

**Time to first fix** (TTFF): - **Cold start**: 30-60 seconds
(no almanac) - **Warm start**: 10-30 seconds (old almanac) -
**Hot start**: 1-10 seconds (recent ephemeris)

**Update rate**: 1 Hz (can be 10 Hz with modern receivers)

### External Resources

**GPS Technical Documentation**: -
[IS-GPS-200
Interface Specification](https://www.gps.gov/technical/icwg/IS-GPS-200M.pdf) - Official GPS signal specification -
[GPS.gov](https://www.gps.gov/) - U.S. government GPS information
portal -
[Navipedia GPS
Section](https://gssc.esa.int/navipedia/index.php?title=GPS) - Comprehensive GPS technical resource

**Related GNSS Systems**: -
[Galileo
OS SIS ICD](https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.0.pdf) - European GNSS signal plan -
[Navipedia
Signal Plan Comparison](https://gssc.esa.int/navipedia/index.php?title=GALILEO_Signal_Plan) - Multi-GNSS signal analysis

**Sensitivity**: -130 dBm (open sky), -145 dBm (aided, indoor
marginal)

<div class="center">

------------------------------------------------------------------------

</div>

## 5. Bluetooth 5.0 (LE Audio)

### System Parameters

**Standard**: Bluetooth 5.0 (2016), LE Audio (2020)

**Frequency**: 2.4 GHz ISM band (2400-2483.5 MHz)

**Bandwidth**: 2 MHz per channel (40 channels, 2 MHz spacing)

**Modulation**: GFSK (Gaussian Frequency Shift Keying, BT=0.5)

**Data rate**: 1 Mbps (LE 1M), 2 Mbps (LE 2M), 125/500 kbps (LE
Coded)

**Coding**: None (1M, 2M), FEC S=2 or S=8 (LE Coded)

**Range**: 10-100 m (LE), 200-400 m (LE Long Range)

<div class="center">

------------------------------------------------------------------------

</div>

### Modulation

**GFSK** (Gaussian FSK): - **Deviation**:
\$\pm\$250 kHz (1M), \$\pm\$500 kHz (2M) -
**Modulation index**: h = 0.5 (1M), h = 1.0 (2M) - **Gaussian
BT**: 0.5 (pre-filter to reduce bandwidth)

**Bit 0**: -250 kHz (1M)

**Bit 1**: +250 kHz (1M)

**Receiver**: FM discriminator (non-coherent) or coherent (better
sensitivity)

<div class="center">

------------------------------------------------------------------------

</div>

### Frame Structure

**Advertising packet** (connection initiation): - Preamble: 8 bits
(01010101 for 1M) - Access address: 32 bits (0x8E89BED6 for advertising)
- PDU: 2-39 bytes (header + payload) - CRC: 24 bits

**Data packet** (connection): - Preamble: 8 bits - Access address:
32 bits (unique per connection) - PDU: 2-255 bytes - CRC: 24 bits

**FEC** (LE Coded): - S=2: Rate 1/2, block code - S=8: Rate 1/8,
repetition code

<div class="center">

------------------------------------------------------------------------

</div>

### Link Budget (LE 1M, 10 m)

**Transmitter** (phone): - TX power: 0 dBm (1 mW, class 2) -
Antenna gain: 0 dBi (PCB antenna) - EIRP: 0 dBm

**Path Loss** (10 m indoor, 2.4 GHz): - Free space: 40 dB - Indoor
clutter: 10 dB - **Total**: 50 dB

**Receiver** (headphones): - RX antenna gain: 0 dBi - Noise figure:
12 dB (low-power design) - Noise floor: -174 + 63 + 12 = -99 dBm (2 MHz)

**Received signal**: - P_r = 0 - 50 + 0 = **-50 dBm**

**SNR**: -50 - (-99) = **49 dB** (excellent!)

**Sensitivity** (spec): -70 dBm (1M), -80 dBm (LE Coded S=8)

**Margin**: 49 - 19 = **30 dB** (19 dB SNR needed for
10\textsuperscript{-}\textsuperscript{3}
BER)

<div class="center">

------------------------------------------------------------------------

</div>

### Synchronization

**Preamble**: 8-bit alternating pattern (01010101 or 10101010) -
Frequency offset estimation - Timing sync (bit transitions)

**Access address**: 32-bit correlation - Frame detection - Fine
timing

**CFO tolerance**: \$\pm\$50 ppm - @ 2.4 GHz:
\$\pm\$120 kHz - Channel BW: 2 MHz - Correctable with
preamble estimation

<div class="center">

------------------------------------------------------------------------

</div>

### Adaptive Frequency Hopping (AFH)

**Avoid interference** from WiFi:

**Channel hopping**: Pseudo-random sequence, 37 data channels - Hop
every 1.25 ms (connection event) - Bad channels blacklisted (CCA, Clear
Channel Assessment)

**Example**: WiFi on ch 6 (2437 MHz, 20 MHz BW) - BT avoids ch
15-24 (2428-2456 MHz) - Uses remaining 27 channels

<div class="center">

------------------------------------------------------------------------

</div>

### Performance

**Throughput**: - **LE 1M**: ~700 kbps
(application layer, overhead ~30%) - **LE 2M**:
~1.4 Mbps - **LE Coded S=2**: ~350 kbps
- **LE Coded S=8**: ~100 kbps

**Latency**: 7.5-40 ms (connection interval)

**Range**: - **LE 1M**: 10-30 m (typical), 100 m (outdoor,
LoS) - **LE Long Range (S=8)**: 200-400 m (outdoor)

**Power**: 10-50 mW (active), \< 1 \$\mu\$W
(deep sleep)

<div class="center">

------------------------------------------------------------------------

</div>

## 6. LoRaWAN (IoT Long Range)

### System Parameters

**Standard**: LoRa Alliance (2015)

**Frequency**: ISM bands (433, 868, 915 MHz)

**Bandwidth**: 125, 250, 500 kHz

**Modulation**: LoRa (Chirp Spread Spectrum, proprietary Semtech)

**Data rate**: 0.3-50 kbps (adaptive)

**Coding**: FEC rate 4/5, 4/6, 4/7, 4/8 (Hamming-based)

**Range**: 2-15 km (urban), 30-50 km (rural, LoS)

<div class="center">

------------------------------------------------------------------------

</div>

### LoRa Modulation

**CSS** (Chirp Spread Spectrum): - Frequency sweeps linearly across
bandwidth - **Symbol duration**: $`T_s = 2^{SF} / BW`$ -
**SF** (Spreading Factor): 7-12 (trade data rate vs range)

**Example** (SF=7, BW=125 kHz): - $`T_s = 2^7 / 125000 = 1.024`$ ms
- Data rate: 5.47 kbps (rate 4/5 coding)

**Example** (SF=12, BW=125 kHz): -
$`T_s = 2^{12} / 125000 = 32.768`$ ms - Data rate: 0.25 kbps

**Energy per bit**: Higher SF \$\rightarrow\$ More
energy per bit \$\rightarrow\$ Longer range

<div class="center">

------------------------------------------------------------------------

</div>

### Link Budget (SF12, 868 MHz, 15 km)

**End Device** (sensor): - TX power: +14 dBm (25 mW, EU limit) -
Antenna gain: +2 dBi (whip antenna) - EIRP: +16 dBm

**Path Loss** (15 km rural, 868 MHz): - Free space: 111 dB -
Terrain: 20 dB (rolling hills) - **Total**: 131 dB

**Gateway** (base station): - RX antenna gain: +8 dBi (omni or
sector) - Cable loss: -1 dB - RX gain: +7 dBi - Noise figure: 3 dB
(SX1301) - Noise floor: -174 + 51 + 3 = -120 dBm (125 kHz)

**Received signal**: - P_r = 16 - 131 + 7 = **-108 dBm**

**SNR**: -108 - (-120) = **12 dB**

**Required SNR** (SF12): -20 dB (yes, negative! CSS allows
below-noise detection)

**Margin**: 12 - (-20) = **32 dB**

**Range**: 15 km achievable

<div class="center">

------------------------------------------------------------------------

</div>

### Adaptive Data Rate (ADR)

**Network server adjusts** SF and TX power per device:

| SF     | Data Rate | Range | Energy   |
|:-------|:----------|:------|:---------|
| **7**  | 5.5 kbps  | 2 km  | Low      |
| **9**  | 1.8 kbps  | 5 km  | Moderate |
| **12** | 0.25 kbps | 15 km | High     |

**Goal**: Minimize airtime and energy (battery life)

**Example**: Device near gateway - Start SF12 (robust) - Network
commands SF7 (after several successful packets) - Airtime: 32.7 ms
\$\rightarrow\$ 1.0 ms (32\$\times\$ faster)
- Battery life: 5\$\times\$ improvement

<div class="center">

------------------------------------------------------------------------

</div>

### LoRaWAN Protocol

**Class A** (battery): - Uplink \$\rightarrow\$ 2 RX
windows (1s, 2s after TX) - Downlink only in RX windows - Power:
~100 mW-years (1 packet/hour)

**Class B** (synchronized): - Periodic RX slots (128 ms beacon from
gateway) - Latency: \< 128 seconds

**Class C** (mains powered): - RX always on (except during TX) -
Latency: ~1 second

<div class="center">

------------------------------------------------------------------------

</div>

### Performance

**Range**: - **Urban**: 2-5 km (SF7), 5-15 km (SF12) -
**Rural**: 10-30 km (line-of-sight, SF12) - **Record**: 702 km
(high altitude balloon, extreme conditions)

**Capacity**: ~1000 devices per gateway (duty cycle
limited)

**Battery life**: 5-15 years (1 packet/hour,
3\$\times\$AA batteries)

**Latency**: 1-10 seconds (Class A, includes ADR negotiation)

<div class="center">

------------------------------------------------------------------------

</div>

## Comparison Summary

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>System</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Frequency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Data Rate</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Range</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Modulation</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Coding</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Latency</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Power</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong>WiFi 802.11n</strong></td>
<td style="text-align: left;">/5 GHz</td>
<td style="text-align: left;">-600 Mbps</td>
<td style="text-align: left;">-100 m</td>
<td style="text-align: left;">-QAM OFDM</td>
<td style="text-align: left;">Conv K=7</td>
<td style="text-align: left;">-5 ms</td>
<td style="text-align: left;">mW</td>
</tr>
<tr>
<td style="text-align: left;"><strong>LTE</strong></td>
<td style="text-align: left;">-2600 MHz</td>
<td style="text-align: left;">-100 Mbps</td>
<td style="text-align: left;">-15 km</td>
<td style="text-align: left;">-QAM OFDMA</td>
<td style="text-align: left;">Turbo K=4</td>
<td style="text-align: left;">ms</td>
<td style="text-align: left;">mW</td>
</tr>
<tr>
<td style="text-align: left;"><strong>DVB-S2X</strong></td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">-160 Mbps</td>
<td style="text-align: left;">,000 km</td>
<td style="text-align: left;">32APSK</td>
<td style="text-align: left;">LDPC+BCH</td>
<td style="text-align: left;">ms</td>
<td style="text-align: left;">W (sat)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>GPS L1</strong></td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">bps</td>
<td style="text-align: left;">Global</td>
<td style="text-align: left;">BPSK DSSS</td>
<td style="text-align: left;">None</td>
<td style="text-align: left;">N/A</td>
<td style="text-align: left;">W (sat)</td>
</tr>
<tr>
<td style="text-align: left;"><strong>Bluetooth 5</strong></td>
<td style="text-align: left;">GHz</td>
<td style="text-align: left;">-2 Mbps</td>
<td style="text-align: left;">-400 m</td>
<td style="text-align: left;">GFSK</td>
<td style="text-align: left;">FEC/Repeat</td>
<td style="text-align: left;">-40 ms</td>
<td style="text-align: left;">mW</td>
</tr>
<tr>
<td style="text-align: left;"><strong>LoRaWAN</strong></td>
<td style="text-align: left;">/915 MHz</td>
<td style="text-align: left;">-50 kbps</td>
<td style="text-align: left;">-50 km</td>
<td style="text-align: left;">LoRa CSS</td>
<td style="text-align: left;">Hamming</td>
<td style="text-align: left;">-10 s</td>
<td style="text-align: left;">mW</td>
</tr>
</tbody>
</table>

<div class="center">

------------------------------------------------------------------------

</div>

## Key Takeaways by System

**WiFi**: High throughput, OFDM handles multipath, MIMO for
capacity, short range

**LTE**: Cellular coverage, adaptive MCS, OFDMA multi-user,
handover at 300 km/h

**DVB-S2X**: Satellite broadcast, ACM for rain fade, long latency
(GEO), high EIRP

**GPS**: Below noise floor (-143 dBm), spread spectrum (43 dB
gain), 5-10 m accuracy

**Bluetooth**: Low power, AFH avoids WiFi, LE Coded for range, 7.5
ms latency

**LoRaWAN**: Ultra-long range (15+ km), sub-noise detection (CSS),
years battery life

<div class="center">

------------------------------------------------------------------------

</div>

## Related Topics

- **\[\[Signal-Chain-(End-to-End-Processing)\]\]**: System
  block diagrams

- **\[\[Complete-Link-Budget-Analysis\]\]**: Detailed link
  calculations

- **\[\[OFDM-&-Multicarrier-Modulation\]\]**: WiFi/LTE PHY
  layer

- **\[\[Spread-Spectrum-(DSSS-FHSS)\]\]**: GPS, Bluetooth AFH

- **\[\[Adaptive-Modulation-&-Coding-(AMC)\]\]**: LTE,
  DVB-S2X, LoRaWAN ADR

<div class="center">

------------------------------------------------------------------------

</div>

## External Resources & Standards

### WiFi (802.11)

- [IEEE
  802.11 Standards](https://standards.ieee.org/standard/802_11-2020.html) - Official WiFi specifications

- [WiFi Alliance](https://www.wi-fi.org/) - Certification and
  technical information

### LTE/5G

- [3GPP Specifications](https://www.3gpp.org/ftp/Specs/archive/) -
  Complete LTE/5G standards

- [3GPP
  TS 36.211](https://www.3gpp.org/ftp/Specs/archive/36_series/36.211/) - LTE Physical channels and modulation

- [3GPP
  TS 36.212](https://www.3gpp.org/ftp/Specs/archive/36_series/36.212/) - LTE Channel coding

### DVB Satellite

- [ETSI
  EN 302 307-1](https://www.etsi.org/deliver/etsi_en/302300_302399/30230701/) - DVB-S2 Standard

- [DVB Project](https://www.dvb.org/) - Digital Video Broadcasting
  organization

### Signal Identification

- [sigidwiki](https://www.sigidwiki.com/wiki/Signal_Identification_Guide)
  - Comprehensive RF signal database

- [RadioReference](https://www.radioreference.com/) - Frequency
  allocations and trunked systems

### Full Bibliography

- See \[\[Bibliography\]\] for complete list of 60+ references,
  textbooks, and resources

<div class="center">

------------------------------------------------------------------------

</div>

**Key takeaway**: **Real systems integrate all concepts:
modulation (BPSK to 256-QAM), coding (convolutional to LDPC), multiple
access (CSMA, OFDMA, TDMA), sync (preambles, pilots), equalization
(MMSE, DFE), and link budgets.** WiFi achieves 600 Mbps via MIMO + 64-QAM
OFDM over 100 m. LTE provides 100 Mbps cellular over 15 km with ACM.
DVB-S2X delivers 160 Mbps from GEO (36,000 km) using 32APSK. GPS
operates at -143 dBm (below noise!) via 43 dB spreading gain. Bluetooth
5 extends to 400 m with FEC (LE Coded). LoRaWAN reaches 50 km rural with
CSS sub-noise detection. Each system optimizes for different
constraints: throughput vs range vs power vs latency. Understanding
these trade-offs is key to system design!

<div class="center">

------------------------------------------------------------------------

</div>

*This wiki is part of the \[\[HomeChimera Project\]\]
documentation.*
