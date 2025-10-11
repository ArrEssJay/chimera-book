# Table of Contents Testing Guide

## Quick Validation Commands

These commands help verify the TOC configuration is working correctly.

### 1. Build the Book

```bash
cd /home/runner/work/chimera-book/chimera-book
./build-book.sh
```

The build script performs 4 XeLaTeX passes automatically to ensure all references resolve.

### 2. Check TOC File Generated

```bash
ls -lh _build/chimera-book.toc
```

Expected: A `.toc` file should exist with reasonable size (not empty).

### 3. Verify No ?? Page Numbers

```bash
# Install pdfgrep if needed
# Ubuntu/Debian: sudo apt-get install pdfgrep
# macOS: brew install pdfgrep

pdfgrep -A 1 "Contents" chimera-book.pdf | grep "??"
```

Expected: Empty output (no "??" strings found). If found, run build script again.

### 4. Count TOC Pages

```bash
pdfinfo chimera-book.pdf | grep Pages
```

Expected: Total pages shown. TOC should be ≤6 pages for 66 chapters (currently ~8 chapters).

### 5. Visual Inspection

Open `chimera-book.pdf` and check:

- [ ] TOC appears after frontmatter (dedication, foreword)
- [ ] All chapters are listed
- [ ] Sections are indented 1.5em from chapters
- [ ] Subsections are indented 3em from chapters (1.5em from sections)
- [ ] Part titles (if present) are bold, large, sans-serif
- [ ] Chapter titles are bold sans-serif
- [ ] Section titles are regular sans-serif
- [ ] Subsection titles are regular serif
- [ ] Page numbers are accurate
- [ ] Dot leaders connect entries to page numbers
- [ ] Spacing is consistent and readable

### 6. Check Specific Chapter

Pick a chapter with known structure, e.g., "Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2":

```bash
# List sections in the chapter
grep "\\\\section\|\\\\subsection" _latex/chapters/Binary-Phase-Shift-Keying-\(BPSK\)-EXEMPLAR-V2.tex
```

Compare the output with what appears in the TOC. All sections/subsections should be present.

### 7. Test TOC Depth

The configuration sets `tocdepth=2` which means:
- Level 0: Part (if present)
- Level 1: Chapter
- Level 2: Section
- Level 3: Subsection

Subsubsections (level 4) should NOT appear in TOC but should still be numbered (secnumdepth=3).

### 8. Check LaTeX Log

If build fails, check the log:

```bash
tail -50 _build/chimera-book.log
```

Look for errors related to:
- `tocloft` package
- TOC formatting commands
- Missing fonts

## Troubleshooting

### Issue: "??" in page numbers

**Solution**: Run build script again. TOC requires at least 2 passes to resolve page numbers.

### Issue: TOC too long (>6 pages)

**Solution**: Reduce tocdepth in `_latex/preamble.tex`:
```latex
\setcounter{tocdepth}{1}  % Show only chapters and sections
```

### Issue: Font not found errors

**Solution**: The configuration uses existing book fonts with fallbacks:
- Myriad Pro → Latin Modern Sans (if not available)
- Minion Pro → Latin Modern Roman (if not available)

### Issue: tocloft package conflicts

**Solution**: Check package load order in preamble. tocloft should load after titlesec.

## Expected TOC Structure (Current Book)

With 8 chapters currently included:

```
Table of Contents

Chapter 1: Binary Phase-Shift Keying (BPSK).................. 1
  1.1 Overview............................................ 2
  1.2 Mathematical Description............................ 3
    1.2.1 Signal Representation........................... 3
    1.2.2 Constellation Diagram........................... 4
  1.3 Performance......................................... 5
  ...

Chapter 2: On-Off Keying (OOK)............................. 15
  2.1 Overview............................................ 16
  ...

[... 6 more chapters ...]

Glossary.................................................... 100
Colophon.................................................... 105
```

(Actual page numbers will vary based on chapter content)

## Validation Checklist

Before submitting the PR as complete:

- [ ] Book builds without errors
- [ ] TOC file generated successfully
- [ ] No "??" page numbers in TOC
- [ ] All hierarchy levels visible (Part, Chapter, Section, Subsection)
- [ ] Indentation correct (1.5em for sections, 3em for subsections)
- [ ] Font styling matches specification
- [ ] Spacing consistent and readable
- [ ] Page numbers accurate
- [ ] TOC fits within reasonable page count
- [ ] Cross-references to chapters work
- [ ] No warnings in LaTeX log related to TOC

## Additional Resources

- tocloft documentation: `texdoc tocloft`
- LaTeX book class: `texdoc book`
- Test with single chapter: See `validate_all_chapters.sh`
