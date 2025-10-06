#!/bin/bash
# Fix Unicode characters in LaTeX source files
# Replace Unicode subscripts/superscripts with proper LaTeX commands

cd "$(dirname "$0")"

# Find all .tex files in chapters/
find chapters/ -name "*.tex" -type f | while read -r file; do
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.bak"
    
    # Subscripts
    sed -i '' 's/ᵢ/_{i}/g' "$file"
    sed -i '' 's/ᵦ/_{b}/g' "$file"
    sed -i '' 's/ᵣ/_{r}/g' "$file"
    
    # Superscripts
    sed -i '' 's/ᵗ/^{t}/g' "$file"
    sed -i '' 's/ᵀ/^{T}/g' "$file"
    
    # Symbols - remove these visual crutches
    sed -i '' 's/🟢//g' "$file"  # Remove green circles
    sed -i '' 's/🎉//g' "$file"  # Remove party emoji
    sed -i '' 's/📊//g' "$file"  # Remove chart emoji
    sed -i '' 's/😞//g' "$file"  # Remove sad emoji
    sed -i '' 's/🛰️//g' "$file"  # Remove satellite emoji
    sed -i '' 's/🛰//g' "$file"   # Remove satellite emoji (no variation selector)
    sed -i '' 's/💡//g' "$file"  # Remove lightbulb emoji
    
    # Warning symbols in callout titles - keep these but make them proper LaTeX
    sed -i '' 's/⚠️/\\textbf{WARNING:}/g' "$file"
    sed -i '' 's/⚠/\\textbf{WARNING:}/g' "$file"
    sed -i '' 's/▲/\\textbf{NOTE:}/g' "$file"
    
    echo "  ✓ Fixed"
done

echo ""
echo "Done! Backup files saved as .tex.bak"
echo "Review changes and run: find chapters/ -name '*.tex.bak' -delete"
