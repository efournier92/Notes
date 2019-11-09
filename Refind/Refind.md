# [rEFInd](http://www.rodsbooks.com/refind/)

## Contents
- [Overview](#overview)
- [Commands](#commands)
  - [Fix APFS](#fix-apfs)
- [EFI Structure](#efi-structure)
- [Stable Version](#stable-version)

## Overview
A fork of the old [rEFIt](http://refit.sourceforge.net/) project, [rEFInd](http://www.rodsbooks.com/refind/) is my favorite boot manager available today. It takes precedence over all available [OS](https://en.wikipedia.org/wiki/Operating_system) options, auto-detects all attached bootable systems, then allows the user to select between them. It's also highly customizable, and can be styled to suit specific system needs. Below are some useful commands for working with [rEFInd](http://www.rodsbooks.com/refind/).

## Commands

### Fix [APFS](https://en.wikipedia.org/wiki/Apple_File_System)

### Description
Often, when creating a triple-boot system, my [APFS](https://en.wikipedia.org/wiki/Apple_File_System) boot partition becomes corrupted. I use the following steps to right this wrong using [rEFInd](http://www.rodsbooks.com/refind/).

### Steps

#### List Disks
```bash
diskutil list
```

#### Locate & Mount `Preboot` Partition
```bash
diskutil mount disk1s2
```

#### Get Partition GUID
```bash
ls /Volumes/Preboot/
```

#### Update [rEFInd](http://www.rodsbooks.com/refind/) Stanza
```
menuentry OSX {
  icon   /EFI/refind/themes/misigno/icons/os_mac.png
  volume "Preboot"
  loader /{ GUID }/System/Library/CoreServices/boot.efi
}
```

## EFI Structure

### Description
I tend to include some custom assets and configuration on my [rEFInd](http://www.rodsbooks.com/refind/) builds. To make life easier, I start by putting the contents of the following [zip](https://en.wikipedia.org/wiki/Zip_(file_format)) file in the `EFI` directory of my [ESP](https://en.wikipedia.org/wiki/EFI_system_partition) partition.

### Location
[Github](https://github.com/efournier92/Notes/blob/master/Refind/EFI.zip)

## Stable Version

### Description
Since [rEFInd](http://www.rodsbooks.com/refind/) smells like a project that could someday disappear from the face of the Internet, I've backed up a stable copy of their binary at the following location.

### Location
[Github](https://github.com/efournier92/Notes/blob/master/Refind/refind-bin-0.11.2.zip)

