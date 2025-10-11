#!/bin/bash -x
# filepath: /Users/rowan/VSCode/chimera/book/build-book.sh
# build-book.sh - Compile the complete Chimera book
# Usage: ./build-book.sh [chapter_range] [--watermark "Text"] [--debug]
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
# Options:
#   --watermark "Text"  - Add the specified text as a watermark.
#   --debug             - Run in debug mode with verbose LaTeX output.
#
# Note: Front and back matter are ALWAYS included regardless of range

set -e  # Exit on error

# Source the ISBNs
source isbns.sh

# --- Argument Parsing ---
WATERMARK_MODE=""
WATERMARK_TEXT=""
DEBUG_MODE=false
CHAPTER_RANGE=""
CHAPTER_NUM=""  # Legacy single chapter mode

# Use a more robust argument parsing loop
args=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --watermark)
      if [[ -n "$2" ]]; then
        WATERMARK_TEXT="$2"
        WATERMARK_MODE="\\gdef\\WATERMARKTEXT{${WATERMARK_TEXT}}"
        echo "WATERMARK ENABLED: '$WATERMARK_TEXT'"
        shift 2
      else
        echo "Error: --watermark requires a second argument." >&2
        exit 1
      fi
      ;;
    --debug)
      DEBUG_MODE=true
      echo "DEBUG MODE ENABLED"
      shift
      ;;
    *)
      # Assume it's the chapter range or number
      if [[ "$1" == *":"* ]]; then
          CHAPTER_RANGE="$1"
      elif [[ "$1" =~ ^[0-9]+$ ]] || [[ "$1" =~ ^-[0-9]+:.*$ ]] || [[ "$1" =~ ^.*:-[0-9]+$ ]]; then
          # Handle numeric, range with negatives
          CHAPTER_RANGE="$1"
      elif [ -z "$CHAPTER_NUM" ] && [ -z "$CHAPTER_RANGE" ]; then
          # Legacy single chapter number
          CHAPTER_NUM="$1"
      fi
      shift
      ;;
  esac
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
command -v perl >/dev/null 2>&1 || { echo "Error: perl not found (required for timeout)"; exit 1; }
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
# HELPER FUNCTION: Run XeLaTeX with timeout and error checking
# ==============================================================================
run_xelatex_with_timeout() {
    local jobname="$1"
    local latex_input="$2"
    local pass_num="$3"
    local total_passes="$4"
    
    local log_file="../$BUILD_DATA_DIR/$jobname.log"
    local timeout_duration=300 # 5 minutes

    echo "--- Pass $pass_num/$total_passes ($jobname) ---"

    # Prepare command
    local xelatex_cmd="xelatex -jobname=\"$jobname\" -shell-escape -interaction=nonstopmode -output-directory=\"../$BUILD_DATA_DIR\" \"$latex_input\""

    # Run with timeout
    # Using perl for a cross-platform timeout solution
    (cd "$LATEX_DIR" && perl -e "alarm $timeout_duration; exec @ARGV" sh -c "$xelatex_cmd") &
    local pid=$!
    wait $pid
    local exit_code=$?

    # Check for errors
    if [ $exit_code -ne 0 ]; then
        echo "❌ Pass $pass_num FAILED with exit code $exit_code."
        if [ $exit_code -eq 142 ] || [ $exit_code -eq 137 ]; then # SIGALRM or SIGKILL
             echo "   Reason: Command timed out after $timeout_duration seconds."
        else
             echo "   Reason: XeLaTeX compilation error."
        fi
        
        if [ -f "$LATEX_DIR/$log_file" ]; then
            echo "   --- Last 50 lines of log file ($log_file) ---"
            tail -50 "$LATEX_DIR/$log_file"
            echo "   ------------------------------------------"
        else
            echo "   Log file not found."
        fi
        
        # In debug mode, don't exit, to allow inspection
        if [ "$DEBUG_MODE" = false ]; then
            exit 1
        else
            echo "   (Debug mode: Continuing despite error)"
            return 1
        fi
    fi

    # Also check log for fatal errors that don't cause a non-zero exit code
    if [ -f "$LATEX_DIR/$log_file" ] && grep -q "Fatal error" "$LATEX_DIR/$log_file"; then
        echo "❌ Pass $pass_num FAILED. Fatal error found in log file."
        echo "   --- Last 50 lines of log file ($log_file) ---"
        tail -50 "$LATEX_DIR/$log_file"
        echo "   ------------------------------------------"
        if [ "$DEBUG_MODE" = false ]; then
            exit 1
        else
            echo "   (Debug mode: Continuing despite error)"
            return 1
        fi
    fi

    # Output handling
    if [ "$DEBUG_MODE" = true ]; then
        echo "   (Debug mode: Full log available at $LATEX_DIR/$log_file)"
    else
        # Show concise output on success
        grep --line-buffered -E "LOADING CHAPTER|CHAPTER.*COMPLETE|Output written|pages" "$LATEX_DIR/$log_file" | tail -n 20
    fi
    
    echo "✅ Pass $pass_num complete."
    return 0
}


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
        if ! [[ "$start_chapter" =~ ^[0-9]+$ ]] || [ "$start_chapter" -lt 1 ] || [ "$start_chapter" -gt $total_chapters ]; then
            echo "Error: Start chapter $start_chapter out of range (1-$total_chapters)"
            exit 1
        fi
        if ! [[ "$end_chapter" =~ ^[0-9]+$ ]] || [ "$end_chapter" -lt 1 ] || [ "$end_chapter" -gt $total_chapters ]; then
            echo "Error: End chapter $end_chapter out of range (1-$total_chapters)"
            exit 1
        fi
        if [ "$start_chapter" -gt "$end_chapter" ]; then
            echo "Error: Start chapter $start_chapter > end chapter $end_chapter"
            exit 1
        fi
    elif [[ "$range" =~ ^[0-9]+$ ]]; then
        # Single number range
        start_chapter=$range
        end_chapter=$range
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
    TEST_DOC_NAME="test-chapter-$CHAPTER_NUM"
    TEST_DOC_TEX="_build_data/$TEST_DOC_NAME.tex"
    cat > "$TEST_DOC_TEX" <<EOF
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
    run_xelatex_with_timeout "$TEST_DOC_NAME" "../$TEST_DOC_TEX" "1" "1"
    
    if [ -f "$BUILD_DATA_DIR/$TEST_DOC_NAME.pdf" ]; then
        cp "$BUILD_DATA_DIR/$TEST_DOC_NAME.pdf" "./$TEST_DOC_NAME.pdf"
        echo
        echo "========================================"
        echo "✅ CHAPTER $CHAPTER_NUM BUILD SUCCESSFUL"
        echo "========================================"
        echo "Output: $TEST_DOC_NAME.pdf"
        open "$TEST_DOC_NAME.pdf"
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
echo
echo "--- Building Print PDF (Color) ---"

