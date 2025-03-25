# main installer
install: ensure
	@echo
	@echo "Downloading all emulators..."
	@echo
	@$(MAKE) azahar
	@$(MAKE) cemu
	@$(MAKE) dolphin
	@$(MAKE) duckstation
	@$(MAKE) melonds
	@$(MAKE) mgba
	@$(MAKE) pcsx2
	@$(MAKE) ppsspp
	@$(MAKE) rpcs3
	@$(MAKE) ryujinx
	@$(MAKE) snes9x
	@echo
	@echo "All emulators downloaded."
	@echo

# helpers to install
uninstall:
	@echo
	@echo "Uninstalling emulators..."
	@rm -rf ~/Applications/Emulators/*
	@echo "Emulators uninstalled."
	@echo

ensure:
	@if ! command -v brew &> /dev/null; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" >/dev/null 2>&1; \
	fi
	@if ! brew list jq &>/dev/null; then \
		brew install jq >/dev/null 2>&1; \
	fi

# emulator downloaders
azahar:
	@chmod +x ./Scripts/azahar_downloader.sh && ./Scripts/azahar_downloader.sh

cemu:
	@chmod +x ./Scripts/cemu_downloader.sh && ./Scripts/cemu_downloader.sh

dolphin:
	@chmod +x ./Scripts/dolphin_downloader.sh && ./Scripts/dolphin_downloader.sh

duckstation:
	@chmod +x ./Scripts/duckstation_downloader.sh && ./Scripts/duckstation_downloader.sh

melonds:
	@chmod +x ./Scripts/melonds_downloader.sh && ./Scripts/melonds_downloader.sh

mgba:
	@chmod +x ./Scripts/mgba_downloader.sh && ./Scripts/mgba_downloader.sh

pcsx2:
	@chmod +x ./Scripts/pcsx2_downloader.sh && ./Scripts/pcsx2_downloader.sh

ppsspp:
	@chmod +x ./Scripts/ppsspp_downloader.sh && ./Scripts/ppsspp_downloader.sh

rpcs3:
	@chmod +x ./Scripts/rpcs3_downloader.sh && ./Scripts/rpcs3_downloader.sh

ryujinx:
	@chmod +x ./Scripts/ryujinx_downloader.sh && ./Scripts/ryujinx_downloader.sh

snes9x:
	@chmod +x ./Scripts/snes9x_downloader.sh && ./Scripts/snes9x_downloader.sh

# emulator removers
remove-azahar:
	@echo
	@echo "Uninstalling Azahar..."
	@rm -rf ~/Applications/Emulators/Azahar.app
	@echo "Azahar uninstalled."
	@echo

remove-cemu:
	@echo
	@echo "Uninstalling Cemu..."
	@rm -rf ~/Applications/Emulators/Cemu.app
	@echo "Cemu uninstalled."
	@echo

remove-dolphin:
	@echo
	@echo "Uninstalling Dolphin..."
	@rm -rf ~/Applications/Emulators/Dolphin.app
	@echo "Dolphin uninstalled."
	@echo

remove-duckstation:
	@echo
	@echo "Uninstalling DuckStation..."
	@rm -rf ~/Applications/Emulators/DuckStation.app
	@echo "DuckStation uninstalled."
	@echo

remove-melonDS:
	@echo
	@echo "Uninstalling melonDS..."
	@rm -rf ~/Applications/Emulators/melonDS.app
	@echo "melonDS uninstalled."
	@echo

remove-mgba:
	@echo
	@echo "Uninstalling mGBA..."
	@rm -rf ~/Applications/Emulators/mGBA.app
	@echo "mGBA uninstalled."
	@echo

remove-pcsx2:
	@echo
	@echo "Uninstalling PCSX2..."
	@rm -rf ~/Applications/Emulators/PCSX2.app
	@echo "PCSX2 uninstalled."
	@echo

remove-ppsspp:
	@echo
	@echo "Uninstalling PPSSPP..."
	@rm -rf ~/Applications/Emulators/PPSSPP.app
	@echo "PPSSPP uninstalled."
	@echo

remove-rpcs3:
	@echo
	@echo "Uninstalling RPCS3..."
	@rm -rf ~/Applications/Emulators/RPCS3.app
	@echo "RPCS3 uninstalled."
	@echo

remove-ryujinx:
	@echo
	@echo "Uninstalling Ryujinx..."
	@rm -rf ~/Applications/Emulators/Ryujinx.app
	@echo "Ryujinx uninstalled."
	@echo

remove-snes9x:
	@echo
	@echo "Uninstalling Snes9x..."
	@rm -rf ~/Applications/Emulators/Snes9x.app
	@echo "Snes9x uninstalled."
	@echo

# emulator updaters
update:
	@echo
	@echo "Updating all emulators (this may take a while)..."
	@make uninstall >/dev/null 2>&1
	@make install >/dev/null 2>&1
	@echo "All emulators updated."
	@echo

update-azahar:
	@echo
	@echo "Updating Azahar..."
	@make remove-azahar >/dev/null 2>&1
	@make azahar >/dev/null 2>&1
	@echo "Azahar updated."
	@echo

update-cemu:
	@echo
	@echo "Updating Cemu..."
	@make remove-cemu >/dev/null 2>&1
	@make cemu >/dev/null 2>&1
	@echo "Cemu updated."
	@echo

update-dolphin:
	@echo
	@echo "Updating Dolphin..."
	@make remove-dolphin >/dev/null 2>&1
	@make dolphin >/dev/null 2>&1
	@echo "Dolphin updated."
	@echo

update-duckstation:
	@echo
	@echo "Updating DuckStation..."
	@make remove-duckstation >/dev/null 2>&1
	@make duckstation >/dev/null 2>&1
	@echo "DuckStation updated."
	@echo

update-melonds:
	@echo
	@echo "Updating melonDS..."
	@make remove-melonds >/dev/null 2>&1
	@make melonds >/dev/null 2>&1
	@echo "melonDS updated."
	@echo

update-mgba:
	@echo
	@echo "Updating mGBA..."
	@make remove-mgba >/dev/null 2>&1
	@make mgba >/dev/null 2>&1
	@echo "mGBA updated."
	@echo

update-pcsx2:
	@echo
	@echo "Updating PCSX2..."
	@make remove-pcsx2 >/dev/null 2>&1
	@make pcsx2 >/dev/null 2>&1
	@echo "PCSX2 updated."
	@echo

update-ppsspp:
	@echo
	@echo "Updating PPSSPP..."
	@make remove-ppsspp >/dev/null 2>&1
	@make ppsspp >/dev/null 2>&1
	@echo "PPSSPP updated."
	@echo

update-rpcs3:
	@echo
	@echo "Updating RPCS3..."
	@make remove-rpcs3 >/dev/null 2>&1
	@make rpcs3 >/dev/null 2>&1
	@echo "RPCS3 updated."
	@echo

update-ryujinx:
	@echo
	@echo "Updating Ryujinx..."
	@make remove-ryujinx >/dev/null 2>&1
	@make ryujinx >/dev/null 2>&1
	@echo "Ryujinx updated."
	@echo

update-snes9x:
	@echo
	@echo "Updating Snes9x..."
	@make remove-snes9x >/dev/null 2>&1
	@make snes9x >/dev/null 2>&1
	@echo "Snes9x updated."
	@echo