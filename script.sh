#!/bin/bash

# Name of the YAML file
file="kubernetes.yaml"

# Separator pattern (matches "---")
separator='---'

# Counter for blocks
counter=0

# Array to store blocks
declare -a blocks

# Read the file line by line
while IFS= read -r line; do
    # If the line matches the separator pattern
    if [[ "$line" =~ $separator ]]; then
        # Increment the counter
        ((counter++))
    else
        # Append the line to the current block
        blocks[$counter]+="$line"$'\n'
    fi
done < "$file"

# Print each block stored in a separate variable
for ((i = 1; i <= counter; i++)); do
    printf "block%02d:\n" "$i"
    echo "${blocks[i]}"
    echo  # Add an empty line between blocks
done
