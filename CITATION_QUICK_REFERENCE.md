# Citation Quick Reference

This document provides a quick reference for commonly used citation keys in the Chimera Book.

## Usage in LaTeX

To cite a reference in your chapter, use:
```latex
\cite{proakissalehi2007}
```

To cite multiple references:
```latex
\cite{proakissalehi2007,sklar2001,haykin2013}
```

## Foundational Textbooks

| Citation Key | Reference | Topics |
|-------------|-----------|---------|
| `proakissalehi2007` | Proakis & Salehi (2007) - Digital Communications | Modulation, Detection, Coding |
| `sklar2001` | Sklar (2001) - Digital Communications | Practical implementations |
| `haykin2013` | Haykin (2013) - Communication Systems | Systems approach |
| `goldsmith2005` | Goldsmith (2005) - Wireless Communications | Wireless, Channel capacity |
| `tseviswanath2005` | Tse & Viswanath (2005) - Wireless Communication | Modern wireless, MIMO |
| `rappaport2002` | Rappaport (2002) - Wireless Communications | Propagation, Mobile systems |
| `oppenheimschafer2009` | Oppenheim & Schafer (2009) - DSP | Signal processing fundamentals |
| `mackay2003` | MacKay (2003) - Information Theory | Coding theory, LDPC |

## Coding Theory

| Citation Key | Reference | Topics |
|-------------|-----------|---------|
| `shannon1948` | Shannon (1948) - Mathematical Theory of Communication | Information theory foundation |
| `viterbi1967` | Viterbi (1967) - Error bounds for convolutional codes | Viterbi algorithm |
| `berrou1993` | Berrou et al. (1993) - Turbo codes | Turbo coding |
| `gallager1962` | Gallager (1962) - LDPC codes | LDPC foundation |
| `hamming1950` | Hamming (1950) - Error detecting codes | Hamming codes |
| `reedsolomon1960` | Reed & Solomon (1960) - Polynomial codes | Reed-Solomon codes |
| `lincostello2004` | Lin & Costello (2004) - Error Control Coding | Coding theory textbook |
| `richardsonurbanke2008` | Richardson & Urbanke (2008) - Modern Coding Theory | LDPC, Turbo codes |

## Wireless & MIMO

| Citation Key | Reference | Topics |
|-------------|-----------|---------|
| `alamouti1998` | Alamouti (1998) - Simple transmit diversity | Space-time block coding |
| `foschinigans1998` | Foschini & Gans (1998) - MIMO capacity | MIMO theory |
| `telatar1999` | Telatar (1999) - Multi-antenna channels | MIMO capacity |
| `paulraj2003` | Paulraj et al. (2003) - Space-Time Communications | MIMO textbook |

## Propagation & Fading

| Citation Key | Reference | Topics |
|-------------|-----------|---------|
| `clarke1968` | Clarke (1968) - Mobile-radio reception | Fading channel theory |
| `jakes1974` | Jakes (1974) - Microwave Mobile Communications | Fading models |
| `rice1944` | Rice (1944) - Random noise analysis | Rician fading |
| `parsons2000` | Parsons (2000) - Mobile Radio Propagation | Channel modeling |

## Standards - 3GPP LTE/5G

| Citation Key | Standard | Description |
|-------------|----------|-------------|
| `3gpp362112020` | 3GPP TS 36.211 | LTE Physical channels |
| `3gpp362122020` | 3GPP TS 36.212 | LTE Multiplexing/coding |
| `3gpp362132020` | 3GPP TS 36.213 | LTE Physical procedures |
| `3gpp382112021` | 3GPP TS 38.211 | 5G NR Physical channels |
| `3gpp382122021` | 3GPP TS 38.212 | 5G NR Multiplexing/coding |
| `3gpp382142021` | 3GPP TS 38.214 | 5G NR Physical procedures |

## Standards - IEEE WiFi

