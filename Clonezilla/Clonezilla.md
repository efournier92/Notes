# [Clonezilla](https://clonezilla.org/)

## Overview
The free and open-source tool available. Built on Linux, it can be installed on a thumb drive to provide a bootable solution for disk cloning, imaging, restoration, and network deployments.

## Tips

### Restore from Image

#### Description
A step-by-step set of instructions to restore a [Clonezilla](https://clonezilla.org/) image you created earlier, via the [Clonezilla](https://clonezilla.org/) bootloader interface. I originally wrote this in case I ever need to talk anyone thru this process over the phone.

#### Steps
1. In the top drawer next to the computer, find the USB flash drive marked `Recovery`
2. Plug the flash drive into the front of the computer
3. Power on the computer, then hold `F12` on the keyboard
4. In the blue & black boot menu, select `SanDisk`
5. Press `Enter` to select _Clonezilla live (Default settings)_
6. Press `Enter` to select _English_
7. Press `Enter` to select _Keep_
8. Press `Enter` to select _start-clonzilla_
9. Press `Enter` to select _device-image_
10. Press `Enter` to select _local-dev_
11. Ensure the `SysBack` drive is selected, then press `Enter` again
12. Ensure the list includes _BUP-Slim-Bk Seagate-BUP-Slim-Bk (1000GB)_
  - Make note of which device it is _/dev/sdb?_
13. Press `Ctrl-C`
14. Select `_sdb1?_ 931.5G-ntfs-SysBack`
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

