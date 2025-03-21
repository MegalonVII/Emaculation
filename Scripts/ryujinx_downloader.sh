#!/bin/bash

# Ensure the destination directory exists
DEST_DIR="$HOME/Applications/Emulators"
mkdir -p "$DEST_DIR"

url=$(curl -s https://api.github.com/repos/Ryubing/Stable-Releases/releases/latest \
    | jq -r '.assets[] | select(.name | contains("macos_universal.app")) | .browser_download_url')

# Check if URL was fetched correctly
if [[ -z "$url" ]]; then
    echo "Error: Could not fetch the download URL. Please check your internet connection or the repository."
    exit 1
fi

# Download the latest release
output_file="$DEST_DIR/Ryujinx-macos-latest.tar.gz"
echo
echo "Downloading latest Ryujinx build..."
curl -L "$url" -o "$output_file" > /dev/null 2>&1

# Check if the download was successful
if [[ ! -f "$output_file" ]]; then
    echo "Error: Download failed. Please check your internet connection."
    exit 1
fi

# Extract the tar.gz file
cd "$DEST_DIR" || exit 1
tar -xvf Ryujinx-macos-latest.tar.gz

# Remove the tar.gz file
rm -f Ryujinx-macos-latest.tar.gz
echo "Latest Ryujinx build downloaded."
echo

# Return to the original directory
cd - >/dev/null || exit 1

