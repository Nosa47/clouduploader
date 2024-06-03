#!/bin/bash

# Function to display a prompt and read input
prompt() {
    read -p "$1" input
    echo "$input"
}

# Function to check internet connection using DNS lookup
check_internet_connection() {
    host -W 1 google.com >/dev/null
    return $?
}

# Function to check if the S3 bucket exists
check_bucket_existence() {
    aws s3 ls "s3://$1" &>/dev/null
    return $?
}

# Function to check if the S3 directory exists
check_directory_existence() {
    aws s3 ls "s3://$1" &>/dev/null
    return $?
}

# Check internet connection
if ! check_internet_connection; then
    echo "Error: No internet connection."
    exit 1
fi

# Prompt for file path
file_path=$(prompt "Enter the file directory: ")

# Extract filename from file path
filename=$(basename "$file_path")

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "Error: $filename doesn't exist."
    exit 1
fi

# Prompt for S3 bucket
for i in {1..3}; do
    s3_bucket=$(prompt "Enter the S3 bucket name: ")

    if check_bucket_existence "$s3_bucket"; then
        break
    else
        if [ $i -eq 3 ]; then
            echo "Error: Maximum attempts reached. Exiting."
            exit 1
        fi
        echo "Error: '$s3_bucket' doesn't exist."
    fi
done

# Prompt for S3 directory
for i in {1..3}; do
    s3_directory=$(prompt "Enter the S3 directory (path): ")

    if check_directory_existence "$s3_bucket/$s3_directory"; then
        break
    else
        if [ $i -eq 3 ]; then
            echo "Error: Maximum attempts reached. Exiting."
            exit 1
        fi
        echo "Error: '$s3_bucket/$s3_directory' doesn't exist."
    fi
done

# Prompt for storage class
storage_class=$(prompt "Enter the storage class (e.g., STANDARD, STANDARD_IA, etc.): ")

# Inform user of the upload process
echo "Uploading..."

# Upload file to AWS S3
if aws s3 cp "$file_path" "s3://$s3_bucket/$s3_directory" --storage-class "$storage_class"; then
    echo "Upload completed."
else
    echo "Error: Failed to upload $filename to s3://$s3_bucket/$s3_directory"
fi
