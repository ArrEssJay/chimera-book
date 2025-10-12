# Wave 2 TOC Implementation - Validation Checklist

## ✅ Pre-Build Validation (Already Completed)

- [x] `latex/preamble.tex` created with all necessary packages
- [x] TOC configuration section added to preamble.tex
- [x] `tocdepth` set to 2 (shows subsections)
- [x] `secnumdepth` set to 3 (numbers subsubsections)
- [x] `tocloft` package loaded
- [x] Part entries styled: bold sans-serif, Large, 2em spacing
- [x] Chapter entries styled: bold sans-serif, 0.8em spacing, dotted leaders
- [x] Section entries styled: sans-serif, 1.5em indent, 0.4em spacing
- [x] Subsection entries styled: serif, 3em indent, 0.2em spacing
- [x] `latex/chimera-book.tex` updated: removed `\setcounter{tocdepth}{1}`
- [x] `latex/chimera-book.tex` updated: changed `\newpage` to `\clearpage`
- [x] `.gitignore` updated: removed `preamble.tex` entry
- [x] All files committed to git

## 🔨 Build Validation (Requires LaTeX Installation)

To validate the TOC implementation, run these commands:

```bash
cd /home/runner/work/chimera-book/chimera-book

# 1. Clean any previous build artifacts
rm -rf _build_data/*

# 2. Build the book (this runs 3 XeLaTeX passes + biber)
./build-book.sh

# Expected output:
#   - First pass: generates .toc file, page numbers are "??"
#   - Biber pass: processes bibliography
#   - Second pass: resolves page numbers
#   - Third pass: finalizes everything
```

## 📊 Post-Build Validation Checklist

After building, verify these items:

### TOC File Generated
```bash
# Check that TOC file exists and has content
ls -lh _build_data/chimera-book-print.toc
wc -l _build_data/chimera-book-print.toc
# Expected: ~800-1200 lines for 66 chapters with sections/subsections
```

### No Missing Page Numbers
```bash
# Check for any unresolved page references (should return nothing)
grep "??" _build_data/chimera-book-print.toc
# Expected output: (none) - empty result means all page numbers resolved
```

### TOC Structure Verification
```bash
# View first 100 lines of TOC to check hierarchy
head -100 _build_data/chimera-book-print.toc
```

Expected structure in `.toc` file:
```latex
\contentsline {part}{\numberline {I}Foundations of Electromagnetism \& Waves}{1}{part.1}
\contentsline {chapter}{\numberline {1}Maxwell's Equations and Wave Propagation}{3}{chapter.1}
\contentsline {section}{\numberline {1.1}Overview}{4}{section.1.1}
\contentsline {subsection}{\numberline {1.1.1}Historical Context}{4}{subsection.1.1.1}
```

### PDF Page Count
```bash
# Check total page count and TOC page range
pdfinfo _build_data/chimera-book-print.pdf | grep Pages
# Expected: ~300-400 pages total for complete book
```

### Visual TOC Inspection

Open the PDF and check:

- [ ] TOC appears after front matter (dedication, foreword, prologue)
- [ ] TOC spans approximately 4-6 pages (for 66 chapters)
- [ ] **Part titles** appear in **bold, large** font with **2em spacing** above
- [ ] **Chapter titles** appear in **bold** font with **0.8em spacing** above
- [ ] **Section titles** appear in regular font, **indented 1.5em** from left
- [ ] **Subsection titles** appear in serif font, **indented 3em** from left
- [ ] **Dotted leaders** (......) connect titles to page numbers
- [ ] **Page numbers** are all numeric (no "??" symbols)
- [ ] **Visual hierarchy** is clear: Part → Chapter → Section → Subsection

### Content Verification

Spot-check some entries by opening the PDF to those pages:

```bash
# Example: Chapter 14 should be on page listed in TOC
# Example: Section 1.1 should be on page listed in TOC
# Example: Subsection 1.1.1 should be on page listed in TOC
```

- [ ] Part I: Foundations starts at correct page
- [ ] Chapter 1: Maxwell's Equations starts at correct page
- [ ] Chapter 14: BPSK starts at correct page
- [ ] Chapter 66: Bibliography starts at correct page
- [ ] All major sections have correct page numbers

## 🎨 Formatting Verification

Compare TOC styling to specifications:

| Element | Required Style | Actual (Check PDF) |
|---------|---------------|-------------------|
| Part titles | Bold sans-serif, Large, 2em spacing | ☐ |
| Chapter titles | Bold sans-serif, 0.8em spacing | ☐ |
| Section titles | Sans-serif, 1.5em indent | ☐ |
| Subsection titles | Serif, 3em indent | ☐ |
| Page numbers | All numeric, no "??" | ☐ |
| Leaders | Dotted lines to page numbers | ☐ |

## 🔍 Edge Cases to Test

- [ ] TOC correctly handles chapters without subsections
- [ ] TOC correctly handles long chapter/section titles (wrapping)
- [ ] TOC correctly handles special characters in titles (e.g., &, $, %)
- [ ] Part introductions don't appear in TOC (only \part{} command does)
- [ ] Appendix chapters appear correctly in TOC

## 📏 Size Constraints

- [ ] TOC is ≤ 6 pages (for 66 chapters)
  - If > 6 pages, can reduce `tocdepth` from 2 to 1 in preamble.tex

## 🐛 Common Issues & Solutions

### Issue: Page numbers show as "??"
**Solution**: Run build script again (requires 2-3 LaTeX passes)

### Issue: TOC is too long (> 6 pages)
**Solution**: Edit `preamble.tex`, change `\setcounter{tocdepth}{2}` to `\setcounter{tocdepth}{1}`

### Issue: Fonts look wrong
**Solution**: 
1. Check if Minion Pro and Myriad Pro fonts are installed
2. Fallback to Latin Modern is automatic if fonts missing
3. Install commercial fonts from Adobe for best results

### Issue: Build fails with "preamble.tex not found"
**Solution**: File should be at `latex/preamble.tex` - check git pull was successful

### Issue: Spacing looks wrong in TOC
**Solution**: Check these values in `preamble.tex`:
- `\cftbeforepartskip` = 2em
- `\cftbeforechapskip` = 0.8em
- `\cftbeforesecskip` = 0.4em
- `\cftbeforesubsecskip` = 0.2em

## ✅ Sign-Off Checklist

After completing all validation steps above:

- [ ] TOC displays all 9 Parts correctly
- [ ] TOC displays all 66 Chapters correctly
- [ ] TOC displays Sections with proper indentation
- [ ] TOC displays Subsections with proper indentation
- [ ] All page numbers are accurate (spot-checked)
- [ ] Visual hierarchy is clear and professional
- [ ] TOC fits within 6 pages
- [ ] No LaTeX errors or warnings related to TOC
- [ ] Build completes successfully with `./build-book.sh`

## 📝 Notes

- The `tocloft` package handles all TOC formatting
- Multi-pass compilation is REQUIRED for page number resolution
- The TOC is auto-generated from `\part`, `\chapter`, `\section`, `\subsection` commands
- No manual TOC entries needed

---

**Validation Date**: _____________  
**Validated By**: _____________  
**Build Status**: ☐ Pass ☐ Fail  
**Notes**: ___________________________________________
