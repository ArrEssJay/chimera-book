#!/bin/bash
# check-citations.sh - Check for common citation issues in LaTeX chapters

echo "Checking for citation issues..."

# Check each chapter for potential problems
for chapter in latex/chapters/*.tex; do
    if [ -f "$chapter" ]; then
        echo -n "Checking $(basename "$chapter")... "
        
        # Check for common citation errors
        # - Invalid characters in cite key
        # - Empty cite command
        # - Stray backslash in cite key
        if grep -q -n -E '\\cite\{[^}]*[^a-zA-Z0-9:_-][^}]*\}|\\cite\{\}|\\cite\{[^}]*\\\}' "$chapter"; then
            echo
            grep -n -E '\\cite\{[^}]*[^a-zA-Z0-9:_-][^}]*\}|\\cite\{\}|\\cite\{[^}]*\\\}' "$chapter" | sed 's/^/  /g'
        fi

        # Check for unmatched braces in cite commands
        if grep '\\cite{' "$chapter" | grep -v '}' > /dev/null; then
            echo "  ⚠️  Possible unmatched brace in citation"
        else
            echo "OK"
        fi
    fi
done

# Check bibliography file for duplicate entries
if [ -f "latex/bibliography.bib" ]; then
    echo "Checking bibliography.bib..."
    if grep "^@" latex/bibliography.bib | sort | uniq -d > /dev/null; then
        grep "^@" latex/bibliography.bib | sort | uniq -d | while read dup; do
            echo "  ⚠️  Possible duplicate entry: $dup"
        done
    else
        echo "OK"
    fi
fi

echo "Citation check complete."
