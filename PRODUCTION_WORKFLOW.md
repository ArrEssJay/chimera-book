# Chapter Production Workflow
## Professional DSP Book Production

**Reference Standard:** Proakis & Manolakis "Digital Signal Processing"

---

## Phase 1: Single Exemplar Chapter (CURRENT)

**Goal:** Perfect one chapter as the template for all others

**Target Chapter:** Binary Phase-Shift Keying (BPSK)
- Good mix of theory, math, diagrams, examples
- Compiled successfully
- Needs content/style refinement

### Tasks:
1. ✅ Create professional preamble with B/W print compatibility
2. ✅ Establish style guide based on Proakis
3. ⏳ **CURRENT:** Review BPSK exemplar against Proakis standards
4. ⏳ Fix all math rendering issues
5. ⏳ Create professional diagrams (TikZ)
6. ⏳ Verify technical accuracy
7. ⏳ Polish typography and layout
8. ⏳ Create mermaid diagrams (convert to PDF)
9. ⏳ Final review and sign-off

---

## Phase 2: Parallel Chapter Production

**Once exemplar approved:**
- Use BPSK as template
- Distribute remaining 68 chapters to parallel workers
- Each worker follows STYLE_GUIDE.md
- Automated validation (validate_all_chapters.sh)

---

## Phase 2: Parallel Production (NOW READY!)

### ✅ Exemplar Approved
- **BPSK Exemplar V2** is complete and ready to use as template
- **Typography finalized:** Libertinus (body) + Cabin (headings - Optima-like)
- **Unicode issues fixed** in all source files
- **Style guide** established

### 🚀 Production System Ready

**Status Tracking:** `CHAPTER_PRODUCTION_STATUS.md`
- 12 waves organized by priority
- Wave 2-5 are critical path (27 chapters)
- Velocity target: 2-3 chapters/day for critical waves

**Helper Script:** `produce_chapter.sh`
```bash
./produce_chapter.sh QPSK-Modulation
# Creates test harness, shows checklist, compiles
```

**Quick Workflow:**
```bash
# 1. Pick a chapter from CHAPTER_PRODUCTION_STATUS.md
# 2. Run helper script
./produce_chapter.sh <chapter-name>

# 3. Edit chapter following exemplar
code chapters/<chapter-name>.tex

# 4. Reference exemplar side-by-side
code chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex

# 5. Test compile frequently
pdflatex -interaction=nonstopmode test_<chapter-name>.tex

# 6. When complete, commit
git add chapters/<chapter-name>.tex
git commit -m "book: professional upgrade of <chapter-name> following exemplar"

# 7. Update CHAPTER_PRODUCTION_STATUS.md
# Mark chapter as [x] complete
```

### 📋 Per-Chapter Checklist

Every chapter must have:
- [ ] Professional LaTeX formatting (follow exemplar)
- [ ] Numbered equations with variable definitions
- [ ] TikZ constellation diagram with grid
- [ ] TikZ block diagrams (modulator/demodulator)
- [ ] Callout boxes (keyconcept, warningbox, calloutbox)
- [ ] Worked example with complete calculation
- [ ] BER performance analysis
- [ ] Applications/use cases section
- [ ] Cross-references using `\ref{ch:name}`
- [ ] Summary section
- [ ] Further Reading with chapter refs
- [ ] Compiles without errors
- [ ] Matches Proakis standards

---

## Immediate Next Steps

### 1. Start Wave 2 (Core Modulation - 7 chapters)

**Priority 1 chapters users learn first:**
1. `Binary-Phase-Shift-Keying-(BPSK).tex` (upgrade from exemplar)
2. `QPSK-Modulation.tex`
3. `8PSK-&-Higher-Order-PSK.tex`
4. `Quadrature-Amplitude-Modulation-(QAM).tex`
5. `Frequency-Shift-Keying-(FSK).tex`
6. `Amplitude-Shift-Keying-(ASK).tex`
7. `On-Off-Keying-(OOK).tex`

**Suggested approach:**
- Do 2-3 chapters per session
- Test compile after each
- Batch commit after wave complete
- [ ] Cross-references valid
- [ ] Technical accuracy verified

### 2. Fix Identified Issues

From LaTeX log review:
- [ ] Remove curved box corners (DONE in preamble)
- [ ] Fix Unicode emoji in titles (DONE - using text symbols)
- [ ] Ensure B/W print compatibility (DONE - grayscale)
- [ ] Add sans-serif headings (DONE)
- [ ] Verify all math renders correctly

### 3. Content Improvements

Reference Proakis Chapter on Digital Modulation:
- [ ] Verify BPSK mathematical description
- [ ] Check BER formula accuracy
- [ ] Validate constellation diagram conventions
- [ ] Confirm carrier recovery techniques
- [ ] Add missing theoretical background if needed

### 4. Visual Improvements

