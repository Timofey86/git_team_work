#!/bin/bash

# 1. Ask for source and target directories
read -p "Enter source directory: " source_dir
read -p "Enter target directory: " target_dir

# 2. Ask for file extension
read -p "Enter file extension: " extension

# 3. Verify directories
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory does not exist or is not accessible."
    exit 1
fi

if [ ! -d "$target_dir" ]; then
    echo "Error: Target directory does not exist or is not accessible."
    exit 1
fi

# 4. Search for files
files=$(find "$source_dir" -maxdepth 1 -type f -name "*.$extension")

if [ -z "$files" ]; then
    echo "Error: No files with extension .$extension found in source directory."
    exit 1
fi

# 5. Copy files
for file in $files; do
    cp "$file" "$target_dir"
    if [ $? -eq 0 ]; then
        echo "Copied: $file"
    else
        echo "Failed to copy: $file"
    fi
done

echo "Done."