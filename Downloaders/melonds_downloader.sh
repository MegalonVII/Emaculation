#!/bin/bash

# Ensure the destination directory exists
DEST_DIR="/Applications"
mkdir -p "$DEST_DIR"

url=$(curl -s https://api.github.com/repos/melonDS-emu/melonDS/releases/latest \
    | jq -r '.assets[] | select(.name | contains("macOS")) | .browser_download_url')

# Check if URL was fetched correctly
if [[ -z "$url" ]]; then
    echo "Error: Could not fetch the download URL. Please check your internet connection or the repository."
    exit 1
fi

# Download the latest release
output_file="$DEST_DIR/melonDS-macos-latest.zip"
echo
echo "Downloading latest melonDS build..."
curl -L "$url" -o "$output_file" > /dev/null 2>&1

# Check if the download was successful
if [[ ! -f "$output_file" ]]; then
    echo "Error: Download failed. Please check your internet connection."
    exit 1
fi

# Extract the ZIP file
cd "$DEST_DIR" || exit 1
unzip melonDS-macos-latest.zip > /dev/null 2>&1
unzip macOS-universal.zip > /dev/null 2>&1

# Remove the ZIP file
rm -f macOS-universal.zip
rm -f melonDS-macos-latest.zip
echo "Latest melonDS build downloaded."
echo

# Return to the original directory
cd - >/dev/null || exit 1
