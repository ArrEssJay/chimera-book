---
layout: chapter
title: "Bit-Error-Rate-(BER)"
chapter: 15
permalink: /chapters/bit-error-rate-(ber)/
---

# Bit Error Rate (BER)

##  For Non-Technical Readers

**BER measures how many mistakes happen when transmitting digital
data---like counting typos in a text message.**

When you send data wirelessly, noise can flip bits
(0\$\leftrightarrow\$1 or
1\$\leftrightarrow\$0). BER counts how often this happens.

**Real examples**: - **Pixelated video**: High BER
\$\rightarrow\$ corrupted data
\$\rightarrow\$ artifacts - **Dropped calls**: BER
\>
10\textsuperscript{-}\textsuperscript{3}
(1 error per 1000 bits) \$\rightarrow\$ bad quality -
**Corrupted downloads**: Even 1 flipped bit can break a file!

**Acceptable levels**: Voice =
10\textsuperscript{-}\textsuperscript{3}
OK, Data = need \<
10\textsuperscript{-}\textsuperscript{6},
Banking = \<
10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2}

**Improve BER**: Move closer to WiFi, use error correction, slow
down transmission rate.

**Fun fact**: WiFi automatically adjusts speed based on
BER---closer = faster (low errors), farther = slower (keep errors
acceptable).

<div class="center">

------------------------------------------------------------------------

</div>

**Bit Error Rate (BER)** is the ratio of incorrectly decoded bits
to total transmitted bits.

## Definition

    BER = Number of Bit Errors / Total Number of Bits

## BER Scale

BER is typically expressed as a decimal or in scientific notation:

| BER Value | Meaning | Quality |
|:---|:---|:---|
| \textsuperscript{-}\textsuperscript{1} | 1 error per 10 bits | Terrible |
| 10\textsuperscript{-}\textsuperscript{2} | 1 error per 100 bits | Very Poor |
| 10\textsuperscript{-}\textsuperscript{3} | 1 error per 1,000 bits | Poor |
| 10\textsuperscript{-}\textsuperscript{4} | 1 error per 10,000 bits | Marginal |
| 10\textsuperscript{-}\textsuperscript{6} | 1 error per 1,000,000 bits | Good |
| 10\textsuperscript{-}\textsuperscript{9} | 1 error per 1 billion bits | Excellent |
| 10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2} | 1 error per 1 trillion bits | Exceptional |

## Pre-FEC vs Post-FEC BER

### Pre-FEC BER

Error rate **before** error correction - Directly reflects channel
quality - Higher at low SNR - Called “raw BER” or “channel BER”

### Post-FEC BER

Error rate **after** error correction (LDPC decoding) - Shows
effectiveness of error correction - Should be much lower than Pre-FEC -
The “residual errors” that couldn't be corrected

    Example:
    Pre-FEC BER:  10² (1 error per 100 bits)
                  
            [LDPC Decoder]
                  
    Post-FEC BER: 10 (1 error per million bits)

    Coding Gain: 40 dB improvement! 

## BER vs SNR Curves

A BER vs SNR curve shows system performance:

    BER
     
     |         
    10|        Unusable
       |        
    10³|        Poor
       |      
    10|        ___ Good (threshold)
       |            +___
    10|                +___ Excellent
       |
       +--------------------- SNR (dB)
        -5  0   5  10  15  20

### Key Features

- **Waterfall region**: Steep decrease in BER as SNR increases

- **Threshold**: SNR where BER becomes acceptable (often
  10\textsuperscript{-}\textsuperscript{6})

- **Error floor**: Minimum achievable BER (implementation limits)

## Theoretical vs Measured BER

### Theoretical BER for QPSK

    BER_QPSK  (1/2) · erfc((Eb/N0))

### In Chimera

- **Theoretical**: Based on the formula above

- **Measured**: Actual errors observed in simulation

- **Difference**: Processing gain, implementation effects, finite
  sample size

## Factors Affecting BER

1.  **\[\[Signal-to-Noise-Ratio-(SNR)\]\]**: Primary factor

    - Higher SNR \$\rightarrow\$ Lower BER

2.  **Modulation Scheme**:

    - QPSK more robust than 16QAM

    - Lower order = better BER at same SNR

3.  **\[\[Forward-Error-Correction-(FEC)\]\]**:

    - Can reduce BER by orders of magnitude

    - LDPC codes provide near-optimal performance

4.  **Channel Impairments**:

    - Phase noise, frequency offset

    - Timing errors, multipath

5.  **Implementation**:

    - Quantization effects

    - Synchronization accuracy

## BER in Chimera

Chimera displays multiple BER metrics:

### Pre-FEC Metrics

- **Symbol Errors**: Count of incorrect symbol decisions

- **Bit Errors (Pre-FEC)**: Bit errors before LDPC decoding

- **Pre-FEC BER**: Bit error rate at demodulator output

### Post-FEC Metrics

- **Bit Errors (Post-FEC)**: Residual errors after LDPC

- **Post-FEC BER**: Final bit error rate

- **Frame Error Rate (FER)**: Percentage of frames with
  uncorrectable errors

### Example Output

    Pre-FEC BER:  2.3 × 10² (2.3% bit errors)
    Post-FEC BER: 0 (all errors corrected!) 
    FER:          0% (no frame errors)

## Acceptable BER Thresholds

Different applications have different requirements:

| Application | Required BER | Rationale |
|:---|:---|:---|
| Voice (analog) | 10\textsuperscript{-}\textsuperscript{3} | Some crackling acceptable |
| Data (with retransmission) | 10\textsuperscript{-}\textsuperscript{4}
-
10\textsuperscript{-}\textsuperscript{6} | Retries handle errors |
| Streaming video | 10\textsuperscript{-}\textsuperscript{6} | Occasional glitch OK |
| File transfer | 10\textsuperscript{-}\textsuperscript{9} | Data integrity critical |
| Financial transactions | 10\textsuperscript{-}\textsuperscript{1}\textsuperscript{2} | Zero tolerance |

## See Also

- \[\[Signal-to-Noise-Ratio-(SNR)\]\] - Primary BER determinant

- \[\[Forward-Error-Correction-(FEC)\]\] - BER improvement technique

- \[\[Energy-Ratios-(Es-N0-and-Eb-N0)\]\] - Used in BER formulas

- \[\[Understanding BER Curves\]\] - Interpreting performance plots
