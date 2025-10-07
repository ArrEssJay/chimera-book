# Coding Specification for Chapter Production

## 🎯 Purpose
This document specifies **exactly** how to produce professional chapters following the BPSK exemplar template.

---

## 📋 Acceptance Criteria Checklist

Every chapter MUST include:

### 1. Structure
- [ ] `\chapter{Title}` with `\label{ch:shortname}`
- [ ] Non-technical introduction (`\begin{nontechnical}...\end{nontechnical}`)
- [ ] `\section{Overview}` with brief technical summary
- [ ] `\section{Mathematical Description}` with subsections
- [ ] `\section{Modulation and Demodulation}` with block diagrams
- [ ] `\section{Performance Analysis}` with BER curves/equations
- [ ] `\section{Worked Example}` with complete calculations
- [ ] `\section{Applications}` with real-world systems
- [ ] `\section{Summary}` with comparison table
- [ ] `\section{Further Reading}` with cross-references

### 2. Equations
- [ ] All equations numbered using `\begin{equation}...\end{equation}`
- [ ] Variable definitions immediately after each equation in `itemize` list
- [ ] Mathematical notation consistent with exemplar (e.g., $E_b$, $N_0$, $\phi$)
- [ ] At least 15-25 numbered equations per chapter

### 3. **TikZ Diagrams (CRITICAL)**

**⚠️ THIS IS WHERE CHAPTERS ARE FAILING ⚠️**

Every chapter MUST include **complete TikZ code** for:

#### Required Diagram 1: Constellation Diagram
```latex
\subsection{Constellation Diagram}

\begin{center}
\begin{tikzpicture}[scale=1.5]
% Axes
\draw[->] (-2.5,0) -- (2.5,0) node[right] {\sffamily\small $I$ (Real)};
\draw[->] (0,-2.5) -- (0,2.5) node[above] {\sffamily\small $Q$ (Imaginary)};

% Grid
\draw[very thin,gray!30] (-2,-2) grid[step=0.5] (2,2);

% Constellation points (CUSTOMIZE for your modulation)
\fill[black] (1.8,0) circle (3pt);
\fill[black] (-1.8,0) circle (3pt);

% Labels (CUSTOMIZE)
\node[below=8pt] at (1.8,0) {\sffamily\small Bit 1};
\node[below=8pt] at (-1.8,0) {\sffamily\small Bit 0};

% Distance annotation
\draw[<->,thick,dashed] (-1.8,0) -- (1.8,0) node[midway,above] {\sffamily\small $d = 2\sqrt{E_b}$};

% Energy circle
\draw[thin,gray,dashed] (0,0) circle (1.8);
\node[below right,gray,font=\scriptsize] at (1.27,-1.27) {Equal energy};
\end{tikzpicture}
\end{center}
```

#### Required Diagram 2: Modulator Block Diagram
```latex
\subsection{Transmitter (Modulator)}

\begin{center}
\begin{tikzpicture}[
  block/.style={rectangle, draw, minimum width=2.2cm, minimum height=1cm, font=\sffamily\small},
  node distance=2.2cm,
  font=\small
]
\node (input) {\sffamily Binary\\$\{0, 1\}$};
\node[block, right of=input] (encoder) {Symbol\\Mapper};
\node[block, right of=encoder] (mod) {Modulator\\(Your Type)};
\node[block, right of=mod] (upconv) {RF\\Upconverter};
\node[right of=upconv] (output) {\sffamily RF\\Output};

% Arrows
\draw[->,thick] (input) -- (encoder);
\draw[->,thick] (encoder) -- node[above] {\scriptsize symbols} (mod);
\draw[->,thick] (mod) -- node[above] {\scriptsize IF} (upconv);
\draw[->,thick] (upconv) -- (output);

% Oscillator
\node[block, below=1.5cm of mod] (osc) {Local\\Oscillator};
\draw[->,thick] (osc) -- (mod);
\end{tikzpicture}
\end{center}
```

#### Required Diagram 3: Demodulator/Receiver Block Diagram
```latex
\subsection{Receiver (Coherent Detector)}

\begin{center}
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

% Arrows
\draw[->,thick] (input) -- (downconv);
\draw[->,thick] (downconv) -- node[above] {\scriptsize IF} (filter);
\draw[->,thick] (filter) -- node[above] {\scriptsize samples} (detector);
\draw[->,thick] (detector) -- (output);

% Carrier recovery
\node[block, below=1.5cm of downconv] (carrier) {Carrier\\Recovery};
\draw[->,thick] (carrier) -- (downconv);
\end{tikzpicture}
\end{center}
```

