#!/bin/bash
# verify_chapter.sh - Verify chapter completeness before PR submission

if [ -z "$1" ]; then
    echo "Usage: ./verify_chapter.sh Chapter-Name"
    echo "Example: ./verify_chapter.sh Frequency-Shift-Keying-(FSK)"
    exit 1
fi

CHAPTER="$1"
CHAPTER_FILE="chapters/${CHAPTER}.tex"

echo "========================================"
echo "Chapter Verification: $CHAPTER"
echo "========================================"
echo

# Check file exists
if [ ! -f "$CHAPTER_FILE" ]; then
    echo "❌ ERROR: File not found: $CHAPTER_FILE"
    exit 1
fi

echo "✅ File exists: $CHAPTER_FILE"
echo

# Initialize pass/fail tracking
PASSED=0
FAILED=0

# 1. Check TikZ diagram count
echo "📊 Checking TikZ diagrams..."
TIKZ_COUNT=$(grep -c "\\\\begin{tikzpicture}" "$CHAPTER_FILE" || echo "0")
echo "   Found: $TIKZ_COUNT TikZ diagrams"

if [ "$TIKZ_COUNT" -ge 3 ]; then
    echo "   ✅ PASS: At least 3 TikZ diagrams present"
    ((PASSED++))
else
    echo "   ❌ FAIL: Need at least 3 TikZ diagrams, found $TIKZ_COUNT"
    ((FAILED++))
fi
echo

# 2. Check for truncated TikZ (incomplete diagrams)
echo "🔍 Checking for truncated/incomplete TikZ..."
TRUNCATED=$(grep -A 2 "\\\\begin{tikzpicture}" "$CHAPTER_FILE" | grep -c "% \\.\\.\\.\\|% (rest" || echo "0")
if [ "$TRUNCATED" -gt 0 ]; then
    echo "   ❌ FAIL: Found $TRUNCATED truncated TikZ diagrams (containing '% ...' or '% (rest')"
    echo "   → TikZ diagrams MUST be complete, not truncated!"
    ((FAILED++))
else
    echo "   ✅ PASS: No truncated TikZ diagrams detected"
    ((PASSED++))
fi
echo

# 3. Check TikZ closing tags
echo "🔍 Checking TikZ structure..."
BEGIN_COUNT=$(grep -c "\\\\begin{tikzpicture}" "$CHAPTER_FILE" || echo "0")
END_COUNT=$(grep -c "\\\\end{tikzpicture}" "$CHAPTER_FILE" || echo "0")
if [ "$BEGIN_COUNT" -eq "$END_COUNT" ]; then
    echo "   ✅ PASS: All TikZ environments properly closed ($BEGIN_COUNT begin = $END_COUNT end)"
    ((PASSED++))
else
    echo "   ❌ FAIL: Mismatched TikZ tags ($BEGIN_COUNT begin vs $END_COUNT end)"
    ((FAILED++))
fi
echo

# 4. Check equation count
echo "📐 Checking numbered equations..."
EQ_COUNT=$(grep -c "\\\\begin{equation}" "$CHAPTER_FILE" || echo "0")
echo "   Found: $EQ_COUNT numbered equations"

if [ "$EQ_COUNT" -ge 15 ]; then
    echo "   ✅ PASS: At least 15 equations present"
    ((PASSED++))
else
    echo "   ⚠️  WARNING: Expected at least 15 equations, found $EQ_COUNT"
    echo "   → Chapters should have comprehensive mathematical coverage"
    ((FAILED++))
fi
echo

# 5. Check for keyconcept boxes
echo "💡 Checking callout boxes..."
KEYCONCEPT_COUNT=$(grep -c "\\\\begin{keyconcept}" "$CHAPTER_FILE" || echo "0")
CALLOUT_COUNT=$(grep -c "\\\\begin{calloutbox}" "$CHAPTER_FILE" || echo "0")

if [ "$KEYCONCEPT_COUNT" -ge 1 ]; then
    echo "   ✅ PASS: Found $KEYCONCEPT_COUNT keyconcept box(es)"
    ((PASSED++))
else
    echo "   ❌ FAIL: Need at least 1 keyconcept box"
    ((FAILED++))
