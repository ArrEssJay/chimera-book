#!/bin/bash
# ==============================================================================
# Chapter Validation Script
# Tests each chapter individually using the common preamble (DRY principle)
# ==============================================================================

set -e

CHAPTERS_DIR="./chapters"
LOG_DIR="./validation_logs"
PREAMBLE="preamble.tex"

# Create log directory
mkdir -p "$LOG_DIR"

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
total=0
passed=0
failed=0

echo "========================================"
echo "Validating Chapters with Common Preamble"
echo "========================================"
echo ""

# Check preamble exists
if [ ! -f "$PREAMBLE" ]; then
    echo -e "${RED}ERROR: $PREAMBLE not found!${NC}"
    exit 1
fi

echo "Using common preamble: $PREAMBLE"
echo ""

# Find all .tex files in chapters directory
for chapter in "$CHAPTERS_DIR"/*.tex; do
    if [ ! -f "$chapter" ]; then
        continue
    fi
    
    chapter_name=$(basename "$chapter")
    total=$((total + 1))
    
    # Create test document using common preamble
    test_file="${LOG_DIR}/test_${chapter_name}"
    cat > "$test_file" << EOF
\documentclass[12pt, a4paper]{article}
\input{../$PREAMBLE}
\begin{document}
\input{../$chapter}
\end{document}
EOF
    
    # Compile
    log_file="${LOG_DIR}/${chapter_name%.tex}.log"
    if pdflatex -halt-on-error -interaction=nonstopmode -output-directory="$LOG_DIR" "$test_file" > "$log_file" 2>&1; then
        echo -e "${GREEN}✓${NC} $chapter_name"
        passed=$((passed + 1))
    else
        echo -e "${RED}✗${NC} $chapter_name"
        failed=$((failed + 1))
        
        # Extract first error
        echo "  Error:"
        grep -A 3 "^!" "$log_file" | head -5 | sed 's/^/    /'
        echo ""
    fi
done

echo ""
echo "========================================"
echo "Summary"
echo "========================================"
echo "Total chapters: $total"
echo -e "Passed: ${GREEN}$passed${NC}"
echo -e "Failed: ${RED}$failed${NC}"

if [ $failed -eq 0 ]; then
    echo -e "${GREEN}All chapters validated successfully!${NC}"
    exit 0
else
    echo -e "${YELLOW}Some chapters need fixes.${NC}"
    exit 1
fi
