---
layout: chapter
title: "Frequency-Shift-Keying-(FSK)"
chapter: 27
permalink: /chapters/frequency-shift-keying-(fsk)/
---

# Frequency-Shift Keying (FSK)

##  For Non-Technical Readers

**FSK is like morse code with two different musical
notes---high note = 1, low note = 0. Simple, robust, and still used
everywhere!**

**The idea**: - Want to send a **1**? Transmit at **high
frequency** (e.g., 1200 Hz) - Want to send a **0**? Transmit at
**low frequency** (e.g., 1000 Hz) - Receiver listens for which tone
is present

**Musical analogy**: - Playing piano: **C note** = 0,
**E note** = 1 - Song: “C C E C E E C” = data: “0 0 1 0 1 1 0”
- Your ear (receiver) easily distinguishes C from E! - FSK receiver does
the same with radio frequencies

**Why it's great**: - **Super robust**: Noise
changes amplitude, but frequency stays clear! - **Simple**: Just
detect which frequency is present - **Immune to fading**: Signal
can get weaker, but frequency doesn't change -
**Works in harsh environments**: Industrial, underwater, long-range

**Where you encounter FSK**: - **Caller ID**: Your phone uses
FSK to send caller info between rings! - **Old dial-up modems**:
1980s modems used FSK (remember the screeching sound?) -
**Bluetooth Low Energy**: Uses GFSK (Gaussian FSK) for low power -
**RFID tags**: Many use FSK for simplicity - **Weather
balloons**: FSK survives atmospheric interference - **Pagers**:
Remember pagers? FSK!

**Real-world sounds**: - **Fax machine**: That squawking noise
is FSK! Listen carefully---you can hear the two tones alternating -
**Dial-up internet**: BEEEE-doo-BEEEE-doo = FSK handshake -
**Emergency broadcast tones**: Two-tone alert = FSK

**Variants**: - **BFSK**: Binary (2 frequencies) = 1
bit/symbol - **MFSK**: Multiple frequencies (4, 8, 16, etc.) = more
bits/symbol - **GFSK**: Gaussian FSK (smooth transitions) = used in
Bluetooth

**Trade-off**: - **Advantage**: Extremely robust, immune to
amplitude variations - **Disadvantage**: Slow compared to QAM
(lower spectral efficiency) - Best for: Low-power, long-range, harsh
environments

**Fun fact**: Old telegraph operators could “read” morse code by
EAR at 40+ words/minute. FSK is the same idea---humans can literally
hear binary data if you slow it down!

<div class="center">

------------------------------------------------------------------------

</div>

**Frequency-Shift Keying (FSK)** is a digital modulation scheme
where binary data is represented by discrete changes in carrier
frequency.

<div class="center">

------------------------------------------------------------------------

</div>

##  Basic Principle

**Binary FSK (BFSK)**:

    Bit "1": s(t) = A·cos(2f·t)
    Bit "0": s(t) = A·cos(2f·t)

    where:
    - A = constant amplitude
    - f = "mark" frequency (higher)
    - f = "space" frequency (lower)
    - f = f - f = frequency separation

**Time-domain representation**:

    Frequency
       
    f |---|   |---|       |---|     Bit "1"
       |   |   |   |       |   |
    f |   |---|   |-------|   |---  Bit "0"
       +-------------------------- Time
           1   0   1   0       1

<div class="center">

------------------------------------------------------------------------

</div>

##  Mathematical Description

**Transmitted signal**:

    s(t) = A·cos[2(f_c + b_k·f/2)·t]     for kT_b  t < (k+1)T_b

    where:
    - f_c = carrier frequency (center)
    - b_k  {-1, +1} (or {0, 1})
    - f = frequency deviation
    - T_b = bit duration

