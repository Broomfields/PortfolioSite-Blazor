#!/bin/bash

# Function to search and delete 'bin' and 'obj' directories
function search_and_delete() {
    for dir in "$1"/*; do
        if [ -d "$dir" ]; then  # Check if it is a directory
            dirname=$(basename "$dir")
            if [ "$dirname" = "bin" ] || [ "$dirname" = "obj" ]; then
                echo "Deleting directory: $dir"
                rm -rf "$dir"  # Force delete the directory
            else
                # Recursively search in the subdirectory
                search_and_delete "$dir"
            fi
        fi
    done
}

# Start the search from the current directory
search_and_delete .
