# Chimera: Signal Processing Book

**A comprehensive open-source textbook on digital signal processing, modulation techniques, and communication systems.**

## 📚 About

Professional DSP textbook with 69 chapters covering fundamentals through advanced topics. Written to Proakis & Manolakis standards with TikZ diagrams and worked examples.

**License:** CC0 (Public Domain) | **Author:** Rowan Jones

## 🚀 Quick Start

```bash
# Test exemplar chapter
pdflatex test_exemplar_v2.tex

# Work on a chapter
./produce_chapter.sh QPSK-Modulation

# Build full book
pdflatex chimera-book.tex
```

## 📊 Production Status

- ✅ **Exemplar complete:** BPSK (professional template)
- ✅ **Typography finalized:** Libertinus + Cabin
- ✅ **69 chapters converted** from markdown to LaTeX
- 🔄 **68 chapters** awaiting professional upgrade

See `CHAPTER_PRODUCTION_STATUS.md` for wave organization and tracking.

## 🎯 Contributing

Ready for parallel production! See `READY_TO_PRODUCE.md` for workflow.

**Wave 2 (Priority 1):** Core Modulation - 7 chapters
- QPSK, 8PSK, QAM, FSK, ASK, OOK

## 🎨 Standards

- **Fonts:** Libertinus (body) + Cabin (headings)  
- **Reference:** Proakis & Manolakis DSP textbook
- **Style Guide:** `STYLE_GUIDE.md`
- **Workflow:** `PRODUCTION_WORKFLOW.md`

## 📖 Topics Covered

Modulation Techniques • Error Correction • Channel Models • MIMO • OFDM • Spread Spectrum • Link Budgets • RF Theory • Signal Analysis • And more...

## 🔗 Related

[Chimera DSP Tool](https://github.com/ArrEssJay/chimera) - Browser-based signal processing experimentation tool
