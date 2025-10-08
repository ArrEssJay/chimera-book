#!/bin/bash

# ==============================================================================
# Adobe Fonts Extractor
#
# This script reads the internal PostScript name directly from the font header
# using `otfinfo`, then uses `grep` and `awk` to parse the output and
# extract ONLY the PostScript name. This guarantees a clean, correct filename.
#
# USAGE:
#   ./extract_adobe_fonts_v_final_final.sh /path/to/output/folder
#
# REQUIRES:
#   - macOS, Homebrew (`brew install lcdf-typetools`)
# ==============================================================================

# --- Configuration ---
ADOBE_FONT_DIR="$HOME/Library/Application Support/Adobe/CoreSync/plugins/livetype/"

# --- Pre-flight Checks ---
if ! command -v otfinfo &> /dev/null; then
    echo "❌ ERROR: 'otfinfo' not found. Please run: brew install lcdf-typetools"
    exit 1
fi
if [ -z "$1" ]; then
  echo "❌ ERROR: You must provide an output directory."
  exit 1
fi
OUTPUT_DIR="$1"
if [ ! -d "$ADOBE_FONT_DIR" ]; then
  echo "❌ ERROR: Adobe font directory not found: $ADOBE_FONT_DIR"
  exit 1
fi
mkdir -p "$OUTPUT_DIR"
echo "✅ Output directory set to: $OUTPUT_DIR"

# --- Main Logic ---
echo "🔎 Reading font headers and parsing for PostScript names..."
echo "------------------------------------------------------------------"

processed_count=0
error_count=0

find "$ADOBE_FONT_DIR" -type f -name "*.otf" | while read -r font_path; do
  
  # THE CRITICAL FIX IS HERE:
  # 1. `otfinfo -i`: Get the full info block.
  # 2. `grep 'PostScript name:'`: Isolate the correct line.
  # 3. `awk '{$1=$2=""; print $0}'`: Print everything *after* the first two words.
  # 4. `sed 's/^[[:space:]]*//'`: Trim leading whitespace.
  postscript_name=$(otfinfo -i "$font_path" | grep 'PostScript name:' | awk '{$1=$2=""; print $0}' | sed 's/^[[:space:]]*//')
  
  if [ -z "$postscript_name" ]; then
    echo "⚠️  WARNING: Could not parse PostScript name for '$font_path'. Skipping."
    ((error_count++))
    continue
  fi

  new_filename="${postscript_name}.otf"
  dest_path="$OUTPUT_DIR/$new_filename"

  echo "  ✅ Reading '$font_path' -> Found name '$postscript_name' -> Copying to '$new_filename'"
  
  cp "$font_path" "$dest_path"
  ((processed_count++))

done

echo "------------------------------------------------------------------"
echo "✅ Font extraction complete."
echo "   Processed: $processed_count files."
if [ "$error_count" -gt 0 ]; then
  echo "   Errors:    $error_count files could not be read."
fi