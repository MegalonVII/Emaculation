#!/bin/bash

# Ensure the destination directory exists
DEST_DIR="/Applications"
mkdir -p "$DEST_DIR"

# Determine system architecture
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
    REPO_URL="https://api.github.com/repos/RPCS3/rpcs3-binaries-mac-arm64/releases/latest"
else
    REPO_URL="https://api.github.com/repos/RPCS3/rpcs3-binaries-mac/releases/latest"
fi

# Fetch the latest release URL
url=$(curl -s "$REPO_URL" | jq -r '.assets[] | select(.name | endswith(".7z")) | .browser_download_url')

# Check if URL was fetched correctly
if [[ -z "$url" ]]; then
    echo "Error: Could not fetch the download URL. Please check your internet connection or the repository."
    exit 1
fi

# Download the latest release
output_file="$DEST_DIR/RPCS3-latest.7z"
echo
echo "Downloading latest RPCS3 build..."
curl -L "$url" -o "$output_file" > /dev/null 2>&1

# Check if the download was successful
if [[ ! -f "$output_file" ]]; then
    echo "Error: Download failed. Please check your internet connection."
    exit 1
fi

# Extract the .7z file
cd "$DEST_DIR" || exit 1
if command -v 7z >/dev/null 2>&1; then
    7z x RPCS3-latest.7z > /dev/null 2>&1
elif command -v unar >/dev/null 2>&1; then
    unar RPCS3-latest.7z > /dev/null 2>&1
else
    echo "Error: No 7z extractor found. Please install p7zip or unar."
    exit 1
fi

# Remove the .7z file
rm -f RPCS3-latest.7z
rm -f Quickstart.url
echo "Latest RPCS3 build downloaded."
echo

# Return to the original directory
cd - >/dev/null || exit 1
