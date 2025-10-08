#!/bin/bash
# =============================================================================
# Chapter-by-Chapter Build Validator
# =============================================================================
# Iterates through each chapter, compiling it individually to isolate errors.
# Usage: ./validate_chapters.sh
# =============================================================================

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

LATEX_DIR="latex"
TEST_FILE="test-chapter.tex"
LOG_FILE="chapter_validation.log"

# Clear previous log
> "$LOG_FILE"

echo -e "${YELLOW}Starting chapter-by-chapter validation...${NC}"
echo "Log file: $LOG_FILE"
echo ""

CHAPTER_COUNT=0
ERROR_COUNT=0

# Get a list of all chapter files
CHAPTERS=("$LATEX_DIR"/chapters/*.tex)

for chapter_path in "${CHAPTERS[@]}"; do
    chapter_file=$(basename "$chapter_path")
    CHAPTER_COUNT=$((CHAPTER_COUNT + 1))
    
    echo -n "[$CHAPTER_COUNT/${#CHAPTERS[@]}] Testing: $chapter_file ... "
    
    # Update the test file to include the current chapter
    sed -i.bak "s|\\input{chapters/.*}|\\input{chapters/$chapter_file}|" "$LATEX_DIR/$TEST_FILE"
    
    # Compile the single chapter (nonstopmode to get all errors)
    if (cd "$LATEX_DIR" && xelatex -shell-escape -interaction=nonstopmode "$TEST_FILE" >> "../$LOG_FILE" 2>&1); then
        echo -e "${GREEN}✓ OK${NC}"
    else
        echo -e "${RED}✗ FAILED${NC}"
        echo "  - Error in $chapter_file. See log for details."
        ERROR_COUNT=$((ERROR_COUNT + 1))
    fi
done

# Clean up backup file
rm -f "$LATEX_DIR/$TEST_FILE.bak"

echo ""
if [ "$ERROR_COUNT" -eq 0 ]; then
    echo -e "${GREEN}=====================================${NC}"
    echo -e "${GREEN}✅ All chapters compiled successfully!${NC}"
    echo -e "${GREEN}=====================================${NC}"
else
    echo -e "${RED}=====================================${NC}"
    echo -e "${RED}❌ Found errors in $ERROR_COUNT chapters.${NC}"
    echo -e "${RED}=====================================${NC}"
    echo "Review the log for details: $LOG_FILE"
    exit 1
fi
