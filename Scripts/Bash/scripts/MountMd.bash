#!/bin/bash

action="$1"
UID_MD0="1c9472df-621b-488f-8480-65eae855ae09"
UID_MD1="7153776b-b3aa-4607-b40c-b774d2203ed6"
jj
if [ $action == 'm' ]; then
  veracrypt --mount "/dev/disk/by-partuuid/$UID_MD0" "/mnt/MD0" --slot=20
  veracrypt --mount "/dev/disk/by-partuuid/$UID_MD1" "/mnt/MD1" --slot=21
fi

if [ $action == 'u' ]; then
  veracrypt -t -d "/dev/disk/by-partuuid/$UID_MD0"
  veracrypt -t -d "/dev/disk/by-partuuid/$UID_MD1"
fi

