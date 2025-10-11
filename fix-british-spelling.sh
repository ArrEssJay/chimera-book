#!/bin/bash
# Fix American to British English spelling in all chapter files

cd "$(dirname "$0")/latex/chapters"

echo "Converting American to British English spelling..."

# Create backup
echo "Creating backups..."
for file in *.tex; do
    cp "$file" "$file.backup"
done

# Perform replacements
for file in *.tex; do
    echo "Processing: $file"
    
    # Use sed with word boundaries to avoid partial matches
    sed -i '' \
        -e 's/\([^a-zA-Z]\)polarization\([^a-zA-Z]\)/\1polarisation\2/g' \
        -e 's/\([^a-zA-Z]\)Polarization\([^a-zA-Z]\)/\1Polarisation\2/g' \
        -e 's/\([^a-zA-Z]\)center\([^a-zA-Z]\)/\1centre\2/g' \
        -e 's/\([^a-zA-Z]\)Center\([^a-zA-Z]\)/\1Centre\2/g' \
        -e 's/\([^a-zA-Z]\)analog\([^a-zA-Z]\)/\1analogue\2/g' \
        -e 's/\([^a-zA-Z]\)Analog\([^a-zA-Z]\)/\1Analogue\2/g' \
        -e 's/\([^a-zA-Z]\)analyze\([^a-zA-Z]\)/\1analyse\2/g' \
        -e 's/\([^a-zA-Z]\)Analyze\([^a-zA-Z]\)/\1Analyse\2/g' \
        -e 's/\([^a-zA-Z]\)analyzing\([^a-zA-Z]\)/\1analysing\2/g' \
        -e 's/\([^a-zA-Z]\)Analyzing\([^a-zA-Z]\)/\1Analysing\2/g' \
        -e 's/\([^a-zA-Z]\)analyzed\([^a-zA-Z]\)/\1analysed\2/g' \
        -e 's/\([^a-zA-Z]\)Analyzed\([^a-zA-Z]\)/\1Analysed\2/g' \
        -e 's/\([^a-zA-Z]\)neighboring\([^a-zA-Z]\)/\1neighbouring\2/g' \
        -e 's/\([^a-zA-Z]\)Neighboring\([^a-zA-Z]\)/\1Neighbouring\2/g' \
        -e 's/\([^a-zA-Z]\)neighbor\([^a-zA-Z]\)/\1neighbour\2/g' \
        -e 's/\([^a-zA-Z]\)Neighbor\([^a-zA-Z]\)/\1Neighbour\2/g' \
        -e 's/\([^a-zA-Z]\)color\([^a-zA-Z]\)/\1colour\2/g' \
        -e 's/\([^a-zA-Z]\)Color\([^a-zA-Z]\)/\1Colour\2/g' \
        -e 's/\([^a-zA-Z]\)favor\([^a-zA-Z]\)/\1favour\2/g' \
        -e 's/\([^a-zA-Z]\)Favor\([^a-zA-Z]\)/\1Favour\2/g' \
        -e 's/\([^a-zA-Z]\)behavior\([^a-zA-Z]\)/\1behaviour\2/g' \
        -e 's/\([^a-zA-Z]\)Behavior\([^a-zA-Z]\)/\1Behaviour\2/g' \
        -e 's/\([^a-zA-Z]\)optimize\([^a-zA-Z]\)/\1optimise\2/g' \
        -e 's/\([^a-zA-Z]\)Optimize\([^a-zA-Z]\)/\1Optimise\2/g' \
        -e 's/\([^a-zA-Z]\)optimization\([^a-zA-Z]\)/\1optimisation\2/g' \
        -e 's/\([^a-zA-Z]\)Optimization\([^a-zA-Z]\)/\1Optimisation\2/g' \
        -e 's/\([^a-zA-Z]\)realize\([^a-zA-Z]\)/\1realise\2/g' \
        -e 's/\([^a-zA-Z]\)Realize\([^a-zA-Z]\)/\1Realise\2/g' \
        -e 's/\([^a-zA-Z]\)recognize\([^a-zA-Z]\)/\1recognise\2/g' \
        -e 's/\([^a-zA-Z]\)Recognize\([^a-zA-Z]\)/\1Recognise\2/g' \
        "$file"
done

echo "✓ British English spelling conversion complete!"
echo "Backups saved with .backup extension"
echo "To revert: for f in *.tex.backup; do mv \"\$f\" \"\${f%.backup}\"; done"
