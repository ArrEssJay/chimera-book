#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/latex/chapters"

echo "Preparing to rename chapter files to simplified, filesystem-safe names..."

declare -A rename_map=(
    ["Maxwell's-Equations-&-Wave-Propagation.tex"]="Maxwells-Equations-and-Wave-Propagation.tex"
    ["Power-Density-&-Field-Strength.tex"]="Power-Density-and-Field-Strength.tex"
    ["Signal-to-Noise-Ratio-(SNR).tex"]="Signal-to-Noise-Ratio-SNR.tex"
    ["Energy-Ratios-(Es-N0-and-Eb-N0).tex"]="Energy-Ratios-Es-N0-and-Eb-N0.tex"
    ["Bit-Error-Rate-(BER).tex"]="Bit-Error-Rate-BER.tex"
    ["Additive-White-Gaussian-Noise-(AWGN).tex"]="Additive-White-Gaussian-Noise-AWGN.tex"
    ["Noise-Sources-&-Noise-Figure.tex"]="Noise-Sources-and-Noise-Figure.tex"
    ["Shannon's-Channel-Capacity-Theorem.tex"]="Shannons-Channel-Capacity-Theorem.tex"
    ["Binary-Phase-Shift-Keying-(BPSK).tex"]="Binary-Phase-Shift-Keying-BPSK.tex"
    ["Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex"]="Binary-Phase-Shift-Keying-BPSK.tex"
    ["On-Off-Keying-(OOK).tex"]="On-Off-Keying-OOK.tex"
    ["Amplitude-Shift-Keying-(ASK).tex"]="Amplitude-Shift-Keying-ASK.tex"
    ["Frequency-Shift-Keying-(FSK).tex"]="Frequency-Shift-Keying-FSK.tex"
    ["8PSK-&-Higher-Order-PSK.tex"]="8PSK-and-Higher-Order-PSK.tex"
    ["Quadrature-Amplitude-Modulation-(QAM).tex"]="Quadrature-Amplitude-Modulation-QAM.tex"
    ["Free-Space-Path-Loss-(FSPL).tex"]="Free-Space-Path-Loss-FSPL.tex"
    ["Channel-Models-(Rayleigh-&-Rician).tex"]="Channel-Models-Rayleigh-and-Rician.tex"
    ["Multipath-Propagation-&-Fading-(Rayleigh,-Rician).tex"]="Multipath-Propagation-and-Fading-Rayleigh-Rician.tex"
    ["Propagation-Modes-(Ground-Wave,-Sky-Wave,-Line-of-Sight).tex"]="Propagation-Modes-Ground-Wave-Sky-Wave-Line-of-Sight.tex"
    ["Atmospheric-Effects-(Ionospheric,-Tropospheric).tex"]="Atmospheric-Effects-Ionospheric-Tropospheric.tex"
    ["Weather-Effects-(Rain-Fade,-Fog-Attenuation).tex"]="Weather-Effects-Rain-Fade-Fog-Attenuation.tex"
    ["Block-Codes-(Hamming,-BCH,-Reed-Solomon).tex"]="Block-Codes-Hamming-BCH-Reed-Solomon.tex"
    ["Convolutional-Codes-&-Viterbi-Decoding.tex"]="Convolutional-Codes-and-Viterbi-Decoding.tex"
    ["OFDM-&-Multicarrier-Modulation.tex"]="OFDM-and-Multicarrier-Modulation.tex"
    ["Spread-Spectrum-(DSSS-FHSS).tex"]="Spread-Spectrum-DSSS-FHSS.tex"
    ["MIMO-&-Spatial-Multiplexing.tex"]="MIMO-and-Spatial-Multiplexing.tex"
    ["Adaptive-Modulation-&-Coding-(AMC).tex"]="Adaptive-Modulation-and-Coding-AMC.tex"
    ["Synchronization-(Carrier,-Timing,-Frame).tex"]="Synchronization-Carrier-Timing-Frame.tex"
    ["Spectral-Efficiency-&-Bit-Rate.tex"]="Spectral-Efficiency-and-Bit-Rate.tex"
    ["Signal-Chain-(End-to-End-Processing).tex"]="Signal-Chain-End-to-End-Processing.tex"
    ["Terahertz-(THz)-Technology.tex"]="Terahertz-THz-Technology.tex"
    ["mmWave-&-THz-Communications.tex"]="mmWave-and-THz-Communications.tex"
    ["Military-&-Covert-Communications.tex"]="Military-and-Covert-Communications.tex"
    ["Orchestrated-Objective-Reduction-(Orch-OR).tex"]="Orchestrated-Objective-Reduction-Orch-OR.tex"
    ["Hyper-Rotational-Physics-(HRP)-Framework.tex"]="Hyper-Rotational-Physics-HRP-Framework.tex"
)

for old in "${!rename_map[@]}"; do
    new=${rename_map[$old]}
    if [ -f "$old" ] && [ "$old" != "$new" ]; then
        if [ -f "$new" ]; then
            echo "Target exists: $new; skipping rename of $old (you may want to inspect duplicates)"
            # If new exists but old is exemplar, prefer exemplar -> replace
            if [[ "$old" == *EXEMPLAR* ]]; then
                echo "EXEMPLAR detected: moving $old over $new"
                git mv -f "$old" "$new" 2>/dev/null || mv -f "$old" "$new"
            fi
        else
            echo "Renaming: $old -> $new"
            git mv "$old" "$new" 2>/dev/null || mv "$old" "$new"
        fi
    fi
done

echo "Rename operation complete. Please review with 'git status' and run 'git add'/'git commit' if desired."
