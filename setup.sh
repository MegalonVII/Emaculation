#!/bin/bash

# Variables
first_dir=$(pwd)
repo_name="Emaculation"
repo_url="https://github.com/MegalonVII/Emaculation.git"
raw_repo_url="https://raw.githubusercontent.com/MegalonVII/Emaculation/main"
rom_folders=("3DS" "GB" "GBA" "GBC" "GC" "NDS" "PS1" "PS2" "PS3" "PSP" "SNES" "Switch" "Wii" "WiiU")
programs=("azahar" "bsnes" "cemu" "dolphin" "duckstation" "melonds" "mgba" "pcsx2" "pegasus" "ppsspp" "rpcs3" "ryujinx")

# Dependencies installation
echo
echo "Installing dependencies..."
if ! command -v brew &> /dev/null; then 
    /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" >/dev/null 2>&1
fi
if ! brew list jq &>/dev/null; then
    brew install jq >/dev/null 2>&1
fi
echo "Dependencies installed."
echo

# Folder setup
echo "Setting up folders..."
mkdir -p $HOME/Documents/Emulation/ROMs && cd $HOME/Documents/Emulation/ROMs
for folder in "${rom_folders[@]}"; do
    mkdir -p "$folder" && cd "$folder" && curl -sL "$raw_repo_url/ROMs/$folder/metadata.txt" -o metadata.txt && cd .. >/dev/null 2>&1
done
cd "$first_dir"
echo "Folders set up."
echo

# Emulator and Pegasus download
echo "Setting up programs..."
for program in "${programs[@]}"; do
    bash <(curl -sL "$raw_repo_url/Downloaders/${program}_downloader.sh")
done
echo "Programs set up."
echo

# Done
echo
echo "Done!"
echo