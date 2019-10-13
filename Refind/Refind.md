# [`rEFInd`](http://www.rodsbooks.com/refind/)

## Overview
A fork of the old [`rEFIt`](http://refit.sourceforge.net/) project, [`rEFInd`](http://www.rodsbooks.com/refind/) is my favorite boot manager available today. It takes precedence over all available [OS](https://en.wikipedia.org/wiki/Operating_system) options, auto-detects all attached bootable systems, then allows the user to select between them. It's also highly customizable, and can be styled to suit specific system needs. Below are some useful commands for working with [`rEFInd`](http://www.rodsbooks.com/refind/).

## Fix APFS Boot with `rEFInd`

### Description

### Commands

#### List Disks
```bash
diskutil list
```

#### Locate & Mount `Preboot` Parition
```bash
diskutil mount disk1s2
```

#### Get Partition GUID
```bash
ls /Volumes/Preboot/
```

#### Update `rEFInd` Stanza
```
menuentry OSX {
  icon   /EFI/refind/themes/misigno/icons/os_mac.png
  volume "Preboot"
  loader /{ GUID }/System/Library/CoreServices/boot.efi
}
```

