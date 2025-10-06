# Chimera Book Production Guidelines

## Purpose
This document defines the production standards for the Chimera book. All LaTeX source files must conform to these guidelines to ensure consistent formatting, successful compilation, and professional output.

## File Structure

```
book/
├── chimera-book.tex          # Main document (DO NOT EDIT directly)
├── preamble.tex              # Global styles and packages (EDIT HERE for styling)
├── titlepage.tex             # Title page
├── license.tex               # CC0 license page
├── introduction.tex          # Author introduction
├── bibliography.bib          # BibTeX references
├── chapters/                 # Individual chapter files (SOURCE OF TRUTH)
│   ├── Home.tex             # First chapter (overview)
│   ├── *.tex                # All other chapters (alphabetically)
└── build.sh                  # Build automation
```

## Style Sheet (preamble.tex)

### Typography
- **Font Family**: Utopia (via `fourier` package) - humanist serif
- **Body Text**: 12pt
- **Line Spacing**: Default (1.0)
- **Paragraph Spacing**: `\parskip` set via `microtype`
- **Justification**: Full justification with `microtype` for improved spacing

### Page Layout
- **Paper**: A4 (210mm × 297mm)
- **Margins**: 2.5cm all sides
- **Headers**: Chapter/section names (fancyhdr)
- **Footers**: Page numbers (fancyhdr)
- **Binding**: One-sided (suitable for PDF distribution and print-on-demand)

### Section Hierarchy
1. **\chapter{}** - Top level (e.g., "Binary Phase Shift Keying")
2. **\section{}** - Major sections (e.g., "Technical Explanation")
3. **\subsection{}** - Subsections (e.g., "Mathematical Model")
4. **\subsubsection{}** - Minor subsections (use sparingly)

**Chapter Formatting**:
- Blue color (`NavyBlue`)
- Large, bold sans-serif font
- 20pt spacing after title

### Math and Code

**Math Equations**:
- Inline: `$...$` for short expressions
- Display: `\[...\]` or `equation` environment for important formulas
- Numbered: `\begin{equation}...\end{equation}` for referenced equations
- Packages: `amsmath`, `amssymb`, `amsfonts`

**Code Blocks**:
- Package: `minted` (requires `-shell-escape`)
- Style: `friendly`
- Line numbers: Enabled
- Frame: Lines above/below
- Font size: `\small`
- Syntax highlighting: Python, C, MATLAB, etc.

### Tables
- Package: `longtable` (for multi-page tables), `booktabs` (for professional rules)
- Rules: Use `\toprule`, `\midrule`, `\bottomrule` (NOT `\hline`)
- Headers: Bold (`\textbf{}`)
- Captions: Above table
- Alignment: Left for text, right for numbers

### Figures and Diagrams
- Package: `graphicx`, `tcolorbox`
- Max width: `\linewidth`
- Max height: `0.8\textheight`
- Captions: Below figure
- Placement: `[h!]` for "here strongly", `[t]` for top of page
- Mermaid diagrams: Converted to PDF, included via `\includemermaid{filename}`

### Callouts (Non-Technical Sections)
- Environment: `\begin{nontechnical}...\end{nontechnical}`
- Purpose: Explain complex concepts to non-expert readers
- Style: Gray background box with border
- Usage: Start of chapters, before heavy math, for analogies

### Cross-References
- Use `\label{}` and `\ref{}` for internal references
- Package: `cleveref` for smart references (e.g., "Section 3.2" automatically)
- Format: `\label{sec:topic-name}`, `\label{eq:formula-name}`, `\label{fig:diagram-name}`

### Citations and Bibliography
- Format: `biblatex` with `biber` backend
- Style: Numeric (`[1]`, `[2]`, etc.)
- Sorting: None (order of appearance)
- Command: `\cite{key}` in text, `\printbibliography` at end
- File: `bibliography.bib` (BibTeX format)

## Chapter File Requirements

### File Naming
- Format: `Topic-Name-With-Hyphens.tex`
- Match original markdown filename (without `.md`)
- Examples: `Binary-Phase-Shift-Keying-(BPSK).tex`, `AID-Protocol-Case-Study.tex`

### Chapter Structure Template

```latex
\chapter{Chapter Title}
\label{ch:chapter-name}

\begin{nontechnical}
Plain English explanation for non-expert readers.
Use analogies and real-world examples.
\end{nontechnical}

\section{Introduction}
Brief overview of the topic...

\section{Technical Content}
Detailed explanation with equations...

\subsection{Mathematical Model}
\begin{equation}
    E = mc^2
    \label{eq:einstein}
\end{equation}

\section{Applications}
Real-world uses...

\section{See Also}
\begin{itemize}
    \item Chapter \ref{ch:related-topic}
    \item \cite{reference-key}
\end{itemize}
```

### Content Guidelines

1. **Start with Non-Technical**: Every chapter should begin with a `\begin{nontechnical}` block.
2. **Progressive Complexity**: Move from simple to complex explanations.
3. **Visual Aids**: Include diagrams, tables, or figures for complex concepts.
4. **Cross-References**: Link to related chapters using `\ref{}`.
5. **Citations**: Reference external sources using `\cite{}`.
6. **Equations**: Number important equations for reference.
7. **Code Examples**: Use `minted` with appropriate language for syntax highlighting.

### Forbidden Patterns

