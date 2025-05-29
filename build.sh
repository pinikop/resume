#!/bin/bash

# Default values
KEEP_AUX=false
TARGET_FILE="myCV.pdf"
COMPANY="general"
SOURCE_FILE="myCV.tex"

# Help message
show_help() {
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  -s, --source FILE    Source .tex file (default: myCV.tex)"
    echo "  -t, --target FILE    Target PDF filename (default: myCV.pdf)"
    echo "  -c, --company NAME   Company name for dated copy (default: general)"
    echo "  -k, --keep           Keep auxiliary files (default: delete)"
    echo "  -h, --help           Show this help message"
    echo
    echo "Examples:"
    echo "  $0 -s myCV.tex -c CompanyName"
    echo "  $0 -s example.tex -t CustomName.pdf -k"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -k|--keep)
            KEEP_AUX=true
            shift
            ;;
        -t|--target)
            TARGET_FILE="$2"
            shift 2
            ;;
        -c|--company)
            COMPANY="$2"
            shift 2
            ;;
        -s|--source)
            SOURCE_FILE="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Ensure source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: Source file '$SOURCE_FILE' not found!"
    exit 1
fi

# Create archive directory if it doesn't exist
mkdir -p archive

# Add .pdf extension if not present in target filename
if [[ ! "$TARGET_FILE" =~ \.pdf$ ]]; then
    TARGET_FILE="${TARGET_FILE}.pdf"
fi

# Generate dated filename for the copy
DATE=$(date +%Y%m%d)
DATED_FILE="archive/${DATE}_${COMPANY}.pdf"

# Compile the CV
echo "Compiling $SOURCE_FILE..."
if ! pdflatex -interaction=nonstopmode -halt-on-error "$SOURCE_FILE" > /dev/null; then
    echo "Error during compilation! Check the log file for details."
    exit 1
fi

# Rename the output
mv "${SOURCE_FILE%.tex}.pdf" "$TARGET_FILE"

# Create dated copy
cp "$TARGET_FILE" "$DATED_FILE"

# Clean up auxiliary files unless -k flag is set
if [ "$KEEP_AUX" = false ]; then
    echo "Cleaning up auxiliary files..."
    rm -f *.aux *.log *.out *.synctex.gz
fi

echo "Build complete!"
echo "Main CV: $TARGET_FILE"
echo "Archived copy: $DATED_FILE" 