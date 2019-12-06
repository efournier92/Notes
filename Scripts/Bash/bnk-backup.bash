#!/bin/bash

backup_drive=$1

date_stamp=`date +'%Y-%m-%d'`
zip -r "/mnt/$backup_drive/SysBk/Sync/$date_stamp.zip" "/mnt/BNK/Sync"