❌ **DO NOT**:
- Use raw `\hline` in tables (use `booktabs` rules)
- Use `\textbackslash` (escaped backslashes indicate conversion errors)
- Use `{[}{[}` or `{]}{]}` (wiki link artifacts - clean these up)
- Use HTML tags (`<br>`, `<em>`, etc.)
- Use raw Unicode characters without math mode (α → `$\alpha$`)
- Use hardcoded colors (use named colors from `xcolor`)
- Use `\newpage` excessively (let LaTeX handle page breaks)

✓ **DO**:
- Use semantic LaTeX commands (`\emph{}`, `\textbf{}`)
- Use math mode for Greek letters and symbols
- Use `booktabs` for tables
- Use `\ref{}` for cross-references
- Use `\cite{}` for bibliography
- Let LaTeX handle spacing and breaks

## Build Process

### Development Workflow
1. **Edit LaTeX** directly in `chapters/` directory
2. **Validate chapter**: `./validate_chapters.sh` (test individual files)
3. **Build book**: `./build.sh` (full compilation)
4. **Review PDF**: Open `chimera-book.pdf`
5. **Iterate**: Fix errors, improve formatting, repeat

### Build Script Behavior
- Converts Markdown → LaTeX (one-time, backup only)
- Creates `chapters.list` (chapter inclusion order)
- Compiles PDF with `pdflatex` (4 passes for references)
- Runs `biber` for bibliography
- Cleans auxiliary files

### Compilation Requirements
- **pdflatex**: LaTeX engine
- **biber**: Bibliography processor
- **minted**: Requires `-shell-escape` flag for code highlighting
- **Fonts**: Utopia (fourier package), Latin Modern fallback

### Error Handling
1. **Syntax Errors**: Check LaTeX log for line numbers
2. **Missing Packages**: Install via TeX Live package manager
3. **Unicode Issues**: Convert to LaTeX equivalents (use Lua filter)
4. **Broken References**: Run pdflatex 2-3 times to resolve
5. **Bibliography Errors**: Check `bibliography.bib` format

## Quality Checklist

Before committing changes, ensure:

- [ ] `./validate_chapters.sh` passes all tests
- [ ] `./build.sh` completes without errors
- [ ] `chimera-book.pdf` renders correctly
- [ ] No `\textbackslash` or escaped backslashes
- [ ] No wiki link artifacts (`{[}{[}`, `{]}{]}`)
- [ ] All cross-references resolve (`\ref{}` produces numbers, not "??")
- [ ] All citations resolve (`\cite{}` produces numbers, not "[?]")
- [ ] Tables use `booktabs` rules
- [ ] Code blocks have syntax highlighting
- [ ] Math equations are properly formatted
- [ ] Figures have captions and labels
- [ ] Non-technical callouts are present at chapter start

## Style Consistency Rules

### Headings
- **Chapters**: Title case ("Binary Phase Shift Keying")
- **Sections**: Sentence case ("Technical explanation")
- **Equations**: Inline for short, display for important

### Numbers and Units
- Use `siunitx` package for consistent units: `\SI{10}{\kilo\hertz}`
- Space between number and unit: "10 kHz" not "10kHz"
- Use math mode for scientific notation: `$10^{-6}$`

### Abbreviations
- Define on first use: "Bit Error Rate (BER)"
- Use consistently thereafter
- Common terms can be used without definition (e.g., "RF", "DSP")

### Voice and Tone
- **Technical sections**: Formal, precise, objective
- **Non-technical sections**: Conversational, analogies, accessible
- **Avoid**: First person ("I think"), colloquialisms, marketing language

## Version Control

### Source of Truth
- **LaTeX files** in `chapters/` are the canonical source
- Original Markdown in `../wiki/` is BACKUP ONLY (do not edit)

### Conversion Strategy
- **LaTeX → PDF**: Primary output (book)
- **LaTeX → Markdown**: Secondary output (online wiki, via pandoc reverse)
- One-time conversion complete; all future work in LaTeX

### Backup Policy
- Keep original Markdown in `../wiki-backup/` directory
- Tag conversion point in git: `v1.0-latex-conversion`
- Do not modify original Markdown unless regenerating from LaTeX

## Production Targets

### Output Formats
1. **PDF** (primary): Professional book for distribution
2. **Markdown** (secondary): Online wiki, generated from LaTeX

### Quality Metrics
- **Compilation**: Zero errors, minimal warnings
- **Formatting**: Consistent throughout
- **Cross-references**: All resolve correctly
- **Bibliography**: All citations present
- **Visual**: Professional appearance, readable fonts, clear diagrams

### Distribution
- **License**: CC0 (public domain)
- **Format**: PDF (print-ready, A4, one-sided)
- **Accessibility**: Hyperlinked TOC, clickable cross-references
- **File Size**: Optimized images, no unnecessary bloat

## Maintenance

### Regular Tasks
- Run `./validate_chapters.sh` before commits
- Update `bibliography.bib` as new references added
- Check for broken internal links periodically
- Review and clean up conversion artifacts

### Known Issues
- Some tables may need manual adjustment for width
- Mermaid diagrams require separate conversion step
- Code highlighting requires `-shell-escape` flag

---

**Last Updated**: 2025-10-06  
**Version**: 1.0 (LaTeX production established)  
**Maintained by**: Rowan Jones
