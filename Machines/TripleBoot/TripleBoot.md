# Triple Boot

## Contents
- [Overview](#overview)

## Overview
Assumes you're using a Macbook

## Steps

### 1. Format Disk & Install [macOS]()
- Boot from a [macOS]() USB installer drive
- Open [Disk Utility]()
  - Rewrite the internal drive with 2 partitions
      1. MAC
        - 100GB
      2. WIN
        - Rest of the space
- Exit [Disk Utility](), and install [macOS]() on the `MAC` partition

### 2. Install [Windows]()
- Boot from a [Windows]() USB installer drive
- Continue to the `Custom Installation` menu
  - Delete the `WIN` partition
  - Add a new 100GB parition
    - Call it `WIN`
  - Leave the rest of the drive space unallocated
- Install [Windows]()

### 4. Clone [Linux]()

### 6. Install [rEFInd]()

### 5. Install [grub2]()


More notes on [rEFInd]() here: [Github]().
### 7. Format Remaining Space

