---
layout: default
title: Home
---

# Chimera: Signal Processing Book

**A comprehensive open-source textbook on digital signal processing, modulation techniques, and communication systems.**

## About

Professional DSP textbook with 69 chapters covering fundamentals through advanced topics. Written to Proakis & Manolakis standards with TikZ diagrams and worked examples.

**License:** CC0 (Public Domain) | **Author:** The Chimera Project (chimera@impermanent.io)

## Chapters

{% for chapter in site.chapters %}
- [{{ chapter.title }}]({{ chapter.url | relative_url }})
{% endfor %}

## Topics Covered

- Modulation Techniques
- Error Correction
- Channel Models
- MIMO
- OFDM
- Spread Spectrum
- Link Budgets
- RF Theory
- Signal Analysis
- And more...

## Related

[Chimera DSP Tool](https://github.com/ArrEssJay/chimera) - Browser-based signal processing experimentation tool

---

© 2024 The Chimera Project | [CC0 Public Domain](https://creativecommons.org/publicdomain/zero/1.0/)
