#!/bin/bash

source_drive="/mnt/$1"
md0_drive="/mnt/md0"
md1_drive="/mnt/md1"
audio_dir="$md0_drive/Audio"
movies_dir="$md0_drive/Video/Movies"
tv_dir="$md1_drive/Video/TV"

if [[ -z "$1" ]]; then
  echo "Must Supply Source Disk"
  exit 1
fi

should_backup() {
  [[ $(ls -A "$source_drive") && $(ls -A "$md0_drive") && $(ls -A "$md1_drive") ]]
}

if should_backup; then
  mkdir -p "$audio_dir"
  rclone sync "$source_drive/Media/Audio" "$audio_dir" --verbose

  mkdir -p "$movies_dir"
  rclone sync "$source_drive/Media/Video/Movies" "$movies_dir" --verbose

  mkdir -p "$tv_dir"
  rclone sync "$source_drive/Media/Video/TV" "$tv_dir" --verbose

  echo " --------------------------"
  echo " DELETING EMPTY DIRECTORIES"
  echo " --------------------------"
  find "$source_drive" -empty -type d -print -delete
  find "$md0_drive" -empty -type d -print -delete
  find "$md1_drive" -empty -type d -print -delete
fi

