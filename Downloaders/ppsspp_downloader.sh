#!/bin/bash

# Ensure the destination directory exists
DEST_DIR="/Applications"
mkdir -p "$DEST_DIR"

url=$(curl -s https://api.github.com/repos/hrydgard/ppsspp/releases/latest \
    | jq -r '.assets[] | select(.name | contains("macOS")) | .browser_download_url')

# Check if URL was fetched correctly
if [[ -z "$url" ]]; then
    echo "Error: Could not fetch the download URL. Please check your internet connection or the repository."
    exit 1
fi

# Download the latest release
output_file="$DEST_DIR/PPSSPP-macos-latest.zip"
echo
echo "Downloading latest PPSSPP build..."
curl -L "$url" -o "$output_file" > /dev/null 2>&1

# Check if the download was successful
if [[ ! -f "$output_file" ]]; then
    echo "Error: Download failed. Please check your internet connection."
    exit 1
fi

# Extract the ZIP file
cd "$DEST_DIR" || exit 1
unzip PPSSPP-macos-latest.zip > /dev/null 2>&1

for zipfile in PPSSPPSDL-macOS-v*.zip; do
    unzip "$zipfile" > /dev/null 2>&1
    rm -f "$zipfile"  # Remove the extracted ZIP file after extraction
done

# Remove the ZIP file
rm -f PPSSPP-macos-latest.zip
mv "PPSSPPSDL.app" "PPSSPP.app"
echo "Latest PPSSPP build downloaded."
echo

# Return to the original directory
cd - >/dev/null || exit 1
