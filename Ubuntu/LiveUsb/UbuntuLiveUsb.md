# Ubuntu Live USB Creation

1. In `GParted`:
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
2. Copy 
