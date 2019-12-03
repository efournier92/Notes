#!/bin/bash

SourceDisk=$1

mkdir -p "/mnt/MD0/Audio"
rclone sync "/mnt/$SourceDisk/Media/Audio" "/mnt/MD0/Audio" --verbose

mkdir -p "/mnt/MD0/Video/Movies"
rclone sync "/mnt/$SourceDisk/Media/Video/Movies" "/mnt/MD0/Video/Movies" --verbose

mkdir -p "/mnt/MD1/Video/TV"
rclone sync "/mnt/$SourceDisk/Media/Video/TV" "/mnt/MD1/Video/TV" --verbose


