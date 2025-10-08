#!/bin/bash
# Create GitHub Issues for visual assessment of each chapter
# Usage: ./create_chapter_issues.sh

set -e

REPO="ArrEssJay/chimera-book"

# Check dependencies
command -v gh >/dev/null 2>&1 || { echo "Error: GitHub CLI not found. Install with: brew install gh"; exit 1; }

# Check if authenticated
gh auth status >/dev/null 2>&1 || { echo "Error: Not authenticated with GitHub CLI. Run: gh auth login"; exit 1; }

echo "Creating visual assessment issues for all chapters..."
echo ""

# List of all chapters (extracted from chimera-book.tex)
CHAPTERS=(
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

for CHAPTER in "${CHAPTERS[@]}"; do
    # Create human-readable title
    TITLE=$(echo "$CHAPTER" | sed 's/-/ /g' | sed 's/[()\&]//g')
    
    echo "📝 Creating issue for: $TITLE"
    
    # Create issue body
    ISSUE_BODY="## 🎨 Visual Quality Assessment

**Chapter:** ${TITLE}  
**File:** \`_latex/chapters/${CHAPTER}.tex\`

---

## 🔍 Assessment Checklist

@copilot Please build the book, visually inspect this chapter in the PDF, and fix any layout issues:

### 1. Text Overlaps ❌
- [ ] Text colliding with graphics
- [ ] Equations overlapping callout boxes  
- [ ] Labels obscuring diagram elements
- [ ] Math symbols overlapping text

### 2. Alignment Issues ❌
- [ ] Misaligned equation numbers
- [ ] TikZ diagrams extending beyond margins
- [ ] Table columns not properly aligned
- [ ] Callout boxes breaking page layout

### 3. Graphics Problems ❌
- [ ] Figures too large/small for page width
- [ ] Poor label positioning in TikZ diagrams
- [ ] Inconsistent font sizes in diagrams
- [ ] Graphics splitting awkwardly across pages
- [ ] Diagram elements cut off at margins

### 4. Typography Issues ❌
- [ ] Poor spacing around math mode
- [ ] Font size inconsistencies
- [ ] Bad line breaks in equations
- [ ] Orphaned headings or widows

---

## 🛠️ How to Fix

1. **Build:** \`cd _latex && xelatex chimera-book.tex\`
2. **Locate chapter** in \`chimera-book.pdf\`  
3. **Identify issues** visually on each page
4. **Fix LaTeX** in \`_latex/chapters/${CHAPTER}.tex\`:
   - Adjust \`\\vspace{}\`, \`\\hspace{}\` for spacing
   - Modify TikZ \`node\` positions and anchors
   - Resize graphics: \`[width=0.8\\textwidth]\`
   - Reposition callout boxes
   - Add \`\\FloatBarrier\` if needed
5. **Rebuild** to verify fixes
6. **Create PR** with changes

---

## ✅ Success Criteria

- All text clearly readable without overlaps
- Graphics properly sized within page margins  
- TikZ labels positioned for clarity
- Consistent spacing throughout
- Professional appearance (BPSK exemplar quality)

---

**Priority:** Visual Quality  
**Type:** Layout Fix  
**Effort:** 15-30 minutes"

    # Create the issue
    gh issue create \
        --repo "$REPO" \
        --title "[Visual Fix] ${TITLE}" \
        --body "$ISSUE_BODY" \
        --label "visual-quality,agentic-task,copilot" \
        2>/dev/null && echo "  ✓ Issue created" || echo "  ⚠ Issue creation failed"
    
    ((ISSUE_COUNT++))
    echo ""
    
    # Small delay to avoid rate limiting
    sleep 0.5
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Created ${ISSUE_COUNT} visual assessment issues"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Issues are now available for @copilot agents."
echo ""
echo "View all: gh issue list --repo $REPO --label visual-quality"
