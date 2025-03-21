#!/bin/bash

latest_release=$(curl -s https://dolphin-emu.org/download/ | grep -o 'href="/download/release/[0-9]\+/' | head -n 1 | grep -o '[0-9]\+')
url="https://dl.dolphin-emu.org/releases/$latest_release/dolphin-$latest_release-universal.dmg"

# Check if URL was fetched correctly
if [[ -z "$url" ]]; then
    echo "Error: Could not fetch the download URL. Please check your internet connection or the repository."
    exit 1
fi

DEST_DIR="$HOME/Applications/Emulators"
mkdir -p "$DEST_DIR"

# Download the latest release
output_file="$DEST_DIR/Dolphin-macos-latest.dmg"
echo
echo "Downloading latest Dolphin build..."
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
cp -R "/Volumes/"*/Dolphin.app "$DEST_DIR/"

hdiutil detach "$volume" -quiet
rm -f "$output_file"

echo "Latest Dolphin build downloaded."