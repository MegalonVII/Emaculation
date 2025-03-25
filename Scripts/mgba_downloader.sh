#!/bin/bash

url=$(curl -s https://api.github.com/repos/mgba-emu/mgba/releases/latest \
    | jq -r '.assets[] | select(.name | contains("macos")) | .browser_download_url')

# Check if URL was fetched correctly
if [[ -z "$url" ]]; then
    echo "Error: Could not fetch the download URL. Please check your internet connection or the repository."
    exit 1
fi

DEST_DIR="$HOME/Applications/Emulators"
mkdir -p "$DEST_DIR"

# Download the latest release
output_file="$DEST_DIR/mGBA-macos-latest.dmg"
echo
echo "Downloading latest mGBA build..."
curl -L "$url" -o "$output_file" > /dev/null 2>&1

# Check if the download was successful
if [[ ! -f "$output_file" ]]; then
    echo "Error: Download failed. Please check your internet connection."
    exit 1
fi

# Mount the .dmg
hdiutil attach "$output_file" -nobrowse -quiet

volume=$(hdiutil info | grep "/Volumes/" | awk '{print $1}' | head -n 1)

if [[ -z "$volume" ]]; then
    echo "Error: Could not find mounted volume. Please check the DMG file."
    hdiutil detach "$volume" > /dev/null 2>&1
    exit 1
fi

# Copy the application to the destination directory
cp -R "/Volumes/"*/mGBA.app "$DEST_DIR/"

hdiutil detach "$volume" -quiet
rm -f "$output_file"

echo "Latest mGBA build downloaded."
echo
