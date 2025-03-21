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
	chmod +x ryujinx_downloader.sh
	./ryujinx_downloader.sh

melonds:
	chmod +x melonds_downloader.sh
	./melonds_downloader.sh

cemu:
	chmod +x cemu_downloader.sh
	./cemu_downloader.sh

mgba:
	chmod +x mgba_downloader.sh
	./mgba_downloader.sh

ppsspp:
	chmod +x ppsspp_downloader.sh
	./ppsspp_downloader.sh

duckstation:
	chmod +x duckstation_downloader.sh
	./duckstation_downloader.sh

pcsx2:
	chmod +x pcsx2_downloader.sh
	./pcsx2_downloader.sh

dolphin:
	chmod +x dolphin_downloader.sh
	./dolphin_downloader.sh

rpcs3:
	chmod +x rpcs3_downloader.sh
	./rpcs3_downloader.sh

snes9x:
	chmod +x snes9x_downloader.sh
	./snes9x_downloader.sh

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