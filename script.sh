#!/bin/bash

# Name of the YAML file
file="your_file.yaml"

# Separator pattern (matches "---")
separator='---'

# Counter for blocks
counter=0

# Read blocks from the file and store each block in a separate variable
while IFS= read -r block; do
    # If the block is not empty
    if [ -n "$block" ]; then
        # Increment the counter
        ((counter++))
        # Print the block label
        printf "block%02d:\n" "$counter"
        # Print the block content
        echo "$block"
        # Add an empty line after each block
        echo
    fi
done < <(awk -v RS="$separator" 'NF > 0' "$file")
