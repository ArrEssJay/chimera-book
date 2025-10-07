# Jekyll Setup for Chimera Book

This document describes the Jekyll build pipeline for converting LaTeX chapters to a GitHub Pages website.

## Overview

The Jekyll pipeline converts LaTeX source files to Markdown and builds a static website with:
- Math rendering via MathJax
- TikZ diagrams converted to SVG
- Responsive design with clean typography
- Automatic deployment to GitHub Pages

## Local Development

### Prerequisites

```bash
# Install dependencies (Ubuntu/Debian)
sudo apt-get install \
  texlive-latex-base \
  texlive-latex-extra \
  texlive-fonts-recommended \
  texlive-fonts-extra \
  texlive-science \
  pdf2svg \
  pandoc \
  ruby \
  ruby-bundler

# Install Jekyll dependencies
bundle install
```

### Convert and Build

```bash
# Convert exemplar chapter from LaTeX to Markdown
./scripts/build-jekyll.sh

# Build Jekyll site
bundle exec jekyll build

# Serve locally
bundle exec jekyll serve
# Visit: http://localhost:4000/chimera-book/
```

## GitHub Actions Deployment

The `.github/workflows/jekyll.yml` workflow automatically:
1. Converts the exemplar LaTeX chapter to Markdown
2. Extracts and converts TikZ diagrams to SVG
3. Builds the Jekyll site
4. Deploys to GitHub Pages

Triggers on push to `main` or `merge-wiki-improvements` branches.

## File Structure

```
.
├── _config.yml                 # Jekyll configuration
├── _layouts/
│   ├── chapter.html           # Chapter page layout (with MathJax)
│   └── default.html           # Default page layout
├── _chapters/                  # Converted markdown chapters
│   └── binary-phase-shift-keying-bpsk-exemplar-v2.md
├── assets/images/              # Generated diagram images
│   ├── bpsk-exemplar_diagram_1.svg
│   ├── bpsk-exemplar_diagram_2.svg
│   └── ...
├── scripts/
│   └── build-jekyll.sh        # Conversion script
├── chapters/                   # LaTeX source (read-only)
└── index.md                    # Homepage
```

## Conversion Process

The `scripts/build-jekyll.sh` script:

1. **Extract TikZ Diagrams**: Finds all `\begin{tikzpicture}...\end{tikzpicture}` blocks
2. **Compile to PDF**: Creates standalone LaTeX files and compiles each diagram
3. **Convert to SVG**: Uses `pdf2svg` to convert PDFs to scalable SVG images
4. **Convert LaTeX to Markdown**: Uses `pandoc` with GitHub Flavored Markdown
5. **Insert Images**: Replaces empty `<div class="center">` tags with image references
6. **Add Frontmatter**: Adds Jekyll frontmatter with title, layout, and permalink

## Math Rendering

Math is preserved using dollar sign notation:
- Inline: `$E = mc^2$`
- Display: `$$E = mc^2$$`

MathJax is loaded in the chapter layout and renders all LaTeX math notation.

## Adding More Chapters

To convert additional chapters:

1. Edit `scripts/build-jekyll.sh`
2. Add the chapter filename to the conversion list
3. Update output filename and permalink
4. Run the script and commit the generated files

## Customization

### Styling

Edit `_layouts/chapter.html` or `_layouts/default.html` to customize:
- Typography (currently: Libertinus body, Cabin headings)
- Colors (currently: Navy blue #003366)
- Layout and spacing

### Configuration

Edit `_config.yml` to change:
- Site title and description
- Base URL (for deployment)
- Collections and permalinks
- Excluded files

## Troubleshooting

### TikZ Compilation Fails

Ensure all required LaTeX packages are installed:
```bash
sudo apt-get install texlive-full
```

### Math Not Rendering

Check that MathJax script is loading in browser console. The script should be loaded from CDN.

### Images Not Showing

Verify that:
1. SVG files exist in `assets/images/`
2. Image paths use `{{ '/assets/images/...' | relative_url }}`
3. Jekyll build includes the assets directory

### Bundle Install Hangs

Kill the process and restart with verbose output:
```bash
bundle install --verbose
```

Or install to local vendor directory:
```bash
bundle config set --local path 'vendor/bundle'
bundle install
```

## GitHub Pages Settings

To enable GitHub Pages for this repository:

1. Go to repository Settings → Pages
2. Set Source to "GitHub Actions"
3. The workflow will deploy on the next push to `main`

Visit the deployed site at: `https://arressjay.github.io/chimera-book/`

## Future Enhancements

- [ ] Convert all 71 chapters (not just exemplar)
- [ ] Add chapter navigation (prev/next)
- [ ] Generate table of contents
- [ ] Add search functionality
- [ ] Improve mobile responsiveness
- [ ] Add dark mode support

## License

CC0 (Public Domain) - Same as the source book.
