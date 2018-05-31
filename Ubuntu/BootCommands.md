# Ubuntu Boot Commands

## Kernel

### Echo System Kernel
```bash
uname -r
```

## `grub2`

### Update `grub2`
```bash
sudo update-grub
```

### Edit Grub Defaults
```bash
sudo vim /etc/default/grub
sudo update-grub
```

### Edit Grub Config
```bash
sudo vim /boot/grub/grub.cfg
```

## `initramfs`

### Fix `resume` Slow Boot
```bash
sudo vim /etc/initramfs-tools/conf.d/resume
sudo update-initramfs -u
```

