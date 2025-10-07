---
layout: chapter
title: "THz-Bioeffects-Thermal-and-Non-Thermal"
chapter: 61
permalink: /chapters/thz-bioeffects-thermal-and-non-thermal/
---

# THz Bioeffects: Thermal and Non-Thermal

\[\[Home\]\] \[\[Terahertz-(THz)-Technology\]\]
\[\[THz-Propagation-in-Biological-Tissue\]\]
\[\[THz-Resonances-in-Microtubules\]\]

<div class="center">

------------------------------------------------------------------------

</div>

## Overview

Terahertz (THz) radiation (0.1-10 THz) interacts with biological systems
through **thermal** (heating) and potentially **non-thermal**
(resonant or quantum) mechanisms. Understanding these effects is
critical for: - **Safety standards**: Protecting workers and
patients from excessive exposure - **Therapeutic applications**:
Exploiting beneficial effects (if any) - **Fundamental
biophysics**: Understanding molecule-THz interactions

**Current consensus** : Thermal effects well-established;
non-thermal effects controversial.

<div class="center">

------------------------------------------------------------------------

</div>

## For Non-Technical Readers 

**What is terahertz radiation?**  
Think of it as invisible light that sits between microwaves (used in
your microwave oven) and infrared (what you feel as heat from the sun).
It's completely different from dangerous ionizing
radiation like X-rays---THz waves don't have enough
energy to damage DNA or cause cancer directly.

**Why does this matter?**  
THz technology is being developed for: - **Security scanning**
(airport body scanners) - **Medical imaging** (seeing skin cancer
without biopsies) - **Quality control** (checking pills for
defects) - **Communication** (future 6G wireless networks)

As these applications grow, we need to know: *Is THz radiation
safe?*

**The Two Types of Effects:**

1.  **Thermal Effects (Heating)** --- **Well Understood**

    - **What happens**: THz waves make water molecules jiggle faster,
      creating heat (like a microwave oven, but much weaker)

    - **Is it dangerous?**: Only at high power. Safety guidelines
      keep exposure low enough that heating is less than
      1\$^\circ\$C---similar to walking from shade
      into sunlight

    - **Analogy**: Standing near a campfire. Get too close = you feel
      heat and can get burned. Stay at a safe distance = perfectly fine

    - **Current safety standards**: Designed to prevent any
      significant heating

2.  **Non-Thermal Effects (Molecular Resonance?)** ---
    **Controversial and Unproven**

    - **What's claimed**: Some scientists hypothesize
      that THz might affect biology *without* heating---by
      vibrating specific molecules at their “natural frequencies” (like
      shattering a wine glass with sound)

    - **Why it's controversial**:

      - Hard to prove the effects aren't just from tiny
        amounts of heating we can't measure

      - Many studies can't be replicated by other labs

      - No agreed-upon mechanism for how it would work

    - **Analogy**: Imagine claiming a dog whistle (which humans
      can't hear) gives you headaches. Is it the sound
      frequency, or stress from thinking about it? Hard to prove.

    - **Current consensus**: Most scientists are skeptical; safety
      standards ignore non-thermal effects because evidence is weak

**Should I worry about THz exposure?**  
**No, if exposure is within guidelines.** Current safety limits are
conservative---they're set well below levels that
cause heating. It's like speed limits: if everyone
follows them, the risk is minimal.

**What about long-term effects?**  
We don't have 50-year studies yet (THz tech is
relatively new), but: - No mechanism for cancer (THz photons are too
weak to break chemical bonds) - No evidence of cumulative damage in
animal studies - Similar to concerns about cell phones 20 years
ago---still being studied, but no confirmed harm at safe levels

**The Bottom Line:**  
THz technology is probably safe at low power, but research continues.
The document below dives into the science for those who want details.

<div class="center">

------------------------------------------------------------------------

</div>

## 1. Thermal Effects (Established )

### 1.1 Absorption and Heating

**Mechanism**: THz radiation absorbed by tissue
\$\rightarrow\$ molecular kinetic energy
\$\rightarrow\$ temperature rise

**Governing equation** (heat diffusion):
``` math
\rho c_p \frac{\partial T}{\partial t} = \nabla \cdot (k \nabla T) + Q
```
where: - $`\rho`$: Tissue density (~1
g/cm\textsuperscript{3}) - $`c_p`$: Specific heat
capacity (~3.6 J/g/K for tissue) - $`k`$: Thermal
conductivity (~0.5 W/m/K) - $`Q`$: Heat source =
$`\alpha I`$ (absorption coefficient \$\times\$ intensity)

**Temperature rise** (steady-state, no blood flow):
``` math
\Delta T \approx \frac{\alpha I \delta^2}{k}
```
where
$`\delta = 1/\alpha`$ is penetration depth.