**VERIFICATION COMMAND:**
```bash
grep -c "begin{tikzpicture}" chapters/Your-Chapter.tex
# Should return at least 3 (ideally 4+)
```

**If this returns 0, YOUR CHAPTER IS INCOMPLETE.**

### 4. Callout Boxes

Use these environments (defined in `preamble.tex`):

```latex
\begin{keyconcept}
Critical technical insight that helps understanding
\end{keyconcept}

\begin{warningbox}
Common mistake or critical warning for practitioners
\end{warningbox}

\begin{calloutbox}{Custom Title}
Additional context or practical note
\end{calloutbox}
```

Minimum requirements:
- [ ] At least 1 `keyconcept` box
- [ ] At least 1 `calloutbox`
- [ ] Optional: `warningbox` if relevant

### 5. Worked Example

Must include:
- [ ] Complete problem statement
- [ ] All given values with units
- [ ] Step-by-step calculation showing work
- [ ] Final answer with units
- [ ] Practical interpretation

Example structure:
```latex
\section{Worked Example: [Specific Application]}

\textbf{Problem:} Design a [system] operating at [parameters]...

\textbf{Given:}
\begin{itemize}
\item Bit rate: $R_b = 1$ Mbps
\item Transmit power: $P_t = 10$ W
\item ...
\end{itemize}

\textbf{Required:} Find the [parameter]

\textbf{Solution:}

\textit{Step 1: Calculate [first thing]}
\begin{equation}
E_b = \frac{P_t \cdot T_b}{1} = ... = X \text{ J}
\end{equation}

\textit{Step 2: ...}
...

\textbf{Answer:} The [parameter] is [value with units].

\textbf{Interpretation:} This means that...
```

### 6. Performance Analysis

Must include:
- [ ] BER equation for AWGN channel
- [ ] Comparison with other modulation schemes (table or list)
- [ ] Discussion of $E_b/N_0$ requirements

Example:
```latex
\section{Bit Error Rate Performance}

For coherent detection in AWGN:
\begin{equation}
P_e = Q\left(\sqrt{\frac{2E_b}{N_0}}\right)
\end{equation}

where $Q(x)$ is the Gaussian Q-function.

\textbf{Performance comparison:}
\begin{itemize}
\item At $P_e = 10^{-5}$: Requires $E_b/N_0 = 9.6$ dB
\item BPSK (coherent): 9.6 dB
\item FSK (non-coherent): 13.5 dB (+3.9 dB penalty)
\item QPSK: Same as BPSK (9.6 dB)
\end{itemize}
```

### 7. Applications Section

Real-world systems using this modulation:
```latex
\section{Applications}

\subsection{System 1 (e.g., GPS)}
GPS satellites use BPSK for...
\begin{itemize}
\item Standard: [IEEE/Protocol]
\item Data rate: [value]
\item Frequency band: [band]
\end{itemize}

\subsection{System 2}
...
```

Minimum 3 real-world applications.

### 8. Summary Section

```latex
\section{Summary}

\begin{center}
\begin{tabular}{ll}
\toprule
\textbf{Parameter} & \textbf{Value/Description} \\
\midrule
Bits per symbol & [value] \\
Bandwidth efficiency & [value] \\
BER ($E_b/N_0$ @ $10^{-5}$) & [value] dB \\
Complexity & [Low/Medium/High] \\
Carrier recovery & [Required/Not required] \\
\bottomrule
\end{tabular}
\end{center}

\textbf{Advantages:}
\begin{itemize}
\item ...
\end{itemize}

\textbf{Disadvantages:}
\begin{itemize}
\item ...
\end{itemize}

\textbf{Best suited for:} [Applications/scenarios]
```

### 9. Further Reading

Cross-reference related chapters:
```latex
\section{Further Reading}

\begin{itemize}
\item For I/Q representation fundamentals: Chapter~\ref{ch:iq}
\item For channel effects: Chapter~\ref{ch:awgn} and Chapter~\ref{ch:rayleigh}
\item For error correction with this modulation: Chapter~\ref{ch:fec}
\item Next modulation: Chapter~\ref{ch:qpsk}
\end{itemize}
```

---

## 🔧 Build & Test Requirements

### Compilation Test
Every chapter MUST compile individually:

```bash
cd /Users/rowan/VSCode/chimera-book

# Create test harness
cat > test_Your-Chapter.tex << 'EOF'
\documentclass[12pt,a4paper,oneside]{book}
\input{preamble}
\begin{document}
\input{chapters/Your-Chapter}
\end{document}
EOF

# Compile
pdflatex test_Your-Chapter.tex

# Should produce PDF with NO errors
```

