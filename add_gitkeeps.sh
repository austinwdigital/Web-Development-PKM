#!/bin/bash

# Find all top-level directories that don't start with a dot
for dir in */; do
    # Skip directories that start with a dot
    if [[ $dir != .* ]]; then
        echo "Processing $dir"
        
        # Find all empty directories within this directory and add .gitkeep to them
        find "$dir" -type d -empty -exec touch {}/.gitkeep \;
    fi
done

echo "Added .gitkeep to all empty directories (excluding dot directories)"