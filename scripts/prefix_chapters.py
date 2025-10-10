#!/usr/bin/env python3
"""
prefix_chapters.py

Simple script to prefix chapter files with their order number (01-, 02-, etc.)
based on the order they appear in chimera-book.tex.

Usage:
  - Dry run (default): show proposed renames
      python3 prefix_chapters.py

  - Apply changes:
      python3 prefix_chapters.py --apply

  - Auto-confirm:
      python3 prefix_chapters.py --apply --yes
"""
from __future__ import annotations
import argparse
import re
import shutil
import subprocess
from pathlib import Path
from typing import Dict, List

ROOT = Path(__file__).resolve().parents[2]
CHIMERA_TEX = ROOT / "book" / "latex" / "chimera-book.tex"
CHAPTERS_DIR = ROOT / "book" / "latex" / "chapters"


def extract_chapter_order(tex_file: Path) -> List[str]:
    """Extract chapter filenames in order from chimera-book.tex.
    
    Returns list of chapter filenames (without .tex extension).
    """
    chapters = []
    with tex_file.open("r", encoding="utf-8") as f:
        for line in f:
            # Match \loggedinput{chapters/filename} or \input{chapters/filename}
            match = re.match(r"^\s*\\(?:loggedinput|input)\{chapters/([^}]+)\}", line)
            if match:
                filename = match.group(1).strip()
                chapters.append(filename)
    return chapters


def build_rename_mapping(chapters: List[str]) -> Dict[Path, Path]:
    """Build mapping from current filenames to prefixed filenames.
    
    Args:
        chapters: List of chapter filenames (stems) in order
        
    Returns:
        Dictionary mapping old Path -> new Path
    """
    mapping = {}
    
    for i, stem in enumerate(chapters, start=1):
        # Find the actual file (might already have a prefix)
        old_file = CHAPTERS_DIR / f"{stem}.tex"
        
        # If file doesn't exist, it might already be prefixed differently
        if not old_file.exists():
            # Look for any file with this stem (ignoring existing numeric prefix)
            pattern = re.compile(rf"^\d+-{re.escape(stem)}\.tex$|^{re.escape(stem)}\.tex$")
            for f in CHAPTERS_DIR.iterdir():
                if pattern.match(f.name):
                    old_file = f
                    break
        
        if not old_file.exists():
            print(f"Warning: Could not find file for '{stem}'")
            continue
        
        # Create new filename with proper prefix
        new_name = f"{i:02d}-{stem}.tex"
        new_file = CHAPTERS_DIR / new_name
        
        # Only add to mapping if name will actually change
        if old_file != new_file:
            mapping[old_file] = new_file
    
    return mapping


def apply_renames(mapping: Dict[Path, Path], use_git: bool = True) -> None:
    """Apply the file renames."""
    for old_path, new_path in mapping.items():
        print(f"  {old_path.name} -> {new_path.name}")
        
        if use_git:
            try:
                subprocess.run(
                    ["git", "mv", str(old_path), str(new_path)],
                    check=True,
                    capture_output=True,
                    text=True
                )
            except subprocess.CalledProcessError as e:
                print(f"    Git mv failed: {e.stderr.strip()}")
                print(f"    Falling back to regular rename")
                old_path.rename(new_path)
        else:
            old_path.rename(new_path)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Prefix chapter files with numbers based on order in chimera-book.tex"
    )
    parser.add_argument("--apply", action="store_true", help="Actually perform the renames")
    parser.add_argument("--yes", action="store_true", help="Don't ask for confirmation")
    args = parser.parse_args()
    
    # Check files exist
    if not CHIMERA_TEX.exists():
        print(f"ERROR: {CHIMERA_TEX} not found")
        return
    if not CHAPTERS_DIR.exists():
        print(f"ERROR: {CHAPTERS_DIR} not found")
        return
    
    # Extract chapter order from tex file
    print(f"Reading chapter order from {CHIMERA_TEX.name}...")
    chapters = extract_chapter_order(CHIMERA_TEX)
    print(f"Found {len(chapters)} chapters")
    
    # Build rename mapping
    mapping = build_rename_mapping(chapters)
    
    if not mapping:
        print("\nNo files need to be renamed (all already have correct prefixes)")
        return
    
    # Show proposed changes
    print(f"\nProposed renames ({len(mapping)} files):")
    print("=" * 70)
    for old_path, new_path in mapping.items():
        print(f"  {old_path.name}")
        print(f"    -> {new_path.name}")
    print("=" * 70)
    
    if not args.apply:
        print("\nDRY RUN - no changes made. Use --apply to perform renames.")
        return
    
    # Confirm if not --yes
    if not args.yes:
        response = input("\nProceed with renames? [y/N] ")
        if response.lower() != 'y':
            print("Aborted.")
            return
    
    # Apply renames
    print("\nApplying renames...")
    use_git = shutil.which("git") is not None
    apply_renames(mapping, use_git=use_git)
    
    print("\n✓ Done! Files have been renamed.")
    print("  Recommendation: Run your build script to verify everything still works.")


if __name__ == "__main__":
    main()
