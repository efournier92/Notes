# Ubuntu Live USB Creation

## Contents
- [Overview](#overview)
- [ESP Structure](#esp-structure)
- [Creation Steps](#migrating-to-a-larger-partition)

## Overview
For years, I wondered why I couldn't clone my [OS](https://en.wikipedia.org/wiki/Operating_system) onto a [USB flash drive](https://en.wikipedia.org/wiki/USB_flash_drive), then make it bootable on any machine like [Linux](https://www.linux.org/) [Live Installers](https://ubuntu.com/download/desktop) do. I finally undertook the project, and came out with a working method to do exactly that. My solution predominantly relies upon [grub2](https://www.gnu.org/software/grub/manual/grub/grub.html) and [Clonezilla](https://www.clonezilla.org/). Below are the steps with which I clone a my system onto a [USB flash drive](https://en.wikipedia.org/wiki/USB_flash_drive).

## [Flash Drive](https://en.wikipedia.org/wiki/USB_flash_drive) Specifications

### Description
For this to work adequately, be sure to use a high-end [flash drive](https://en.wikipedia.org/wiki/USB_flash_drive) with a fast [I/O](https://en.wikipedia.org/wiki/Input/output) speed. Below are some benchmarks I took of different brands when I undertook this project.

### Benchmarks
[Github](https://github.com/efournier92/Notes/blob/master/Linux/LiveUsb/UsbBenchmarks.md)

## ESP Structure

### Description
Getting the [ESP](https://en.wikipedia.org/wiki/ESP_system_partition) structure right is integral to making this work. In the below steps, I use the following zip file to get this structure started.

### Location
[ESP.zip](https://github.com/efournier92/Notes/blob/master/Linux/LiveUsb/ESP.zip)

## Creation Steps

### 1. Prepare the [flash drive](https://en.wikipedia.org/wiki/USB_flash_drive) in [GParted](https://gparted.org/)

#### Reformat
- Select the flash drive
- In the menu, select `Device`, then `Create Partition Table...`
- Select `msdos`, then click `Apply`

#### 1st Partition
- Label: ESP
- Size: 100MiB
- File System: fat32

#### 2nd Partition
- Label: SWP
- Size: 7500MiB
- File System: linux-swp

#### 3rd Partition
- Label: LNX
- Size: [Remaining Space]
- File System: ext4

#### Select `Apply all operations`

### 2. Install [grub2](https://www.gnu.org/software/grub/manual/grub/grub.html) on the flash drive

#### Prepare the Environment
- Boot into an Ubuntu Live USB
- Launch terminal

#### Install [grub2](https://www.gnu.org/software/grub/manual/grub/grub.html)
```bash
sudo su
mkdir -p /mnt/USB && mkdir -p /mnt/USB/boot && mount /dev/sdx1 /mnt/USB
grub-install --force --removable --boot-directory=/mnt/USB/boot /dev/sdx
```

### 3. Copy files to ESP

#### Download via [cURL](https://curl.haxx.se/)
```bash
wget https://raw.githubusercontent.com/efournier92/Notes/master/Ubuntu/LiveUsb/ESP.zip
```

#### Copy Files
```bash
cp grub.cnf {ESP}/boot/grub/
cp efi/ {ESP}/
```

### 4. Clone a preexisting [Clonezilla](https://www.clonezilla.org/) partition to the [flash drive](https://en.wikipedia.org/wiki/USB_flash_drive)
- Boot into [Clonezilla](https://www.clonezilla.org/), and select the following options.
- `device-device`
- `Beginner`
- `part_to_local_part`
- Find and select `$Temp_Part`
- Find and select the flash drive ext4 partition
- Input `y` until clone process starts

### 5. Optionally Change the [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier) of to Match Another Configuration
```bash
sudo e2fsck -f /dev/sdX#
sudo tune2fs /dev/sdX# -U 364595bd-494c-4829-b360-7bd0e96913e4
```

### 6. Boot Ubuntu from the flash drive

### 7. Update [fstab](https://en.wikipedia.org/wiki/Fstab) on the [flash drive](https://en.wikipedia.org/wiki/USB_flash_drive)

#### Check System [UUIDs](https://en.wikipedia.org/wiki/Universally_unique_identifier)
```bash
sudo blkid
```

#### Update [fstab](https://en.wikipedia.org/wiki/USB_flash_drive) with Correct [UUIDs](https://en.wikipedia.org/wiki/Universally_unique_identifier)
```bash
sudo vim /etc/fstab
```

