#!/bin/bash
# Chapter Production Helper Script
# Usage: ./produce_chapter.sh <chapter-basename>
# Example: ./produce_chapter.sh QPSK-Modulation

set -e

CHAPTER_NAME="$1"

if [ -z "$CHAPTER_NAME" ]; then
    echo "❌ Error: No chapter name provided"
    echo "Usage: $0 <chapter-basename>"
    echo "Example: $0 QPSK-Modulation"
    exit 1
fi

CHAPTER_FILE="chapters/${CHAPTER_NAME}.tex"
TEST_FILE="test_${CHAPTER_NAME}.tex"
EXEMPLAR="chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex"

# Check if chapter exists
if [ ! -f "$CHAPTER_FILE" ]; then
    echo "❌ Error: Chapter file not found: $CHAPTER_FILE"
    exit 1
fi

echo "🎯 Starting production workflow for: $CHAPTER_NAME"
echo ""

# Step 1: Create test harness
echo "📝 Step 1: Creating test harness..."
cat > "$TEST_FILE" << EOF
\documentclass[12pt,a4paper,oneside]{book}

\input{preamble}

\begin{document}

\frontmatter
\tableofcontents

\mainmatter
\input{$CHAPTER_FILE}

\end{document}
EOF

echo "  ✓ Test harness created: $TEST_FILE"
echo ""

# Step 2: Initial compilation test
echo "🔨 Step 2: Testing initial compilation..."
if pdflatex -interaction=nonstopmode "$TEST_FILE" > /dev/null 2>&1; then
    echo "  ✅ Chapter compiles (may have warnings)"
else
    echo "  ⚠️  Chapter has compilation errors - review log:"
    echo "  cat ${TEST_FILE%.tex}.log | grep -A 5 '^!'"
fi
echo ""

# Step 3: Show exemplar structure reminder
echo "📚 Step 3: Exemplar structure reminder..."
echo ""
echo "  Your chapter should follow this structure (from exemplar):"
echo ""
echo "  1. Introduction paragraph"
echo "  2. Mathematical Description"
echo "     - Formal equations with \\begin{equation}"
echo "     - Variable definitions in itemized lists"
echo "  3. TikZ Constellation Diagram"
echo "  4. Modulation Process (TikZ block diagram)"
echo "  5. Demodulation Process (TikZ block diagram)"
echo "  6. KEY CONCEPT callout boxes"
echo "  7. Performance Analysis"
echo "     - BER equations"
echo "     - Bandwidth efficiency"
echo "  8. Practical Considerations"
echo "     - Carrier recovery techniques"
echo "     - Implementation challenges"
echo "  9. WORKED EXAMPLE callout"
echo "     - Complete calculation with numbers"
echo "  10. Applications"
echo "      - Real-world systems"
echo "      - Standards (IEEE, etc.)"
echo "  11. Advantages/Disadvantages table"
echo "  12. Summary"
echo "  13. Further Reading"
echo ""

# Step 4: Quality checklist
echo "✅ Step 4: Quality checklist..."
echo ""
echo "  Before marking complete, verify:"
echo ""
echo "  [ ] All inline math converted to \\begin{equation}...\\end{equation}"
echo "  [ ] Variable definitions in itemized lists after equations"
echo "  [ ] TikZ constellation diagram with grid"
echo "  [ ] TikZ block diagrams (modulator + demodulator)"
echo "  [ ] Professional callout boxes:"
echo "      [ ] keyconcept (KEY CONCEPT)"
echo "      [ ] warningbox (CRITICAL REQUIREMENT)"
echo "      [ ] calloutbox for worked examples"
echo "  [ ] Worked example with complete calculation"
echo "  [ ] BER performance analysis"
echo "  [ ] Applications section"
echo "  [ ] Advantages/disadvantages"
echo "  [ ] Cross-references use \\ref{ch:name}"
echo "  [ ] Summary table/section"
echo "  [ ] Further Reading with chapter references"
echo "  [ ] Compiles without errors"
echo "  [ ] Visual style matches exemplar"
echo ""

# Step 5: Open files for editing
echo "🚀 Step 5: Ready for editing!"
echo ""
echo "  Next steps:"
echo "    1. Open in editor: code $CHAPTER_FILE"
echo "    2. Reference exemplar: code $EXEMPLAR"
echo "    3. Reference style guide: code STYLE_GUIDE.md"
echo "    4. Make professional upgrades following exemplar"
echo "    5. Test compile: pdflatex -interaction=nonstopmode $TEST_FILE"
echo "    6. Review PDF: open ${TEST_FILE%.tex}.pdf"
echo "    7. When satisfied, commit:"
echo "       git add $CHAPTER_FILE"
echo "       git commit -m \"book: professional upgrade of $CHAPTER_NAME following exemplar\""
echo ""

# Step 6: Compile and show stats
echo "📊 Step 6: Current chapter statistics..."
echo ""
echo "  Lines: $(wc -l < "$CHAPTER_FILE")"
echo "  Equations: $(grep -c '\\begin{equation}' "$CHAPTER_FILE" || echo 0)"
echo "  Figures: $(grep -c '\\begin{figure}' "$CHAPTER_FILE" || echo 0)"
echo "  TikZ diagrams: $(grep -c '\\begin{tikzpicture}' "$CHAPTER_FILE" || echo 0)"
echo "  Callout boxes: $(grep -c '\\begin{keyconcept}\|\\begin{warningbox}\|\\begin{calloutbox}' "$CHAPTER_FILE" || echo 0)"
echo ""

echo "✨ Production workflow initialized for: $CHAPTER_NAME"
echo ""
echo "💡 Pro tip: Use the exemplar as a side-by-side reference while editing"
echo ""
