# Ubuntu Live USB Creation

## To a Larger Partition
1. In `GParted`, prepare the flash drive
  * Select the flash drive
  * In the menu, select `Device`, then `Create Partition Table...`
  * Select `msdos`, then click `Apply`
  * Create 1st Partition
    - Label: ESP
    - Size: 100MiB
    - File System: fat32
  * Create 2nd Partition
    - Label: SWP
    - Size: 7500MiB
    - File System: linux-swp
  * Create 3rd Partition
    - Label: LNX
    - Size: [Remaining Space]
    - File System: ext4
  * Apply all operations
2. Install `grub2` on the flash drive
  * Boot into an Ubuntu Live USB
  * Launch terminal
  * `$ sudo su`
  * `$ mkdir /mnt/USB && mount /dev/sdx1 /mnt/USB`
  * `$ grub-install --force --removable --boot-directory=/mnt/USB/boot /dev/sdx`
3. In `MC`, copy files to ESP
  * See [Github repo directory](https://github.com/efournier92/configs/tree/master/Ubuntu/LiveUsb/ESP) contents to ESP
  * Copy `grub.cnf` to `/boot/grub/` directory
  * Copy `efi` directory to ESP root
4. Change UUID of `$Temp_Part`
  * `$ sudo e2fsck -f /dev/sdX#`
  * `$ sudo tune2fs /dev/sdX# -U 364595bd-494c-4829-b360-7bd0e96913e4`
5. In `Clonezilla`, clone `$Temp_Part` to the flash drive
  * `device-device`
  * `Beginner`
  * `part_to_local_part`
  * Find and select `$Temp_Part`
  * Find and select the flash drive ext4 partition
  * Input `y` until clone process starts
6. Boot Ubuntu from the flash drive
7. Update `fstab` on flash drive
  * `$ sudo vim /etc/fstab`
  * Check UUIDs with `sudo blkid`
  * Update all UUIDs in `fstab`

## To a Smaller Partition
1. In `GParted`, prepare the flash drive
  * Select the flash drive
  * In the menu, select `Device`, then `Create Partition Table...`
  * Select `msdos`, then click `Apply`
  * Create 1st Partition
    - Label: ESP
    - Size: 100MiB
    - File System: fat32
  * Create 2nd Partition
    - Label: SWP
    - Size: 7500MiB
    - File System: linux-swp
  * Create 3rd Partition
    - Label: LNX
    - Size: [Remaining Space]
    - File System: ext4
  * Apply all operations
2. Install `grub2` on the flash drive
  * Boot into an Ubuntu Live USB
  * Launch terminal
  * `$ sudo su`
  * `$ mkdir /mnt/USB && mount /dev/sdx1 /mnt/USB`
  * `$ grub-install --force --removable --boot-directory=/mnt/USB/boot /dev/sdx`
3. In `MC`, copy files to ESP
  * See [Github repo directory](https://github.com/efournier92/configs/tree/master/Ubuntu/LiveUsb/ESP) contents to ESP
  * Copy `grub.cnf` to `/boot/grub/` directory
  * Copy `efi` directory to ESP root
4. In `Clonezilla`, clone the system image to `$Temp_Part` for shrinking
  * `device-image`
  * `local_dev`
  * Find & select system image partition
  * `Beginner`
  * `restoreparts`
  * Choose image file
  * Choose partition
  * Find & select `$Temp_Part`
  * Enter password and press `y`
5. Change UUID of `$Temp_Part`
  * `$ sudo e2fsck -f /dev/sdX#`
  * `$ sudo tune2fs /dev/sdX# -U 364595bd-494c-4829-b360-7bd0e96913e4`
6. In `GParted`, resize `$Temp_Part`
  * Select the disk containing the `$Temp_Part`
  * Right-click `$Temp_Part`
  * Select `Resize/Move...`
    - New Size (MiB): 40000
  * Apply all operations
7. In `Clonezilla`, clone `$Temp_Part` to the flash drive
  * `device-device`
  * `Beginner`
  * `part_to_local_part`
  * Find and select `$Temp_Part`
  * Find and select the flash drive ext4 partition
  * Input `y` until clone process starts
8. Boot Ubuntu from the flash drive
9. Update `fstab` on flash drive
  * `$ sudo vim /etc/fstab`
  * Check UUIDs with `sudo blkid`
  * Update all UUIDs in `fstab`

