# AArch64 Playground

Welcome to the **AArch64 Playground** repo! This project is a collection of AArch64 assembly code examples, with a focus on learning and experimenting with low-level programming on the AArch64 architecture. The repository (soon) will include tutorials and code examples for working with OpenGL and SDL2 in assembly.

## Getting Started

### Prerequisites

To build and run the examples you'll need:

- **Xcode Command Line Tools**: Install via `xcode-select --install`.
- **Homebrew**: Install via `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- **SDL2**: Install via `brew install sdl2`

### Building

1. **Close the Repository**
```bash
    git clone https://github.com/FloofyPlasma/AArch64-Playground.git
    cd AArch64-Playground
```

2. **Build the project**
```bash
    make
```
This will compile the assembly source files and link them into an executable located in the `build/` directory.

3. **Clean Up**
    To remove the build files, use:
```bash
    make clean
```

## Adding More Assembly Files

Simply add more `.s` files into the `src/` directory. The Makefile will automatically compile them and include them in the build process.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to open issues or submit pull requests if you have improvements or additions!
