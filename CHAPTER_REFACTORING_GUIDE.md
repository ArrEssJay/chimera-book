# Chapter Structure Refactoring Guide

## Current Status (After Front Matter & Part Divider Updates)

### ✅ Completed Tasks:
1. **Part Dividers**: Redesigned with larger, more impactful typography
   - Part number: 60pt Loretta Display Bold
   - Part title: 48pt Loretta Display Bold
   - Centered layout with improved spacing

2. **Part Introductions**: Placeholder files created for all 9 parts
   - Located in: `frontmatter/part-i-intro.tex` through `part-ix-intro.tex`
   - Already integrated into `chimera-book.tex`
   - Ready for content insertion (marked with TODO comments)

3. **workedexample environments**: Already correctly implemented throughout

4. **British Spelling Fix**: Fixed `\begin{centre}` → `\begin{center}` (LaTeX requires American spelling for environment names)

5. **Cataloging Page**: Updated ISBNs to correct values

6. **Table of Contents**: Configured to show Parts, Chapters, and Sections (tocdepth=1)

---

## 🔧 Remaining Task: Chapter Structure Refactoring

### The Problem:
Chapters currently use `\subsection{}` as the top-level heading below `\chapter{}`, which causes LaTeX to number them as "X.0.1", "X.0.2", etc. (where X is the chapter number). This "0" in the middle indicates there's no `\section` level.

### Example from Current Structure:
```latex
\chapter{The Electromagnetic Spectrum}  % Chapter 2
\subsection{Overview}                   % Numbered as 2.0.1
\subsection{Fundamental Relationships}  % Numbered as 2.0.2
\subsection{Radio Frequencies (RF)}     % Numbered as 2.0.3
```

### User's Requirement:
Convert to proper LaTeX hierarchy:
- "2.0.1 Overview" → `\section{Overview}` (numbered as 2.1)
- Major topics → `\section{}`
- Minor topics/details → `\paragraph{}` (or remain as `\subsection{}`)

---

## Implementation Options:

### Option A: Simple Global Replacement (FASTEST)
**Action**: Replace all `\subsection{` with `\section{` across all 66 chapters.

**Pros**:
- Can be done with a single sed command
- Maintains existing structure, just changes hierarchy level
- Consistent across all chapters

**Cons**:
- May create overly flat structure (all topics at same level)
- Doesn't distinguish between major and minor topics

**Command**:
```bash
cd /Users/rowan/VSCode/chimera/book/latex/chapters
sed -i '' 's/\\subsection{/\\section{/g' *.tex
```

---

### Option B: Smart Restructuring (RECOMMENDED)
**Action**: Analyze each chapter's structure and apply appropriate hierarchy:
- `\section{}` for major topics
- `\subsection{}` for subtopics
- `\paragraph{}` or custom `\parhead{}` for minor points

**Pros**:
- Creates meaningful hierarchy
- Better reflects content organization
- Improved TOC readability

**Cons**:
- Requires chapter-by-chapter analysis
- Time-consuming for 66 chapters
- Needs human judgment for topic importance

**Example Transformation**:
```latex
% BEFORE:
\chapter{The Electromagnetic Spectrum}
\subsection{Overview}
\subsection{Fundamental Relationships}
\subsection{Radio Frequencies (RF)}

% AFTER:
\chapter{The Electromagnetic Spectrum}
\section{Overview}
\section{Fundamental Relationships}
\section{Radio Frequency Bands}
\paragraph{ELF (3-30 Hz)} ...
\paragraph{VLF (3-30 kHz)} ...
\paragraph{LF (30-300 kHz)} ...
```

---

### Option C: Hybrid Approach (BALANCED)
**Action**: 
1. Global replace `\subsection{Overview}` → `\section{Overview}`
2. Convert other first-level subsections to sections
3. Leave nested structure as-is (existing subsubsections become subsections)

**Pros**:
- Relatively quick
- Maintains some hierarchy
- Standardizes "Overview" sections

**Cons**:
- Still somewhat mechanical
- May not optimize every chapter

---

## Current Chapter Analysis

### Typical Chapter Structure (e.g., Ch 2):
```latex
\chapter{...}
\begin{nontechnical} ... \end{nontechnical}  % Non-technical intro
\subsection{Overview}                         % Always first section
\subsection{Major Topic 1}
\subsection{Major Topic 2}
  \begin{spectrumband}{...} ... \end{spectrumband}  % Custom environment
\subsection{Major Topic 3}
\begin{keyconcept} ... \end{keyconcept}
\begin{workedexample}{Title} ... \end{workedexample}
\begin{importantbox} ... \end{importantbox}
```

### Proposed Standard Structure:
```latex
\chapter{...}
\begin{nontechnical} ... \end{nontechnical}
\section{Overview}                   % Standard first section
\section{Major Topic 1}
\section{Major Topic 2}
  \subsection{Subtopic 2.1}
  \subsection{Subtopic 2.2}
\section{Major Topic 3}
  \paragraph{Minor Point} ...        % For detailed items
\begin{keyconcept} ... \end{keyconcept}
\begin{workedexample}{Title} ... \end{workedexample}
```

---

## Recommendation for User

**I recommend Option A (Simple Global Replacement) for these reasons:**

1. **Speed**: Can be done in seconds across all 66 chapters
2. **Consistency**: Every chapter will have the same structure
3. **Reversibility**: Easy to undo if needed
4. **Sufficient**: Converts "2.0.1" → "2.1" which solves the numbering issue

**Then, if desired**, you can manually refine specific chapters later where deeper hierarchy makes sense.

---

## Next Steps

**Waiting for your decision:**
- **Option A**: I'll run the global replacement immediately
- **Option B**: I'll need several hours to analyze and restructure all 66 chapters
- **Option C**: I'll implement the hybrid approach with selective refinement
- **Custom**: Specify your preferred approach

Once you confirm, I'll proceed with the chapter refactoring.

---

## Build Status

Current build error was the `\begin{centre}` issue (now fixed). The book should build successfully once Part Introduction content is added (currently showing placeholders).