**Example**: 1 W/cm\textsuperscript{2} at 1 THz,
$`\alpha = 200`$
cm\textsuperscript{-}\textsuperscript{1},
$`\delta = 50`$ \$\mu\$m:
``` math
\Delta T \approx \frac{200 \times 10^4 \times 10^{-6} \times (50 \times 10^{-6})^2}{0.005} \approx 1^\circ\text{C}
```

**Safety threshold**: $`\Delta T < 1^\circ`$C for prolonged
exposure (ICNIRP guideline)

### 1.2 Depth Dependence

**Shallow heating**: THz absorption strongest at surface
\$\rightarrow\$ temperature peak at skin surface

**Thermal diffusion time**:
``` math
\tau_{\text{th}} = \frac{L^2}{\kappa}
```
where
$`\kappa = k/(\rho c_p)`$ is thermal diffusivity (~1.3
\$\times\$
10\textsuperscript{-}\textsuperscript{3}
cm\textsuperscript{2}/s for tissue).

For $`L = 100`$ \$\mu\$m: $`\tau_{\text{th}} \approx 0.1`$
s (heat dissipates quickly)

**Pulsed exposure**: Short pulses (\<1
\$\mu\$s) create transient temperature spikes that relax
before tissue damage.

### 1.3 Biological Consequences of Heating

**Mild heating** (1-2\$^\circ\$C): - Increased
metabolic rate - Altered enzyme kinetics - Enhanced blood flow
(vasodilation)

**Moderate heating** (5-10\$^\circ\$C): - Protein
denaturation (irreversible above
~50\$^\circ\$C) - Cell membrane
disruption - Apoptosis (programmed cell death)

**Severe heating** (\>20\$^\circ\$C): -
Tissue ablation - Burns

**Threshold for damage**:
~43\$^\circ\$C for prolonged exposure
(\>1 hour) \$\rightarrow\$ cumulative equivalent
minutes (CEM43)

<div class="center">

------------------------------------------------------------------------

</div>

## 2. Non-Thermal Effects (Speculative )

### 2.1 Definition

**Non-thermal effect**: Biological response that occurs at
intensities too low to cause measurable heating
($`\Delta T < 0.1^\circ`$C) OR that persists after heating stops.

**Challenge**: Distinguishing non-thermal from: - **Localized
heating**: Hot spots due to field enhancement - **Transient
heating**: Temporary temperature spikes below detection threshold -
**Indirect thermal effects**: Heat-activated signaling cascades

### 2.2 Proposed Mechanisms

#### 2.2.1 Resonant Absorption by Biomolecules

**Hypothesis**: THz frequencies match vibrational modes of
proteins, DNA, or membranes \$\rightarrow\$ selective
excitation.

**Evidence**: - Proteins have collective vibrational modes at 0.1-3
THz (low-frequency Raman, THz-TDS) - DNA backbone vibrations at
~1 THz (B-form helix breathing modes)

**Problem**: In solution, these modes are heavily broadened
(lifetime ~ps) \$\rightarrow\$ weak
resonance peak. Excitation is non-selective.

**Counterpoint**: *In vitro* studies show altered protein
function at sub-thermal intensities (see Section 3.1)

#### 2.2.2 Membrane Electroporation

**Hypothesis**: THz electric fields induce transmembrane voltage
\$\rightarrow\$ pore formation.

**Induced voltage**:
``` math
V_m = 1.5 r E \cos\theta
```
where $`r`$ is
cell radius, $`E`$ is external field, $`\theta`$ is angle.

For $`r = 10`$ \$\mu\$m, $`E = 10`$ kV/cm:
$`V_m \approx 15`$ mV (below electroporation threshold ~1
V)

**Conclusion**: Unlikely at THz (frequency too high for membrane
charging; shielded by ionic double layer)

#### 2.2.3 Microtubule Resonances

**Hypothesis**: THz resonates with microtubule vibrational modes
\$\rightarrow\$ alters quantum coherence
\$\rightarrow\$ affects neural function (see
\[\[THz-Resonances-in-Microtubules\]\]).

**Predicted frequencies**: 0.5-10 THz (acoustic phonons, optical
phonons)

**Quantum mechanism**: Vibronic coupling (electron-phonon) sustains
coherence at 310 K; THz drives transitions between vibronic states.

**Status**: No direct experimental test; theoretical models exist
but lack validation.

#### 2.2.4 Water Structuring

**Hypothesis**: THz alters hydrogen bond network dynamics in
vicinal water (near protein/membrane surfaces)
\$\rightarrow\$ affects protein function.

**Mechanism**: THz drives librational modes (hindered rotations)
\$\rightarrow\$ transiently disrupts H-bond network
\$\rightarrow\$ lowers activation barrier for
conformational changes.

