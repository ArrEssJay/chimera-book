# TikZ Diagram Issue - Root Cause and Fix

## Problem Identified

**PR #14 (FSK chapter)** has **ZERO TikZ diagrams** when it should have at least 3.

### Verification
```bash
$ grep -c "begin{tikzpicture}" chapters/Frequency-Shift-Keying-(FSK).tex
0
```

**Expected:** ≥3 diagrams (constellation, modulator, demodulator)
**Actual:** 0 diagrams

### Root Cause
Agents are **truncating or omitting TikZ diagram code** during chapter production. The GitHub PR diff shows:

```latex
\begin{tikzpicture}[
% ... (TRUNCATED - rest of code missing)
\end{tikzpicture}
```

Or worse, diagrams are completely omitted.

## Why This Happens

1. **Lack of explicit examples** in original acceptance criteria
2. **No verification script** to catch missing diagrams before PR
3. **Agents may be:**
   - Summarizing large code blocks
   - Hitting token limits
   - Not recognizing complete TikZ code is required

## Solution Implemented

### 1. Created `CODING_SPEC.md`
Comprehensive specification with:
- ✅ Complete TikZ code examples (good vs bad)
- ✅ Exact structure for 3 required diagrams
- ✅ Verification commands
- ✅ Common mistakes to avoid

### 2. Created `verify_chapter.sh`
Automated verification script that checks:
- TikZ diagram count (≥3 required)
- No truncated diagrams (detects `% ...` patterns)
- Matching begin/end tags
- Compilation success
- **FAILS if diagrams missing**

### 3. Updated All Wave 2 Issues
Added comments to issues #4-9 with:
- ⚠️ CRITICAL: TikZ diagrams must be complete
- Link to `CODING_SPEC.md`
- Instructions to run `verify_chapter.sh` before PR
- Example of complete vs truncated TikZ code

## Required TikZ Diagrams (All Chapters)

### Diagram 1: Constellation Diagram
```latex
\begin{tikzpicture}[scale=1.5]
% Axes
\draw[->] (-2.5,0) -- (2.5,0) node[right] {\sffamily\small $I$ (Real)};
\draw[->] (0,-2.5) -- (0,2.5) node[above] {\sffamily\small $Q$ (Imaginary)};

% Grid
\draw[very thin,gray!30] (-2,-2) grid[step=0.5] (2,2);

% Constellation points (CUSTOMIZE for modulation scheme)
\fill[black] (1.8,0) circle (3pt);
\fill[black] (-1.8,0) circle (3pt);

% Labels
\node[below=8pt] at (1.8,0) {\sffamily\small Bit 1};
\node[below=8pt] at (-1.8,0) {\sffamily\small Bit 0};

% Distance/Energy annotations
\draw[<->,thick,dashed] (-1.8,0) -- (1.8,0) node[midway,above] {\sffamily\small $d = 2\sqrt{E_b}$};
\draw[thin,gray,dashed] (0,0) circle (1.8);
\node[below right,gray,font=\scriptsize] at (1.27,-1.27) {Equal energy};
\end{tikzpicture}
```

**Lines:** ~15-20 (COMPLETE, not truncated)

### Diagram 2: Modulator Block Diagram
```latex
\begin{tikzpicture}[
  block/.style={rectangle, draw, minimum width=2.2cm, minimum height=1cm, font=\sffamily\small},
  node distance=2.2cm,
  font=\small
]
\node (input) {\sffamily Binary\\$\{0, 1\}$};
\node[block, right of=input] (encoder) {Symbol\\Mapper};
\node[block, right of=encoder] (mod) {[Modulator\\Type]};
\node[block, right of=mod] (upconv) {RF\\Upconverter};
\node[right of=upconv] (output) {\sffamily RF\\Output};

% Signal flow arrows
\draw[->,thick] (input) -- (encoder);
\draw[->,thick] (encoder) -- node[above] {\scriptsize symbols} (mod);
\draw[->,thick] (mod) -- node[above] {\scriptsize IF} (upconv);
\draw[->,thick] (upconv) -- (output);

% Local oscillator
\node[block, below=1.5cm of mod] (osc) {Local\\Oscillator};
\draw[->,thick] (osc) -- (mod);
\end{tikzpicture}
```

**Lines:** ~15-25 (COMPLETE, not truncated)

### Diagram 3: Demodulator/Receiver Block Diagram
```latex
\begin{tikzpicture}[
  block/.style={rectangle, draw, minimum width=2.2cm, minimum height=1cm, font=\sffamily\small},
  node distance=2.2cm,
  font=\small
]
\node (input) {\sffamily RF\\Input};
\node[block, right of=input] (downconv) {RF\\Downconverter};
\node[block, right of=downconv] (filter) {Matched\\Filter};
\node[block, right of=filter] (detector) {Threshold\\Detector};
\node[right of=detector] (output) {\sffamily Binary\\Output};

% Signal flow arrows
\draw[->,thick] (input) -- (downconv);
\draw[->,thick] (downconv) -- node[above] {\scriptsize IF} (filter);
\draw[->,thick] (filter) -- node[above] {\scriptsize samples} (detector);
\draw[->,thick] (detector) -- (output);

% Carrier recovery
\node[block, below=1.5cm of downconv] (carrier) {Carrier\\Recovery};
\draw[->,thick] (carrier) -- (downconv);
\end{tikzpicture}
```

**Lines:** ~15-25 (COMPLETE, not truncated)

## Verification Before PR Submission

**MANDATORY:** All agents must run this before creating PR:

```bash
./verify_chapter.sh Your-Chapter-Name
```

### Example Output (PASS):
```
✅ PASS: At least 3 TikZ diagrams present
✅ PASS: No truncated TikZ diagrams detected
✅ PASS: All TikZ environments properly closed
✅ PASS: Compilation successful
```

### Example Output (FAIL):
```
❌ FAIL: Need at least 3 TikZ diagrams, found 0
❌ ❌ ❌  VERIFICATION FAILED  ❌ ❌ ❌
```

**If verification fails, PR CANNOT be submitted.**

## References

- **Exemplar:** `chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex`
  - Lines 186-214: Constellation diagram (complete TikZ)
  - Lines 240-272: Modulator block diagram (complete TikZ)
  - Lines 293-325: Demodulator block diagram (complete TikZ)
  - Lines 462-501: Higher-order modulation diagram (complete TikZ)

- **Coding Spec:** `CODING_SPEC.md` (sections 3.1, 3.2, 3.3)

- **Verification:** `verify_chapter.sh` (automated checking)

## Action Items

### For Current PRs
- [ ] PR #14 (FSK): Add complete TikZ diagrams (currently has 0)
- [ ] All future PRs: Run `verify_chapter.sh` before submission

### For Future Issues
- ✅ All Wave 2 issues updated with TikZ requirements
- ✅ `CODING_SPEC.md` added to repository
- ✅ `verify_chapter.sh` added to repository
- [ ] Update issue template to reference `CODING_SPEC.md`
- [ ] Add verification as part of CI/CD (future)

## Lessons Learned

1. **Be explicit:** "TikZ diagram" is not enough → need "complete TikZ code from \\begin to \\end"
2. **Provide examples:** Show what NOT to do and what TO do side-by-side
3. **Automate verification:** Scripts catch mistakes before PR submission
4. **Reference line numbers:** Point to exemplar with specific line numbers

---

**Status:** FIXED (for future chapters)
**Date:** October 6, 2025
**Commits:**
- `b721d9b` - feat: add explicit TikZ requirements and chapter verification script
