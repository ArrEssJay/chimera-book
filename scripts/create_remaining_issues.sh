#!/bin/bash
# Create remaining visual assessment issues sequentially
# More reliable than parallel batches

REPO="ArrEssJay/chimera-book"

echo "Creating remaining visual assessment issues..."
echo ""

# Skip the 5 already created, continue with the rest
CHAPTERS=(
    "IQ-Representation"
    "Constellation-Diagrams"
    "Signal-to-Noise-Ratio-(SNR)"
    "Energy-Ratios-(Es-N0-and-Eb-N0)"
    "Bit-Error-Rate-(BER)"
    "Noise-Sources-&-Noise-Figure"
    "Shannon's-Channel-Capacity-Theorem"
    "Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2"
    "On-Off-Keying-(OOK)"
    "Amplitude-Shift-Keying-(ASK)"
    "Frequency-Shift-Keying-(FSK)"
    "QPSK-Modulation"
    "8PSK-&-Higher-Order-PSK"
    "Quadrature-Amplitude-Modulation-(QAM)"
    "Channel-Models-(Rayleigh-&-Rician)"
    "Multipath-Propagation-&-Fading-(Rayleigh,-Rician)"
    "Channel-Equalization"
    "Free-Space-Path-Loss-(FSPL)"
    "Propagation-Modes-(Ground-Wave,-Sky-Wave,-Line-of-Sight)"
    "Atmospheric-Effects-(Ionospheric,-Tropospheric)"
    "Weather-Effects-(Rain-Fade,-Fog-Attenuation)"
    "Link-Loss-vs-Noise"
    "Complete-Link-Budget-Analysis"
    "Hamming-Distance-&-Error-Detection"
    "Block-Codes-(Hamming,-BCH,-Reed-Solomon)"
    "Convolutional-Codes-&-Viterbi-Decoding"
    "Turbo-Codes"
    "LDPC-Codes"
    "Polar-Codes"
    "OFDM-&-Multicarrier-Modulation"
    "Spread-Spectrum-(DSSS-FHSS)"
    "MIMO-&-Spatial-Multiplexing"
    "Adaptive-Modulation-&-Coding-(AMC)"
    "Synchronization-(Carrier,-Timing,-Frame)"
    "Spectral-Efficiency-&-Bit-Rate"
    "Signal-Chain-(End-to-End-Processing)"
    "Real-World-System-Examples"
    "Antenna-Theory-Basics"
    "mmWave-&-THz-Communications"
    "Terahertz-(THz)-Technology"
    "AID-Protocol-Case-Study"
    "Military-&-Covert-Communications"
    "Acoustic-Heterodyning"
    "Biophysical-Coupling-Mechanism"
    "Frey-Microwave-Auditory-Effect"
    "Non-Linear-Biological-Demodulation"
    "Intermodulation-Distortion-in-Biology"
    "Microtubule-Structure-and-Function"
    "Orchestrated-Objective-Reduction-(Orch-OR)"
    "THz-Propagation-in-Biological-Tissue"
    "THz-Bioeffects-Thermal-and-Non-Thermal"
    "THz-Resonances-in-Microtubules"
    "Hyper-Rotational-Physics-(HRP)-Framework"
    "Formula-Reference-Card"
    "Bibliography"
)

COUNT=0
for CHAPTER in "${CHAPTERS[@]}"; do
    TITLE=$(echo "$CHAPTER" | sed 's/-/ /g' | sed 's/[()\&]//g' | sed 's/  / /g')
    
    echo -n "[$((COUNT+6))/61] Creating: $TITLE ... "
    
    gh issue create --repo "$REPO" \
        --title "Visual Fix: $TITLE" \
--body "**File:** `latex/chapters/${CHAPTER}.tex`

Compile book and visually assess this chapter for:
- Overlapping text/graphics
- Alignment issues  
- Graphics sizing/placement
- Typography problems

Fix LaTeX source and create PR."
        > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo "✓"
    else
        echo "✗ (failed)"
    fi
    
    ((COUNT++))
    sleep 1
done

echo ""
echo "✅ Process complete! Total issues now:"
gh issue list --repo "$REPO" --search "Visual Fix" --limit 100 --json number --jq 'length'