**Evidence**: Simulations suggest THz can perturb water structure
on ~ps timescales; biological relevance unclear.

<div class="center">

------------------------------------------------------------------------

</div>

## 3. Experimental Evidence

### 3.1 Cell-Level Studies

**Gene expression** : - **Observation**: Altered mRNA levels
after THz exposure (0.1-2.5 THz, \<1
mW/cm\textsuperscript{2},
\<1\$^\circ\$C heating) - **Example**:
Upregulation of heat shock proteins (HSP70) in human keratinocytes
(Wilmink et al., 2010) - **Interpretation**: Could be indirect
thermal effect (transient microheating) OR non-thermal stress response

**Membrane permeability** : - **Observation**: Increased
uptake of fluorescent dyes after THz pulse exposure (Bock et al., 2010)
- **Interpretation**: Pore formation? Or thermal disruption? -
**Control needed**: Measure temperature with high spatial/temporal
resolution

**Calcium signaling** : - **Observation**: Transient
Ca\textsuperscript{2}\textsuperscript{+}
influx in neurons after THz exposure (Zhao et al., 2019) -
**Mechanism**: THz-sensitive ion channels? Or indirect heating? -
**Problem**: Calcium-sensitive dyes themselves have temperature
dependence

### 3.2 Protein Studies

**Enzyme activity** (thermal) / (non-thermal?): -
**Observation**: Altered kinetics of lysozyme, alkaline phosphatase
at sub-thermal intensities (Cherkasova et al., 2009) -
**Interpretation**: Possible resonant excitation of active site
modes; but thermal artifacts not fully ruled out

**Protein unfolding** (thermal): - Clear correlation with
temperature; follows Arrhenius kinetics

### 3.3 DNA Studies

**Strand breaks** (thermal at high intensity): - Observed at
\>100 W/cm\textsuperscript{2} (ablation
regime); clearly thermal

**Transcription** : - *In vitro* transcription assays: Some
studies report altered transcription rates at \<1
W/cm\textsuperscript{2} - **Problem**: DNA
polymerase highly temperature-sensitive; even
0.1\$^\circ\$C affects rate

### 3.4 Whole-Animal Studies

**Developmental effects** : - **Zebrafish embryos**: Some
studies report abnormal development after THz exposure (Titova et al.,
2013) - **Confounding factors**: Dehydration, handling stress,
temperature gradients in aquarium

**Behavioral effects** : - **Mice**: No consistent behavioral
changes at sub-thermal intensities - **Drosophila**: Some reports
of altered locomotion; not reproduced independently

**Conclusion**: No robust, reproducible whole-animal non-thermal
effects demonstrated.

<div class="center">

------------------------------------------------------------------------

</div>

## 4. Critical Analysis: Are Non-Thermal Effects Real?

### 4.1 Arguments For 

1.  **Molecular resonances exist**: Proteins, DNA have THz
    vibrational modes

2.  **Some cellular effects at low intensity**: Not all studies show
    strict temperature correlation

3.  **Precedent in other bands**: RF/microwave “non-thermal
    effects” debated for decades

### 4.2 Arguments Against 

1.  **No consensus mechanism**: Multiple proposed mechanisms, none
    with strong evidence

2.  **Reproducibility issues**: Many studies lack independent
    replication

3.  **Thermal artifacts**: Hard to rule out localized or transient
    heating

4.  **Lack of dose-response**: No clear threshold or saturation
    behavior for “non-thermal” effects

5.  **Evolutionary perspective**: If THz resonances were functionally
    important, natural selection would have exploited or shielded them

### 4.3 Current Scientific Consensus

**ICNIRP position** (2013): “There is no consistent evidence for
non-thermal effects at intensities below thermal damage thresholds.”

**WHO position**: THz safety guidelines based on thermal effects
only.

**Research community**: Divided; ongoing studies but skepticism
high.

<div class="center">

------------------------------------------------------------------------

</div>

## 5. Safety Standards

### 5.1 ICNIRP Guidelines (2013)

**Frequency range**: 0.3-3 THz

**Power density limits**: - **Occupational exposure**: 10
mW/cm\textsuperscript{2} (averaged over
68/f\textsuperscript{1}\$\cdot\$\textsuperscript{0}\textsuperscript{5}
minutes, $`f`$ in THz) - **General public exposure**: 2
mW/cm\textsuperscript{2} (same averaging)

**Rationale**: Keep $`\Delta T < 1^\circ`$C

### 5.2 IEEE Standards (C95.1-2019)

**Similar limits**: ~10
mW/cm\textsuperscript{2} for controlled environments

**Frequency gaps**: Standards less developed for 3-10 THz (far-IR
overlap)

