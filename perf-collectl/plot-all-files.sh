#!/bin/bash

# Path to the script you want to run for each .raw file
SCRIPT="./plot-file.sh"

# Iterate over each .raw file in the current directory
for FILE in *.raw.gz; do
  # Check if there are any .raw files
  [ -e "$FILE" ] || { echo "No .raw files found."; exit 1; }
  
  # Run the script with the .raw file as an argument
  "$SCRIPT" "$FILE"
done
