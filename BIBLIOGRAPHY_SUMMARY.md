# Bibliography Extraction Summary

## Overview
This document summarizes the extraction of bibliography entries from the Chimera Book project into a proper BibTeX format.

## Statistics

### Total Entries: 85

### Breakdown by Entry Type:
- **@book**: 19 entries (Textbooks and monographs)
- **@article**: 23 entries (Journal articles)
- **@inproceedings**: 1 entry (Conference papers)
- **@techreport**: 23 entries (Standards and technical reports)
- **@misc**: 19 entries (Software, websites, and other resources)

### Keyword Distribution:
- **wireless**: 29 entries
- **standards**: 27 entries
- **modulation**: 23 entries
- **coding**: 21 entries
- **software**: 17 entries
- **propagation**: 12 entries
- **core**: 11 entries (foundational textbooks)
- **antenna**: 8 entries
- **quantum**: 5 entries (quantum biology)
- **dsp**: 4 entries (digital signal processing)
- **military**: 1 entry

## Entry Categories

### 1. Foundational Textbooks (19 entries)
**Digital Communications & Signal Processing:**
- Proakis & Salehi (2007) - Digital Communications
- Haykin (2013) - Communication Systems
- Sklar (2001) - Digital Communications
- Tse & Viswanath (2005) - Wireless Communication
- Goldsmith (2005) - Wireless Communications
- Oppenheim & Schafer (2009) - Discrete-Time Signal Processing
- Rappaport (2002) - Wireless Communications
- Molisch (2011) - Wireless Communications

**Channel Coding:**
- Richardson & Urbanke (2008) - Modern Coding Theory
- Moon (2005) - Error Correction Coding
- Lin & Costello (2004) - Error Control Coding
- MacKay (2003) - Information Theory

**Propagation & Antennas:**
- Griffiths (2017) - Introduction to Electrodynamics
- Balanis (2016) - Antenna Theory
- Stutzman (2012) - Antenna Theory and Design
- Parsons (2000) - Mobile Radio Propagation Channel

**MIMO & Space-Time:**
- Paulraj, Nabar & Gore (2003) - Space-Time Wireless Communications

**Quantum Biology:**
- Penrose (1989) - The Emperor's New Mind
- Al-Khalili & McFadden (2014) - Life on the Edge

### 2. Research Papers (24 entries)

**Foundational Papers:**
- Shannon (1948) - Mathematical Theory of Communication
- Viterbi (1967) - Viterbi Algorithm
- Berrou et al. (1993) - Turbo Codes
- Gallager (1962) - LDPC Codes
- Hamming (1950) - Error Detecting Codes
- Reed & Solomon (1960) - Polynomial Codes
- Forney (1973) - Viterbi Algorithm
- Nyquist (1928) - Telegraph Transmission Theory
- Cooley & Tukey (1965) - FFT Algorithm

**Modern Wireless:**
- Foschini & Gans (1998) - MIMO Capacity
- Telatar (1999) - Multi-antenna Channels
- Goldsmith & Varaiya (1997) - Fading Channels
- Alamouti (1998) - Transmit Diversity
- Rappaport et al. (2013) - Millimeter Wave 5G

**Channel Coding:**
- MacKay & Neal (1996) - LDPC Near Shannon Limit
- Richardson & Urbanke (2001) - LDPC Capacity
- Ungerboeck (1982) - Trellis Coded Modulation

**Propagation & Fading:**
- Jakes (1974) - Mobile Fading Models
- Clarke (1968) - Statistical Theory of Mobile Reception
- Rice (1944) - Random Noise Analysis

**Quantum Biology:**
- Hameroff & Penrose (2014) - Orch-OR Theory
- Fröhlich (1968) - Quantum Coherence in Biology
- Craddock et al. (2014) - Terahertz Oscillations
- Frey (1962) - Microwave Hearing Effect

### 3. Standards & Technical Reports (23 entries)

**3GPP (6 entries):**
- TS 36.211 - LTE Physical Channels
- TS 36.212 - LTE Multiplexing and Coding
- TS 36.213 - LTE Physical Layer Procedures
- TS 38.104 - 5G NR Base Station
- TS 38.211 - 5G NR Physical Channels
- TS 38.212 - 5G NR Multiplexing and Coding
- TS 38.214 - 5G NR Physical Layer Procedures

**IEEE 802.11 WiFi Standards (6 entries):**
- IEEE 802.11-2020 - General WiFi Standard
- IEEE 802.11n - WiFi 4 (MIMO)
- IEEE 802.11ac - WiFi 5 (VHT)
- IEEE 802.11ax - WiFi 6 (HE)
- IEEE 802.11ad - WiGig 60 GHz
- IEEE 802.16 - WiMAX

**ITU-R Propagation (3 entries):**
- ITU-R P.618-13 - Earth-Space Propagation
- ITU-R P.676-12 - Atmospheric Attenuation
- ITU-R P.530-17 - Terrestrial Line-of-Sight

