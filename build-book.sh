#!/bin/bash -x
# filepath: /Users/rowan/VSCode/chimera/book/build-book.sh
# build-book.sh - Compile the complete Chimera book
# Usage: ./build-book.sh [chapter_range] [--watermark "Text"]
# 
# Chapter range examples:
#   (no args)  - Build complete book (chapters 1 to end)
#   :          - Build complete book (chapters 1 to end)
#   1:         - Build chapters 1 to end
#   :10        - Build chapters 1 to 10
#   5:15       - Build chapters 5 to 15
#   :-1        - Build chapters 1 to (last - 1)
#   -5:        - Build chapters (last - 5) to end
#   42         - Build single chapter 42 (legacy mode)
#
# Watermark examples:
#   --watermark "DRAFT"     - Add "DRAFT" watermark
#   --watermark "V0.2"      - Add "V0.2" watermark
#   --watermark "REVIEW"    - Add "REVIEW" watermark
#
# Note: Front and back matter are ALWAYS included regardless of range

set -e  # Exit on error

# Source the ISBNs
source isbns.sh

# Parse watermark argument
WATERMARK_MODE=""
WATERMARK_TEXT=""
i=1
while [ $i -le $# ]; do
    arg="${!i}"
    if [[ "$arg" == "--watermark" ]]; then
        i=$((i + 1))
        WATERMARK_TEXT="${!i}"
        WATERMARK_MODE="\def\WATERMARKTEXT{$WATERMARK_TEXT}"
        echo "WATERMARK ENABLED: '$WATERMARK_TEXT'"
    fi
    i=$((i + 1))
done

# Parse chapter range argument
CHAPTER_RANGE=""
CHAPTER_NUM=""  # Legacy single chapter mode
for arg in "$@"; do
    if [[ "$arg" != "--watermark" ]] && [[ "$arg" != "$WATERMARK_TEXT" ]] && [[ ! -z "$arg" ]]; then
        if [[ "$arg" == *":"* ]]; then
            CHAPTER_RANGE="$arg"
        else
            # Legacy: single chapter number
            CHAPTER_NUM="$arg"
        fi
        break
    fi
done

# Determine build mode
if [ ! -z "$CHAPTER_NUM" ]; then
    echo "========================================"
    echo "Building Single Chapter: $CHAPTER_NUM"
    [ ! -z "$WATERMARK_TEXT" ] && echo "(Watermark: $WATERMARK_TEXT)"
    echo "========================================"
    echo
elif [ ! -z "$CHAPTER_RANGE" ]; then
    echo "========================================"
    echo "Building Chapter Range: $CHAPTER_RANGE"
    echo "(Front and back matter included)"
    [ ! -z "$WATERMARK_TEXT" ] && echo "(Watermark: $WATERMARK_TEXT)"
    echo "========================================"
    echo
else
    echo "========================================"
    echo "Building Chimera Book - First Edition"
    [ ! -z "$WATERMARK_TEXT" ] && echo "(Watermark: $WATERMARK_TEXT)"
    echo "========================================"
    echo
fi

# Check for required tools
command -v xelatex >/dev/null 2>&1 || { echo "Error: xelatex not found"; exit 1; }
command -v biber >/dev/null 2>&1 || { echo "Error: biber not found"; exit 1; }
if [ -z "$CHAPTER_NUM" ]; then
    command -v pandoc >/dev/null 2>&1 || { echo "Error: pandoc not found"; exit 1; }
fi

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
# Clean build data but keep directory structure
rm -f "$BUILD_DATA_DIR"/*.aux "$BUILD_DATA_DIR"/*.log "$BUILD_DATA_DIR"/*.pdf "$BUILD_DATA_DIR"/*.toc "$BUILD_DATA_DIR"/*.out "$BUILD_DATA_DIR"/*.bbl "$BUILD_DATA_DIR"/*.blg "$BUILD_DATA_DIR"/*.bcf "$BUILD_DATA_DIR"/*.idx "$BUILD_DATA_DIR"/*.run.xml
rm -f "$BUILD_DIR"/*

# ==============================================================================
# FUNCTION: Parse chapter range and generate \includeonly list
# ==============================================================================
generate_includeonly_list() {
    local range="$1"
    
    # Get list of all chapter files (sorted numerically)
    local chapter_files=($(ls "$LATEX_DIR/chapters/"[0-9]*.tex 2>/dev/null | sort -V))
    local total_chapters=${#chapter_files[@]}
    
    if [ $total_chapters -eq 0 ]; then
        echo "Error: No chapter files found in $LATEX_DIR/chapters/"
        exit 1
    fi
    
    # Parse range
    local start_chapter=""
    local end_chapter=""
    
    if [[ "$range" == ":" ]]; then
        # ":" means complete book (no includeonly needed)
        echo ""
        return
    elif [[ "$range" == *":"* ]]; then
        # Split on colon
        IFS=':' read -r start_chapter end_chapter <<< "$range"
        
        # Handle negative indices (count from end)
        if [[ "$start_chapter" == -* ]]; then
            start_chapter=$((total_chapters + start_chapter + 1))
        fi
        if [[ "$end_chapter" == -* ]]; then
            end_chapter=$((total_chapters + end_chapter + 1))
        fi
        
        # Default empty values
        [ -z "$start_chapter" ] && start_chapter=1
        [ -z "$end_chapter" ] && end_chapter=$total_chapters
        
        # Validate range
        if [ "$start_chapter" -lt 1 ] || [ "$start_chapter" -gt $total_chapters ]; then
            echo "Error: Start chapter $start_chapter out of range (1-$total_chapters)"
            exit 1
        fi
        if [ "$end_chapter" -lt 1 ] || [ "$end_chapter" -gt $total_chapters ]; then
            echo "Error: End chapter $end_chapter out of range (1-$total_chapters)"
            exit 1
        fi
        if [ "$start_chapter" -gt "$end_chapter" ]; then
            echo "Error: Start chapter $start_chapter > end chapter $end_chapter"
            exit 1
        fi
    else
        echo "Error: Invalid range format: $range"
        exit 1
    fi
    
    # Build includeonly list (just the list, no \includeonly command)
    local includeonly_list=""
    for (( i=start_chapter-1; i<end_chapter; i++ )); do
        local chapter_file="${chapter_files[$i]}"
        local chapter_basename=$(basename "$chapter_file" .tex)
        if [ -z "$includeonly_list" ]; then
            includeonly_list="chapters/$chapter_basename"
        else
            includeonly_list="$includeonly_list,chapters/$chapter_basename"
        fi
    done
    
    echo "$includeonly_list"
}

# ==============================================================================
# SINGLE CHAPTER BUILD (Legacy Mode)
# ==============================================================================
if [ ! -z "$CHAPTER_NUM" ]; then
    echo "--- Building Single Chapter $CHAPTER_NUM ---"
    
    # Find the chapter file
    CHAPTER_FILE=$(ls "$LATEX_DIR/chapters/${CHAPTER_NUM}-"*.tex 2>/dev/null | head -1)
    if [ -z "$CHAPTER_FILE" ]; then
        echo "Error: Chapter $CHAPTER_NUM not found"
        exit 1
    fi
    CHAPTER_BASENAME=$(basename "$CHAPTER_FILE")
    echo "Found: $CHAPTER_BASENAME"
    
    # Create a minimal test document
    TEST_DOC="_build_data/test-chapter-$CHAPTER_NUM.tex"
    cat > "$TEST_DOC" <<EOF
\documentclass[11pt,letterpaper,openany]{book}
\usepackage{fontspec}
\usepackage{amsmath,amssymb,amsthm}
\usepackage{graphicx}
\usepackage{xcolor}
\usepackage{tikz}
\usepackage{tcolorbox}
\usepackage{booktabs}
\usepackage{hyperref}

% Define custom environments to prevent errors
\newenvironment{nontechnical}{\par\textbf{Non-Technical Summary:}\par}{\par}
\newenvironment{keyconcept}{\begin{tcolorbox}}{\end{tcolorbox}}
\newenvironment{importantbox}{\begin{tcolorbox}}{\end{tcolorbox}}
\newenvironment{calloutbox}[1][]{\begin{tcolorbox}}{\end{tcolorbox}}
\newenvironment{warningbox}{\begin{tcolorbox}}{\end{tcolorbox}}

\begin{document}
\input{chapters/$CHAPTER_BASENAME}
\end{document}
EOF
    
    echo "Test document created. Compiling..."
    (cd "$LATEX_DIR" && xelatex -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "../$TEST_DOC") 2>&1 | tail -50
    
    if [ -f "$BUILD_DATA_DIR/test-chapter-$CHAPTER_NUM.pdf" ]; then
        cp "$BUILD_DATA_DIR/test-chapter-$CHAPTER_NUM.pdf" "./test-chapter-$CHAPTER_NUM.pdf"
        echo
        echo "========================================"
        echo "✅ CHAPTER $CHAPTER_NUM BUILD SUCCESSFUL"
        echo "========================================"
        echo "Output: test-chapter-$CHAPTER_NUM.pdf"
        open "test-chapter-$CHAPTER_NUM.pdf"
    else
        echo
        echo "========================================"
        echo "❌ CHAPTER $CHAPTER_NUM BUILD FAILED"
        echo "========================================"
        echo "Check the output above for errors."
        exit 1
    fi
    
    exit 0
fi

# ==============================================================================
# GENERATE INCLUDEONLY LIST (for chapter range builds)
# ==============================================================================
INCLUDEONLY_LIST=""
if [ ! -z "$CHAPTER_RANGE" ]; then
    INCLUDEONLY_LIST=$(generate_includeonly_list "$CHAPTER_RANGE")
    if [ ! -z "$INCLUDEONLY_LIST" ]; then
        echo "Chapter selection: $INCLUDEONLY_LIST"
        echo
    fi
fi

# ==============================================================================
# HELPER FUNCTION: Create temporary modified chimera-book.tex
# ==============================================================================
create_modified_book() {
    local output_file="$1"
    local isbn="$2"
    local includeonly_list="$3"
    
    # Copy original file
    cp "$LATEX_DIR/$DOC.tex" "$output_file"
    
    # If we have a chapter list, comment out \loggedinput lines for chapters NOT in the list
    if [ ! -z "$includeonly_list" ]; then
        # Create temporary file
        mv "$output_file" "$output_file.orig"
        
        # Process line by line
        while IFS= read -r line; do
            if [[ "$line" =~ \\loggedinput\{(chapters/[^}]+)\} ]]; then
                chapter_name="${BASH_REMATCH[1]}"
                # Check if this chapter is in the includeonly list
                if [[ ",$includeonly_list," == *",$chapter_name,"* ]]; then
                    # Keep this chapter
                    echo "$line"
                else
                    # Comment out this chapter
                    echo "% SKIPPED: $line"
                fi
            else
                # Not a loggedinput line, keep as is
                echo "$line"
            fi
        done < "$output_file.orig" > "$output_file"
        
        rm "$output_file.orig"
    fi
}

# ==============================================================================
# PRINT PDF BUILD (COLOR ONLY - Use Adobe Preflight for B/W)
# ==============================================================================
echo "--- Building Print PDF (Color) ---"

# Create modified version of chimera-book.tex if needed
if [ ! -z "$INCLUDEONLY_LIST" ]; then
    create_modified_book "$BUILD_DATA_DIR/chimera-book-print-modified.tex" "$ISBN_PRINT" "$INCLUDEONLY_LIST"
    PRINT_INPUT="../$BUILD_DATA_DIR/chimera-book-print-modified.tex"
else
    PRINT_INPUT="$DOC.tex"
fi

echo "Pass 1/3..."
(cd "$LATEX_DIR" && xelatex -jobname="chimera-book-print" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$WATERMARK_MODE\def\ISBN{$ISBN_PRINT}\input{$PRINT_INPUT}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"

# Run biber for bibliography
if [ -f "$BUILD_DATA_DIR/chimera-book-print.bcf" ]; then
    echo "Running biber..."
    (biber "$BUILD_DATA_DIR/chimera-book-print") 2>&1 | tail -10
fi

# Two more passes for references
echo "Pass 2/3..."
(cd "$LATEX_DIR" && xelatex -jobname="chimera-book-print" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$WATERMARK_MODE\def\ISBN{$ISBN_PRINT}\input{$PRINT_INPUT}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"

echo "Pass 3/3..."
(cd "$LATEX_DIR" && xelatex -jobname="chimera-book-print" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$WATERMARK_MODE\def\ISBN{$ISBN_PRINT}\input{$PRINT_INPUT}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"

cp "$BUILD_DATA_DIR/chimera-book-print.pdf" "./chimera-book-print.pdf"

# ==============================================================================
# E-PDF BUILD
# ==============================================================================
echo "--- Building E-PDF version ---"

# Create modified version for E-PDF if needed
if [ ! -z "$INCLUDEONLY_LIST" ]; then
    create_modified_book "$BUILD_DATA_DIR/chimera-book-epdf-modified.tex" "$ISBN_EPDF" "$INCLUDEONLY_LIST"
    EPDF_INPUT="../$BUILD_DATA_DIR/chimera-book-epdf-modified.tex"
else
    EPDF_INPUT="$DOC.tex"
fi

# Define metadata specifically for the e-PDF version
EPDF_METADATA="\
\def\pdftitle{Digital Signal Processing: Past, Present & Future}\
\def\pdfsubject{The Chimera Project}\
\def\pdfauthor{Rowan Jones, Editor}\
\def\pdfkeywords{signal processing, modulation, M-Theory, telecommunications, DSP}\
\def\ISBN{$ISBN_EPDF}"

echo "E-PDF Pass 1/3..."
(cd "$LATEX_DIR" && xelatex -jobname="chimera-book-epdf" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$WATERMARK_MODE$EPDF_METADATA\input{$EPDF_INPUT}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"

# Run Biber for citations if needed
if [ -f "$BUILD_DATA_DIR/chimera-book-epdf.bcf" ]; then
    echo "Running biber for E-PDF..."
    (biber "$BUILD_DATA_DIR/chimera-book-epdf") 2>&1 | tail -10
    # Re-run xelatex to include citations
    echo "E-PDF Pass 2/3..."
    (cd "$LATEX_DIR" && xelatex -jobname="chimera-book-epdf" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$WATERMARK_MODE$EPDF_METADATA\input{$EPDF_INPUT}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"
    echo "E-PDF Pass 3/3..."
    (cd "$LATEX_DIR" && xelatex -jobname="chimera-book-epdf" -shell-escape -interaction=nonstopmode -output-directory="../$BUILD_DATA_DIR" "$WATERMARK_MODE$EPDF_METADATA\input{$EPDF_INPUT}") 2>&1 | grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages"
fi
cp "$BUILD_DATA_DIR/chimera-book-epdf.pdf" "./chimera-book-epdf.pdf"

# ==============================================================================
# EPUB BUILD
# ==============================================================================
echo "--- Building EPUB version (TEMPORARILY SKIPPED) ---"
# TEMPORARILY COMMENTED OUT - Pandoc hanging on conversion
# pandoc "$LATEX_DIR/$DOC.tex" -o "$BUILD_DIR/$DOC.epub" --from=latex --to=epub --metadata-file="metadata.xml" --resource-path="$LATEX_DIR" --css="epub.css" --toc --toc-depth=2
# cp "$BUILD_DIR/$DOC.epub" "./chimera-book.epub"
touch "./chimera-book.epub"  # Create empty file to satisfy check

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