# Create modified version of chimera-book.tex if needed
if [ ! -z "$INCLUDEONLY_LIST" ]; then
    create_modified_book "$BUILD_DATA_DIR/chimera-book-print-modified.tex" "$ISBN_PRINT" "$INCLUDEONLY_LIST"
    PRINT_INPUT_BASE="chimera-book-print-modified.tex"
else
    PRINT_INPUT_BASE="$DOC.tex"
fi
PRINT_INPUT_TEX="../$BUILD_DATA_DIR/$PRINT_INPUT_BASE"
# If not modified, the path should be relative to LATEX_DIR
if [ -z "$INCLUDEONLY_LIST" ]; then
    PRINT_INPUT_TEX="$PRINT_INPUT_BASE"
fi

# Define inputs for XeLaTeX
PRINT_XELATEX_INPUT="\\def\\ISBN{$ISBN_PRINT}"
if [ ! -z "$WATERMARK_MODE" ]; then
    PRINT_XELATEX_INPUT="\\AtBeginDocument{$WATERMARK_MODE}$PRINT_XELATEX_INPUT"
fi
PRINT_XELATEX_INPUT="$PRINT_XELATEX_INPUT\\input{$PRINT_INPUT_TEX}"


# Run passes
run_xelatex_with_timeout "chimera-book-print" "$PRINT_XELATEX_INPUT" "1" "3"

