#!/bin/bash
# =============================================================================
# Chimera Book - Jekyll Site Builder
# =============================================================================
# Converts LaTeX chapters to Markdown and builds Jekyll site
# Usage: ./build-site.sh [--serve]
# =============================================================================

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=====================================${NC}"
echo -e "${BLUE}Chimera Book - Jekyll Site Builder${NC}"
echo -e "${BLUE}=====================================${NC}"
echo

# Check for required tools
command -v pandoc >/dev/null 2>&1 || { echo "❌ pandoc required but not installed"; exit 1; }
command -v bundle >/dev/null 2>&1 || { echo "❌ bundle required but not installed"; exit 1; }

# Directories
LATEX_DIR="latex"
CHAPTERS_DIR="chapters"
FRONTMATTER_DIR="frontmatter"
BUILD_DIR="_build"

# Clean and create directories
echo -e "${YELLOW}📁 Setting up directories...${NC}"
rm -rf "$CHAPTERS_DIR" "$FRONTMATTER_DIR" "$BUILD_DIR"
mkdir -p "$CHAPTERS_DIR" "$FRONTMATTER_DIR" "$BUILD_DIR"

# Convert frontmatter
echo -e "${YELLOW}📝 Converting front matter...${NC}"
for tex_file in "$LATEX_DIR/frontmatter"/*.tex; do
    if [ -f "$tex_file" ]; then
        filename=$(basename "$tex_file" .tex)
        md_file="$FRONTMATTER_DIR/${filename}.md"
        
        echo "  - Converting $filename"
        
        # Convert to markdown
        pandoc "$tex_file" \
            -f latex \
            -t gfm \
            --wrap=preserve \
            -o "$md_file"
        
        # Add YAML frontmatter
        permalink=$(echo "$filename" | tr '[:upper:]' '[:lower:]')
        cat > "$BUILD_DIR/temp.md" << EOF
---
layout: frontmatter
title: $filename
permalink: /${permalink}/
---

EOF
        cat "$md_file" >> "$BUILD_DIR/temp.md"
        mv "$BUILD_DIR/temp.md" "$md_file"
    fi
done

# Convert chapters
echo -e "${YELLOW}📚 Converting chapters...${NC}"
chapter_count=0
for tex_file in "$LATEX_DIR/chapters"/*.tex; do
    if [ -f "$tex_file" ]; then
        filename=$(basename "$tex_file" .tex)
        md_file="$CHAPTERS_DIR/${filename}.md"
        
        echo "  - Converting $filename"
        
        # Convert to markdown
        pandoc "$tex_file" \
            -f latex \
            -t gfm \
            --wrap=preserve \
            --standalone \
            -o "$md_file"
        
        # Add YAML frontmatter
        chapter_count=$((chapter_count + 1))
        permalink=$(echo "$filename" | tr '[:upper:]' '[:lower:]')
        cat > "$BUILD_DIR/temp.md" << EOF
---
layout: chapter
title: "$filename"
chapter: $chapter_count
permalink: /chapters/${permalink}/
---

EOF
        cat "$md_file" >> "$BUILD_DIR/temp.md"
        mv "$BUILD_DIR/temp.md" "$md_file"
    fi
done

echo -e "${GREEN}✅ Converted $chapter_count chapters${NC}"

# Generate chapters index
echo -e "${YELLOW}📖 Generating chapters index...${NC}"
cat > "$CHAPTERS_DIR/index.md" << 'EOF'
---
layout: page
title: Chapters
permalink: /chapters/
---

# Book Chapters

EOF

for md_file in "$CHAPTERS_DIR"/*.md; do
    if [ -f "$md_file" ] && [ "$(basename "$md_file")" != "index.md" ]; then
        filename=$(basename "$md_file" .md)
        # Extract title from frontmatter or use filename
        title=$(grep "^title:" "$md_file" | sed 's/title: //' | tr -d '"')
        permalink=$(echo "$filename" | tr '[:upper:]' '[:lower:]')
        echo "- [$title](./${permalink}/)" >> "$CHAPTERS_DIR/index.md"
    fi
done

# Install dependencies
if [ -f "Gemfile" ]; then
    echo -e "${YELLOW}📦 Installing Jekyll dependencies...${NC}"
    bundle config set --local path 'vendor/bundle'
    bundle install --quiet
fi

# Build or serve
if [ "$1" == "--serve" ]; then
    echo -e "${GREEN}🚀 Starting Jekyll server...${NC}"
    bundle exec jekyll serve --livereload
else
    echo -e "${YELLOW}🔨 Building Jekyll site...${NC}"
    bundle exec jekyll build
    
    if [ $? -eq 0 ]; then
        echo
        echo -e "${GREEN}=====================================${NC}"
        echo -e "${GREEN}✅ BUILD SUCCESSFUL${NC}"
        echo -e "${GREEN}=====================================${NC}"
        echo -e "Site built to: ${BLUE}_site/${NC}"
        echo -e "Chapters: ${BLUE}$chapter_count${NC}"
        echo
    else
        echo -e "${RED}❌ Build failed${NC}"
        exit 1
    fi
fi
