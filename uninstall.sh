#!/bin/bash

echo
while true; do
    read -rp "Are you sure? (y/n) " choice
    case "$choice" in
        [Yy]) echo "Proceeding..."; break ;;
        [Nn]) echo "Aborted."; echo; exit 1 ;;
        *) echo "Invalid input. Please enter 'y' or 'n'." ;;
    esac
done

rm -rf /Applications/Emulators
rm -rf /Applications/Pegasus.app
rm -rf ~/Library/Preferences/pegasus-frontend

echo "Done. Sorry to see you go..."
echo