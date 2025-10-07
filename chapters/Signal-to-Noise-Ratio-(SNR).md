---
layout: chapter
title: "Signal-to-Noise-Ratio-(SNR)"
chapter: 57
permalink: /chapters/signal-to-noise-ratio-(snr)/
---

# Signal-to-Noise Ratio (SNR)

##  For Non-Technical Readers

**SNR is like the difference between a conversation in a quiet
library (high SNR) vs a loud nightclub (low SNR)---higher SNR =
easier to understand the message!**

**The idea - Signal vs Background**: - **Signal**: The
information you want (voice, data, music) - **Noise**: Random
interference you don't want (static, hiss, interference)
- **SNR**: How much stronger is signal than noise?

**Real-world analogies**:

**Good SNR** (Easy to hear): - **Quiet library conversation**:
Speech is 20\$\times\$ louder than background
\$\rightarrow\$ 26 dB SNR - **Clear radio station**:
Music is 100\$\times\$ louder than static
\$\rightarrow\$ 40 dB SNR - **Strong WiFi**: Data
signal is 1000\$\times\$ stronger than noise
\$\rightarrow\$ 60 dB SNR

**Bad SNR** (Hard to hear): - **Loud nightclub**: Trying to
talk, voice only 2\$\times\$ louder than music
\$\rightarrow\$ 6 dB SNR - **Weak radio station**:
Static almost as loud as music \$\rightarrow\$ 3 dB SNR -
**Far from router**: WiFi signal barely stronger than interference
\$\rightarrow\$ 5 dB SNR

**The dB scale** (why engineers use it): - **Linear**:
10\$\times\$ stronger = 10 dB, 100\$\times\$
stronger = 20 dB, 1000\$\times\$ stronger = 30 dB -
**Logarithmic**: Makes huge ranges manageable - **Rule of
thumb**: +3 dB = double the power, +10 dB = 10\$\times\$
the power

**SNR quality guide**:

    60+ dB SNR:  Perfect - Laboratory quality
    40-60 dB:    Excellent - WiFi close to router
    20-40 dB:   🟡 Good - Cell phone normal use
    10-20 dB:   🟠 Fair - Far from WiFi, slower speeds
    0-10 dB:    🔴 Poor - Lots of errors, need error correction
    Below 0 dB:  Terrible - Noise louder than signal!

**Real examples you experience**:

**WiFi speed changes**: - **Next to router**: 60 dB SNR
\$\rightarrow\$ Use 1024-QAM \$\rightarrow\$
1200 Mbps - **One room away**: 35 dB SNR
\$\rightarrow\$ Use 256-QAM \$\rightarrow\$
600 Mbps - **Two rooms away**: 20 dB SNR
\$\rightarrow\$ Use 64-QAM \$\rightarrow\$
200 Mbps - **Far corner**: 10 dB SNR \$\rightarrow\$
Use QPSK \$\rightarrow\$ 50 Mbps - Your device
**automatically adjusts** based on SNR!

**Cell phone bars**: - **5 bars**: \>20 dB SNR
\$\rightarrow\$ Fast data, clear calls - **3 bars**:
~10 dB SNR \$\rightarrow\$ Slower data,
occasional drop - **1 bar**: ~5 dB SNR
\$\rightarrow\$ Very slow, frequent errors - **No
bars**: \<0 dB SNR \$\rightarrow\$
Can't connect

**Voice calls**: - **Landline**: ~40 dB SNR
\$\rightarrow\$ Crystal clear - **Good cell**:
~20 dB SNR \$\rightarrow\$ Clear -
**Bad cell**: ~10 dB SNR
\$\rightarrow\$ “Can you hear me now?” -
**Terrible cell**: ~5 dB SNR
\$\rightarrow\$ Garbled, robotic voice

**Why SNR matters**:

**Data rate** (how fast): - High SNR \$\rightarrow\$
Use complex modulation (256-QAM, 1024-QAM) \$\rightarrow\$
Fast! - Low SNR \$\rightarrow\$ Use simple modulation
(QPSK, BPSK) \$\rightarrow\$ Slow but reliable

**Error rate** (how accurate): - High SNR
\$\rightarrow\$ Few errors \$\rightarrow\$
No retransmissions \$\rightarrow\$ Efficient - Low SNR
\$\rightarrow\$ Many errors \$\rightarrow\$
Lots of retransmissions \$\rightarrow\$ Inefficient

**Range** (how far): - Close distance \$\rightarrow\$
High SNR \$\rightarrow\$ Fast connection - Far distance
\$\rightarrow\$ Low SNR \$\rightarrow\$ Slow
or no connection

