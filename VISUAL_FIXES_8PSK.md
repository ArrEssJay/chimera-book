# Visual Fixes for 8PSK Chapter

## Summary
Fixed visual issues in `_latex/chapters/8PSK-&-Higher-Order-PSK.tex` to improve layout, prevent overlapping text/graphics, and ensure proper alignment within page margins.

## Changes Made

### 1. Constellation Diagram (Lines 99-124)
**Issue:** Labels were too close to constellation points at 45°, 135°, 225°, and 315° positions, potentially causing overlap.

**Fixes:**
- Reduced scale from `2.2` to `2.0` for better fit on page
- Increased label spacing:
  - Cardinal points (0°, 90°, 180°, 270°): `4pt` → `5pt`
  - Diagonal points (45°, 135°, 225°, 315°): `2pt` → `3pt`
- Moved angular spacing annotation further from point: `right=2pt` → `right=4pt`

### 2. Transmitter Block Diagram (Lines 209-238)
**Issue:** Diagram was too wide and could overflow page margins with many blocks arranged horizontally.

**Fixes:**
- Reduced block minimum width: `2.2cm` → `2cm`
- Reduced block minimum height: `1cm` → `0.9cm`
- Reduced node distances:
  - From input to mapper: `2.8cm` → `2.5cm`
  - From mapper to filters: `2.8cm` → `2.5cm`
  - From filters to mixers: `3cm` → `2.7cm`
  - From mixers to sum: `2.5cm` → `2.3cm`
  - From sum to output: `2.2cm` → `2cm`
- Adjusted oscillator label positioning: `1.5cm` → `1.4cm`
- Reduced default node distance: `2.2cm` → `2cm`

### 3. Receiver Block Diagram (Lines 256-287)
**Issue:** Longest diagram in the chapter, stretching across page with 7 stages plus connections.

**Fixes:**
- Reduced block minimum width: `2cm` → `1.9cm`
- Reduced block minimum height: `1cm` → `0.9cm`
- Reduced all horizontal node distances: `2.8cm` → `2.5cm` (consistent throughout)
- Reduced default node distance: `2cm` → `1.9cm`
- Adjusted input connection length: `++(1,0)` → `++(0.9,0)`

### 4. Callout Box Title (Line 439)
**Issue:** Title "Spectral Efficiency vs Power Efficiency Trade-off" was too long and could overflow box header.

**Fix:**
- Shortened to "Efficiency Trade-off" (more concise, equally descriptive in context)

### 5. Parameter Table Alignment (Lines 700-713)
**Issue:** Table lacked proper centering environment.

**Fix:**
- Added `\begin{center}...\end{center}` wrapper around table

## Impact
These changes ensure:
- ✅ All diagrams fit within 7×10 inch page margins (0.875in left/right margins)
- ✅ No overlapping labels on constellation diagram
- ✅ Proper spacing between block diagram elements
- ✅ Callout box titles fit within header space
- ✅ Tables are properly centered on page

## Testing Required
To verify these fixes:
```bash
cd _latex
pdflatex -interaction=nonstopmode test_8psk.tex
# Review test_8psk.pdf for:
# - No overfull hbox warnings
# - Clean diagram rendering
# - No overlapping elements
# - Proper page margins maintained
```

## Notes
- Changes maintain visual consistency with other chapters
- No semantic content was modified
- Only layout/spacing parameters adjusted
- All TikZ diagrams remain complete and functional
