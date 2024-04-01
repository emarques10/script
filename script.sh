#!/bin/bash

# Name of the YAML file
file="your_file.yaml"

# Separator pattern (matches "---")
separator='---'

# Counter for sections
counter=0

# Read sections from the file and store each section in a separate variable
while IFS= read -r section || [ -n "$section" ]; do
    # If the section is not empty
    if [ -n "$section" ]; then
        # Create a variable name dynamically
        var_name="section_$((counter + 1))"
        # Assign the section to the variable
        declare "$var_name"="$section"
        # Increment the counter
        ((counter++))
    fi
done < <(awk -v RS="$separator" 'NF > 0' "$file")

# Print each section stored in a separate variable
for ((i = 0; i < counter; i++)); do
    var_name="section_$((i + 1))"
    echo "Section $((i + 1)):"
    echo "${!var_name}"
    echo  # Add an empty line between sections
done