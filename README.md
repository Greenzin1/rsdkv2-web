# RSDKv2 Web

A WebAssembly port of the [RSDKv2 Decompilation](https://github.com/RSDKModding/RSDKv2-Decompilation) (Sonic Nexus 2008) running in the browser via Emscripten + Genesis Plus GX.

## About

This is a web port of the Retro-Sonic Engine v2, allowing Sonic Nexus to run directly in your browser.

Without assets from the Sonic Nexus 2008 demo, this port will not run. You can download the game [here](https://info.sonicretro.org/Sonic_Nexus).

## How to Use

1. Download the Sonic Nexus 2008 demo
2. Extract `Data.bin` (or the `Data/` folder) from the game
3. Open the web page and load the data file
4. Play!

## How to Build

This project uses [CMake](https://cmake.org/) with [Emscripten](https://emscripten.org/) to compile to WebAssembly.

### Prerequisites

Install the [Emscripten SDK](https://emscripten.org/docs/getting_started/downloads.html):
```bash
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
```

### Compiling

```bash
emcmake cmake -B build -DCMAKE_BUILD_TYPE=Release -DPLATFORM=Emscripten
cmake --build build --parallel
```

The resulting build will be located in `build/` as `.js` and `.wasm` files.

### Building via CI

This repo includes a GitHub Actions workflow that automatically builds the WASM artifacts on push. You can download the pre-built artifacts from the [Actions tab](../../actions).

## Project Structure

```
rsdkv2-web/
├── RSDKv2/              # Engine source code
│   ├── RetroEngine.*    # Core engine (patched for Emscripten)
│   ├── Drawing.cpp      # Software renderer
│   ├── Audio.cpp        # SDL2 audio
│   ├── Scene.cpp        # Level/scene management
│   ├── Script.cpp       # RetroScript VM
│   └── ...
├── platforms/
│   └── Emscripten.cmake # Emscripten build configuration
├── dependencies/        # Bundled libogg/libvorbis
└── .github/workflows/
    └── wasm.yml         # CI build workflow
```

## CMake Flags

- `PLATFORM=Emscripten` — Target Emscripten/WASM build
- `RETRO_USE_MOD_LOADER` — Enable/disable mod loader (default: ON)
- `FORCE_CASE_INSENSITIVE` — Force case insensitive file loading (default: OFF)
- `RETRO_USE_ORIGINAL_CODE` — Strip all decomp changes (default: OFF, **unplayable**)

## Credits

- **Taxman / Christian Whitehead** — Original Retro Engine
- **RSDKModding** — [RSDKv2 Decompilation](https://github.com/RSDKModding/RSDKv2-Decompilation)
- **Emscripten** — C/C++ to WebAssembly compiler
- **libretro/Genesis Plus GX** — Genesis/Mega Drive emulator core (WASM build)

## Contact

Join the [Retro Engine Modding Discord Server](https://dc.railgun.works/retroengine) for any extra questions.
