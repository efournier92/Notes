#!/bin/bash

backup_drive="$1"
working_dir=`pwd`
date_stamp=`date +'%Y-%m-%d'`
zip_location="/mnt/$backup_drive/Snc/$date_stamp.zip"
sync_dir="/mnt/bnk"
trash_dir="$sync_dir/snc/.trash"

# Navigate to sync directory
cd "$sync_dir"

# Delete preexisiting zip, if one exists
rm -rf "$zip_location"

# Zip the sync directory
zip -r "$zip_location" "snc"

# Clean trash directory
rm -rf "$trash_dir"

# Navigate back to original directory
cd "$working_dir"

# Load alias files
shopt -s expand_aliases
for file in ~/.zsh/aliases/*.zsh; do
  source "$file"
done

# Backup log directory
bk_lg

