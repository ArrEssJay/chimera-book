#!/bin/bash
# ==============================================================================
# Jekyll Build Script for Chimera Book
# ==============================================================================
# Converts LaTeX chapters to Markdown for Jekyll/GitHub Pages
# Focus: Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex
# ==============================================================================

set -e  # Exit on error

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
CHAPTERS_DIR="$ROOT_DIR/chapters"
OUTPUT_DIR="$ROOT_DIR/_chapters"
IMAGES_DIR="$ROOT_DIR/assets/images"

# Exemplar chapter
EXEMPLAR_TEX="Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex"
EXEMPLAR_MD="binary-phase-shift-keying-bpsk-exemplar-v2.md"

echo "=========================================="
echo "Jekyll Build Script - Chimera Book"
echo "=========================================="
echo ""

# Check dependencies
echo "🔍 Checking dependencies..."
command -v pandoc >/dev/null 2>&1 || { echo "❌ pandoc not installed. Install with: apt-get install pandoc"; exit 1; }
command -v pdflatex >/dev/null 2>&1 || { echo "❌ pdflatex not installed. Install with: apt-get install texlive-latex-base"; exit 1; }
echo "✅ Dependencies OK"
echo ""

# Create directories
echo "📁 Creating output directories..."
mkdir -p "$OUTPUT_DIR"
mkdir -p "$IMAGES_DIR"
echo "✅ Directories created"
echo ""

# Function to extract TikZ diagrams from LaTeX
extract_tikz_diagrams() {
    local tex_file="$1"
    local output_prefix="$2"
    
    echo "🎨 Extracting TikZ diagrams from $tex_file..."
    
    # Extract TikZ code blocks
    local diagram_count=0
    local in_tikz=0
    local tikz_content=""
    local line_num=0
    
    while IFS= read -r line; do
        line_num=$((line_num + 1))
        
        if [[ "$line" =~ \\begin\{tikzpicture\} ]]; then
            in_tikz=1
            tikz_content="$line"$'\n'
            diagram_count=$((diagram_count + 1))
        elif [[ $in_tikz -eq 1 ]]; then
            tikz_content+="$line"$'\n'
            
            if [[ "$line" =~ \\end\{tikzpicture\} ]]; then
                # Create standalone LaTeX file for this diagram
                local diagram_tex="$OUTPUT_DIR/tikz_diagram_${diagram_count}.tex"
                local diagram_pdf="$OUTPUT_DIR/tikz_diagram_${diagram_count}.pdf"
                local diagram_svg="$IMAGES_DIR/${output_prefix}_diagram_${diagram_count}.svg"
                
                cat > "$diagram_tex" <<EOF
\\documentclass[tikz,border=10pt]{standalone}
\\usepackage{tikz}
\\usetikzlibrary{arrows,shapes,positioning,calc}
\\usepackage{amsmath}

\\begin{document}
$tikz_content
\\end{document}
EOF
                
                # Compile to PDF
                echo "  📊 Compiling diagram $diagram_count..."
                (cd "$OUTPUT_DIR" && pdflatex -interaction=nonstopmode "tikz_diagram_${diagram_count}.tex" > /dev/null 2>&1) || {
                    echo "  ⚠️  Warning: Failed to compile diagram $diagram_count"
                }
                
                # Convert to SVG if pdf2svg is available
                if command -v pdf2svg >/dev/null 2>&1; then
                    pdf2svg "$diagram_pdf" "$diagram_svg" 2>/dev/null || {
                        echo "  ⚠️  Warning: Failed to convert diagram $diagram_count to SVG"
                    }
                    echo "  ✅ Created: $(basename "$diagram_svg")"
                else
                    echo "  ℹ️  pdf2svg not available - diagrams will be included as code blocks"
                fi
                
                in_tikz=0
                tikz_content=""
            fi
        fi
    done < "$tex_file"
    
    echo "  Found $diagram_count TikZ diagrams"
    echo $diagram_count
}

