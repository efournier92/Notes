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

#### Base
export RC="/mnt/rc"

#### Mount
alias rc="mount /dev/disk/by-uuid/0000-006F"

#### Unmount
alias rc!="umount $RC"

#### Remove WAV files
alias rcrm="rm $RC"

#### Remove WAV files
alias rcls="ls $RC"

### /mnt/bnk

#### Base
export BNK="/mnt/bnk"

#### Mount
alias bnk=". $HSCRIPTS/mount_uuid_veracrypt $uuid_bnk $BNK 33"

#### Unmount
alias bnk!=". $HSCRIPTS/umount_uuid_veracrypt $uuid_bnk"

### /mnt/extA

#### Base
export EXTA="/mnt/extA"

#### Mount
alias extA="$HSCRIPTS/mount_uuid_veracrypt $uuid_extA $EXTA 8"

#### Unmount
alias extA!="$HSCRIPTS/umount_uuid_veracrypt $uuid_extA"

### /mnt/extB

#### Base
export EXTB="/mnt/extB"

#### Mount
alias extB=". $HSCRIPTS/mount_uuid_veracrypt $uuid_extB $EXTB 12"

#### Unmount
alias extB!=". $HSCRIPTS/umount_uuid_veracrypt $uuid_extB"

### /mnt/extC

#### Base
export EXTC="/mnt/extC"

#### Mount
alias extC=". $HSCRIPTS/mount_uuid_veracrypt $uuid_extC $EXTC 16"

#### Unmount
alias extC!=". $HSCRIPTS/umount_uuid_veracrypt $uuid_extC"

### /mnt/bkA

#### Base
export BKA="/mnt/bkA"

#### Mount
alias bkA=". $HSCRIPTS/mount_uuid $uuid_bkA $BKA"

#### Unmount
alias bkA!=". $HSCRIPTS/umount_uuid $uuid_bkA"

### /mnt/bkB

#### Base
export BKB="/mnt/bkB"

#### Mount
alias bkB=". $HSCRIPTS/mount_uuid $uuid_bkB $BKB"

#### Unmount
alias bkB!=". $HSCRIPTS/umount_uuid $uuid_bkB"

### /mnt/bkC

#### Base
export BKC="/mnt/bkC"

#### Mount
alias bkC=". $HSCRIPTS/mount_uuid $uuid_bkC $BKC"

#### Umount
alias bkC!=". $HSCRIPTS/umount_uuid $uuid_bkC"

### /mnt/md

#### Base
export MD="/mnt/md"

#### Mount
alias md=". $HSCRIPTS/mount_uuid_veracrypt $uuid_md $MD 16"

#### Unmount
alias md!=". $HSCRIPTS/umount_uuid_veracrypt $uuid_md"

## Backups

### Create a zip backup of snc directory
alias bk_snc=". $HSCRIPTS/backup_snc $EXTA"

### Create a zip backup of lg directory
alias bk_lg=". $HSCRIPTS/backup_lg $EXTA"

### Backup extA to extB
alias bk_extAB=". $HSCRIPTS/backup_dir $EXTA $EXTB"

### Backup extA to extC
alias bk_extAC=". $HSCRIPTS/backup_dir $EXTA $EXTC"

### Backup extB to extC
alias bk_extBC=". $HSCRIPTS/backup_dir $EXTB $EXTC"

### Backup extA to MD
alias bk_extAMD=". $HSCRIPTS/backup_dir $EXTA/Media $MD"

### Backup extB to MD
alias bk_extBMD=". $HSCRIPTS/backup_dir $EXTB/Media $MD"

### Backup bkA to bkB
alias bk_bkAB=". $HSCRIPTS/backup_dir $BKA $BKB"

### Backup bkA to bkC
alias bk_bkAC=". $HSCRIPTS/backup_dir $BKA $BKC"

### Backup bkB to bkC
alias bk_bkBC=". $HSCRIPTS/backup_dir $BKB $BKC"

