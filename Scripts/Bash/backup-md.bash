#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Must Supply Source Disk"
  exit 1
fi

should_backup() {
  [[ ls -1qA "$source_drive" | grep -q . && ls -1qA "$destination_drive" | grep -q . ]]
}

source_disk="$1"
md0_disk="/mnt/MD0"
md1_disk="/mnt/MD1"
audio_dir="$md0_disk/Audio"
movies_dir="$md1_disk/Video/Movies"
tv_dir="$md1_disk/Video/TV"

if should_backup; then
  mkdir -p "$audio_dir"
  rclone sync "/mnt/$source_disk/Media/Audio" "$audio_dir" --verbose

  mkdir -p "$movies_dir"
  rclone sync "/mnt/$source_disk/Media/Video/Movies" "$movies_dir" --verbose

  mkdir -p "$tv_dir"
  rclone sync "/mnt/$source_disk/Media/Video/TV" "$tv_dir" --verbose

  echo " --------------------------"
  echo " DELETING EMPTY DIRECTORIES"
  echo " --------------------------"
  pkexec find "$source_disk" -empty -type d -print -delete
  pkexec find "$md0_disk" -empty -type d -print -delete
  pkexec find "$md1_disk" -empty -type d -print -delete
fi

