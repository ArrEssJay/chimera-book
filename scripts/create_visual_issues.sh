#!/bin/bash
# Create GitHub Issues for visual assessment of each chapter
# Usage: ./create_visual_issues.sh

set -e

REPO="ArrEssJay/chimera-book"

# Check dependencies
command -v gh >/dev/null 2>&1 || { echo "Error: GitHub CLI not found."; exit 1; }

echo "Creating visual assessment issues for all chapters..."
echo ""

# All 61 chapters from the book
declare -a CHAPTERS=(
    "Maxwell's-Equations-&-Wave-Propagation"
    "Electromagnetic-Spectrum"
    "Wave-Polarization"
    "Power-Density-&-Field-Strength"
    "Baseband-vs-Passband-Signals"
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

ISSUE_COUNT=0
FAILED_COUNT=0

for CHAPTER in "${CHAPTERS[@]}"; do
    # Create readable title
    TITLE=$(echo "$CHAPTER" | sed 's/-/ /g' | sed 's/[()\&]//g' | sed 's/  / /g')
    
    echo "📝 Creating issue for: $TITLE"
    
    # Create issue body
    BODY="## 🎨 Visual Quality Assessment Required

**Chapter:** ${TITLE}  
**File:** `latex/chapters/${CHAPTER}.tex`

---

## 🔍 Assessment Checklist

Please compile the book and visually inspect this chapter for the following issues:

### ✅ Text & Graphics
- [ ] No text overlapping with graphics
- [ ] No text overlapping with equations
- [ ] No text overlapping with callout boxes
- [ ] Labels clearly readable and positioned well

### ✅ Alignment
- [ ] Equation numbers properly aligned
- [ ] TikZ diagrams within page margins
- [ ] Table columns properly aligned
- [ ] Callout boxes properly positioned

### ✅ Graphics Quality
- [ ] Figures appropriately sized for page
- [ ] TikZ labels positioned clearly
- [ ] Font sizes consistent in diagrams
- [ ] No graphics split awkwardly across pages

### ✅ Typography
- [ ] Proper spacing around math mode
- [ ] Consistent font usage
- [ ] No orphaned lines or widows
- [ ] Professional appearance

---

## 🛠️ How to Fix

1. **Compile:** `cd latex && xelatex chimera-book.tex`
2. **Locate:** Find this chapter in \`chimera-book.pdf\`
3. **Identify:** Note specific line numbers with issues
4. **Fix:** Modify `latex/chapters/${CHAPTER}.tex`:
   - Adjust spacing: \`\\vspace{1em}\`, \`\\hspace{0.5cm}\`
   - Resize graphics: \`[width=0.8\\textwidth]\`
   - Reposition TikZ nodes
   - Adjust callout box placement
5. **Test:** Rebuild and verify fixes
6. **PR:** Create PR with fixes

---

**Labels:** visual-quality, agentic-task  
**Priority:** Medium  
**Effort:** 15-30 minutes"

    # Create issue with error handling
    if gh issue create \
        --repo "$REPO" \
        --title "Visual Fix: ${TITLE}" \
        --body "$BODY" \
        --label "visual-quality,agentic-task" 2>/dev/null; then
        ((ISSUE_COUNT++))
        echo "  ✓ Issue created successfully"
    else
        ((FAILED_COUNT++))
        echo "  ✗ Failed (may already exist or rate limit)"
    fi
    
    echo ""
    
    # Rate limit protection
    sleep 2
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Created: ${ISSUE_COUNT} issues"
echo "❌ Failed: ${FAILED_COUNT} issues"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "View issues: gh issue list --repo $REPO --label visual-quality"
