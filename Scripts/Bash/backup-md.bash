#!/bin/bash

source_disk=$1

mkdir -p "/mnt/MD0/Audio"
rclone sync "/mnt/$source_disk/Media/Audio" "/mnt/MD0/Audio" --verbose

mkdir -p "/mnt/MD0/Video/Movies"
rclone sync "/mnt/$source_disk/Media/Video/Movies" "/mnt/MD0/Video/Movies" --verbose

mkdir -p "/mnt/MD1/Video/TV"
rclone sync "/mnt/$source_disk/Media/Video/TV" "/mnt/MD1/Video/TV" --verbose


