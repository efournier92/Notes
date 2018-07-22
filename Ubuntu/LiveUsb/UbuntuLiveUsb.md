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
    - Size: 7500MiB
    - File System: linux-swp
  * Create 3rd Partition
    - Partition Name / Label: LNX
    - Size: [Remaining Space]
    - File System: ext4
  * Apply all operations
  * Click `Manage Flags` for `ESP` Partition
    - Check `boot` & `lba`
2. In `MC`, copy [Github repo directory](https://github.com/efournier92/configs/tree/master/Ubuntu/LiveUsb/ESP) contents to ESP
3. In `Clonezilla`, clone the system image to `$Temp_Part` for shrinking
  * `device-image`
  * `local_dev`
  * Find & select system image partition
  * `Beginner`
  * `restoreparts`
  * Choose image file
  * Choose partition
  * Find & select `$Temp_Part`
  * Enter password and press `y`
4. Change UUID of `$Temp_Part`
  * `$ sudo e2fsck -f /dev/sdX#`
  * `$ sudo tune2fs /dev/sdX# -U 364595bd-494c-4829-b360-7bd0e96913e4`
5. In `GParted`, resize `$Temp_Part`
  * Select the disk containing the `$Temp_Part`
  * Right-click `$Temp_Part`
  * Select `Resize/Move...`
    - New Size (MiB): 40000
  * Apply all operations
6. In `Clonezilla`, clone `$Temp_Part` to the flash drive
  * `device-device`
  * `Beginner`
  * `part_to_local_part`
  * Find and select `$Temp_Part`
  * Find and select the flash drive ext4 partition
  * Input `y` until clone process starts
7. Boot Ubuntu from the flash drive
8. Update `fstab` on flash drive
  * `$ sudo vim /etc/fstab`
  * Check UUIDs with `sudo blkid`
  * Update all UUIDs in `fstab`

