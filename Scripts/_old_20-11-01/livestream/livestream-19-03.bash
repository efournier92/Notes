#!/bin/bash

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
  -f concat -safe 0 -i $ConcatFile -c:a aac \
  -fflags +igndts -fflags +genpts -copytb 1 \
  -c:v libx264 -preset veryfast -pix_fmt yuv420p -threads 0 -tune zerolatency -g 60 \
  -t 00:59:58 \
  -f flv "rtmp://live.twitch.tv/app/live_422375864_tssyAl45ZdXrUcfHuoEnCte2QO0VLe"

