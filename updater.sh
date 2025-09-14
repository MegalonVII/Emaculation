#!/bin/bash

shell_programs=("azahar" "bsnes" "cemu" "dolphin" "duckstation" "melonds" "mgba" "pcsx2" "pegasus" "ppsspp" "rpcs3" "ryujinx")
raw_program_names=("Azahar" "bsnes" "Cemu" "Dolphin" "DuckStation" "melonDS" "mGBA" "PCSX2" "Pegasus" "PPSSPP" "RPCS3" "Ryujinx")
raw_repo_url="https://raw.githubusercontent.com/MegalonVII/Emaculation/main"

# Loop to remove apps
for name in "${raw_program_names[@]}"; do
    rm -rf "/Applications/${name}.app"
done

# Loop to update programs
for i in "${!shell_programs[@]}"; do
    program="${shell_programs[i]}"
    raw_program_name="${raw_program_names[i]}"    
    
    echo
    echo "Updating ${raw_program_name}..."
    bash <(curl -sL "$raw_repo_url/Downloaders/${program}_downloader.sh") >/dev/null 2>&1
    echo "$raw_program_name updated."
    echo
done
