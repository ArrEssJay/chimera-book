#!/bin/bash
# build-book.sh - Compile the complete Chimera book

set -e  # Exit on error

echo "========================================"
echo "Building Chimera Book - First Edition"
echo "========================================"
echo

# Check for required tools
command -v xelatex >/dev/null 2>&1 || { echo "Error: xelatex not found"; exit 1; }
command -v biber >/dev/null 2>&1 || { echo "Error: biber not found"; exit 1; }

# Main document
DOC="chimera-book"

echo "Step 1: First XeLaTeX pass (generate aux files)..."
xelatex -shell-escape -interaction=nonstopmode "$DOC.tex" | tail -20

echo
echo "Step 2: Generate bibliography..."
if [ -f "$DOC.bcf" ]; then
    biber "$DOC" 2>&1 | tail -10
else
    echo "No bibliography file found, skipping biber"
fi

echo
echo "Step 3: Second XeLaTeX pass (resolve references)..."
xelatex -shell-escape -interaction=nonstopmode "$DOC.tex" | tail -20

echo
echo "Step 4: Third XeLaTeX pass (finalize TOC and index)..."
xelatex -shell-escape -interaction=nonstopmode "$DOC.tex" | tail -20

echo
echo "Step 5: Final XeLaTeX pass for hyperlinks..."
xelatex -shell-escape -interaction=nonstopmode "$DOC.tex" | tail -20

# Check for errors
if [ $? -eq 0 ]; then
    PDF_SIZE=$(du -h "$DOC.pdf" | cut -f1)
    PAGE_COUNT=$(pdfinfo "$DOC.pdf" 2>/dev/null | grep "Pages:" | awk '{print $2}')
    
    echo
    echo "========================================"
    echo "✅ BUILD SUCCESSFUL"
    echo "========================================"
    echo "Output: $DOC.pdf"
    echo "Size: $PDF_SIZE"
    echo "Pages: ${PAGE_COUNT:-unknown}"
    echo
    echo "Opening PDF..."
    open "$DOC.pdf" 2>/dev/null || xdg-open "$DOC.pdf" 2>/dev/null || echo "PDF ready: $DOC.pdf"
else
    echo
    echo "========================================"
    echo "❌ BUILD FAILED"
    echo "========================================"
    echo "Check the LaTeX log for errors: $DOC.log"
    exit 1
fi

echo
echo "Cleaning auxiliary files..."
rm -f *.aux *.log *.out *.toc *.bcf *.run.xml *.blg *.bbl 2>/dev/null || true

echo "Done!"