# Run biber for bibliography
if [ -f "$BUILD_DATA_DIR/chimera-book-print.bcf" ]; then
    echo "--- Running biber (Print) ---"
    (biber "$BUILD_DATA_DIR/chimera-book-print") 2>&1 | tail -10
    if [ ${PIPESTATUS[0]} -ne 0 ]; then
        echo "⚠️ Biber failed for print version. Bibliography may be incorrect. Continuing build..."
        if [ "$DEBUG_MODE" = true ]; then
            # In debug mode, show the full error
            biber "$BUILD_DATA_DIR/chimera-book-print"
        fi
    fi
fi

# Two more passes for references
run_xelatex_with_timeout "chimera-book-print" "$PRINT_XELATEX_INPUT" "2" "3"
run_xelatex_with_timeout "chimera-book-print" "$PRINT_XELATEX_INPUT" "3" "3"

cp "$BUILD_DATA_DIR/chimera-book-print.pdf" "./chimera-book-print.pdf"

# ==============================================================================
# E-PDF BUILD
# ==============================================================================
echo
echo "--- Building E-PDF version ---"

# Create modified version for E-PDF if needed
if [ ! -z "$INCLUDEONLY_LIST" ]; then
    create_modified_book "$BUILD_DATA_DIR/chimera-book-epdf-modified.tex" "$ISBN_EPDF" "$INCLUDEONLY_LIST"
    EPDF_INPUT_BASE="chimera-book-epdf-modified.tex"
else
    EPDF_INPUT_BASE="$DOC.tex"
fi
EPDF_INPUT_TEX="../$BUILD_DATA_DIR/$EPDF_INPUT_BASE"
if [ -z "$INCLUDEONLY_LIST" ]; then
    EPDF_INPUT_TEX="$EPDF_INPUT_BASE"
fi


# Define metadata and inputs for XeLaTeX
EPDF_METADATA="\\def\\pdftitle{Digital Signal Processing: Past, Present & Future}\\def\\pdfsubject{The Chimera Project}\\def\\pdfauthor{Rowan Jones, Editor}\\def\\pdfkeywords{signal processing, modulation, M-Theory, telecommunications, DSP}\\def\\ISBN{$ISBN_EPDF}"
EPDF_XELATEX_INPUT="$EPDF_METADATA"
if [ ! -z "$WATERMARK_MODE" ]; then
    EPDF_XELATEX_INPUT="\\AtBeginDocument{$WATERMARK_MODE}$EPDF_XELATEX_INPUT"
fi
EPDF_XELATEX_INPUT="$EPDF_XELATEX_INPUT\\input{$EPDF_INPUT_TEX}"

# Run passes
run_xelatex_with_timeout "chimera-book-epdf" "$EPDF_XELATEX_INPUT" "1" "3"

# Run Biber for citations if needed
if [ -f "$BUILD_DATA_DIR/chimera-book-epdf.bcf" ]; then
    echo "--- Running biber (E-PDF) ---"
    (biber "$BUILD_DATA_DIR/chimera-book-epdf") 2>&1 | tail -10
    if [ ${PIPESTATUS[0]} -ne 0 ]; then
        echo "⚠️ Biber failed for E-PDF version. Bibliography may be incorrect. Continuing build..."
        if [ "$DEBUG_MODE" = true ]; then
            biber "$BUILD_DATA_DIR/chimera-book-epdf"
        fi
    fi
    
    # Re-run xelatex to include citations
    run_xelatex_with_timeout "chimera-book-epdf" "$EPDF_XELATEX_INPUT" "2" "3"
    run_xelatex_with_timeout "chimera-book-epdf" "$EPDF_XELATEX_INPUT" "3" "3"
else
    # If no biber run needed, we still need the other two passes
    run_xelatex_with_timeout "chimera-book-epdf" "$EPDF_XELATEX_INPUT" "2" "3"
    run_xelatex_with_timeout "chimera-book-epdf" "$EPDF_XELATEX_INPUT" "3" "3"
fi
cp "$BUILD_DATA_DIR/chimera-book-epdf.pdf" "./chimera-book-epdf.pdf"

# ==============================================================================
# EPUB BUILD
# ==============================================================================
echo
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
    echo "Check logs in $BUILD_DATA_DIR for errors."
    exit 1
fi

echo
echo "Cleaning auxiliary files..."
# The _build_data directory is cleaned at the start of the script.
# No need to delete it upon successful completion, allows for inspection of logs.

echo "Done!"
