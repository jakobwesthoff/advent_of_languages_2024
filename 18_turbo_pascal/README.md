# Day 18: Turbo Pascal

## Installation Guide

This guide will help you set up DOSBox and Turbo Pascal to run the code. Due to
copyright restrictions, the Turbo Pascal Compiler cannot be included directly,
but this guide will help you obtain and set it up.

While these instructions are for macOS, they can be easily adapted for other
operating systems.

## Prerequisites

### 1. DOSBox Installation

Install DOSBox-X using Homebrew:

```sh
brew install dosbox-x
```

### 2. Turbo Pascal Setup

1. Download Turbo Pascal 7.0 from [WinWorld PC](https://winworldpc.com/product/turbo-pascal/7)

2. Install mtools (required for disk image extraction):

```sh
brew install mtools
```

3. Extract the disk images:

```sh
mkdir TPSETUP
for i in *.img; do echo Extracting $i; mcopy -m -i "$i" :: TPSETUP; done
```

4. Create a directory for DOSBox's C drive (e.g., `~/.dosbox/C`) and copy the `TPSETUP` folder there

### 3. Turbo Pascal Installation

1. Start DOSBox and mount your C drive:

```sh
mount c ~/.dosbox/C
```

2. Navigate to the TPSETUP directory and run the installer:

```sh
c:
cd TPSETUP
install
```

3. Follow the on-screen instructions, accepting default installation locations

The Turbo Pascal executable will be installed at `C:\TP\BIN\TURBO.EXE`

## Running the Program

1. Create a directory for your source code (e.g., `~/.dosbox/A`)

2. Mount the source code directory as Drive A in DOSBox:

```sh
mount a ~/.dosbox/A
```

3. Launch Turbo Pascal:

```sh
C:
cd TP\BIN
TURBO
```

You can now open and run your Pascal source files through the Turbo Pascal IDE.
