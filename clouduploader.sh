#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 <file_path> <s3_directory> <storage_class>"
    exit 1
}

# Check if all required arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Error: Invalid number of arguments."
    usage
fi

# Extract arguments
file_path="$1"
s3_directory="$2"
storage_class="$3"

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File not found: $file_path"
    exit 1
fi

# Display parsed arguments (optional)
echo "File path: $file_path"
echo "S3 directory: $s3_directory"
echo "Storage class: $storage_class"

# Upload file to AWS S3
aws s3 cp "$file_path" "s3://$s3_directory" --storage-class "$storage_class"