# Function to convert LaTeX to Markdown
convert_to_markdown() {
    local tex_file="$1"
    local md_file="$2"
    local title="$3"
    local permalink="$4"
    
    echo "📝 Converting LaTeX to Markdown..."
    echo "   Input:  $tex_file"
    echo "   Output: $md_file"
    
    # Use pandoc for conversion
    # --wrap=none: Don't wrap lines (preserves math)
    # -f latex: From LaTeX
    # -t gfm+tex_math_dollars: To GitHub Flavored Markdown with $ math
    pandoc "$tex_file" \
        -f latex \
        -t gfm+tex_math_dollars \
        --wrap=none \
        -o "$md_file.tmp" 2>/dev/null || {
            echo "❌ Pandoc conversion failed"
            return 1
        }
    
    # Add Jekyll frontmatter
    cat > "$md_file" <<EOF
---
layout: chapter
title: "$title"
permalink: $permalink
date: $(date +%Y-%m-%d)
---

EOF
    
    # Append converted content and replace empty center divs with diagram images
    local diagram_num=1
    local in_center_div=0
    while IFS= read -r line; do
        if [[ "$line" =~ ^\<div\ class=\"center\"\>$ ]]; then
            # Found start of center div
            in_center_div=1
            continue
        elif [[ $in_center_div -eq 1 ]]; then
            if [[ "$line" =~ ^\</div\>$ ]]; then
                # Found end of empty center div, insert diagram
                echo "" >> "$md_file"
                echo "![Diagram $diagram_num]({{ '/assets/images/bpsk-exemplar_diagram_${diagram_num}.svg' | relative_url }})" >> "$md_file"
                echo "{: .center-image}" >> "$md_file"
                echo "" >> "$md_file"
                diagram_num=$((diagram_num + 1))
                in_center_div=0
                continue
            elif [[ -z "$line" ]]; then
                # Skip blank lines inside center div
                continue
            fi
        fi
        
        # Output all other lines
        echo "$line" >> "$md_file"
    done < "$md_file.tmp"
    rm -f "$md_file.tmp"
    
    echo "✅ Conversion complete"
}

# Main conversion process
echo "🚀 Converting exemplar chapter..."
echo ""

# Extract TikZ diagrams
diagram_count=$(extract_tikz_diagrams \
    "$CHAPTERS_DIR/$EXEMPLAR_TEX" \
    "bpsk-exemplar" | tail -1)

echo ""

# Convert to Markdown
convert_to_markdown \
    "$CHAPTERS_DIR/$EXEMPLAR_TEX" \
    "$OUTPUT_DIR/$EXEMPLAR_MD" \
    "Binary Phase-Shift Keying (BPSK)" \
    "/chapters/binary-phase-shift-keying-bpsk-exemplar-v2"

echo ""

# Clean up temporary files
echo "🧹 Cleaning up..."
rm -f "$OUTPUT_DIR"/*.aux "$OUTPUT_DIR"/*.log "$OUTPUT_DIR"/*.tex
echo "✅ Cleanup complete"
echo ""

# Summary
echo "=========================================="
echo "✅ Build Complete!"
echo "=========================================="
echo ""
echo "📄 Markdown output: $OUTPUT_DIR/$EXEMPLAR_MD"
if [ -d "$IMAGES_DIR" ] && [ "$(ls -A "$IMAGES_DIR" 2>/dev/null)" ]; then
    echo "🎨 Diagram images: $IMAGES_DIR/"
    ls -1 "$IMAGES_DIR"/*.svg 2>/dev/null || echo "   (No SVG diagrams generated - pdf2svg not available)"
fi
echo ""
echo "Next steps:"
echo "  1. Install Jekyll dependencies: bundle install"
echo "  2. Serve locally: bundle exec jekyll serve"
echo "  3. Visit: http://localhost:4000/chimera-book/chapters/binary-phase-shift-keying-bpsk-exemplar-v2"
echo ""
