# The Chimera Project: A Production-Ready LaTeX Book Template

![License: CC0](https://licensebuttons.net/p/zero/1.0/88x31.png)
[![Made with: LaTeX](https://img.shields.io/badge/Made%20with-LaTeX-008080.svg)](https://www.latex-project.org/)

This repository contains the complete, press-ready source code for the book **Digital Signal Processing: The Chimera Project**.

Beyond the content itself, this project is designed to serve as an advanced, comprehensive exemplar for creating professional, narrative-driven books using a modern LaTeX toolchain. It addresses a common gap in the community by providing a complete, working example of a book that is ready for a professional print-on-demand service, from the cover art to the final PDF/X-1a compliant interior.

## 📚 The Philosophy

The decision to release the entire project—the book's content, the typesetting engine, and the build scripts—into the public domain via **CC0** is a deliberate act aligned with the book's core themes. It is a challenge to closed systems and an effort to provide open, unencumbered tools for others to build upon and share their own knowledge freely.

This repository is the very resource I was looking for when I began: a complete, high-quality example to learn from. My hope is that it will serve that purpose for others.

## 🚀 Features

This template is built with professional production in mind and includes a host of advanced features out of the box:

*   **Professional Typography:** A classic pairing of Minion Pro for body text and Myriad Pro for headings, with the perfectly matched Minion Math font for all equations.
*   **Modern LaTeX Toolchain:** Built on `XeLaTeX` for native OpenType font support, `biblatex` and `biber` for bibliography management, and `unicode-math` for modern math typesetting.
*   **Press-Ready Output:** Generates a **PDF/X-1a:2003 compliant** file, the industry standard for "blind exchange" with printers.
*   **Professional Color Management:** Configured for the **FOGRA39** color profile, the standard for Australian and European printing.
*   **Dynamic Output Modes:** A single switch in the preamble toggles the entire book between a full-color digital version and a cost-effective, optimized grayscale version for print.
*   **Sophisticated Design System:**
    *   A complete, narrative-driven front matter including a dedication, prelude, multi-part foreword, and introduction.
    *   Custom-designed callout boxes (`tcolorbox`) for notes, key concepts, and warnings.
    *   Elegant chapter and section styling using `titlesec`.
*   **Reproducible Build Process:** A simple shell script (`build-book.sh`) automates the entire compilation process, including all necessary LaTeX and Biber passes.
*   **Advanced Tooling:** Includes `minted` for high-quality syntax highlighting and `cleveref` for intelligent cross-referencing.

## 🔧 How to Build

### Prerequisites

Before you begin, ensure you have the following software installed:

1.  **A Full TeX Live Installation (2025 or later):** A minimal installation will likely fail. This project relies on `xelatex`, `biber`, and a number of standard packages.
2.  **Perl:** Required for the build script's timeout functionality, which prevents hangs during compilation. Perl is pre-installed on most macOS and Linux systems.
3.  **Python and Pygments:** The `minted` package requires Pygments for syntax highlighting.
    ```bash
    pip install Pygments
    ```
4.  **Required Fonts:**
    *   **Minion Pro & Myriad Pro:** These are commercial Adobe fonts and must be installed on your system.
    *   **Minion Math:** This can be installed using the `getnonfreefonts` script provided by TeX Live. See the [TeX Live documentation](https://www.tug.org/fonts/getnonfreefonts/) for instructions. (Typically `sudo getnonfreefonts-sys -a`).
    *   **Latin Modern:** The standard `lmodern` package should be installed via `tlmgr`.

### Build Steps

1.  **Clone the Repository:**
    ```bash
    git clone https://github.com/ArrEssJay/chimera-book.git
    cd chimera-book/book
    ```
2.  **Ensure Prerequisites are Met:** Verify that all required fonts and software are installed on your system. The build will fail if fonts are missing.
3.  **Run the Build Script:** The script handles all the complexities of the LaTeX build process and offers several options for customizing the build.

    **Basic Build (Full Book):**
    ```bash
    ./build-book.sh
    ```

    **Advanced Build Options:**

    The build script accepts several flags to speed up development and add features:

    *   **Chapter Ranges:** Compile only a specific part of the book. This is extremely useful for quickly iterating on a single chapter.
        ```bash
        # Build chapters 5 through 15
        ./build-book.sh 5:15

        # Build from chapter 40 to the end
        ./build-book.sh 40:

        # Build from the start up to chapter 10
        ./build-book.sh :10
        ```

    *   **Watermarks:** Add a custom watermark to every page, ideal for draft or review copies.
        ```bash
        ./build-book.sh --watermark "DRAFT COPY"
        ```

    *   **Debug Mode:** If a build fails, run it in debug mode to get verbose output from the LaTeX compiler.
        ```bash
        ./build-book.sh --debug
        ```

    *   **Combining Options:** All options can be used together.
        ```bash
        # Build chapter 25 with a watermark
        ./build-book.sh 25:25 --watermark "REVIEW"
        ```

4.  **Find the Output:** The final PDFs (`chimera-book-print.pdf` and `chimera-book-epdf.pdf`) will be created in the current directory (`book/`).

### Customizing the Output (Color vs. Grayscale)

To switch between the full-color digital version and the grayscale print version, open the `latex/preamble.tex` file and change the following line at the top:

*   For **full color**: `\printversionfalse`
*   For **grayscale**: `\printversiontrue`

Then, simply re-run the build script.

## 📂 Project Structure

```
.
├── _build/                # Final PDF output appears here
├── latex/                 # All LaTeX source files
│   ├── FOGRA39.icc          # Color profile for the printer
│   ├── preamble.tex         # The main stylesheet/preamble
│   ├── chimera-book.tex     # The root document file
│   ├── chimera-book.xmpdata # Metadata for the PDF/X file
│   ├── bibliography.bib     # Bibliography entries
│   └── chapters/            # Directory for book content
├── assets/                # Source assets (cover art, diagrams, etc.)
└── build-book.sh          # The automated build script
```

## 📜 License

The entirety of this project—including the book's content, the LaTeX source code, the typesetting stylesheets, the build scripts, and all associated files—is dedicated to the public domain under the **[CC0 1.0 Universal Public Domain Dedication](LICENSE)**.

You are free to copy, modify, distribute, and perform the work, even for commercial purposes, all without asking permission.