### Quality Checks

Run these before submitting PR:

```bash
# 1. Check TikZ diagram count
grep -c "begin{tikzpicture}" chapters/Your-Chapter.tex
# Expected: ≥3

# 2. Check equation count
grep -c "\\begin{equation}" chapters/Your-Chapter.tex
# Expected: ≥15

# 3. Check callout boxes
grep -c "\\begin{keyconcept}" chapters/Your-Chapter.tex
# Expected: ≥1

# 4. Check for incomplete LaTeX
grep "% \.\.\." chapters/Your-Chapter.tex
# Expected: NO matches (no truncated sections)

# 5. Compile test
pdflatex test_Your-Chapter.tex 2>&1 | grep -i error
# Expected: NO errors
```

---

## ❌ Common Mistakes to AVOID

### 1. **Truncated TikZ Diagrams**
```latex
% ❌ WRONG - Incomplete!
\begin{tikzpicture}[
% ... (rest of diagram missing)
\end{tikzpicture}
```

```latex
% ✅ CORRECT - Complete code
\begin{tikzpicture}[scale=1.5]
\draw[->] (-2.5,0) -- (2.5,0);
\draw[->] (0,-2.5) -- (0,2.5);
\fill[black] (1.8,0) circle (3pt);
\end{tikzpicture}
```

### 2. **Missing Variable Definitions**
```latex
% ❌ WRONG
\begin{equation}
E_b = P_t \cdot T_b
\end{equation}

% ✅ CORRECT
\begin{equation}
E_b = P_t \cdot T_b
\end{equation}
where:
\begin{itemize}
\item $E_b$ = energy per bit (Joules)
\item $P_t$ = transmit power (Watts)
\item $T_b$ = bit duration (seconds)
\end{itemize}
```

### 3. **Non-Technical Section Too Technical**
```latex
% ❌ WRONG - Too technical
\begin{nontechnical}
QPSK achieves orthogonality through $\pi/2$ phase offset...
\end{nontechnical}

% ✅ CORRECT - Accessible analogy
\begin{nontechnical}
Think of QPSK like a compass: North, East, South, West = 4 directions = 4 symbols.
Each direction represents 2 bits...
\end{nontechnical}
```

### 4. **Incomplete Worked Example**
```latex
% ❌ WRONG - Missing steps
\textbf{Solution:} The answer is 9.6 dB.

% ✅ CORRECT - Show all work
\textbf{Solution:}

\textit{Step 1:} Calculate $E_b/N_0$ required:
\begin{equation}
E_b/N_0 = ... = 9.6 \text{ dB}
\end{equation}

\textit{Step 2:} ...
```

---

## 📚 Reference Files

1. **Exemplar:** `chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex`
   - 594 lines
   - 4 TikZ diagrams
   - 26 numbered equations
   - Complete structure to follow

2. **Style Guide:** `STYLE_GUIDE.md`
   - Typography rules
   - Formatting conventions

3. **Preamble:** `preamble.tex`
   - All LaTeX packages
   - Custom environments (keyconcept, warningbox, etc.)
   - Font configuration

---

## ✅ Definition of Done

A chapter is complete when:

1. ✅ Compiles without errors: `pdflatex test_Chapter.tex`
2. ✅ Contains ≥3 TikZ diagrams (complete code, not truncated)
3. ✅ Contains ≥15 numbered equations with definitions
4. ✅ Has complete worked example with all steps shown
5. ✅ Includes BER analysis and performance comparison
6. ✅ Lists ≥3 real-world applications
7. ✅ Contains ≥1 keyconcept box and ≥1 calloutbox
8. ✅ Has summary table with advantages/disadvantages
9. ✅ PDF visual inspection: diagrams render correctly, equations formatted properly
10. ✅ Technical accuracy verified against references

---

## 🚨 CRITICAL: TikZ Diagram Verification

**BEFORE submitting PR, run:**

```bash
./verify_chapter.sh Your-Chapter-Name
```

This script checks:
- TikZ diagram count ≥3
- All `\begin{tikzpicture}` have matching `\end{tikzpicture}`
- No truncated diagrams (no lines with just `% ...`)
- Compilation succeeds

**If verification fails, DO NOT submit PR.**

---

## 📞 Questions?

1. Check the exemplar: `chapters/Binary-Phase-Shift-Keying-(BPSK)-EXEMPLAR-V2.tex`
2. Read the style guide: `STYLE_GUIDE.md`
3. Ask in issue comments if stuck

**Remember:** Quality over speed. A complete chapter with all diagrams is better than a fast but incomplete submission.
