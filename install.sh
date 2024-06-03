#!/bin/bash

# Path to the script file
SCRIPT_FILE="clouduploader.sh"

# Destination directory for installation
INSTALL_DIR="/usr/local/bin"

# Check if the script file exists
if [ ! -f "$SCRIPT_FILE" ]; then
    echo "Error: '$SCRIPT_FILE' not found."
    exit 1
fi

# Move the script file to the installation directory
mv "$SCRIPT_FILE" "$INSTALL_DIR/clouduploader"

# Make the script executable
chmod +x "$INSTALL_DIR/clouduploader"

echo "Cloud Uploader CLI Tool installed successfully!"
