# Fix APFS Boot with `rEFInd`

## Description

## Commands

### List Disks
```bash
diskutil list
```

### Locate & Mount `Preboot` Parition
```bash
diskutil mount disk1s2
```

### Get Partition GUID
```bash
ls /Volumes/Preboot/
```

### Update `rEFInd` Stanza
```
menuentry OSX {
  icon   /EFI/refind/themes/misigno/icons/os_mac.png
  volume "Preboot"
  loader /{ GUID }/System/Library/CoreServices/boot.efi
}
```

