#!/bin/bash

# Input YAML file
input_file="your_input_file.yaml"

# Separator pattern
separator="---"

# Output file prefix
output_prefix="output"

# Flag to indicate if the separator has been found
separator_found=false

# Counter for parts
part_counter=1

# Output file name for the first part
output_file="${output_prefix}_${part_counter}.yaml"

# Read the input YAML file line by line
while IFS= read -r line; do
    # If the line matches the separator pattern
    if [[ "$line" == "$separator" ]]; then
        # Set the separator flag to true
        separator_found=true
        # Increment the part counter
        ((part_counter++))
        # Update the output file name for the next part
        output_file="${output_prefix}_${part_counter}.yaml"
        # Skip writing the separator to the output file
        continue
    fi

    # If the separator has been found, write the line to the current output file
    if [ "$separator_found" = true ]; then
        echo "$line" >> "$output_file"
    fi
done < "$input_file"
