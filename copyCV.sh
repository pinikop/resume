#!/bin/sh
# 's' & 't' flage are optional

# Set default values
source_file="myCV.pdf"
target_file="PiniKoplovitchCV.pdf"

# Parse command line options
# while getopts ":s:t:" opt; do
while getopts ":s:t:" opt; do
    case $opt in
        s)
            source_file="$OPTARG"
            ;;
        t)
            target_file="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# Check if the source file exists
if [ ! -f "$source_file" ]; then
    echo "Error: Source file '$source_file' not found."
    exit 1
fi

# Copy the PDF file to the target file
cp "$source_file" "$target_file"

# Display success message
echo "PDF file '$source_file' copied to '$target_file' successfully."
