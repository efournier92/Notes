# [Clonezilla](https://clonezilla.org/)

## Contents

- [Overview](#overview)
- [Restore from Image](#restore-from-Image)

## Overview

The best free and [open source](https://en.wikipedia.org/wiki/Open_source) tool available, for [disk cloning](https://en.wikipedia.org/wiki/Disk_cloning), and much more. Built on [Linux](https://www.linux.org/), it can be installed on a thumb drive to provide a bootable solution for [disk cloning](https://en.wikipedia.org/wiki/Disk_cloning), [imaging](https://en.wikipedia.org/wiki/Disk_image), restoration, and network deployments.

## Restore from Image

### Description

A step-by-step set of instructions to restore a [Clonezilla](https://clonezilla.org/) image you created earlier, via the [Clonezilla](https://clonezilla.org/) bootloader interface. I originally wrote this in case I ever need to talk anyone thru this process over the phone.

### Steps

1. In the top drawer next to the computer, find the USB flash drive marked `Recovery`
2. Plug the flash drive into the front of the computer
3. Power on the computer, then hold `F12` on the keyboard
4. In the blue & black boot menu, select `SanDisk`
5. Press `Enter` to select *Clonezilla live (Default settings)*
6. Press `Enter` to select *English*
7. Press `Enter` to select *Keep*
8. Press `Enter` to select *start-clonzilla*
9. Press `Enter` to select *device-image*
10. Press `Enter` to select *local-dev*
11. Ensure the `SysBack` drive is selected, then press `Enter` again
12. Ensure the list includes *BUP-Slim-Bk Seagate-BUP-Slim-Bk (1000GB)*
  - Make note of which device it is */dev/sdb?*
13. Press `Ctrl-C`
14. Select `_sdb1?* 931.5G-ntfs-SysBack`
15. Select `System`
16. Select `2018-11-25-15-img-WholeDisk`
17. Press `Enter`
18. Press `Right` twice to select `Done`, the press `Enter`
19. Select `2018-11-25-15-img-WholeDisk`
20. Press `Enter`
21. Press `Enter` to select `Beginner`
22. Select `restoredisk`, then press `Enter`
23. Select `2018-11-25-15-img-WholeDisk`
24. Select `sda 240GB-bitlocaker-PNY-XA900-240GB-SSD`
25. Press `Enter` to select `Yes, check the image before restoring`
26. Select `-p reboot`, then press `Enter`
27. Press `Enter` to restore the disk image

