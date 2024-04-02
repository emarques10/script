#!/bin/bash

# Input file with separator
input_file="your_input_file.txt"

# Separator pattern
separator="---"

# Output file prefix
output_prefix="output"

# Counter for parts
part_counter=1

# Read the input file line by line
while IFS= read -r line; do
    # If the line matches the separator pattern
    if [[ "$line" == "$separator" ]]; then
        # Increment the part counter
        ((part_counter++))
        # Skip writing the separator to the output file
        continue
    fi

    # Output file name for the current part
    output_file="${output_prefix}_${part_counter}.txt"
    
    # Write the line to the current output file
    echo "$line" >> "$output_file"
done < "$input_file"
