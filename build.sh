#!/bin/bash
# ==============================================================================
# Chimera Book Build Script
# ==============================================================================
#
# This script automates the process of building the Chimera book from
# Markdown sources into a professional PDF.
#
# Workflow:
# 1. Checks for required dependencies (pandoc, pdflatex, biber, mmdc).
# 2. Converts all Markdown files from ../wiki into individual LaTeX
#    chapter files in ./chapters/.
# 3. Converts all Mermaid diagrams from ../wiki into PDFs.
# 4. Creates a list of chapters to be included in the main book file.
# 5. Compiles the final PDF using pdflatex and biber for bibliography.
#
# Usage:
#   cd book/
#   ./build.sh
#
# ==============================================================================

set -e # Exit immediately if a command exits with a non-zero status.

# --- Configuration ---
WIKI_DIR="../wiki"
CHAPTERS_DIR="./chapters"
BOOK_NAME="chimera-book"
LUA_FILTER="../scripts/unicode-to-latex.lua"

# --- Dependency Check ---
echo "🔎 Checking for required tools..."
command -v pandoc >/dev/null 2>&1 || { echo >&2 "❌ Pandoc is required but not installed. Aborting."; exit 1; }
command -v pdflatex >/dev/null 2>&1 || { echo >&2 "❌ pdflatex is required but not installed (install MacTeX/TeX Live). Aborting."; exit 1; }
command -v biber >/dev/null 2>&1 || { echo >&2 "❌ biber is required but not installed (install MacTeX/TeX Live). Aborting."; exit 1; }
command -v mmdc >/dev/null 2>&1 || { echo >&2 "⚠️ mmdc (Mermaid CLI) is not installed. Mermaid diagrams will not be rendered. Install with: npm install -g @mermaid-js/mermaid-cli"; }
echo "✅ All required tools found."

# --- Setup Directories ---
mkdir -p "$CHAPTERS_DIR"

# --- Step 1: Convert Markdown to LaTeX Chapters ---
echo "📚 Converting Markdown wiki files to LaTeX chapters..."
for md_file in "$WIKI_DIR"/*.md; do
    filename=$(basename -- "$md_file")
    base_name="${filename%.*}"
    tex_file="$CHAPTERS_DIR/$base_name.tex"
    
    echo "  - Converting $filename to $tex_file"
    
    # Use pandoc to convert markdown to a standalone LaTeX file for each chapter
    # The --standalone flag is used to make each chapter compilable on its own for debugging
    pandoc "$md_file" \
      -f markdown \
      -t latex \
      --lua-filter="$LUA_FILTER" \
      --output="$tex_file"
done
echo "✅ Markdown conversion complete."

# --- Step 2: Convert Mermaid Diagrams ---
if command -v mmdc >/dev/null 2>&1; then
    echo "🧜‍♀️ Converting Mermaid diagrams (.mmd) to PDF..."
    for mmd_file in "$WIKI_DIR"/*.mmd; do
        if [ -f "$mmd_file" ]; then
            filename=$(basename -- "$mmd_file")
            base_name="${filename%.*}"
            pdf_file="$CHAPTERS_DIR/$base_name.pdf"
            echo "  - Converting $filename to $pdf_file"
            mmdc -i "$mmd_file" -o "$pdf_file" -w 1024 -H 768
        fi
    done
    echo "✅ Mermaid diagrams converted."
else
    echo "⚠️ Skipping Mermaid diagram conversion."
fi


# --- Step 3: Create Chapter List for Main Book ---
echo "📑 Creating chapter inclusion list..."
# List all .tex files in chapters directory, ensuring Home is first
{
  find "$CHAPTERS_DIR" -name 'Home.tex' | sed 's|^\./chapters/||'
  find "$CHAPTERS_DIR" -name '*.tex' ! -name 'Home.tex' | sed 's|^\./chapters/||' | sort
} > chapters.list
echo "✅ Chapter list created."


# --- Step 4: Compile the Full Book PDF ---
echo "📖 Compiling the final book PDF (this may take a few minutes)..."

# We need to run pdflatex multiple times to resolve references and TOC
# The -shell-escape flag is required for the `minted` package (code highlighting)

echo "  - Pass 1: pdflatex (initial compilation)"
pdflatex -interaction=nonstopmode --shell-escape "$BOOK_NAME.tex" > /dev/null

echo "  - Pass 2: biber (bibliography processing)"
biber "$BOOK_NAME" > /dev/null

echo "  - Pass 3: pdflatex (include bibliography)"
pdflatex -interaction=nonstopmode --shell-escape "$BOOK_NAME.tex" > /dev/null

echo "  - Pass 4: pdflatex (resolve final references)"
pdflatex -interaction=nonstopmode --shell-escape "$BOOK_NAME.tex" > /dev/null

echo "✅ Book compilation complete!"

# --- Cleanup ---
echo "🧹 Cleaning up intermediate files..."
rm -f *.aux *.bcf *.log *.blg *.run.xml *.toc chapters.list
echo "✅ Cleanup complete."

# --- Final Output ---
if [ -f "$BOOK_NAME.pdf" ]; then
  SIZE=$(du -h "$BOOK_NAME.pdf" | cut -f1)
  echo "🚀 Success! Your book is ready: $BOOK_NAME.pdf ($SIZE)"
else
  echo "❌ Error: PDF generation failed. Check the log files for details."
  exit 1
fi
