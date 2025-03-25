# Emaculation

## MacOS emulator configurator to transform your Mac into an emulation powerhouse!

This is a (WIP) series of Shell scripts which allows for anyone, be they brand new to the concept of emulation or someone who just doesn't want to spend more time on configurations, on MacOS to transform their *brand new* Mac into a capable machine for a emulation console. This assumes that you have never configured anything related to emulation on your device before. **Currently, this is only just roughly starting; contributions are very much welcome!**

### Ideas To Implement

1. A proper frontend, maybe either [ES-DE](https://es-de.org) or [Pegasus](https://pegasus-frontend.org/). Should have ability to switch between it and MacOS desktop and vice versa, much like how the Steam Deck does.
2. More emulators, including but not limited to NES, N64, and anything Xbox. Would prefer **NOT** to use RetroArch or other core-based emulators, as I think they are very bloated and the cores are not often updated fast enough compared to their standalone counterparts.
3. Automatic configurations for each emulator.
4. Giving users (partial) access to the contents of the `~/Library/Application Support/` folder (or wherever else) in which the emulators store their configurations. This is to upload any BIOS files or system firmware/keys they need to use with the emulator.
5. A "drag and drop" system to store their ROMs in, so that after doing so they appear in the frontend.

And more to come that I'm not thinking of at the moment! Remember, if you have any ideas, feel free to contribute!

### Getting Started!

This is only now just getting started, so there are no current plans for a release `.app` file. However, eventually I would like to make one that would make this process more GUI based for ease of use. For the time being here are some instructions to get started.

```
bash <(curl -sL https://raw.githubusercontent.com/MegalonVII/Emaculation/main/setup.sh)
```

### Reach Out To Me!

I may make a Discord server later if this project picks up traction. For the time being, however, please send me a message over Discord with anything regarding this project. My Discord username is `megalonvii`; shoot me a friend request!

### Thanks

- [OpenEmu](https://openemu.org/) for getting me started with emulation in the first place.
- [RetroPie](https://github.com/RetroPie/RetroPie-Setup) for inspiration behind the project.
- [The Steam Deck](https://www.steamdeck.com/en/) for being my favorite console ever. (Yes, I'm calling it a console. Shut up, elitists.).
- [EmuDeck](https://www.emudeck.com/) for explaining to me why the Steam Deck is awesome.
