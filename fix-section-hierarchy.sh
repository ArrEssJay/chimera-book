#!/bin/bash
# ==============================================================================
# Fix Section Hierarchy Script
# Adds a \section{} wrapper to chapters that currently skip the section level
# ==============================================================================
#
# This script implements Option 1 from NUMBERING_VALIDATION_RESULTS.md:
# - Adds ONE \section{Overview and Properties} per chapter
# - Places it after the nontechnical box, before the first \subsection
# - Creates backups of all modified files
#
# Usage:
#   ./fix-section-hierarchy.sh [--dry-run]
#
# Options:
#   --dry-run    Show what would be changed without making changes
#
# ==============================================================================

set -e

DRY_RUN=false
if [ "$1" = "--dry-run" ]; then
    DRY_RUN=true
    echo "DRY RUN MODE - No files will be modified"
    echo
fi

CHAPTERS_DIR="latex/chapters"
SECTION_TITLE="Overview and Properties"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "========================================"
echo " Fix Section Hierarchy"
echo "========================================"
echo
echo "This script will add \\section{$SECTION_TITLE} to chapters"
echo "that currently skip the section level."
echo

if [ "$DRY_RUN" = false ]; then
    read -p "Continue? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
    echo
fi

fixed_count=0
skipped_count=0

# Process each chapter
for chapter_file in "$CHAPTERS_DIR"/*.tex; do
    chapter_name=$(basename "$chapter_file")
    
    # Skip chapters that already have sections
    if grep -q "^\\\\section{" "$chapter_file"; then
        echo -e "${BLUE}Skipping${NC} $chapter_name (already has sections)"
        skipped_count=$((skipped_count + 1))
        continue
    fi
    
    # Skip if no subsections
    if ! grep -q "^\\\\subsection{" "$chapter_file"; then
        echo -e "${BLUE}Skipping${NC} $chapter_name (no subsections found)"
        skipped_count=$((skipped_count + 1))
        continue
    fi
    
    # Find the line number where the first subsection appears
    first_subsection_line=$(grep -n "^\\\\subsection{" "$chapter_file" | head -1 | cut -d: -f1)
    
    if [ -z "$first_subsection_line" ]; then
        echo -e "${YELLOW}Warning${NC}: Could not find subsection line in $chapter_name"
        skipped_count=$((skipped_count + 1))
        continue
    fi
    
    if [ "$DRY_RUN" = true ]; then
        echo -e "${GREEN}Would fix${NC}: $chapter_name (insert \\section at line $first_subsection_line)"
        fixed_count=$((fixed_count + 1))
    else
        # Create a backup
        cp "$chapter_file" "$chapter_file.bak"
        
        # Insert \section before first subsection
        # Add blank line before and after for readability
        awk -v line="$first_subsection_line" -v title="$SECTION_TITLE" '
            NR == line {
                print "\\section{" title "}"
                print ""
            }
            { print }
        ' "$chapter_file.bak" > "$chapter_file"
        
        echo -e "${GREEN}✓ Fixed${NC}: $chapter_name"
        fixed_count=$((fixed_count + 1))
    fi
done

echo
echo "========================================"
echo " Summary"
echo "========================================"
echo "Chapters fixed: $fixed_count"
echo "Chapters skipped: $skipped_count"

if [ "$DRY_RUN" = false ] && [ $fixed_count -gt 0 ]; then
    echo
    echo "Backups created with .bak extension"
    echo
    echo "Next steps:"
    echo "1. Review changes: git diff latex/chapters/"
    echo "2. Build and test: ./build-book.sh 1:10"
    echo "3. Validate: ./validate-numbering.sh"
    echo "4. If satisfied: rm latex/chapters/*.bak"
    echo "5. If problems: for f in latex/chapters/*.bak; do mv \"\$f\" \"\${f%.bak}\"; done"
fi

echo
