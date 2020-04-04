#!/bin/bash

backup_drive="$1"
date_stamp=`date +'%Y-%m-%d'`
zip_location="/mnt/$backup_drive/SysBk/Sync/$date_stamp.zip"
sync_dir="/mnt/bnk/snc"
trash_dir="$sync_dir/.trash"

# Delete preexisiting zip, if one exists
rm -rf "$zip_location"

# Zip the sync directory
zip -r --exclude=*Books* "$zip_location" "$sync_dir"

# Clean trash folder
rm -rf "$trash_dir"

