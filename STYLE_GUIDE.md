# Chimera DSP Book Style & Content Guide
## Based on Proakis & Manolakis "Digital Signal Processing"

**Reference:** Digital Signal Processing (John G. Proakis, Dimitris K Manolakis)
**Status:** Authoritative reference for all technical content and formatting

---

## Typography & Layout Standards

### Font Hierarchy
- **Body text:** Serif (Utopia/similar) 12pt
- **Headings:** Sans-serif, bold, hierarchical sizing
  - Chapter: Huge, bold sans
  - Section: Large, bold sans
  - Subsection: Normal size, bold sans
- **Equations:** Math mode with proper spacing
- **Code:** Monospace, slightly smaller than body

### Page Layout
- **Margins:** Symmetric (2.5cm all sides for single-sided)
- **Line spacing:** 1.0-1.2 (professional, not double-spaced)
- **Paragraph spacing:** Moderate (5pt between)
- **No paragraph indentation** after section headings

### Callout Boxes
- **Sharp corners** (no rounded borders)
- **Light gray fill** (5-10% black for B/W printing)
- **1pt solid borders** (black or dark gray)
- **Sans-serif bold titles**
- **Minimal padding** (8-10pt)

---

## Mathematical Notation Standards

### Signal Notation
- Time-domain signals: lowercase $x(t)$, $y(t)$, $s(t)$
- Discrete-time: $x[n]$, $y[n]$ with square brackets
- Frequency-domain: uppercase $X(f)$, $X(\omega)$, $X(z)$
- Complex baseband: $\tilde{x}(t)$ or $x_b(t)$

### Common Symbols
- **Frequency:** $f$ (Hz), $\omega = 2\pi f$ (rad/s)
- **Period:** $T$ (seconds)
- **Sampling rate:** $f_s$ or $F_s$
- **Energy:** $E$ or $\mathcal{E}$
- **Power:** $P$
- **Noise PSD:** $N_0$ (W/Hz)
- **SNR:** $\gamma$ or SNR
- **Convolution:** $*$ or $\ast$
- **Correlation:** $\star$ or $R_{xy}$

### Equation Formatting
```latex
% Single equation with number
\begin{equation}
x(t) = A\cos(2\pi f_c t + \phi)
\end{equation}

% Multiple aligned equations
\begin{align}
x(t) &= I(t)\cos(2\pi f_c t) - Q(t)\sin(2\pi f_c t) \\
I(t) &= x(t)\cos(2\pi f_c t) \\
Q(t) &= -x(t)\sin(2\pi f_c t)
\end{align}

% Inline math: $E_b/N_0$
```

### Key Principles
1. **Number important equations** - use `\equation` not `\[...\]`
2. **Align multi-line derivations** - use `align` environment
3. **Define all variables** - itemized list after equation
4. **Use proper spacing** - `\,` for multiplication, `\quad` for separation
5. **SI units** - always include: Hz, W, dB, etc.

---

## Content Structure Standards

### Chapter Organization
1. **Brief introduction** (1-2 paragraphs overview)
2. **Mathematical foundation** (definitions, derivations)
3. **Properties and theorems** (numbered, boxed if important)
4. **Implementation details** (block diagrams, algorithms)
5. **Examples** (worked problems with step-by-step solutions)
6. **Summary** (bullet points or table)
7. **Problems** (optional - for textbook style)
8. **References** (inline citations to bibliography)

### Section Hierarchy
```
\chapter{Title}          % Top level
\section{Title}          % Major division
\subsection{Title}       % Subdivision
\subsubsection{Title}    % Fine detail (use sparingly)
\paragraph{Title}        % Inline heading (avoid unless necessary)
```

### Figures & Tables
- **Always numbered:** Figure 1.1, Table 2.3, etc.
- **Captions below figures, above tables**
- **Referenced in text:** "as shown in Figure~\ref{fig:bpsk-constellation}"
- **Professional quality:** Clean lines, labeled axes, legible fonts
- **Grayscale compatible:** Use patterns/textures, not just color

---

## Diagram Standards

### Block Diagrams
```latex
\begin{tikzpicture}
% Use rectangular blocks
\node[draw, rectangle, minimum width=2cm, minimum height=1cm] (block) {Label};
% Clear signal flow left-to-right
% Label all signals/connections
% Sans-serif labels
% 1pt borders, no fill or light gray fill
\end{tikzpicture}
```

### Constellation Diagrams
- **Axes:** I (horizontal), Q (vertical)
- **Grid:** Light gray, helps reading
- **Points:** Solid black circles (3pt)
- **Labels:** Clear, unambiguous
- **Equal aspect ratio**

### Signal Plots
- **Time on x-axis, amplitude on y-axis**
- **Labeled axes with units**
- **Grid optional** (light gray if used)
- **Multiple signals:** Distinguish by line style (solid/dashed), not color

---

## Technical Writing Standards

### Voice & Style
- **Third person, passive when appropriate:** "The signal is filtered..."
- **Present tense for facts:** "BPSK provides..."
- **Past tense for derivations:** "We derived the expression..."
- **Clear, concise sentences**
- **Technical precision over colloquialism**

### Terminology Consistency
- **Bit Error Rate** (BER), not "error rate" or "bit errors"
- **Signal-to-Noise Ratio** (SNR), spell out first use
- **In-phase** (I), **Quadrature** (Q) - capitalize
- **Phase-Shift Keying** (PSK), not "phase shift keying"
- **Additive White Gaussian Noise** (AWGN)