### 5.3 Medical Device Regulations

**THz imaging systems**: Require FDA clearance (USA) or CE mark
(EU)

**Approval criteria**: - Demonstrate temperature rise
\<1\$^\circ\$C in vivo - No evidence of
long-term effects (mutagenicity, carcinogenicity)

<div class="center">

------------------------------------------------------------------------

</div>

## 6. Therapeutic Potential (Speculative )

### 6.1 THz-Induced Neuromodulation

**Hypothesis**: THz pulses could activate neurons non-invasively.

**Mechanisms** (proposed): - **TRPV channels**:
Temperature-sensitive ion channels activated by localized heating -
**Microtubule resonances**: Quantum effects alter neuronal
excitability

**Challenges**: Penetration (THz doesn't reach deep
brain), specificity (heating is non-selective)

### 6.2 Cancer Therapy

**Hypothesis**: Cancer cells more sensitive to THz due to altered
water content or membrane properties.

**Evidence**: Minimal; no clinical trials

**Alternative**: THz imaging for cancer detection (established)
vs. THz ablation (speculative)

### 6.3 Wound Healing

**Hypothesis**: Low-intensity THz stimulates cell proliferation.

**Evidence**: *In vitro* studies show increased fibroblast
migration at \<1 mW/cm\textsuperscript{2};
mechanism unknown.

<div class="center">

------------------------------------------------------------------------

</div>

## 7. Future Directions

### 7.1 What Experiments Are Needed?

**To prove non-thermal effects exist**: 1. **High-resolution
thermometry**: Measure temperature with
\$\pm\$0.01\$^\circ\$C accuracy,
\<10 \$\mu\$m spatial resolution 2. **Isotope
substitution**: Deuterate proteins (H \$\rightarrow\$ D
shifts vibrational modes); predict frequency-dependent effects 3.
**Molecular dynamics simulations**: Model THz-biomolecule
interactions at atomic resolution 4. **Dose-response curves**:
Establish clear thresholds and saturation 5. **Blind studies**:
Eliminate experimenter bias

**To understand thermal effects better**: 1. **Pulsed vs. CW
comparison**: Do transient spikes matter more than average temperature?
2. **Tissue-specific thresholds**: Map safe exposure limits for
skin, eye, brain

### 7.2 Proposed Mechanisms to Test

- **Vibronic coupling in microtubules**: Measure quantum variance
  (see \[\[Quantum-Coherence-in-Biological-Systems\]\]); test if THz
  modulates coherence time

- **Water structuring**: Time-resolved spectroscopy of vicinal
  water during THz exposure

- **Resonant protein excitation**: Site-directed mutagenesis to
  shift vibrational frequencies; predict altered THz sensitivity

<div class="center">

------------------------------------------------------------------------

</div>

## 8. Connections to Other Wiki Pages

- \[\[THz-Propagation-in-Biological-Tissue\]\] --- Absorption
  and penetration depth

- \[\[THz-Resonances-in-Microtubules\]\] --- Speculative quantum
  mechanism

- \[\[Terahertz-(THz)-Technology\]\] --- Sources and detectors

- \[\[Quantum-Coherence-in-Biological-Systems\]\] ---
  Theoretical framework for non-thermal effects

- \[\[Frey-Microwave-Auditory-Effect\]\] --- Analogous RF
  non-thermal effect (pulsed microwaves \$\rightarrow\$
  auditory perception)

<div class="center">

------------------------------------------------------------------------

</div>

## 9. References

### Thermal Effects (Established)

1.  **ICNIRP, *Health Phys.* 105, 171 (2013)** --- THz
    exposure guidelines

2.  **Pickwell & Wallace, *J. Phys. D* 39, R301 (2006)**
    --- THz-tissue interactions

### Non-Thermal Effects (Speculative)

1.  **Wilmink et al., *J. Infrared Millim. THz Waves* 31, 1234
    (2010)** --- Gene expression changes

2.  **Titova et al., *Sci. Rep.* 3, 2363 (2013)** ---
    Zebrafish developmental effects

3.  **Zhao et al., *Neurophotonics* 6, 011004 (2019)** ---
    Calcium signaling in neurons

### Critical Reviews

1.  **Alexandrov et al., *Phys. Lett. A* 374, 1214 (2010)**
    --- DNA resonances (controversial)

2.  **Foster, *Radiat. Res.* 162, 492 (2004)** --- Critique
    of non-thermal RF/THz effects

### Vibronic Coupling

1.  **Bao et al., *J. Chem. Theory Comput.* 20, 4377 (2024)**
    --- VE-TFCC theory (thermal coherence)

<div class="center">

------------------------------------------------------------------------

</div>

**Last updated**: October 2025
