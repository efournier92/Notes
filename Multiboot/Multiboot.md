# Multiboot PC

## Contents

## Overview

## Steps

### 1. Boot any Linux Live distribution from USB
Open [gdisk]()

```bash
sudo gdisk /dev/$DISK
```

`o` to create a new GPT

#### ESP Parition
`n` to add a new partition
+200M
EF00
ESP

#### WIN Parition
`n` to add a new partition
Last sector: +80G
Hex code: 0700
WIN

#### SWP Parition
`n` to add a new partition
+10G
0700
SWP

#### UBU Parition
`n` to add a new partition
+80G
08??
UBU

#### LN0 Parition
`n` to add a new partition
+20G
08??
LN0

#### LN1 Parition
`n` to add a new partition
+20G
08??
LN1

#### BNK Parition
`n` to add a new partition
+240G
0700
BNK

#### Slot Space
Leave the remaining empty
To be filled by 

### 
```
mkdir -p /media/dskmnt
sudo mount /dev/$DISK /media/mnt
mkdir -p /media/mnt/efi/tools
```

```
sudo add-apt-repository ppa:rodsmith/refind
sudo apt install refind
```
**DEFER ESP INSTALLATION**

#### Manually Install `refind`
```bash
sudo mkdir -p /media/esp/EFI/refind/drivers_x64
sudo cp /usr/share/refind/refind/refind_x64.efi /media/esp/EFI/refind/
```
```bash
sudo efibootmgr --create --disk /dev/$disk_device --part $part_number --loader /EFI/refind/refind_x64.efi --label "rEFInd" --verbose
```
```bash
sudo cp /usr/share/refind/refind/drivers_x64/* /media/esp/EFI/refind/drivers_x64/
```
```bash
sudo cp /usr/share/refind/refind/refind.conf-sample esp/EFI/refind/refind.conf
```

#### Uncomment `textonly`
```bash
sudo vi /media/esp/EFI/refind/refind.conf
```

#### boot delete
```
sudo efibootmgr -Bb $XXXX
```

### Restore `UBU` from Clonezilla

**If isntalling fresh, be sure to point the grub2 location at the partition of installation, not the disk itself**

### Format SWP

### Fix `UBU` fstab
```bash
boot back into LIVE
lsblk -o NAME,SIZE,UUID
sudo mkdir -p /mnt/ubu
sudo mount /dev/$ubu_blk /mnt/ubu
sudo vi /mnt/ubu/etc/fstab
```
Correct the ESP & SWP entries with their corresponding UUID strings

### Install Windows
It's best to install windows properly first

Boot from install USB
Format 2nd partition
Install Windows on 2nd Partition

### Encrypt BNK
```bash
sudo mkfs.ntfs /dev/$bnk_drive
```
Encrypt using [Veracrypt]()

### Install Slots


### Create
Download the zip, and see it's size

```bash
sudo gdisk /dev/$disk_id
```
`n` to add a new partition
+XXM
0700


`c` to rename new parition
  - Give it a name, so it's easier to distinguish in the rEFInd menu

```
sudo partprobe /dev/$disk_id
```

#### From [zip]()
```bash
sudo mkdir -p /mnt/slot
zip_file=''
sudo mount /dev/$part_id /mnt/slot
sudo unzip $zip_file /mnt/slot
```


#### ISO

#### `dd`
```bash
sudo dd bs=4M if=$iso_file of=$part_id oflag=sync
```

#### Expand
```bash
sudo mkdir -p /mnt/slot
sudo mount /dev/$part_id /mnt/slot
iso_file=''
sudo mkdir -p /mnt/tmp
sudo mount -o loop $iso_file /mnt/tmp
sudo cp -rv /mnt/tmp/* /mnt/slot
```

