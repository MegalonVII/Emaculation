#!/bin/bash

# Ensure the destination directory exists
DEST_DIR="$HOME/Applications/Emulators"
mkdir -p "$DEST_DIR"

url=$(curl -s https://api.github.com/repos/PCSX2/pcsx2/releases/latest \
    | jq -r '.assets[] | select(.name | contains("macos-Qt")) | .browser_download_url')

# Check if URL was fetched correctly
if [[ -z "$url" ]]; then
    echo "Error: Could not fetch the download URL. Please check your internet connection or the repository."
    exit 1
fi

# Download the latest release
output_file="$DEST_DIR/PCSX2-macos-latest.tar.xz"
echo
echo "Downloading latest PCSX2 build..."
curl -L "$url" -o "$output_file" > /dev/null 2>&1

# Check if the download was successful
if [[ ! -f "$output_file" ]]; then
    echo "Error: Download failed. Please check your internet connection."
    exit 1
fi

# Extract the tar.xz file
cd "$DEST_DIR" || exit 1
tar -xvf PCSX2-macos-latest.tar.xz >/dev/null 2>&1

# Remove the tar.gz file
rm -f PCSX2-macos-latest.tar.xz
mv PCSX2*.app PCSX2.app
echo "Latest PCSX2 build downloaded."
echo

# Return to the original directory
cd - >/dev/null || exit 1

