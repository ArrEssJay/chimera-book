#!/bin/bash
# test-all-chapters.sh - Compile each chapter individually to isolate errors.

set -e

LATEX_DIR="."
BUILD_DIR="../_build/chapter_tests"
TEST_FILE="test-chapter.tex"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "========================================"
echo "Testing All Chapters Individually"
echo "========================================"
echo

mkdir -p "$BUILD_DIR"

SUCCESS_COUNT=0
FAIL_COUNT=0

for chapter_file in chapters/*.tex; do
    CHAPTER_NAME=$(basename "$chapter_file")
    echo -n "Testing: $CHAPTER_NAME ... "

    # Create a minimal .tex file for this chapter
    cat > "$TEST_FILE" <<EOF
\documentclass[11pt,twoside]{book}
\input{preamble}
\begin{document}
\input{chapters/$CHAPTER_NAME}
\end{document}
EOF

    # Compile the chapter
    if xelatex -shell-escape -interaction=batchmode -output-directory="$BUILD_DIR" "$TEST_FILE" > "$BUILD_DIR/$CHAPTER_NAME.log" 2>&1; then
        echo -e "${GREEN}✓ Success${NC}"
        ((SUCCESS_COUNT++))
    else
        echo -e "${RED}✗ Failure${NC}"
        ((FAIL_COUNT++))
    fi
done

# Clean up the temporary test file
rm "$TEST_FILE"

echo
echo "========================================"
echo "Test Complete"
echo "========================================"
echo -e "Successful: ${GREEN}$SUCCESS_COUNT${NC}"
echo -e "Failed:     ${RED}$FAIL_COUNT${NC}"
echo

if [ "$FAIL_COUNT" -gt 0 ]; then
    echo "Check the log files in '$BUILD_DIR' for details."
    echo "Example: less '$BUILD_DIR/$(ls -1 "$BUILD_DIR" | grep '\.log$' | head -n 1)'"
    exit 1
fi

exit 0
