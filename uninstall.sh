#!/bin/bash

programs=("Azahar" "bsnes" "Cemu" "Dolphin" "DuckStation" "melonDS" "mGBA" "PCSX2" "Pegasus" "PPSSPP" "RPCS3" "Ryujinx")

echo
while true; do
    read -rp "Are you sure? (y/n) " choice
    case "$choice" in
        [Yy]) echo "Proceeding..."; break ;;
        [Nn]) echo "Aborted."; echo; exit 1 ;;
        *) echo "Invalid input. Please enter 'y' or 'n'." ;;
    esac
done

for program in "${programs[@]}"; do
    rm -rf /Applications/"$program"
done
rm -rf ~/Library/Preferences/pegasus-frontend

echo "Done. Sorry to see you go..."
echo
