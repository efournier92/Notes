# Ubuntu Boot Config

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

### Edit
```bash
sudo vim /etc/default/grub
sudo mc /boot/grub/
sudo mc /boot/grub/grub.cfg
```

## `initramfs`
```bash
sudo vim /etc/initramfs-tools/conf.d/resume
sudo update-initramfs -u
```
