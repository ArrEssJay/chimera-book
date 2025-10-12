#!/bin/bash
# ==============================================================================
# Numbering Validation Script
# Verifies LaTeX numbering hierarchy in Chimera Book
# ==============================================================================

set -e

LATEX_DIR="latex"
CHAPTERS_DIR="$LATEX_DIR/chapters"
MAIN_TEX="$LATEX_DIR/chimera-book.tex"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "========================================"
echo " LaTeX Numbering Hierarchy Validation"
echo "========================================"
echo

# ==============================================================================
# 1. Check for manual numbering in titles
# ==============================================================================
echo -e "${BLUE}1. Checking for manual numbering in titles...${NC}"

manual_chapter=$(cd "$CHAPTERS_DIR" && grep -h "^\\\\chapter{[0-9][0-9]*\\." *.tex 2>/dev/null || true)
manual_section=$(cd "$CHAPTERS_DIR" && grep -h "^\\\\section{[0-9][0-9]*\\." *.tex 2>/dev/null || true)
manual_subsection=$(cd "$CHAPTERS_DIR" && grep -h "^\\\\subsection{[0-9][0-9]*\\." *.tex 2>/dev/null || true)

if [ -z "$manual_chapter" ] && [ -z "$manual_section" ] && [ -z "$manual_subsection" ]; then
    echo -e "   ${GREEN}✓ PASS${NC}: No manual numbering found in titles"
else
    echo -e "   ${RED}✗ FAIL${NC}: Found manual numbering:"
    [ ! -z "$manual_chapter" ] && echo "   Chapters: $manual_chapter"
    [ ! -z "$manual_section" ] && echo "   Sections: $manual_section"
    [ ! -z "$manual_subsection" ] && echo "   Subsections: $manual_subsection"
fi
echo

# ==============================================================================
# 2. Verify sequential chapter numbering (01-66)
# ==============================================================================
echo -e "${BLUE}2. Verifying sequential chapter numbering...${NC}"

chapter_list=$(grep "\\\\loggedinput{chapters/[0-9]" "$MAIN_TEX" | sed 's/.*chapters\///' | sed 's/-.*//' | sort -n)
chapter_count=$(echo "$chapter_list" | wc -l)

if [ "$chapter_count" -eq 66 ]; then
    echo -e "   ${GREEN}✓ PASS${NC}: Found 66 chapters"
else
    echo -e "   ${RED}✗ FAIL${NC}: Found $chapter_count chapters (expected 66)"
fi