### Abbreviations
- **First use:** Spell out with abbreviation in parentheses
  - "Binary Phase-Shift Keying (BPSK)"
- **Subsequent use:** Abbreviation only
- **Common acronyms:** No definition needed (SNR, BER, FFT, etc.)

### Numbered Lists vs Bullets
- **Numbered:** Sequential steps, procedures, algorithms
- **Bulleted:** Properties, features, advantages

---

## Example Formatting

### Good Example Section
```latex
\section{Coherent Detection}

The optimal receiver for BPSK employs coherent detection, which requires
knowledge of both the carrier frequency and phase. The received signal is

\begin{equation}
r(t) = s(t) + n(t) = A d_n \cos(2\pi f_c t + \phi) + n(t)
\label{eq:bpsk-received}
\end{equation}

where:
\begin{itemize}
\item $A$ = carrier amplitude (volts)
\item $d_n \in \{+1, -1\}$ = data symbol
\item $f_c$ = carrier frequency (Hz)
\item $\phi$ = carrier phase (radians)
\item $n(t)$ = AWGN with PSD $N_0/2$ (W/Hz)
\end{itemize}

The coherent detector multiplies the received signal by a local replica
of the carrier:

\begin{equation}
y(t) = r(t) \cdot 2\cos(2\pi f_c t + \phi)
\label{eq:bpsk-correlation}
\end{equation}

After lowpass filtering to remove the $2f_c$ component, the decision
statistic is

\begin{equation}
z = \int_0^{T_b} y(t)\,dt = A T_b d_n + n'
\label{eq:bpsk-decision}
\end{equation}

where $n'$ is the filtered noise component.
```

---

## Special Elements

### Theorems & Properties
```latex
\begin{calloutbox}{Nyquist Sampling Theorem}
A bandlimited signal with bandwidth $B$ can be perfectly reconstructed
from samples taken at rate $f_s \geq 2B$.
\end{calloutbox}
```

### Examples
```latex
\begin{calloutbox}{Example 3.1: Link Budget Calculation}
\textbf{Given:} ...

\textbf{Solution:}
\begin{enumerate}
\item Calculate FSPL: ...
\item Compute received power: ...
\item Determine SNR: ...
\end{enumerate}

\textbf{Result:} Link closes with 12~dB margin.
\end{calloutbox}
```

### Warnings & Critical Info
```latex
\begin{warningbox}
\textbf{Carrier synchronization is essential.} Phase error $\phi_e$
degrades performance by $\cos(\phi_e)$. At $\phi_e = 90°$, complete
signal loss occurs.
\end{warningbox}
```

---

## Bibliography & Citations

### In-Text Citations
- **Numeric style:** [1], [2, 3], [4-7]
- **Author-year style:** (Proakis, 2007)
- **Consistent throughout book**

### Bibliography Format
```bibtex
@book{proakis2007,
  author    = {John G. Proakis and Dimitris K. Manolakis},
  title     = {Digital Signal Processing},
  edition   = {4},
  publisher = {Pearson},
  year      = {2007}
}
```

---

## Content Accuracy Requirements

### Technical Correctness
1. **Verify all equations** against authoritative sources
2. **Use standard notation** (Proakis convention)
3. **Include proper units** in all numerical examples
4. **Check dimensionality** of equations
5. **Validate performance curves** (BER vs SNR, etc.)

### Depth Appropriate to Audience
- **Undergraduate level:** Detailed derivations with explanations
- **Reference text:** Concise but complete
- **Include intuition** alongside mathematical rigor

### Cross-Referencing
- **Internal:** Link related chapters/sections
- **External:** Cite original papers for advanced topics
- **Forward/backward refs:** "as will be shown in Chapter X" / "as derived in Section Y"

---

## Quality Checklist

Before finalizing any chapter:

- [ ] All equations numbered and referenced
- [ ] All variables defined
- [ ] All figures/tables captioned and referenced
- [ ] Consistent notation throughout
- [ ] Units included in all numerical values
- [ ] Cross-references valid
- [ ] Worked examples complete with solutions
- [ ] Summary section present
- [ ] Bibliography entries correct
- [ ] Compiles without warnings
- [ ] Grayscale-printable (no color-dependent information)
- [ ] Professional appearance (sharp boxes, clean layout)

---

## Proakis-Specific Conventions to Adopt

1. **Z-transform notation:** $X(z) = \mathcal{Z}\{x[n]\}$
2. **DFT notation:** $X[k] = \sum_{n=0}^{N-1} x[n]e^{-j2\pi kn/N}$
3. **Convolution sum:** $y[n] = \sum_{k=-\infty}^{\infty} x[k]h[n-k]$
4. **Correlation:** $R_{xy}[l] = \mathbb{E}\{x[n]y^*[n-l]\}$
5. **Power spectral density:** $S_x(f) = \mathcal{F}\{R_x[\tau]\}$

---

## Emoji Usage Policy

**Principle:** Minimal and strategic, B/W print compatible

**Approved uses:**
- ⚠ (Warning triangle) - Critical technical requirements
- ✓ (Checkmark) - Advantages, verification
- ✗ (X mark) - Disadvantages, failures
- ▲ (Triangle) - Priority indicators

**Prohibited:**
- Colored emoji in callout titles
- Emoji in mathematical expressions
- Decorative emoji without functional purpose

---

**Last Updated:** 2025-10-06
**Status:** Living document - update as we refine standards
