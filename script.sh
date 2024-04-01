#!/bin/bash

# Name of the YAML file
file="your_file.yaml"

# Separator pattern (matches "---")
separator='---'

# Counter for blocks
counter=0

# Read blocks from the file and print each block with a label
awk -v RS="$separator" 'NF > 0' "$file" | while IFS= read -r block; do
    # Increment the counter
    ((counter++))
    # Print the block label
    printf "block%02d:\n" "$counter"
    # Print the block content
    echo "$block"
    # Add an empty line after each block for clarity
    echo
done