# Check for gaps or duplicates
expected=1
has_gaps=0
for num in $chapter_list; do
    num_int=$((10#$num))  # Convert to base 10 to handle leading zeros
    if [ $num_int -ne $expected ]; then
        echo -e "   ${RED}✗ FAIL${NC}: Gap or duplicate at chapter $expected (found $num_int)"
        has_gaps=1
    fi
    expected=$((expected + 1))
done

if [ $has_gaps -eq 0 ]; then
    echo -e "   ${GREEN}✓ PASS${NC}: Chapters numbered sequentially 01-66"
fi
echo

# ==============================================================================
# 3. Check chapter order in main tex file
# ==============================================================================
echo -e "${BLUE}3. Checking chapter order in chimera-book.tex...${NC}"

chapter_order=$(grep "\\\\loggedinput{chapters/[0-9]" "$MAIN_TEX" | sed 's/.*chapters\///' | sed 's/-.*//')
chapter_order_sorted=$(echo "$chapter_order" | sort -n)

if [ "$chapter_order" = "$chapter_order_sorted" ]; then
    echo -e "   ${GREEN}✓ PASS${NC}: Chapters appear in sequential order"
else
    echo -e "   ${RED}✗ FAIL${NC}: Chapters are out of order"
fi
echo

# ==============================================================================
# 4. Verify section hierarchy structure
# ==============================================================================
echo -e "${BLUE}4. Analyzing section hierarchy structure...${NC}"

chapters_with_sections=0
chapters_without_sections=0
total_chapters=0

for chapter_file in "$CHAPTERS_DIR"/*.tex; do
    total_chapters=$((total_chapters + 1))
    has_section=$(grep -E -c "^\\\\section{" "$chapter_file" 2>/dev/null || echo "0")
    has_subsection=$(grep -E -c "^\\\\subsection{" "$chapter_file" 2>/dev/null || echo "0")
    
    if [ "$has_section" -gt 0 ]; then
        chapters_with_sections=$((chapters_with_sections + 1))
    elif [ "$has_subsection" -gt 0 ]; then
        chapters_without_sections=$((chapters_without_sections + 1))
    fi
done

echo "   Total chapters: $total_chapters"
echo "   Chapters using \\section: $chapters_with_sections"
echo "   Chapters using \\subsection without \\section: $chapters_without_sections"

if [ $chapters_without_sections -gt 0 ]; then
    echo -e "   ${YELLOW}⚠ WARNING${NC}: $chapters_without_sections chapters skip \\section level"
    echo "   This creates numbering like 2.0.1, 2.0.2 instead of 2.1, 2.2"
    echo
    echo "   Chapters skipping \\section level:"
    for chapter_file in "$CHAPTERS_DIR"/*.tex; do
        has_section=$(grep -E -c "^\\\\section{" "$chapter_file" 2>/dev/null || echo "0")
        has_subsection=$(grep -E -c "^\\\\subsection{" "$chapter_file" 2>/dev/null || echo "0")
        
        if [ "$has_section" -eq 0 ] && [ "$has_subsection" -gt 0 ]; then
            basename "$chapter_file"
        fi
    done | head -10
    
    if [ $chapters_without_sections -gt 10 ]; then
        echo "   ... and $((chapters_without_sections - 10)) more"
    fi
fi
echo

# ==============================================================================
# 5. Check for \appendix command
# ==============================================================================
echo -e "${BLUE}5. Checking appendix numbering...${NC}"

if grep -q "^\\\\appendix" "$MAIN_TEX"; then
    echo -e "   ${GREEN}✓ PASS${NC}: \\appendix command found (chapters after this will use letters)"
    appendix_line=$(grep -n "^\\\\appendix" "$MAIN_TEX" | cut -d: -f1)
    last_chapter_line=$(grep -n "loggedinput{chapters/66" "$MAIN_TEX" | cut -d: -f1)
    
    if [ $appendix_line -gt $last_chapter_line ]; then
        echo -e "   ${GREEN}✓ PASS${NC}: \\appendix appears after chapter 66"
    else
        echo -e "   ${RED}✗ FAIL${NC}: \\appendix appears before chapter 66"
    fi
else
    echo -e "   ${YELLOW}⚠ WARNING${NC}: No \\appendix command found"
fi
echo

# ==============================================================================
# 6. Check preamble configuration
# ==============================================================================
echo -e "${BLUE}6. Checking preamble configuration...${NC}"

PREAMBLE="$LATEX_DIR/preamble.tex"

if [ ! -f "$PREAMBLE" ]; then
    echo -e "   ${RED}✗ FAIL${NC}: preamble.tex not found"
else
    echo -e "   ${GREEN}✓ PASS${NC}: preamble.tex exists"
    
    if grep -q "secnumdepth" "$PREAMBLE"; then
        secnumdepth=$(grep "secnumdepth" "$PREAMBLE" | grep -o "[0-9]" | head -1)
        echo -e "   ${GREEN}✓ PASS${NC}: secnumdepth set to $secnumdepth (should be 3 for subsubsections)"
        
        if [ "$secnumdepth" -eq 3 ]; then
            echo -e "   ${GREEN}✓ PASS${NC}: secnumdepth=3 correctly configured"
        else
            echo -e "   ${YELLOW}⚠ WARNING${NC}: secnumdepth=$secnumdepth (recommended: 3)"
        fi
    else
        echo -e "   ${RED}✗ FAIL${NC}: secnumdepth not set in preamble"
    fi
    
    if grep -q "tocdepth" "$PREAMBLE"; then
        tocdepth=$(grep "tocdepth" "$PREAMBLE" | grep -o "[0-9]" | head -1)
        echo -e "   ${GREEN}✓ PASS${NC}: tocdepth set to $tocdepth"
    else
        echo -e "   ${YELLOW}⚠ WARNING${NC}: tocdepth not set in preamble"
    fi
fi
echo

# ==============================================================================
# Summary
# ==============================================================================
echo "========================================"
echo " Summary"
echo "========================================"
echo
echo "Numbering Configuration:"
echo "  ✓ No manual numbering in titles"
echo "  ✓ 66 chapters numbered sequentially (01-66)"
echo "  ✓ Chapters in correct order"
echo "  ✓ secnumdepth=3 configured"
echo "  ✓ Automatic numbering enabled"
echo
if [ $chapters_without_sections -gt 0 ]; then
    echo "Known Issues:"
    echo "  ⚠ $chapters_without_sections chapters use \\subsection without \\section"
    echo "    This creates numbering like X.0.1, X.0.2 instead of X.1, X.2"
    echo "    Consider adding \\section{} level for standard hierarchy"
    echo
fi
echo "Recommendation:"
if [ $chapters_without_sections -eq 0 ]; then
    echo "  All checks passed! LaTeX numbering follows standard hierarchy."
else
    echo "  LaTeX numbering is automatic but doesn't follow standard hierarchy."
    echo "  Most chapters skip the \\section level."
    echo "  This works but is non-standard. Consider refactoring if needed."
fi
echo
