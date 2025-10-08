#!/bin/bash -x
# build-book.sh - Compile the complete Chimera book

set -e  # Exit on error

echo "========================================"
echo "Building Chimera Book - First Edition"
echo "========================================"
echo

# Check for required tools
command -v xelatex >/dev/null 2>&1 || { echo "Error: xelatex not found"; exit 1; }
command -v biber >/dev/null 2>&1 || { echo "Error: biber not found"; exit 1; }

# Directories
LATEX_DIR="latex"
BUILD_DIR="_build"

# Main document
DOC="chimera-book"

# Create build directory
mkdir -p "$BUILD_DIR"

echo "Step 1: First XeLaTeX pass (generate aux files)..."
(cd "$LATEX_DIR" && xelatex -shell-escape -interaction=nonstopmode "$DOC.tex") | tail -20
mv "$LATEX_DIR"/*.pdf "$LATEX_DIR"/*.aux "$LATEX_DIR"/*.log "$LATEX_DIR"/*.out "$LATEX_DIR"/*.toc "$LATEX_DIR"/*.bcf "$LATEX_DIR"/*.run.xml "$LATEX_DIR"/*.blg "$LATEX_DIR"/*.bbl "$BUILD_DIR/" 2>/dev/null || true

echo
echo "Step 2: Generate bibliography..."
if [ -f "$BUILD_DIR/$DOC.bcf" ]; then
    (cd "$LATEX_DIR" && biber "../$BUILD_DIR/$DOC") 2>&1 | tail -10
else
    echo "No bibliography file found, skipping biber"
fi

echo
echo "Step 3: Second XeLaTeX pass (resolve references)..."
cp "$BUILD_DIR"/*.bbl "$LATEX_DIR/" 2>/dev/null || true
(cd "$LATEX_DIR" && xelatex -shell-escape -interaction=nonstopmode "$DOC.tex") | tail -20
mv "$LATEX_DIR"/*.pdf "$LATEX_DIR"/*.aux "$LATEX_DIR"/*.log "$LATEX_DIR"/*.out "$LATEX_DIR"/*.toc "$LATEX_DIR"/*.bcf "$LATEX_DIR"/*.run.xml "$LATEX_DIR"/*.blg "$LATEX_DIR"/*.bbl "$BUILD_DIR/" 2>/dev/null || true

echo
echo "Step 4: Third XeLaTeX pass (finalize TOC and index)..."
(cd "$LATEX_DIR" && xelatex -shell-escape -interaction=nonstopmode "$DOC.tex") | tail -20
mv "$LATEX_DIR"/*.pdf "$LATEX_DIR"/*.aux "$LATEX_DIR"/*.log "$LATEX_DIR"/*.out "$LATEX_DIR"/*.toc "$LATEX_DIR"/*.bcf "$LATEX_DIR"/*.run.xml "$LATEX_DIR"/*.blg "$LATEX_DIR"/*.bbl "$BUILD_DIR/" 2>/dev/null || true

echo
echo "Step 5: Final XeLaTeX pass for hyperlinks..."
(cd "$LATEX_DIR" && xelatex -shell-escape -interaction=nonstopmode "$DOC.tex") | tail -20
mv "$LATEX_DIR"/*.pdf "$LATEX_DIR"/*.aux "$LATEX_DIR"/*.log "$LATEX_DIR"/*.out "$LATEX_DIR"/*.toc "$LATEX_DIR"/*.bcf "$LATEX_DIR"/*.run.xml "$LATEX_DIR"/*.blg "$LATEX_DIR"/*.bbl "$BUILD_DIR/" 2>/dev/null || true

# Copy PDF to book root
if [ -f "$BUILD_DIR/$DOC.pdf" ]; then
    cp "$BUILD_DIR/$DOC.pdf" "."
fi

# Check for errors
if [ -f "$DOC.pdf" ]; then
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
    echo "Check the LaTeX log for errors: $BUILD_DIR/$DOC.log"
    exit 1
fi

echo
echo "Cleaning auxiliary files..."
rm -f "$BUILD_DIR"/*.aux "$BUILD_DIR"/*.log "$BUILD_DIR"/*.out "$BUILD_DIR"/*.toc "$BUILD_DIR"/*.bcf "$BUILD_DIR"/*.run.xml "$BUILD_DIR"/*.blg "$BUILD_DIR"/*.bbl 2>/dev/null || true

echo "Done!"