| Citation Key | Standard | Description |
|-------------|----------|-------------|
| `ieee8022112020` | IEEE 802.11-2020 | General WiFi standard |
| `ieee80211n2009` | IEEE 802.11n | WiFi 4 (MIMO) |
| `ieee80211ac2013` | IEEE 802.11ac | WiFi 5 (VHT) |
| `ieee80211ax2021` | IEEE 802.11ax | WiFi 6 (HE) |
| `ieee80211ad2012` | IEEE 802.11ad | WiGig 60 GHz |

## Standards - DVB Broadcasting

| Citation Key | Standard | Description |
|-------------|----------|-------------|
| `etsien3007442015` | ETSI EN 300 744 | DVB-T (Terrestrial) |
| `etsien3025552011` | ETSI EN 302 755 | DVB-T2 (Next-gen) |
| `etsien3023072014` | ETSI EN 302 307-1 | DVB-S2 (Satellite) |

## Standards - GPS/GNSS

| Citation Key | Standard | Description |
|-------------|----------|-------------|
| `isgps2002021` | IS-GPS-200M | GPS Interface Spec |
| `galileoossisicd2021` | Galileo OS SIS ICD | Galileo signals |

## Standards - IoT

| Citation Key | Standard | Description |
|-------------|----------|-------------|
| `bluetooth54` | Bluetooth 5.4 | Bluetooth Core Spec |
| `lorawan104` | LoRaWAN 1.0.4 | LoRaWAN Spec |

## Software Tools

| Citation Key | Tool | Description |
|-------------|------|-------------|
| `gnuradio` | GNURadio | Open-source SDR toolkit |
| `sdrplusplus` | SDR++ | SDR receiver software |
| `gqrx` | GQRX | SDR receiver |

## Quantum Biology (Part VIII)

| Citation Key | Reference | Topics |
|-------------|-----------|---------|
| `penrose1989` | Penrose (1989) - Emperor's New Mind | Consciousness theory |
| `hameroffpenrose2014` | Hameroff & Penrose (2014) - Orch-OR review | Orch-OR theory |
| `frohlich1968` | Fröhlich (1968) - Biological quantum coherence | Quantum biology |
| `craddock2014` | Craddock et al. (2014) - THz oscillations | Microtubules |

## Classic Papers

| Citation Key | Reference | Historical Significance |
|-------------|-----------|------------------------|
| `shannon1948` | Shannon (1948) | Founded information theory |
| `nyquist1928` | Nyquist (1928) | Sampling theorem |
| `hamming1950` | Hamming (1950) | Error correction codes |
| `viterbi1967` | Viterbi (1967) | Viterbi algorithm |
| `cooleytukey1965` | Cooley & Tukey (1965) | Fast Fourier Transform |

## Tips for Authors

1. **Check existing citations first** - Use `grep "cite{" *.tex` in your chapter directory
2. **Use consistent citation style** - Place citations before punctuation: `\cite{key}.`
3. **Multiple related works** - Group related citations: `\cite{proakissalehi2007,sklar2001}`
4. **Standards** - Cite specific versions when discussing features
5. **Textbooks** - Include chapter numbers in text: "See Proakis \& Salehi~\cite{proakissalehi2007}, Chapter 5"

## Finding Citation Keys

To find a citation key, search the bibliography file:
```bash
cd _latex
grep -i "author.*proakis" bibliography.bib
grep -i "title.*turbo" bibliography.bib
grep "^@.*802.11" bibliography.bib
```

Or view all keys:
```bash
grep "^@" bibliography.bib | cut -d'{' -f2 | cut -d',' -f1 | sort
```

## Adding New Entries

If you need to cite a work not in the bibliography:

1. Check if it's truly missing (search bibliography.bib)
2. Add entry following existing format
3. Use consistent citation key format: `authorYEAR` or `author1author2YEAR`
4. Include all required fields for the entry type
5. Add appropriate keywords
6. Test build to ensure no errors

---

**Total Available Citations:** 85 entries  
**File Location:** `_latex/bibliography.bib`  
**Documentation:** `BIBLIOGRAPHY_SUMMARY.md`