**Modulation index**:

    h = 2f·T_b

    Common values:
    - h = 0.5 (Minimum Shift Keying - MSK)
    - h = 1.0 (Sunde's FSK)
    - h > 1 (Wideband FSK)

<div class="center">

------------------------------------------------------------------------

</div>

##  Spectral Characteristics

**Bandwidth** (Carson's rule):

    B = 2(f + R_b)

    where R_b = 1/T_b = bit rate

**Examples**: - Narrowband FSK (h = 0.5): B
\$\approx\$ 1.5 R_b - Wideband FSK (h = 2): B
\$\approx\$ 5 R_b

**Power spectral density**: Two main lobes centered at
f\textsubscript{0} and
f\textsubscript{1}

<div class="center">

------------------------------------------------------------------------

</div>

##  Demodulation Methods

### 1. Non-Coherent Detection (Envelope Detector)

**Simple and practical** - no carrier phase recovery!

    Architecture:

             +---------+
        r(t)-+ BPF @ f+--+
             +---------+  |
                          +- Envelope  Compare  Decision
             +---------+  |   Detectors
        r(t)-+ BPF @ f+--+
             +---------+

    Decision:
    If |output of f filter| > |output of f filter|: bit = 1
    Else: bit = 0

**Advantages**: Simple, no synchronization **Disadvantages**:
~1 dB worse than coherent

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Coherent Detection (Correlation)

**Optimal performance** but requires carrier synchronization:

    Correlators:

             +----------+
        r(t)-+ × cos(2ft) +--   z
             +----------+      0 to Tb

             +----------+
        r(t)-+ × cos(2ft) +--   z
             +----------+      0 to Tb

    Decision:
    If z > z: bit = 1
    Else: bit = 0

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Frequency Discriminator

**Classic FM receiver approach**:

    r(t)  [Limiter]  [Frequency Discriminator]  [LPF]  Decision

**Converts frequency deviation to voltage**, then samples at bit
boundaries.

<div class="center">

------------------------------------------------------------------------

</div>

##  Performance Analysis

### Bit Error Rate (BER)

**With non-coherent detection** (AWGN channel):

    BER = (1/2)exp(-E_b/2N)      for orthogonal FSK

    where:
    - E_b = bit energy = (A²T_b)/2
    - N = noise power spectral density

**With coherent detection**:

    BER = Q((E_b/N))            (1 dB better!)

**For orthogonal FSK**: Frequencies
f\textsubscript{0} and
f\textsubscript{1} must satisfy:

    (f - f)·T_b = n/2    (n = integer)

    Minimum: f = 1/(2T_b)   h = 1 (Sunde's FSK)

<div class="center">

------------------------------------------------------------------------

</div>

##  Advantages & Disadvantages

### Advantages

**Constant envelope** - efficient power amplifiers (Class C)
**Non-coherent detection** - simple receivers **Robust to
fading** - amplitude variations don't affect frequency
**Good for noisy channels** - frequency easier to detect than phase
**Legacy compatibility** - used in many older systems

### Disadvantages

**Poor spectral efficiency** - wider bandwidth than PSK
**Moderate power efficiency** - 1-2 dB worse than \[\[BPSK\]\]
**Frequency stability** - requires accurate oscillators
**Doppler sensitivity** - frequency shifts problematic

<div class="center">

------------------------------------------------------------------------

</div>

##  Applications

### Historical & Current

- **Telephone modems** (Bell 103: 1962, 300 baud,
  f\textsubscript{0}=1070 Hz,
  f\textsubscript{1}=1270 Hz)

- **Radio teletype** (RTTY, 1930s-)

- **Caller ID** (Bell 202: 1200 bps,
  f\textsubscript{0}=2200 Hz,
  f\textsubscript{1}=1200 Hz)

- **Pagers** (POCSAG, FLEX protocols)

### Modern

- **LoRa** (sub-GHz IoT, chirp spread spectrum FSK)

- **Bluetooth Low Energy** (GFSK - Gaussian FSK)

- **Wireless sensor networks** - low power, simple receivers

- **Optical fiber** (frequency-shifted laser)

- **\[\[AID-Protocol-Case-Study\]\]** - 12 kHz FSK sub-carrier
  (11,999/12,001 Hz)

<div class="center">

------------------------------------------------------------------------

</div>

##  FSK Variants

### 1. Minimum Shift Keying (MSK)

**Special case**: h = 0.5 (minimum for orthogonality)

    Properties:
    - Continuous phase (no discontinuities)
    - Constant envelope
    - Bandwidth = 1.5 R_b (narrowest FSK)
    - Equivalent to offset QPSK with sinusoidal pulse shaping

**Used in**: GSM cellular (GMSK - Gaussian MSK)

<div class="center">

------------------------------------------------------------------------

</div>

### 2. Gaussian FSK (GFSK)

**MSK + Gaussian pre-modulation filter**

    Purpose: Further reduce spectral sidelobes
    Bandwidth: ~1.2-1.5 R_b (depending on BT product)
    BT product: Bandwidth × T_b (typical: 0.3-0.5)

**Used in**: Bluetooth, Zigbee

<div class="center">

------------------------------------------------------------------------

</div>

### 3. Continuous Phase FSK (CPFSK)

**Phase is continuous** across bit boundaries:

    (t) = 2[f_c·t + (hf/2)·^{t} b()d]

    Benefits:
    - No spectral splatter
    - Better spectral efficiency
    - Smoother power envelope

<div class="center">

------------------------------------------------------------------------

</div>

### 4. Multi-Frequency FSK (MFSK)

**M \> 2 frequencies** for higher data rates:

    M symbols  log(M) bits per symbol

    Example (4-FSK):
    - f: bits 00
    - f: bits 01
    - f: bits 10
    - f: bits 11

    Bandwidth: B = M·R_b (wider!)
    Power efficiency: Better than BFSK for high M

**Used in**: HF radio (MT63, Olivia modes)

<div class="center">

------------------------------------------------------------------------

</div>

##  Constellation Diagram

**BFSK in frequency space**:

    Frequency
       
    f |      Symbol "1"
       |
    f_c|       (carrier)
       |
    f |      Symbol "0"
       +------------ Time

**Not a traditional I/Q constellation** (frequency, not
amplitude/phase).

**Equivalent I/Q representation** (for coherent detection):

          Q
          
          |
      0  |  1   On real axis, separated
          |
    ------+------ I

**Distance between points**: d = \$\sqrt{}\$(2E_b)
(for orthogonal FSK)

<div class="center">

------------------------------------------------------------------------

</div>

##  Comparison Table

<table>
<thead>
<tr>
<th style="text-align: left;"><div class="minipage">
<p>Modulation</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Bits/Symbol</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Bandwidth</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Eb/N0 @ BER 10^-6</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Envelope</p>
</div></th>
<th style="text-align: left;"><div class="minipage">
<p>Detection</p>
</div></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span>[</span><span>[</span>On-Off-Keying-(OOK)</td>
<td style="text-align: left;">OOK<span>]</span><span>]</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">2R_b</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Variable</td>
</tr>
<tr>
<td style="text-align: left;"><strong>FSK</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">2R_b</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Constant</td>
<td style="text-align: left;">Non-coherent</td>
</tr>
<tr>
<td style="text-align: left;"><strong>MSK</strong></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">1.5R_b</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Constant</td>
<td style="text-align: left;">Coherent</td>
</tr>
<tr>
<td style="text-align: left;">BPSK<span>]</span><span>]</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">R_b</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Constant</td>
<td style="text-align: left;">Coherent</td>
</tr>
<tr>
<td style="text-align: left;">QPSK-Modulation</td>
<td style="text-align: left;">QPSK<span>]</span><span>]</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">R_b</td>
<td style="text-align: left;">dB</td>
<td style="text-align: left;">Constant</td>
</tr>
</tbody>
</table>

