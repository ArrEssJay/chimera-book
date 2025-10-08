#!/bin/bash
# Batch create visual assessment issues - simplified version
# Usage: ./batch_create_issues.sh

REPO="ArrEssJay/chimera-book"

echo "Creating 61 visual assessment issues..."
echo ""

# Create issues for all chapters in parallel batches
gh issue create --repo "$REPO" --title "Visual Fix: Maxwell's Equations & Wave Propagation" --body "Review latex/chapters/Maxwell's-Equations-&-Wave-Propagation.tex for overlapping text, alignment issues, and graphics problems. Compile book, inspect visually, fix LaTeX source." &
gh issue create --repo "$REPO" --title "Visual Fix: Electromagnetic Spectrum" --body "Review latex/chapters/Electromagnetic-Spectrum.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Wave Polarization" --body "Review latex/chapters/Wave-Polarization.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Power Density & Field Strength" --body "Review latex/chapters/Power-Density-&-Field-Strength.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Baseband vs Passband Signals" --body "Review latex/chapters/Baseband-vs-Passband-Signals.tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: IQ Representation" --body "Review latex/chapters/IQ-Representation.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Constellation Diagrams" --body "Review latex/chapters/Constellation-Diagrams.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Signal-to-Noise Ratio (SNR)" --body "Review latex/chapters/Signal-to-Noise-Ratio-(SNR).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Energy Ratios (Es/N0 and Eb/N0)" --body "Review latex/chapters/Energy-Ratios-(Es-N0-and-Eb-N0).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Bit Error Rate (BER)" --body "Review latex/chapters/Bit-Error-Rate-(BER).tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: Noise Sources & Noise Figure" --body "Review latex/chapters/Noise-Sources-&-Noise-Figure.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Shannon's Channel Capacity Theorem" --body "Review latex/chapters/Shannon's-Channel-Capacity-Theorem.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Binary Phase-Shift Keying (BPSK)" --body "Review latex/chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: On-Off Keying (OOK)" --body "Review latex/chapters/On-Off-Keying-(OOK).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Amplitude Shift Keying (ASK)" --body "Review latex/chapters/Amplitude-Shift-Keying-(ASK).tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: Frequency Shift Keying (FSK)" --body "Review latex/chapters/Frequency-Shift-Keying-(FSK).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: QPSK Modulation" --body "Review latex/chapters/QPSK-Modulation.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: 8PSK & Higher-Order PSK" --body "Review latex/chapters/8PSK-&-Higher-Order-PSK.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Quadrature Amplitude Modulation (QAM)" --body "Review latex/chapters/Quadrature-Amplitude-Modulation-(QAM).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Channel Models (Rayleigh & Rician)" --body "Review latex/chapters/Channel-Models-(Rayleigh-&-Rician).tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: Multipath Propagation & Fading" --body "Review latex/chapters/Multipath-Propagation-&-Fading-(Rayleigh,-Rician).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Channel Equalization" --body "Review latex/chapters/Channel-Equalization.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Free-Space Path Loss (FSPL)" --body "Review latex/chapters/Free-Space-Path-Loss-(FSPL).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Propagation Modes" --body "Review latex/chapters/Propagation-Modes-(Ground-Wave,-Sky-Wave,-Line-of-Sight).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Atmospheric Effects" --body "Review latex/chapters/Atmospheric-Effects-(Ionospheric,-Tropospheric).tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: Weather Effects (Rain Fade, Fog)" --body "Review latex/chapters/Weather-Effects-(Rain-Fade,-Fog-Attenuation).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Link Loss vs Noise" --body "Review latex/chapters/Link-Loss-vs-Noise.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Complete Link Budget Analysis" --body "Review latex/chapters/Complete-Link-Budget-Analysis.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Hamming Distance & Error Detection" --body "Review latex/chapters/Hamming-Distance-&-Error-Detection.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Block Codes (Hamming, BCH, Reed-Solomon)" --body "Review latex/chapters/Block-Codes-(Hamming,-BCH,-Reed-Solomon).tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: Convolutional Codes & Viterbi Decoding" --body "Review latex/chapters/Convolutional-Codes-&-Viterbi-Decoding.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Turbo Codes" --body "Review latex/chapters/Turbo-Codes.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: LDPC Codes" --body "Review latex/chapters/LDPC-Codes.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Polar Codes" --body "Review latex/chapters/Polar-Codes.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: OFDM & Multicarrier Modulation" --body "Review latex/chapters/OFDM-&-Multicarrier-Modulation.tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: Spread Spectrum (DSSS/FHSS)" --body "Review latex/chapters/Spread-Spectrum-(DSSS-FHSS).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: MIMO & Spatial Multiplexing" --body "Review latex/chapters/MIMO-&-Spatial-Multiplexing.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Adaptive Modulation & Coding (AMC)" --body "Review latex/chapters/Adaptive-Modulation-&-Coding-(AMC).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Synchronization (Carrier, Timing, Frame)" --body "Review latex/chapters/Synchronization-(Carrier,-Timing,-Frame).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Spectral Efficiency & Bit Rate" --body "Review latex/chapters/Spectral-Efficiency-&-Bit-Rate.tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: Signal Chain (End-to-End Processing)" --body "Review latex/chapters/Signal-Chain-(End-to-End-Processing).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Real-World System Examples" --body "Review latex/chapters/Real-World-System-Examples.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Antenna Theory Basics" --body "Review latex/chapters/Antenna-Theory-Basics.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: mmWave & THz Communications" --body "Review latex/chapters/mmWave-&-THz-Communications.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Terahertz (THz) Technology" --body "Review latex/chapters/Terahertz-(THz)-Technology.tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: AID Protocol Case Study" --body "Review latex/chapters/AID-Protocol-Case-Study.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Military & Covert Communications" --body "Review latex/chapters/Military-&-Covert-Communications.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Acoustic Heterodyning" --body "Review latex/chapters/Acoustic-Heterodyning.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Biophysical Coupling Mechanism" --body "Review latex/chapters/Biophysical-Coupling-Mechanism.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Frey Microwave Auditory Effect" --body "Review latex/chapters/Frey-Microwave-Auditory-Effect.tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: Non-Linear Biological Demodulation" --body "Review latex/chapters/Non-Linear-Biological-Demodulation.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Intermodulation Distortion in Biology" --body "Review latex/chapters/Intermodulation-Distortion-in-Biology.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Microtubule Structure and Function" --body "Review latex/chapters/Microtubule-Structure-and-Function.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Orchestrated Objective Reduction (Orch-OR)" --body "Review latex/chapters/Orchestrated-Objective-Reduction-(Orch-OR).tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: THz Propagation in Biological Tissue" --body "Review latex/chapters/THz-Propagation-in-Biological-Tissue.tex for overlapping text, alignment issues, and graphics problems." &

wait
sleep 3

gh issue create --repo "$REPO" --title "Visual Fix: THz Bioeffects (Thermal and Non-Thermal)" --body "Review latex/chapters/THz-Bioeffects-Thermal-and-Non-Thermal.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: THz Resonances in Microtubules" --body "Review latex/chapters/THz-Resonances-in-Microtubules.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Hyper-Rotational Physics (HRP) Framework" --body "Review latex/chapters/Hyper-Rotational-Physics-(HRP)-Framework.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Formula Reference Card" --body "Review latex/chapters/Formula-Reference-Card.tex for overlapping text, alignment issues, and graphics problems." &
gh issue create --repo "$REPO" --title "Visual Fix: Bibliography" --body "Review latex/chapters/Bibliography.tex for overlapping text, alignment issues, and graphics problems." &

wait

echo ""
echo "✅ All 61 visual assessment issues created!"
echo "View them: gh issue list --repo $REPO --search 'Visual Fix' --limit 100"
