#!/bin/bash

SourceDrive="/mnt/$1"
DestinationDrive="/mnt/$2"

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Must Supply 2 Drive Names"
    exit 1
fi

shouldBackUp() {
  if ls -1qA "$SourceDrive" | grep -q . && ls -1qA "$DestinationDrive" | grep -q .
  then
    true
  else
    false
  fi
}

if shouldBackUp; then
  pkexec rclone sync "$SourceDrive" "$DestinationDrive" --verbose
  echo " --------------------------"
  echo " DELETING EMTPY DIRECTORIES"
  echo " --------------------------"
  pkexec find "$SourceDrive" -empty -type d -print -delete
  pkexec find "$DestinationDrive" -empty -type d -print -delete
fi