**Key insight**: FSK trades bandwidth for simplicity.
\[\[BPSK\]\]/\[\[QPSK-ModulationQPSK\]\] are more
efficient but require phase synchronization.

<div class="center">

------------------------------------------------------------------------

</div>

##  Key Takeaways

1.  **Frequency switching**: Binary data
    \$\rightarrow\$ two different frequencies

2.  **Constant envelope**: Good for non-linear amplifiers

3.  **Non-coherent detection**: Simple receivers, still good
    performance

4.  **Bandwidth penalty**: ~2\$\times\$
    wider than PSK

5.  **Robust**: Good for noisy, fading channels

6.  **Still widely used**: Bluetooth, LoRa, pagers, caller ID

7.  **Gateway to chirp spread spectrum**: LoRa uses frequency chirps

<div class="center">

------------------------------------------------------------------------

</div>

##  See Also

- \[\[On-Off-Keying-(OOK)\]\] - Simpler (amplitude modulation)

- \[\[Binary-Phase-Shift-Keying-(BPSK)\]\] - Alternative (phase
  modulation)

- \[\[QPSK-Modulation\]\] - More bits per symbol (phase)

- \[\[Constellation-Diagrams\]\] - Visualizing modulation schemes

- \[\[AID-Protocol-Case-Study\]\] - Uses 1 bps FSK sub-carrier
  (11,999/12,001 Hz)

<div class="center">

------------------------------------------------------------------------

</div>

##  References

1.  **Sunde, E.D.** (1946) “Ideal binary pulse transmission by AM
    and FM” *Bell Syst. Tech. J.* 25, 1067-1093

2.  **de Jager, F. & Dekker, C.B.** (1978) “Tamed Frequency
    Modulation” *IEEE Trans. Comm.* COM-26, 534-542

3.  **Proakis, J.G. & Salehi, M.** (2008) *Digital
    Communications* 5th ed. (McGraw-Hill)

4.  **Sklar, B.** (2001) *Digital Communications* 2nd
    ed. (Prentice Hall)
