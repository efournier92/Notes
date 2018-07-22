# Ubuntu Live USB Creation

1. In `GParted`, prepare the flash drive
  * Select the flash drive
  * In the menu, select `Device`, then `Create Partition Table...`
  * Select `msdos`, then click `Apply`
  * Create 1st Partition
    - Label: ESP
    - Size: 100MiB
    - File System: fat32
  * Create 2nd Partition
    - Partition Name / Label: SWP
    - Size: 1000MiB
    - File System: linux-swp
  * Create 3rd Partition
    - Partition Name / Label: LNX
    - Size: [Remaining Space]
    - File System: ext4
  * Apply changes 
  * Click `Manage Flags` for `ESP` Partition
    - Check `boot` & `lba`
2. In `MC`, copy [Github repo directory](https://github.com/efournier92/configs/tree/master/Ubuntu/LiveUsb/ESP) contents to ESP
3. In `Clonezilla`, clone the system image to a temporary partition for shrinking
  * `device-image`
  * `local_dev`
  * Find & select system image partition
  * `Beginner`
  * `restoreparts`
  * Choose image file
  * Choose partition
  * Find & select destination partition
  * Enter password and press `y`