- [ ] Recreate block diagrams in professional TikZ style
- [ ] Improve constellation diagram (grid, labels)
- [ ] Create signal waveform plots if missing
- [ ] Ensure consistent line weights and styling
- [ ] Verify figure captions and references

---

## Chapter Validation Checklist

Use this for EVERY chapter:

### Technical Accuracy
- [ ] Equations verified against Proakis or equivalent source
- [ ] Notation consistent with established style
- [ ] Units present in all numerical examples
- [ ] Dimensional analysis correct
- [ ] Performance curves match theory

### Mathematical Presentation
- [ ] Important equations numbered with `\begin{equation}`
- [ ] Variables defined after first use
- [ ] Derivations shown step-by-step (not skipped)
- [ ] Inline math uses `$...$`
- [ ] Display math uses `equation` or `align`

### Figures & Diagrams
- [ ] All figures numbered (Figure X.Y)
- [ ] Captions below figures
- [ ] Referenced in text
- [ ] Professional quality (clean, labeled, legible)
- [ ] Grayscale-compatible

### Tables
- [ ] All tables numbered (Table X.Y)
- [ ] Captions above tables
- [ ] booktabs style (no vertical lines)
- [ ] Referenced in text
- [ ] Clear column headers with units

### Typography
- [ ] Sans-serif headings
- [ ] Serif body text
- [ ] Consistent spacing
- [ ] No orphans/widows
- [ ] Proper hyphenation

### Callouts
- [ ] Sharp corners (not rounded)
- [ ] Light gray fill (B/W compatible)
- [ ] 1pt borders
- [ ] Sans-serif bold titles
- [ ] Appropriate use (not excessive)

### Cross-References
- [ ] Chapter references use `\ref{ch:name}`
- [ ] Section references use `\ref{sec:name}`
- [ ] Figure/table references use `\ref{fig:name}`, `\ref{tab:name}`
- [ ] All labels defined
- [ ] No broken references

### Bibliography
- [ ] Citations in text [1], [2, 3], etc.
- [ ] Bibliography entries complete
- [ ] Consistent format (numeric style)
- [ ] All cited works in bibliography

### Compilation
- [ ] Compiles without errors
- [ ] No overfull hboxes (or minimal)
- [ ] No undefined references
- [ ] PDF output correct

---

## Automated Validation

```bash
# Test single chapter
cd /Users/rowan/VSCode/chimera/book
./test_chapter.sh chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex

# Validate all chapters
./validate_all_chapters.sh

# Full book build
./build.sh
```

---

## Chapter Conversion Process

For converting wiki markdown to professional book chapters:

### Step 1: Initial Conversion
```bash
pandoc wiki_page.md -f markdown -t latex \
  --lua-filter=../scripts/unicode-to-latex.lua \
  -o chapters/Chapter-Name.tex
```

### Step 2: Manual Cleanup
1. Remove wiki navigation links `{[}{[}...{]}{]}`
2. Fix math mode: `\$...\$` → `$...$`
3. Replace `\textbackslash` with actual LaTeX commands
4. Add `\label{ch:name}` to chapter
5. Add `\label{sec:name}` to major sections
6. Number important equations
7. Define all variables

### Step 3: Enhance Content
1. Add professional diagrams (TikZ)
2. Create proper callouts
3. Add worked examples
4. Include summary tables
5. Add cross-references
6. Verify against Proakis

### Step 4: Validate
1. Compile individually
2. Check math rendering
3. Verify technical accuracy
4. Review PDF output
5. Get sign-off

---

## Deliverables

### Per Chapter:
- `chapters/Chapter-Name.tex` - Clean LaTeX source
- Compiles individually without errors
- Passes all quality checks
- PDF output reviewed and approved

### Full Book:
- `chimera-book.tex` - Main document
- `preamble.tex` - Common styles (DRY)
- `bibliography.bib` - All references
- `chapters.list` - Chapter order
- `chimera-book.pdf` - Final output

---

## Success Criteria

**Exemplar Chapter (BPSK) is complete when:**
1. PDF output matches Proakis quality standards
2. All math renders correctly in professional style
3. Diagrams are publication-quality
4. Technical content verified accurate
5. Typography is professional and consistent
6. B/W print looks excellent
7. Serves as clear template for other chapters
8. Maintainer approves for production

**Ready for parallel production when:**
1. Exemplar chapter approved
2. STYLE_GUIDE.md finalized
3. Preamble locked (no more changes)
4. Validation scripts working
5. Process documented
6. Template chapter can be copy-pasted

---

## Current Status

**File:** `test_exemplar_v2.pdf` (215K, compiled successfully)

**Needs Review:**
- Visual inspection against Proakis style
- Technical accuracy verification
- Math notation consistency
- Diagram quality
- Overall professional appearance

**Next Action:** 
Detailed review of PDF output and comparison with Proakis standards.

---

**Last Updated:** 2025-10-06
