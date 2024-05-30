#!/bin/bash

# Path to install the script
INSTALL_DIR="/usr/local/bin"

# Copy the script file to the installation directory
cp clouduploader.sh "$INSTALL_DIR"

# Make the script executable
chmod +x "$INSTALL_DIR/clouduploader.sh"

echo "Cloud Uploader CLI Tool installed successfully!"
