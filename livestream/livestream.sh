#!/bin/bash

# crontab
# 0 * * * * bash /home/misigno/.livestream/livestream.sh

NowTimestamp=`date +'%Y-%m-%d-%H'`
LivestreamDir="/home/misigno/.livestream"
MusicDir="/mnt/MD/Audio/Music"
ConcatFile="$LivestreamDir/Playlists/$NowTimestamp.txt"

killall ffmpeg

mkdir -p "$LivestreamDir/Playlists"
mkdir -p "$LivestreamDir/Logs"
rm -f "$ConcatFile"

find $MusicDir/. -name "*mp3" | sort -R | head -n 30 | while read file; do
  if ! [[ $file == *"'"* ]]; then
   echo "file '$file'" >> $ConcatFile
  fi
done

FFREPORT=file="$LivestreamDir/Logs/$NowTimestamp.log":level=24 \
ffmpeg -i /dev/video0 \
  -f concat -safe 0 -i $ConcatFile -c:a libfdk_aac -b:a 64k \
  -fflags +igndts -fflags +genpts -copytb 1 \
  -c:v libx264 -preset veryfast -pix_fmt yuv420p -threads 0 -tune zerolatency -g 60 \
  -t 01:00:00 \
  -f flv "rtmp://live.twitch.tv/app/live_422375864_tssyAl45ZdXrUcfHuoEnCte2QO0VLe"

