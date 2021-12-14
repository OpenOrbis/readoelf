# Tool Documentation (readoelf)

## Summary
The `readoelf` tool is meant to be a replacement for the standard `readelf` found on most systems. The reason a replacement was written is because PS4 ELFs (OELFs) have many proprietary types for most tables, including program header types, relocation types, as well as a completely custom linking system. This tool will allow developers to get detailed information on OELFs built with the SDK.

Note that this tool may work on standard ELFs / ELFs not targeting the PS4, however many of the options will not function properly. File, program, and section headers will likely work, however other options such as printing the dynamic, relocation, or symbol table, will not.

### Build
The tool is written in Golang. Commands should be the same between Windows and Linux assuming Golang is installed on the target system.

Building is straightforward, you can use the provided Makefile or build scripts. The script will automatically copy the built binaries to `$OO_PS4_TOOLCHAIN/bin`. If you just wish to build individual files without cross-compiling or moving to a build directory, simply go to `cmd/readoelf` and run `go build`.

There is a shell build script to compile `readoelf` on Linux and macOS, and cross-compile it for Windows.

### Usage
The `readoelf` tool requires one argument, being the file to evaluate.

There are also additional optional arguments for customizing app information in the final SELF or PRX.

```
Options:
  --all / -a
        Display all information
  --headers / -e
        Display all header-related information, including the file header, section headers, and program headers
  --file-header / -h
        Display file header information
  --program-headers / --segments / -l
        Display segment/program header information
  --section-headers / --sections / -S
        Display section header information
  --symbols / --syms / --dyn-syms / -s
        Display dynamic symbol table information
  --relocs / -r
        Display relocation table information
  --dynamic / -d
        Display dynamic table information
```

### Example Usage

```
./readoelf -a hello_world.oelf
```

## Source code overview
Each source file is responsible for a group of actions invoked by the tool. Below is a list of source files and what they're generally responsible for.

**ELFParsing.go**

Contains functions necessary for parsing the ELF, and contains the functions that print out the various table information to stdout.

**main.go**

Contains the main entry point and handles argument parsing.

## Maintainers + Thanks
- Specter: Lead maintainer
- Kiwidog: Maintainer
- CrazyVoid: Maintainer
