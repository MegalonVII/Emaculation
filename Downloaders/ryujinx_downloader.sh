#!/bin/bash

# Ensure the destination directory exists
DEST_DIR="/Applications"
mkdir -p "$DEST_DIR"

# Get URL
url_for_version=$(curl -Ls -o /dev/null -w %{url_effective} https://update.ryujinx.app/latest)
version=$(basename "$url_for_version")
url="https://git.ryujinx.app/api/v4/projects/1/packages/generic/Ryubing/$version/ryujinx-$version-macos_universal.app.tar.gz"

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
tar -xvf Ryujinx-macos-latest.tar.gz >/dev/null 2>&1

# Remove the tar.gz file
rm -f Ryujinx-macos-latest.tar.gz
echo "Latest Ryujinx build downloaded."
echo

# Return to the original directory
cd - >/dev/null || exit 1

