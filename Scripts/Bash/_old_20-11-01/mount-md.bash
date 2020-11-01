#!/bin/bash

md_uid="$1"
action="$2"

if [[ -z "$md_uid" || -z "$action" ]]; then
  echo "USAGE: mount-md.bash $md_uid $action[m or d]"
  exit
fi

# Mount
if [[ "$action" == "m" ]]; then
  veracrypt --mount "/dev/disk/by-partuuid/$md_uid" "/mnt/md" --slot=20
fi

# Unmount
if [[ "$action" == "u" ]]; then
  veracrypt -t -d "/dev/disk/by-partuuid/$md_uid"
fi

