all:
	echo
	echo "Downloading all Emulators..."
	make ryujinx
	make melonds
	make cemu
	make mgba
	make ppsspp
	make duckstation
	make pcsx2
	make dolphin
	make rpcs3
	make snes9x
	echo
	echo "All Emulators downloaded."
	echo

clean:
	rm -rf ~/Applications/Emulators/*

ryujinx:
	chmod +x ./Scripts/ryujinx_downloader.sh
	./Scripts/ryujinx_downloader.sh

melonds:
	chmod +x ./Scripts/melonds_downloader.sh
	./Scripts/melonds_downloader.sh

cemu:
	chmod +x ./Scripts/cemu_downloader.sh
	./Scripts/cemu_downloader.sh

mgba:
	chmod +x ./Scripts/mgba_downloader.sh
	./Scripts/mgba_downloader.sh

ppsspp:
	chmod +x ./Scripts/ppsspp_downloader.sh
	./Scripts/ppsspp_downloader.sh

duckstation:
	chmod +x ./Scripts/duckstation_downloader.sh
	./Scripts/duckstation_downloader.sh

pcsx2:
	chmod +x ./Scripts/pcsx2_downloader.sh
	./Scripts/pcsx2_downloader.sh

dolphin:
	chmod +x ./Scripts/dolphin_downloader.sh
	./Scripts/dolphin_downloader.sh

rpcs3:
	chmod +x ./Scripts/rpcs3_downloader.sh
	./Scripts/rpcs3_downloader.sh

snes9x:
	chmod +x ./Scripts/snes9x_downloader.sh
	./Scripts/snes9x_downloader.sh

remove-ryujinx:
	rm -rf ~/Applications/Emulators/Ryujinx.app

remove-melonDS:
	rm -rf ~/Applications/Emulators/melonDS.app

remove-cemu:
	rm -rf ~/Applications/Emulators/Cemu.app

remove-mgba:
	rm -rf ~/Applications/Emulators/mGBA.app

remove-ppsspp:
	rm -rf ~/Applications/Emulators/PPSSPP.app

remove-duckstation:
	rm -rf ~/Applications/Emulators/DuckStation.app

remove-pcsx2:
	rm -rf ~/Applications/Emulators/PCSX2.app

remove-dolphin:
	rm -rf ~/Applications/Emulators/Dolphin.app

remove-rpcs3:
	rm -rf ~/Applications/Emulators/RPCS3.app

remove-snes9x:
	rm -rf ~/Applications/Emulators/Snes9x.app

update:
	make clean
	make all

update-ryujinx:
	make remove-ryujinx
	make ryujinx

update-melonds:
	make remove-melonds
	make melonds

update-cemu:
	make remove-cemu
	make cemu

update-mgba:
	make remove-mgba
	make mgba

update-ppsspp:
	make remove-ppsspp
	make ppsspp

update-duckstation:
	make remove-duckstation
	make duckstation

update-pcsx2:
	make remove-pcsx2
	make pcsx2

update-dolphin:
	make remove-dolphin
	make dolphin

update-rpcs3:
	make remove-rpcs3
	make rpcs3

update-snes9x:
	make remove-snes9x
	make snes9x