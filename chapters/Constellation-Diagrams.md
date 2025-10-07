---
layout: chapter
title: "Constellation-Diagrams"
chapter: 20
permalink: /chapters/constellation-diagrams/
---

# Constellation Diagrams

##  For Non-Technical Readers

**A constellation diagram is like a visual map showing all the
“hand signals” your WiFi/phone can use to send data---each dot is
a unique signal position!**

**The analogy - Lighthouse signals**: - Imagine
you're communicating with lighthouse beams - You can
vary: **brightness** (amplitude) and **color** (phase) - Each
unique combination = one symbol (represents some bits) - Constellation
diagram = map showing all possible combinations!

**Real example - QPSK (4 dots)**:

         Q
         
        |      4 positions = 2 bits per symbol
    -----+----- I
        |  

- Top-right \$\bullet\$ = “00”

- Top-left \$\bullet\$ = “01”

- Bottom-left \$\bullet\$ = “10”

- Bottom-right \$\bullet\$ = “11”

**Why dots matter**: - **More dots** = more data per symbol =
faster! - QPSK: 4 dots (2 bits/symbol) - 16-QAM: 16 dots (4 bits/symbol)
= 2\$\times\$ faster - 256-QAM: 256 dots (8 bits/symbol) =
4\$\times\$ faster! - **Dots closer together** =
harder to distinguish when noisy - Your phone uses fewer dots when
signal is weak (reliable) - Uses more dots when signal is strong (fast!)

**When you see it**: - **WiFi speed negotiation**:
“Constellation: 64-QAM” = using 64-dot map - **Spectrum
analyzer**: Shows received dots scattered around ideal positions (noise!)
- **Signal quality**: Dots tight = good signal, dots spread out =
noisy channel

**Fun fact**: Your WiFi constantly monitors how scattered the
received dots are and automatically switches between constellations
(4/16/64/256/1024-QAM) to optimize speed vs reliability!

<div class="center">

------------------------------------------------------------------------

</div>

A **constellation diagram** is a visual representation of a digital
modulation scheme. It shows all possible symbol positions in the I/Q
plane.

## Reading a Constellation Diagram

          Q (Imaginary)
               
               |
          +----+----+
          |   |   |  Each dot represents
          |    |    |  a valid symbol position
       ---+----+----+--- I (Real)
          |    |    |
          |   |   |
          +----+----+
               |

## Key Elements

1.  **Ideal Points**: Perfect symbol positions (clean transmission)

2.  **Received Cloud**: Actual received symbols scattered due to
    noise

3.  **Decision Boundaries**: Regions that determine which symbol was
    sent

## TX vs RX Constellations

### TX Constellation (Transmitter)

- Shows ideal symbol positions

- Points are crisp and perfectly positioned

- Represents what was intended to be transmitted

### RX Constellation (Receiver)

- Shows received symbol positions after channel effects

- Points are scattered in clouds around ideal positions

- Scattering indicates noise level and channel quality

- Larger scatter = more noise = harder to decode correctly

## What the Constellation Tells You

| Pattern          | Meaning                   | Quality             |
|:-----------------|:--------------------------|:--------------------|
| Tight clusters   | Low noise, high SNR       | Excellent           |
| Scattered clouds | High noise, low SNR       | Poor                |
| Symbol overlap   | Very poor signal quality  | Critical            |
| Pattern offset   | Frequency or phase errors | Requires correction |

## Example: QPSK Constellation at Different SNR Levels

### High SNR (-5 dB Channel)

      Q
      
     |       Tight clusters
    --+-- I    Perfect separation
     | 

### Medium SNR (-15 dB Channel)

      Q
      
    |     Visible scatter
    |    Still decodable
    ----+---- I
    | 
    |

### Low SNR (-25 dB Channel)

      Q
      
     |     Heavy scatter
    |   Errors likely
    |  FEC required
    -----+----- I
    |
    |
     |

## Observing Constellations in Chimera

When you run a simulation:

1.  **TX Constellation Panel**: See the ideal QPSK symbol positions

2.  **RX Constellation Panel**: See how noise scatters the received
    symbols

3.  **Adjust SNR**: Watch how constellation quality changes in
    real-time

The constellation is the most intuitive way to understand signal
quality!

## See Also

- \[\[QPSK-Modulation\]\] - The modulation scheme being visualized

- \[\[Signal-to-Noise-Ratio-(SNR)\]\] - What controls the scatter

- \[\[IQ-Representation\]\] - The coordinate system

- \[\[Reading the Constellation\]\] - Practical interpretation guide
