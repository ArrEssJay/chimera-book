#!/usr/bin/env python3
"""
Generate standard ISBN barcode using LaTeX ean13isbn package.

Usage:
    python3 generate-barcode.py <ISBN-with-hyphens> <output-name>

Example:
    python3 generate-barcode.py 978-1-7643427-0-4 isbn-barcode-pdf
    python3 generate-barcode.py 978-1-2345678-9-0 isbn-barcode-print

Output:
    Creates <output-name>.pdf in the ../graphics/ directory
    Uses the same ean13isbn LaTeX package as the book.
"""

import sys
import os
import subprocess
import tempfile


def generate_barcode(isbn_hyphenated, output_name):
    """Generate standard ISBN barcode using LaTeX ean13isbn package"""
    
    script_dir = os.path.dirname(os.path.abspath(__file__))
    graphics_dir = os.path.join(script_dir, '..', 'graphics')
    os.makedirs(graphics_dir, exist_ok=True)
    
    # Create temporary LaTeX file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.tex', delete=False, dir=graphics_dir) as f:
        tex_content = f"""\\documentclass{{standalone}}
\\usepackage{{ean13isbn}}
\\begin{{document}}
\\EANisbn[ISBN={isbn_hyphenated}]
\\end{{document}}
"""
        f.write(tex_content)
        tex_file = f.name
    
    try:
        # Compile with XeLaTeX (silent mode)
        result = subprocess.run(
            ['xelatex', '-interaction=nonstopmode', tex_file],
            cwd=graphics_dir,
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0:
            raise RuntimeError(f"XeLaTeX compilation failed:\n{result.stderr}")
        
        # Move PDF to desired name
        tex_base = os.path.splitext(os.path.basename(tex_file))[0]
        temp_pdf = os.path.join(graphics_dir, f"{tex_base}.pdf")
        output_pdf = os.path.join(graphics_dir, f"{output_name}.pdf")
        
        if os.path.exists(temp_pdf):
            os.rename(temp_pdf, output_pdf)
        else:
            raise FileNotFoundError(f"PDF not generated: {temp_pdf}")
        
        return output_pdf
        
    finally:
        # Clean up temporary files
        for ext in ['.tex', '.aux', '.log']:
            temp_file = tex_file.replace('.tex', ext)
            if os.path.exists(temp_file):
                os.remove(temp_file)


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print(__doc__)
        print("\nError: Missing arguments")
        print("Usage: python3 generate-barcode.py <ISBN-with-hyphens> <output-name>")
        sys.exit(1)
    
    isbn = sys.argv[1]
    output = sys.argv[2]
    
    # Validate ISBN format
    digits_only = isbn.replace('-', '').replace(' ', '')
    if not digits_only.isdigit():
        print(f"Error: ISBN must contain only digits and hyphens, got: {isbn}")
        sys.exit(1)
    
    if len(digits_only) != 13:
        print(f"Error: ISBN must be 13 digits, got {len(digits_only)} digits")
        sys.exit(1)
    
    try:
        filename = generate_barcode(isbn, output)
        print(f"✅ Standard ISBN barcode generated: {filename}")
        print(f"   ISBN: {isbn}")
        print(f"   Method: LaTeX ean13isbn package (industry standard)")
    except Exception as e:
        print(f"❌ Error generating barcode: {e}")
        sys.exit(1)