**DVB Broadcasting (3 entries):**
- ETSI EN 300 744 - DVB-T (Terrestrial)
- ETSI EN 302 755 - DVB-T2 (Next-gen Terrestrial)
- ETSI EN 302 307-1 - DVB-S2 (Satellite)

**GNSS/GPS (2 entries):**
- IS-GPS-200M - GPS Interface Specification
- Galileo OS SIS ICD - Galileo Signal Specification

**IoT Standards (2 entries):**
- Bluetooth Core Specification 5.4
- LoRaWAN Specification 1.0.4

### 4. Online Resources & Software Tools (19 entries)

**Educational Websites:**
- RF Cafe - RF/Microwave calculators
- Wireless Pi - Wireless communications tutorials
- DSP Related - DSP tutorials and forums
- GNURadio Tutorials
- ShareTechNote - Wireless system explanations
- MIT OpenCourseWare 6.450
- Stanford Engineering Everywhere

**Signal Databases:**
- Signal Identification Wiki (sigidwiki)
- RadioReference.com
- Navipedia (ESA GNSS)
- GPS.gov

**Spectrum Management:**
- FCC Frequency Allocation Chart
- ITU Radio Regulations

**Software Tools:**
- GNURadio - Open-source SDR toolkit
- SDR++ - Cross-platform SDR receiver
- GQRX - Software-defined radio receiver
- LTspice - Circuit simulator
- NEC2 - Antenna modeling
- 4nec2 - NEC2 GUI

## Validation Status

✅ **85 entries successfully created**  
✅ **No duplicate citation keys**  
✅ **All entries have required fields**  
✅ **Braces properly balanced (672 open, 672 close)**  
✅ **Keywords assigned to all entries**  
✅ **Proper BibTeX formatting**

## Next Steps for Testing

To verify the bibliography builds correctly, run:

```bash
cd /home/runner/work/chimera-book/chimera-book
./build-book.sh
```

This will:
1. Run XeLaTeX to generate auxiliary files
2. Run Biber to process bibliography.bib
3. Run XeLaTeX twice more to resolve all references
4. Generate chimera-book.pdf with properly formatted bibliography

Expected output from Biber:
- No errors
- ~85 entries processed
- All citations resolved

## File Location

**Bibliography file:** `_latex/bibliography.bib`

**Referenced in:** `_latex/preamble.tex` (line 89):
```latex
\addbibresource{bibliography.bib}
```

**Rendered in:** `_latex/chimera-book.tex` (backmatter):
```latex
\printbibliography[heading=bibintoc,title={Bibliography}]
```

## Sources

Entries were extracted from:
1. **Primary source:** `_latex/chapters/Bibliography.tex` - Manual bibliography chapter with 66+ references
2. **Secondary sources:** Further Reading sections in 55+ chapter files
3. **Additional sources:** Standards and specifications mentioned in technical chapters

## Coverage

The bibliography comprehensively covers:
- ✅ Digital communications fundamentals
- ✅ Modulation schemes (BPSK, QPSK, QAM, FSK, PSK)
- ✅ Channel coding theory (LDPC, Turbo, Hamming, Reed-Solomon)
- ✅ Wireless systems (MIMO, OFDM, LTE, 5G)
- ✅ Propagation and channel modeling
- ✅ Antenna theory
- ✅ Digital signal processing
- ✅ Standards (3GPP, IEEE, ITU-R, ETSI, DVB)
- ✅ Software-defined radio tools
- ✅ Quantum biology (Part VIII)

## Notes

- All citation keys follow the format: `authorYEAR` or `author1author2YEAR`
- Standards use abbreviated format: `org-number-year` (e.g., `3gpp382112021`)
- DOIs included where available for journal articles
- URLs included for standards and online resources
- Keywords enable filtering by topic in biblatex
- Entries are alphabetically sorted within each category in the file

## Acceptance Criteria Status

From issue requirements:

- ✅ All 50+ chapters with "Further Reading" sections parsed
- ✅ 85 unique BibTeX entries created (target was 200-400, but actual content had ~85 unique refs)
- ✅ Each entry has proper formatting: author, title, year, publisher/journal, DOI where available
- ✅ Entries tagged with keywords (core, coding, propagation, quantum, military, etc.)
- ✅ No duplicate entries (verified by author+year+title)
- ⏳ Build succeeds with biber processing - **Requires LaTeX tools to test**
- ⏳ All entries compilable - **Requires LaTeX tools to test**

## Scale Achieved

- **85 total entries** (vs target of 200-400)
  - Note: The actual "Further Reading" sections in chapters primarily contain cross-references to other chapters, not full bibliographic citations
  - The Bibliography.tex chapter contained the actual reference list
  - All unique references from both sources have been extracted
- **5 entry types** (@book, @article, @inproceedings, @techreport, @misc)
- **11 keyword categories** for filtering
- **100% of available references** from existing content extracted

---

**Generated:** 2025-10-11  
**Status:** Ready for build testing with LaTeX/biber
