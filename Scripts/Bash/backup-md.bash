#!/bin/bash

if [ -z "$1" ]; then
  echo "Must Supply Source Disk"
  exit 1
fi


source_disk="/mnt/$1"
md0_disk="/mnt/MD0"
md1_disk="/mnt/MD1"
audio_dir="$md0_disk/Audio"
movies_dir="$md0_disk/Video/Movies"
tv_dir="$md1_disk/Video/TV"

should_backup() {
  if ls -1qA "$source_disk" | grep -q . \
    && ls -1qA "$md0_disk" | grep -q . \
    && ls -1qA "$md1_disk" | grep -q .
  then
    true
  else
    false
  fi
}

if should_backup; then
  mkdir -p "$audio_dir"
  rclone sync "$source_disk/Media/Audio" "$audio_dir" --verbose

  mkdir -p "$movies_dir"
  rclone sync "$source_disk/Media/Video/Movies" "$movies_dir" --verbose

  mkdir -p "$tv_dir"
  rclone sync "$source_disk/Media/Video/TV" "$tv_dir" --verbose

  echo " --------------------------"
  echo " DELETING EMPTY DIRECTORIES"
  echo " --------------------------"
  pkexec find "$source_disk" -empty -type d -print -delete
  pkexec find "$md0_disk" -empty -type d -print -delete
  pkexec find "$md1_disk" -empty -type d -print -delete
fi

