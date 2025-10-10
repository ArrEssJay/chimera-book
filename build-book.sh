#!/bin/bash -x
# build-book.sh - Compile the complete Chimera book

set -e  # Exit on error

# Source the ISBNs
source isbns.sh

echo "========================================"
echo "Building Chimera Book - First Edition"
echo "========================================"
echo

# Check for required tools
command -v xelatex >/dev/null 2>&1 || { echo "Error: xelatex not found"; exit 1; }
command -v biber >/dev/null 2>&1 || { echo "Error: biber not found"; exit 1; }
command -v pandoc >/dev/null 2>&1 || { echo "Error: pandoc not found"; exit 1; }

# Directories
LATEX_DIR="latex"
BUILD_DIR="_build"
BUILD_DATA_DIR="_build_data"
DOC="chimera-book"

# Create build directories
mkdir -p "$BUILD_DIR"
mkdir -p "$BUILD_DATA_DIR"

# Clean old outputs to ensure fresh build
echo "--- Cleaning old build artifacts ---"
rm -f ./*.pdf
rm -f ./*.epub
rm -rf "$BUILD_DATA_DIR"/*
rm -f "$BUILD_DIR"/*

# ==============================================================================
# PRINT PDF BUILD (COLOR ONLY - Use Adobe Preflight for B/W)
# ==============================================================================
echo "--- Building Print PDF (Color) ---"
echo "Pass 1/3..."
(cd "$LATEX_DIR" && xelatex -jobname="chimera-book-print" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "\def\ISBN{$ISBN_PRINT}\input{$DOC.tex}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"

# Run biber for bibliography
if [ -f "$BUILD_DATA_DIR/chimera-book-print.bcf" ]; then
    echo "Running biber..."
    (biber "$BUILD_DATA_DIR/chimera-book-print") 2>&1 | tail -10
fi

# Two more passes for references
echo "Pass 2/3..."
(cd "$LATEX_DIR" && xelatex -jobname="chimera-book-print" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "\def\ISBN{$ISBN_PRINT}\input{$DOC.tex}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"
echo "Pass 3/3..."
(cd "$LATEX_DIR" && xelatex -jobname="chimera-book-print" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "\def\ISBN{$ISBN_PRINT}\input{$DOC.tex}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"
cp "$BUILD_DATA_DIR/chimera-book-print.pdf" "./chimera-book-print.pdf"

# ==============================================================================
# E-PDF BUILD
# ==============================================================================
echo "--- Building E-PDF version ---"
# Define metadata specifically for the e-PDF version
EPDF_METADATA="\
\def\pdftitle{Digital Signal Processing: Past, Present & Future}\
\def\pdfsubject{The Chimera Project}\
\def\pdfauthor{Rowan Jones, Editor}\
\def\pdfkeywords{signal processing, modulation, M-Theory, telecommunications, DSP}\
\def\ISBN{$ISBN_EPDF}"

echo "E-PDF Pass 1/3..."
(cd "$LATEX_DIR" && xelatex -jobname="chimera-book-epdf" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$EPDF_METADATA\input{$DOC.tex}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"

# Run Biber for citations if needed
if [ -f "$BUILD_DATA_DIR/chimera-book-epdf.bcf" ]; then
    echo "Running biber for E-PDF..."
    (biber "$BUILD_DATA_DIR/chimera-book-epdf") 2>&1 | tail -10
    # Re-run xelatex to include citations
    echo "E-PDF Pass 2/3..."
    (cd "$LATEX_DIR" && xelatex -jobname="chimera-book-epdf" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$EPDF_METADATA\input{$DOC.tex}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"
    echo "E-PDF Pass 3/3..."
    (cd "$LATEX_DIR" && xelatex -jobname="chimera-book-epdf" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$EPDF_METADATA\input{$DOC.tex}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"
fi
cp "$BUILD_DATA_DIR/chimera-book-epdf.pdf" "./chimera-book-epdf.pdf"

# ==============================================================================
# EPUB BUILD
# ==============================================================================
echo "--- Building EPUB version ---"
pandoc "$LATEX_DIR/$DOC.tex" -o "$BUILD_DIR/$DOC.epub" --from=latex --to=epub --metadata-file="metadata.xml" --resource-path="$LATEX_DIR" --css="epub.css" --toc --toc-depth=2
cp "$BUILD_DIR/$DOC.epub" "./chimera-book.epub"

# ==============================================================================
# FINAL CHECK & CLEANUP
# ==============================================================================
if [ -f "chimera-book-print.pdf" ] && [ -f "chimera-book-epdf.pdf" ] && [ -f "chimera-book.epub" ]; then
    echo
    echo "========================================"
    echo "✅ BUILD SUCCESSFUL"
    echo "========================================"
    echo "Outputs:"
    echo "  - chimera-book-print.pdf (Color - convert to B/W with Adobe Preflight)"
    echo "  - chimera-book-epdf.pdf"
    echo "  - chimera-book.epub"
    echo
    echo "Opening PDFs..."
    open "chimera-book-print.pdf"
    open "chimera-book-epdf.pdf"
else
    echo
    echo "========================================"
    echo "❌ BUILD FAILED"
    echo "========================================"
    echo "Check logs in $BUILD_DIR for errors."
    exit 1
fi

echo
echo "Cleaning auxiliary files..."
# The _build_data directory is cleaned at the start of the script.
# No need to delete it upon successful completion, allows for inspection of logs.

echo "Done!"
