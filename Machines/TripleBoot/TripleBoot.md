# Triple Boot Procedure | Macbook | 2018

## Contents

- [Overview](#overview)
- [Steps](#steps)

## Overview

- The following steps can guide you thru the procedure for configuring a triple-boot system on a Macbook.

## Steps

### 1. Clean disk

- Boot W10 install media
- Open command prompt
  - `$ diskpart`
  - `$ disk list`
  - `$ select Disk 0`
  - `$ clean`
- Shut down

## 2. Partition Disk

- Boot OSX installation media
- Open `Disk Utility`
- Erase
  - **Name**: OSX
  - **Format**: Mac OS Extended (Journaled)
- Partition
  - Split OSX (leave 120 GB)
  - Rename new partition `W10`
  - Apply
- Partition
  - Split W10 (leave 80 GB)
  - Rename new partition `BNK`
  - Apply
- Partition
  - Split BNK (leave 200 GB)
  - Rename new partition `SWP`
  - Apply
- Partition
  - Split SWP (leave 16 GB)
  - Rename new partion `LX1`
  - Apply
- Partition
  - Split LX1 (in half)
  - Rename new partion `LX2`
  - Apply
- Erase
  - OSX => APFS
  - W10 => FAT32
  - BNK => FAT32
  - SWP => FAT32
  - LX1 => FAT32
  - LX2 => FAT32
- Exit to main menu

## 3. Restore OSX

- Select `Restore from Time Machine Backup`, then `continue`
- Select `continue` past `Restore Your System`
- Select disk containing Time Machine backup
- Select desired Time Machine backup
- Select desired destination disk
- Click `Continue`, and wait for restore process to complete

## 4. Install W10

- Boot W10 installation media
- Verify language & select `next`
- Select `Install now`
- Verify OS & select `next`
- Accept terms & select `next`
- Select custom install
- Select W10 partition
- Select `Format`
- Select `Next`
- Wait for installation to complete
- Select `Customize settings`
  - Toggle all off
  - Select `next`
  - Toggle all off
  - Select `next`
- Enter user name & password
- Select `Next`
- Wait for setup to complete
- Shut down

## 5. Install Linux

- Boot Linux installation media
- Verify language & select `continue`
- Verify settings & select `continue`
- Custom install
  - Set `Device for bootloader installation`
    - Same LX1 partition
  - Change LX1 partition
    - **Use as**: Ext4 journaling file system
    - **Mount point**: /
  - Change SWP partition
    - **Use as**: swap area
  - Select `Install Now`
  - Select `Install Now`
  - Select `Install Now`
  - Select `Continue`
  - Enter user name & password
  - Select `Continue`
- Wait for install to complete
- Install MacBook wifi driver
  - Download `brcmfmac43602-pcie.bin`
  - Move to `/lib/firmware/brcm/`
- Shut down
- Repeat *Step 6* for LX2
- Shut down

## 6. Fix W10 Boot Partition

- Boot Linux
- Open terminal with root permissions
- `$ fdisk list -l`
  - Verifty correct drive
- `$ gdisk`
  - `$ {/dev/sda}`
  - `$ x` [extra functionality]
  - `$ n` [create a new protective MBR]
- Shut down

## 7. Install rEFInd

- Boot OSX
- [Download](https://sourceforge.net/projects/refind/)
- Unzip `refind-bin-0.11.2.zip`
- Command prompt to extracted folder
- `$ ./refind-install`
- Shut down

