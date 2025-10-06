#!/bin/bash
# ==============================================================================
# Chapter Validation Script
# ==============================================================================
#
# Tests each chapter file individually to ensure it compiles without errors.
# This helps isolate problematic chapters before full book compilation.
#
# Usage:
#   cd book/
#   ./validate_chapters.sh
#
# ==============================================================================

set -e

CHAPTERS_DIR="./chapters"
PREAMBLE="../preamble.tex"
TEST_DIR="./chapter_tests"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🔍 Chapter Validation Script"
echo "=============================="

# Create test directory
mkdir -p "$TEST_DIR"

# Counter for results
PASSED=0
FAILED=0
FAILED_CHAPTERS=()

# Test each chapter
for chapter_file in "$CHAPTERS_DIR"/*.tex; do
    filename=$(basename -- "$chapter_file")
    base_name="${filename%.*}"
    
    echo -n "Testing $filename... "
    
    # Create a minimal test document for this chapter
    cat > "$TEST_DIR/test_${base_name}.tex" <<EOF
\documentclass[12pt, a4paper]{article}
\input{../preamble}
\begin{document}
\input{../$chapter_file}
\end{document}
EOF
    
    # Try to compile
    cd "$TEST_DIR"
    if pdflatex -interaction=nonstopmode -halt-on-error "test_${base_name}.tex" > "test_${base_name}.log" 2>&1; then
        echo -e "${GREEN}✓ PASS${NC}"
        ((PASSED++))
    else
        echo -e "${RED}✗ FAIL${NC}"
        ((FAILED++))
        FAILED_CHAPTERS+=("$filename")
        # Extract error from log
        echo -e "${YELLOW}  Error details:${NC}"
        grep -A 5 "^!" "test_${base_name}.log" | head -10 | sed 's/^/    /'
    fi
    cd ..
done

# Summary
echo ""
echo "=============================="
echo "Summary:"
echo "  Passed: ${GREEN}${PASSED}${NC}"
echo "  Failed: ${RED}${FAILED}${NC}"

if [ ${FAILED} -gt 0 ]; then
    echo ""
    echo "Failed chapters:"
    for chapter in "${FAILED_CHAPTERS[@]}"; do
        echo "  - ${RED}${chapter}${NC}"
    done
    echo ""
    echo "Check logs in: $TEST_DIR/"
    exit 1
else
    echo ""
    echo "${GREEN}✓ All chapters validated successfully!${NC}"
    # Clean up test directory
    rm -rf "$TEST_DIR"
    exit 0
fi