fi

if [ "$CALLOUT_COUNT" -ge 1 ]; then
    echo "   ✅ PASS: Found $CALLOUT_COUNT calloutbox(es)"
    ((PASSED++))
else
    echo "   ⚠️  WARNING: Consider adding at least 1 calloutbox"
fi
echo

# 6. Check for required sections
echo "📑 Checking required sections..."
REQUIRED_SECTIONS=(
    "\\\\chapter{"
    "\\\\begin{nontechnical}"
    "\\\\section{Overview}"
    "\\\\section{Mathematical Description}"
    "\\\\section{.*Performance"
    "\\\\section{.*Applications}"
    "\\\\section{Summary}"
)

for section in "${REQUIRED_SECTIONS[@]}"; do
    if grep -q "$section" "$CHAPTER_FILE"; then
        echo "   ✅ Found: $section"
        ((PASSED++))
    else
        echo "   ❌ Missing: $section"
        ((FAILED++))
    fi
done
echo

# 7. Check for worked example
echo "📝 Checking worked example..."
if grep -qi "\\\\textbf{Problem:}\\|\\\\textbf{Given:}\\|\\\\textbf{Solution:}" "$CHAPTER_FILE"; then
    echo "   ✅ PASS: Worked example structure found"
    ((PASSED++))
else
    echo "   ❌ FAIL: No worked example found (need Problem/Given/Solution structure)"
    ((FAILED++))
fi
echo

# 8. Compilation test
echo "🔨 Testing compilation..."
TEST_FILE="test_${CHAPTER}.tex"

cat > "$TEST_FILE" << EOF
\\documentclass[12pt,a4paper,oneside]{book}
\\input{preamble}
\\begin{document}
\\input{$CHAPTER_FILE}
\\end{document}
EOF

if pdflatex -interaction=nonstopmode "$TEST_FILE" > /tmp/pdflatex_output.log 2>&1; then
    if [ -f "test_${CHAPTER}.pdf" ]; then
        PDF_SIZE=$(du -h "test_${CHAPTER}.pdf" | cut -f1)
        echo "   ✅ PASS: Compilation successful! PDF generated ($PDF_SIZE)"
        ((PASSED++))
    else
        echo "   ❌ FAIL: Compilation claimed success but no PDF generated"
        ((FAILED++))
    fi
else
    echo "   ❌ FAIL: Compilation errors detected"
    echo "   → Check /tmp/pdflatex_output.log for details"
    grep -i "error" /tmp/pdflatex_output.log | head -5
    ((FAILED++))
fi
echo

# 9. Check file size (sanity check)
echo "📏 Checking chapter size..."
LINE_COUNT=$(wc -l < "$CHAPTER_FILE")
echo "   Lines: $LINE_COUNT"

if [ "$LINE_COUNT" -ge 300 ]; then
    echo "   ✅ PASS: Chapter has substantial content (≥300 lines)"
    ((PASSED++))
else
    echo "   ⚠️  WARNING: Chapter seems short ($LINE_COUNT lines, expected ≥300)"
    echo "   → Compare with exemplar (594 lines)"
fi
echo

# Summary
echo "========================================"
echo "VERIFICATION SUMMARY"
echo "========================================"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo

if [ "$FAILED" -eq 0 ]; then
    echo "✅ ✅ ✅  ALL CHECKS PASSED  ✅ ✅ ✅"
    echo
    echo "Chapter is ready for PR submission!"
    echo
    echo "Next steps:"
    echo "  1. Visual inspection: Open test_${CHAPTER}.pdf"
    echo "  2. Technical accuracy review"
    echo "  3. Create PR with acceptance criteria checklist"
    exit 0
else
    echo "❌ ❌ ❌  VERIFICATION FAILED  ❌ ❌ ❌"
    echo
    echo "Please fix the issues above before submitting PR."
    echo
    echo "Common fixes:"
    echo "  • TikZ diagrams: Copy complete code from exemplar"
    echo "  • Equations: Add variable definitions after each equation"
    echo "  • Sections: Follow exemplar structure"
    echo "  • Worked example: Show all calculation steps"
    echo
    echo "Reference: chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex"
    exit 1
fi
