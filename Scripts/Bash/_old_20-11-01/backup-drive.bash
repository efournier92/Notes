#!/bin/zsh

source_drive="/mnt/$1"
destination_drive="/mnt/$2"

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Must Supply 2 Drive Names"
    exit 1
fi

should_backup() {
  if ls -1qA "$source_drive" | grep -q . && ls -1qA "$destination_drive" | grep -q .
  then
    true
  else
    false
  fi
}

if should_backup; then
  rclone sync "$source_drive" "$destination_drive" --verbose
  echo " --------------------------"
  echo " DELETING EMPTY DIRECTORIES"
  echo " --------------------------"
  find "$source_drive" -empty -type d -print -delete
  find "$destination_drive" -empty -type d -print -delete
fi

