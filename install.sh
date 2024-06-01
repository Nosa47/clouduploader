#!/bin/bash

# Path to install the script
INSTALL_DIR="/usr/local/bin"

# Move the renamed script file to the installation directory
mv clouduploader "$INSTALL_DIR"

# Make the script executable
chmod +x "$INSTALL_DIR/clouduploader"

echo "Cloud Uploader CLI Tool installed successfully!"
