Prefixing chapter filenames
===========================

This directory contains a helper script `prefix_chapters.py` which can be used
to add numeric prefixes to the LaTeX chapter filenames in `latex/chapters/`.

Why:
- Makes editing and ordering large numbers of chapters easier
- Keeps filenames stable and sortable

Basic usage:

- Dry run (see proposed changes):
  python3 prefix_chapters.py

- Apply changes and update references across the repo:
  python3 prefix_chapters.py --apply

Always run the dry run first. The script will back up modified files with the
.bak suffix when applying changes.