**Engineering trade-offs**:

**Increase SNR by**: - **More transmit power**: Stronger
signal (but uses battery, FCC limits) - **Bigger antennas**:
Collect more signal (but bulky) - **Get closer**: Reduce distance
(not always possible) - **Reduce noise**: Better receivers,
shielding (expensive)

**Shannon's Law** (theoretical limit):

    Max data rate = Bandwidth × log(1 + SNR)

- Double SNR \$\rightarrow\$ ~40% more data
  rate

- 10\$\times\$ SNR \$\rightarrow\$
  3\$\times\$ more data rate

- This is why 5G needs high SNR for multi-Gbps speeds!

**When you see SNR**:

**Router admin page**: “SNR: 42 dB” \$\rightarrow\$
Excellent connection **WiFi diagnostics**: “Signal: -45 dBm,
Noise: -95 dBm” \$\rightarrow\$ SNR = 50 dB **Cell
phone**: “RSRP: -80 dBm, SINR: 15 dB” \$\rightarrow\$
Decent 4G signal **Audio recording**: “SNR: 90 dB”
\$\rightarrow\$ Professional studio quality

**The ultimate limit - Thermal noise**: - All electronics generate
noise from heat - Room temperature: Noise floor ~-174
dBm/Hz - This sets fundamental limit for all communication -
Can't go below this (without cooling to near absolute
zero!)

**Fun fact**: Deep space communications have SNR well below 0
dB---Voyager 1's signal arriving at Earth is
**10,000\$\times\$ weaker than the noise!** Engineers
use huge antennas, narrow filters, and sophisticated algorithms to
extract signal from noise. It's like hearing a whisper
from 15 billion miles away!

<div class="center">

------------------------------------------------------------------------

</div>

**Signal-to-Noise Ratio (SNR)** measures the strength of the
desired signal relative to the background noise. It's
typically expressed in decibels (dB).

## Understanding SNR Values

    Higher SNR = Better Signal Quality

    SNR (dB)  |  Quality          |  Typical Use Case
    ----------|-------------------|----------------------------------
    > 20 dB   |  Excellent        |  Clear reception, low error rate
    10-20 dB  |  Good             |  Reliable communication
    0-10 dB   |  Poor             |  Many errors, FEC required
    < 0 dB    |  Very Poor        |  Noise stronger than signal

## SNR Formula

    SNR (linear) = Signal Power / Noise Power

    SNR (dB) = 10 · log(Signal Power / Noise Power)

## SNR in Chimera

In Chimera's simulation, you control the **channel
SNR**, which determines how much noise is added to the transmitted
signal:

| Setting                 | Description    | Constellation         |
|:------------------------|:---------------|:----------------------|
| **High SNR** (-5 dB)    | Minimal noise  | Tight clusters        |
| **Medium SNR** (-15 dB) | Moderate noise | Visible scatter       |
| **Low SNR** (-25 dB)    | Heavy noise    | Large scatter, errors 
                                            likely                 |

### Processing Gain

Chimera achieves approximately **35 dB of processing gain** through
symbol averaging and oversampling. This means:

    Effective SNR = Channel SNR + Processing Gain
                  = -25 dB + 35 dB
                  = 10 dB (after processing)

This is why the system can operate reliably even with very low channel
SNR values.

## SNR vs Es/N0

In Chimera's UI, “Channel SNR (dB)” represents
**Es/N0** (symbol energy to noise ratio): - **Before
processing**: Low Es/N0 (e.g., -25 dB) - **After processing gain**:
Higher effective SNR (~10 dB) - **LDPC threshold**:
Fails below -27 dB channel SNR

## Impact on Performance

### High SNR (\>15 dB)

- Perfect constellation separation

- Zero or near-zero bit errors

- FEC not strictly needed

- BER:
  \<10\textsuperscript{-}\textsuperscript{6}

### Medium SNR (5-15 dB)

- Visible constellation scatter

- Some bit errors occur

- FEC recommended

- BER:
  10\textsuperscript{-}\textsuperscript{3}
  to
  10\textsuperscript{-}\textsuperscript{6}

### Low SNR (\<5 dB)

- Heavy constellation scatter

- Many bit errors

- FEC required

- BER:
  \>10\textsuperscript{-}\textsuperscript{3}

## See Also

- \[\[Energy-Ratios-(Es-N0-and-Eb-N0)\]\] - Related energy metrics

- \[\[Additive-White-Gaussian-Noise-(AWGN)\]\] - What creates the
  noise

- \[\[Bit-Error-Rate-(BER)\]\] - How SNR affects errors

- \[\[Constellation-Diagrams\]\] - Visualizing SNR impact
