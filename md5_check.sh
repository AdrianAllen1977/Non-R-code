#!/bin/bash

# Directory containing the FASTQ files
DIR="/Users/adrianallen/Desktop/Deer_paper_genomes"

# Output file for the MD5 checksums (absolute path to ensure it writes where expected)
OUTPUT_FILE="/Users/adrianallen/Desktop/md5_checksums.txt"

# Create or clear the output file
> "$OUTPUT_FILE"

# Print the starting message for debugging
echo "Starting to calculate MD5 checksums for files in $DIR..."

# Flag to check if any files are found
found_files=false

# Iterate over each FASTQ file in the directory
for file in "$DIR"/*.fastq.gz; do
    if [ -f "$file" ]; then
        # Debugging: Print the file being processed
        echo "Processing $file"

        # Calculate MD5 checksum and append it to the output file
        md5 "$file" >> "$OUTPUT_FILE"

        # Set flag to indicate files were found
        found_files=true
    fi
done

# Check if any .fastq.gz files were found and processed
if [ "$found_files" = false ]; then
    echo "No .fastq.gz files found in $DIR."
else
    echo "MD5 checksums have been written to $OUTPUT_FILE"
fi
