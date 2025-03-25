# main installer
install: ensure
	@echo
	@echo "Downloading all emulators..."
	@echo
	@$(MAKE) azahar
	@$(MAKE) bsnes
	@$(MAKE) cemu
	@$(MAKE) dolphin
	@$(MAKE) duckstation
	@$(MAKE) melonds
	@$(MAKE) mgba
	@$(MAKE) pcsx2
	@$(MAKE) ppsspp
	@$(MAKE) rpcs3
	@$(MAKE) ryujinx
	@echo
	@echo "All emulators downloaded."
	@echo

# helpers to install
uninstall:
	@echo
	@echo "Uninstalling emulators..."
	@rm -rf /Applications/Emulators/*
	@echo "Emulators uninstalled."
	@echo

ensure:
	@echo
	@echo "Installing dependencies..."
	@if ! command -v brew &> /dev/null; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" >/dev/null 2>&1; \
	fi
	@if ! brew list jq &>/dev/null; then \
		brew install jq >/dev/null 2>&1; \
	fi
	@echo "Dependencies installed."
	@echo

	@echo
	@echo "Setting up directories..."
	@if [ ! -d "$(HOME)/Documents/Emulation/" ]; then \
		echo; \
		echo "Setting directories..."; \
		mkdir -p $(HOME)/Documents/Emulation
	fi
	@echo "Directories set."
	@echo

# emulator downloaders
azahar:
	@chmod +x ./Downloaders/azahar_downloader.sh && ./Downloaders/azahar_downloader.sh

bsnes:
	@chmod +x ./Downloaders/bsnes_downloader.sh && ./Downloaders/bsnes_downloader.sh

cemu:
	@chmod +x ./Downloaders/cemu_downloader.sh && ./Downloaders/cemu_downloader.sh

dolphin:
	@chmod +x ./Downloaders/dolphin_downloader.sh && ./Downloaders/dolphin_downloader.sh

duckstation:
	@chmod +x ./Downloaders/duckstation_downloader.sh && ./Downloaders/duckstation_downloader.sh

melonds:
	@chmod +x ./Downloaders/melonds_downloader.sh && ./Downloaders/melonds_downloader.sh

mgba:
	@chmod +x ./Downloaders/mgba_downloader.sh && ./Downloaders/mgba_downloader.sh

pcsx2:
	@chmod +x ./Downloaders/pcsx2_downloader.sh && ./Downloaders/pcsx2_downloader.sh

ppsspp:
	@chmod +x ./Downloaders/ppsspp_downloader.sh && ./Downloaders/ppsspp_downloader.sh

rpcs3:
	@chmod +x ./Downloaders/rpcs3_downloader.sh && ./Downloaders/rpcs3_downloader.sh

ryujinx:
	@chmod +x ./Downloaders/ryujinx_downloader.sh && ./Downloaders/ryujinx_downloader.sh

# emulator removers
remove-azahar:
	@echo
	@echo "Uninstalling Azahar..."
	@rm -rf /Applications/Emulators/Azahar.app
	@echo "Azahar uninstalled."
	@echo

remove-bsnes:
	@echo
	@echo "Uninstalling bsnes..."
	@rm -rf /Applications/Emulators/bsnes.app
	@echo "bsnes uninstalled."
	@echo

remove-cemu:
	@echo
	@echo "Uninstalling Cemu..."
	@rm -rf /Applications/Emulators/Cemu.app
	@echo "Cemu uninstalled."
	@echo

remove-dolphin:
	@echo
	@echo "Uninstalling Dolphin..."
	@rm -rf /Applications/Emulators/Dolphin.app
	@echo "Dolphin uninstalled."
	@echo

remove-duckstation:
	@echo
	@echo "Uninstalling DuckStation..."
	@rm -rf /Applications/Emulators/DuckStation.app
	@echo "DuckStation uninstalled."
	@echo

remove-melonDS:
	@echo
	@echo "Uninstalling melonDS..."
	@rm -rf /Applications/Emulators/melonDS.app
	@echo "melonDS uninstalled."
	@echo

remove-mgba:
	@echo
	@echo "Uninstalling mGBA..."
	@rm -rf /Applications/Emulators/mGBA.app
	@echo "mGBA uninstalled."
	@echo

remove-pcsx2:
	@echo
	@echo "Uninstalling PCSX2..."
	@rm -rf /Applications/Emulators/PCSX2.app
	@echo "PCSX2 uninstalled."
	@echo

remove-ppsspp:
	@echo
	@echo "Uninstalling PPSSPP..."
	@rm -rf /Applications/Emulators/PPSSPP.app
	@echo "PPSSPP uninstalled."
	@echo

remove-rpcs3:
	@echo
	@echo "Uninstalling RPCS3..."
	@rm -rf /Applications/Emulators/RPCS3.app
	@echo "RPCS3 uninstalled."
	@echo

remove-ryujinx:
	@echo
	@echo "Uninstalling Ryujinx..."
	@rm -rf /Applications/Emulators/Ryujinx.app
	@echo "Ryujinx uninstalled."
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

update-bsnes:
	@echo
	@echo "Updating bsnes..."
	@make remove-bsnes >/dev/null 2>&1
	@make bsnes >/dev/null 2>&1
	@echo "bsnes updated."
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