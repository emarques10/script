#!/bin/bash

# Input file
input_file="input.txt"

# Separator
separator="---"

# Output file prefix
output_prefix="output"

# Counter for output files
counter=1

# Flag to indicate if separator has been found
separator_found=false

# Loop through each line in the input file
while IFS= read -r line; do
    # Trim leading and trailing whitespaces from the line and separator
    trimmed_line=$(echo "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
    trimmed_separator=$(echo "$separator" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

    # Check if the current line matches the separator
    if [[ "$trimmed_line" == "$trimmed_separator" ]]; then
        # Set the flag to indicate separator is found
        separator_found=true
        # Increment the counter for output files
        ((counter++))
        # Continue to the next iteration
        continue
    fi

    # If separator has been found, write the line to a new output file
    if [ "$separator_found" = true ]; then
        # Generate the output file name
        output_file="${output_prefix}_${counter}.txt"
        # Write the line to the output file
        echo "$line" > "$output_file"
    else
        # If separator has not been found yet, append the line to the current output file
        output_file="${output_prefix}_${counter}.txt"
        echo "$line" >> "$output_file"
    fi
done < "$input_file"