#!/bin/bash
# Create GitHub PRs for visual assessment of each chapter
# Usage: ./create_chapter_prs.sh

set -e

REPO="ArrEssJay/chimera-book"
BASE_BRANCH="main"
ISSUE_TEMPLATE="../_visual_review/issue_template.md"
CHAPTERS_FILE="../_visual_review/chapters_list.txt"

# Check dependencies
command -v gh >/dev/null 2>&1 || { echo "Error: GitHub CLI not found. Install with: brew install gh"; exit 1; }

# Check if authenticated
gh auth status >/dev/null 2>&1 || { echo "Error: Not authenticated with GitHub CLI. Run: gh auth login"; exit 1; }

echo "Creating visual assessment PRs for all chapters..."
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

PR_COUNT=0

for CHAPTER in "${CHAPTERS[@]}"; do
    # Clean chapter name for branch and title
    CLEAN_NAME=$(echo "$CHAPTER" | sed 's/[()\&]//g' | sed 's/,/-/g' | sed 's/--/-/g')
    BRANCH_NAME="copilot/visual-fix-${CLEAN_NAME}"
    
    # Create human-readable title
    TITLE=$(echo "$CHAPTER" | sed 's/-/ /g' | sed 's/[()\&]//g')
    
    echo "📝 Creating PR for: $TITLE"
    
    # Create branch
    cd /Users/rowan/VSCode/chimera/book
    git checkout -b "$BRANCH_NAME" 2>/dev/null || git checkout "$BRANCH_NAME"
    
    # Create a marker file to trigger PR
    mkdir -p _visual_review/prs
    cat > "_visual_review/prs/${CLEAN_NAME}.md" <<EOF
# Visual Assessment: ${TITLE}

**Chapter File:** `latex/chapters/${CHAPTER}.tex`

## Assessment Required

@copilot Please perform a visual assessment of this chapter for:

1. **Overlapping text** - Check for text collisions with graphics, equations, or callout boxes
2. **Poor alignment** - Verify proper alignment of:
   - Equations and equation numbers
   - TikZ diagrams and captions
   - Tables and column alignment
   - Callout boxes and margins
3. **Graphics placement** - Ensure figures don't:
   - Overflow page margins
   - Split across page breaks inappropriately
   - Obscure important text
4. **Typography issues** - Check for:
   - Proper spacing around math symbols
   - Consistent font sizing in diagrams
   - Readable label positioning in TikZ graphics

## How to Assess

1. Build the book: \`cd _latex && xelatex chimera-book.tex\`
2. Open \`chimera-book.pdf\` and locate this chapter
3. Review each page visually
4. Identify specific line numbers in `latex/chapters/${CHAPTER}.tex` that need fixes
5. Propose LaTeX corrections (adjust spacing, positioning, sizing)

## Success Criteria

- [ ] No overlapping text or graphics
- [ ] All elements properly aligned within margins
- [ ] TikZ diagrams render cleanly with readable labels
- [ ] Equations positioned correctly with proper spacing
- [ ] Callout boxes don't collide with other elements
- [ ] Professional appearance matching BPSK exemplar standard

## Files to Modify

- `latex/chapters/${CHAPTER}.tex`

**Priority:** Visual quality fix
**Estimated effort:** 15-30 minutes
EOF
    
    git add "_visual_review/prs/${CLEAN_NAME}.md"
    git commit -m "Visual assessment request: ${TITLE}" --quiet 2>/dev/null || true
    
    # Push branch
    git push -u origin "$BRANCH_NAME" --force --quiet 2>/dev/null || echo "  ⚠ Push failed, may need manual push"
    
    # Create PR with @copilot assignment
    PR_BODY="## 🎨 Visual Quality Assessment Required

**Chapter:** ${TITLE}  
**File:** `latex/chapters/${CHAPTER}.tex`

---

## 🔍 What to Check

@copilot Please compile the book, visually inspect this chapter, and fix:

### 1. Text Overlaps
- Text colliding with graphics
- Equations overlapping callout boxes
- Labels obscuring diagram elements

### 2. Alignment Issues
- Misaligned equation numbers
- TikZ diagrams extending beyond margins
- Table columns not properly aligned
- Callout boxes breaking formatting

### 3. Graphics Problems
- Figures too large/small for page
- Poor label positioning in TikZ
- Inconsistent font sizes in diagrams
- Graphics splitting awkwardly across pages

### 4. Typography
- Spacing issues around math mode
- Font size inconsistencies
- Poor line breaking in equations

---

## 📋 Acceptance Criteria

- [ ] All text clearly readable without overlaps
- [ ] Graphics properly sized and positioned within margins
- [ ] TikZ labels positioned for maximum clarity
- [ ] Consistent spacing throughout chapter
- [ ] Professional appearance (BPSK exemplar quality)

---

## 🛠️ How to Fix

1. **Build book:** `cd latex && xelatex chimera-book.tex`
2. **Locate chapter** in \`chimera-book.pdf\`
3. **Identify issues** visually on each page
4. **Fix LaTeX source** in `latex/chapters/${CHAPTER}.tex`:
   - Adjust \`\\vspace{}\`, \`\\hspace{}\` for spacing
   - Modify TikZ node positions
   - Resize graphics with \`[width=0.8\\textwidth]\`
   - Fix callout box placement
5. **Test rebuild** to verify fixes
6. **Mark PR ready for review**

---

**Priority:** Visual Quality  
**Type:** Layout Fix  
**Estimated Time:** 15-30 minutes"

    gh pr create \
        --repo "$REPO" \
        --base "$BASE_BRANCH" \
        --head "$BRANCH_NAME" \
        --title "Visual Fix: ${TITLE}" \
        --body "$PR_BODY" \
        --label "visual-quality,agentic-review" \
        2>/dev/null || echo "  ⚠ PR creation failed, may already exist"
    
    ((PR_COUNT++))
    echo "  ✓ PR #${PR_COUNT} created"
    echo ""
    
    # Small delay to avoid rate limiting
    sleep 1
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Created ${PR_COUNT} visual assessment PRs"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "PRs are now available for @copilot agents to process."
echo "Each PR contains visual assessment instructions."
echo ""
echo "Monitor progress: gh pr list --repo $REPO --label agentic-review"
