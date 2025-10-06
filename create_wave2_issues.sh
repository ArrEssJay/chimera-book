#!/bin/bash

# Wave 2: Core Modulation - 7 chapters

chapters=(
  "QPSK-Modulation:QPSK (Quadrature Phase-Shift Keying):4 phase states, 2 bits/symbol, DVB-S/GPS"
  "8PSK-&-Higher-Order-PSK:8PSK and Higher-Order PSK:8 phase states, 3 bits/symbol, satellite"
  "Quadrature-Amplitude-Modulation-(QAM):QAM (Quadrature Amplitude Modulation):Combined amplitude+phase, high spectral efficiency"
  "Frequency-Shift-Keying-(FSK):FSK (Frequency-Shift Keying):Frequency modulation, robust, IoT/LoRa"
  "Amplitude-Shift-Keying-(ASK):ASK (Amplitude-Shift Keying):Amplitude modulation, simple, fiber optics"
  "On-Off-Keying-(OOK):OOK (On-Off Keying):Binary ASK, simplest modulation, RFID"
  "Binary-Phase-Shift-Keying-(BPSK):BPSK (Binary Phase-Shift Keying):Update original with exemplar improvements"
)

for chapter_data in "${chapters[@]}"; do
  IFS=':' read -r filename title description <<< "$chapter_data"
  
  gh issue create \
    --title "[Wave 2] $title" \
    --label "wave-2,priority-1,chapter-production" \
    --body "## Chapter: $title

**File:** \`chapters/${filename}.tex\`
**Wave:** 2 - Core Modulation Techniques
**Priority:** 1 (Critical Path)

### Overview
$description

### Acceptance Criteria
- [ ] Professional LaTeX formatting following exemplar
- [ ] Numbered equations with variable definitions
- [ ] TikZ constellation diagram with grid
- [ ] TikZ modulator/demodulator block diagrams
- [ ] Professional callout boxes (keyconcept, warningbox)
- [ ] Worked example with complete calculation
- [ ] BER performance analysis
- [ ] Applications section (real-world systems)
- [ ] Advantages/disadvantages
- [ ] Cross-references using \\\ref{ch:name}
- [ ] Summary section
- [ ] Further Reading
- [ ] Compiles without errors
- [ ] Matches exemplar quality

### Resources
- **Exemplar:** \`chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex\`
- **Style Guide:** \`STYLE_GUIDE.md\`
- **Helper:** \`./produce_chapter.sh ${filename}\`
- **Test:** \`pdflatex test_${filename}.tex\`

### Definition of Done
✅ Compiles cleanly
✅ Visual inspection passes
✅ Technical accuracy verified
✅ Committed to main"
    
  echo "✓ Created issue for: $title"
  sleep 1
done

echo ""
echo "🎉 All Wave 2 issues created!"
