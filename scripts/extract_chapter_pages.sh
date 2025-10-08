#!/bin/bash
# Extract PDF pages as PNG images for visual review
# Usage: ./extract_chapter_pages.sh

set -e

PDF_FILE="../latex/chimera-book.pdf"
OUTPUT_DIR="../visual_review/pages"
CHAPTER_MAP="../visual_review/chapter_page_map.txt"

# Check dependencies
command -v pdftoppm >/dev/null 2>&1 || { echo "Error: pdftoppm not found. Install poppler-utils."; exit 1; }
command -v pdfinfo >/dev/null 2>&1 || { echo "Error: pdfinfo not found. Install poppler-utils."; exit 1; }

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Get total pages
TOTAL_PAGES=$(pdfinfo "$PDF_FILE" | grep "^Pages:" | awk '{print $2}')
echo "Total pages: $TOTAL_PAGES"

# Extract all pages as PNG (300 DPI for good quality)
echo "Extracting pages as PNG images..."
pdftoppm -png -r 300 "$PDF_FILE" "$OUTPUT_DIR/page"

# Rename files to have consistent numbering (page-001.png, page-002.png, etc.)
cd "$OUTPUT_DIR"
for f in page-*.png; do
    # Files are already numbered by pdftoppm
    echo "Extracted: $f"
done

echo "✓ Extracted $TOTAL_PAGES pages to $OUTPUT_DIR"
echo "Next step: Run create_chapter_prs.sh to generate GitHub PRs"
