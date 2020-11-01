#!/bin/zsh

#----------------
# Name          : drives.zsh
# Description   : Aliases for drive operations
# Author        : E Fournier
# Dependencies  : zsh
#----------------

## Configuration
uuid_bnk="316fb91f-e238-4dce-b610-f7dfe74d8eec"
uuid_extA="082f97de-0589-46f9-99d3-850791eddfb3"
uuid_extB="8270e3db-a812-476c-b2bc-ef2bdb50e9e8"
uuid_extC="b790dcd2-3998-4f51-9365-397149e38f97"
uuid_bkA="9ecb85bd-62f3-4f24-9801-8b3c2839903d"
uuid_bkB="d416cfe4-9b86-42da-9c33-4b3814a164de"
uuid_bkC="e6210770-ba18-4162-9be5-cbc647e229ce"
uuid_md="42e96f42-a1df-4606-9c10-ee746a9e2f66"

## Mountpoints

### /mnt/rc

#### Mount
alias m_rc="mount /dev/disk/by-uuuid/0000-006F"

#### Unmount
alias m_rc!="umount /mnt/rc"

### /mnt/bnk

#### Mount
alias m_bnk="$HOME/scripts/mount_uuid_veracrypt $uuid_bnk /mnt/bnk 33"

#### Unmount
alias m_bnk!="$HOME/scripts/umount_uuid_veracrypt $uuid_bnk"

### /mnt/extA

#### Mount
alias m_extA="$HOME/scripts/mount_uuid_veracrypt $uuid_extA /mnt/extA 8"

#### Unmount
alias m_extA!="$HOME/scripts/umount_uuid_veracrypt $uuid_extA"

### /mnt/extB

#### Mount
alias m_extB="$HOME/scripts/mount_uuid_veracrypt $uuid_extB /mnt/extB 12"

#### Unmount
alias m_extB!="$HOME/scripts/umount_uuid_veracrypt $uuid_extB"

### /mnt/extC

#### Mount
alias m_extC="$HOME/scripts/mount_uuid_veracrypt $uuid_extC /mnt/extC 16"

#### Unmount
alias m_extC!="$HOME/scripts/umount_uuid_veracrypt $uuid_extC"

### /mnt/bkA

#### Mount
alias m_bkA="$HOME/scripts/mount_uuid $uuid_bkA /mnt/bkA"

#### Unmount
alias m_bkA!="$HOME/scripts/umount_uuid $uuid_bkA"

### /mnt/bkB

#### Mount
alias m_bkB="$HOME/scripts/mount_uuid $uuid_bkB /mnt/bkB"

#### Unmount
alias m_bkB!="$HOME/scripts/umount_uuid $uuid_bkB"

### /mnt/bkC

#### Mount
alias m_bkC="$HOME/scripts/mount_uuid $uuid_bkC /mnt/bkC"

#### Umount
alias m_bkC!="$HOME/scripts/umount_uuid $uuid_bkC"

### /mnt/md

#### Mount
alias m_md="$HOME/scripts/mount_uuid_veracrypt $uuid_md /mnt/md 16"

#### Unmount
alias m_md!="$HOME/scripts/umount_uuid_veracrypt $uuid_md"

## Backups

### Create a zip backup of snc directory
alias bk_snc=". $HOME/scripts/backup_snc /mnt/extA"

### Create a zip backup of lg directory
alias bk_lg=". $HOME/scripts/backup_lg /mnt/extA"

### Backup extA to extB
alias bk_extAB="$HOME/scripts/backup_drive /mnt/extA /mnt/extB"

### Backup extA to extC
alias bk_extAC="$HOME/scripts/backup_drive /mnt/extA /mnt/extC"

### Backup extB to extC
alias bk_extBC="$HOME/scripts/backup_drive /mnt/extB /mnt/extC"

### Backup extA to MD
alias bk_extAMD="$HOME/scripts/backup_drive /mnt/extA/Media /mnt/md"

### Backup extB to MD
alias bk_extBMD="$HOME/scripts/backup_drive /mnt/extB/Media /mnt/md"

### Backup bkA to bkB
alias bk_bkAB="$HOME/scripts/backup_drive /mnt/bkA /mnt/bkB"

### Backup bkA to bkC
alias bk_bkAC="$HOME/scripts/backup_drive /mnt/bkA /mnt/bkC"

### Backup bkB to bkC
alias bk_bkBC="$HOME/scripts/backup_drive /mnt/bkB /mnt/bkC"

