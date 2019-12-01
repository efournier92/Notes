#!/bin/bash

# crontab
# 0 * * * * bash /home/misigno/.livestream/livestream.sh

NowTimestamp=`date +'%Y-%m-%d-%H'`
LivestreamDir="/home/misigno/.livestream"
# MusicDir="/mnt/MD/Audio/Music"
MusicDir="/media/veracrypt1/Audio/Music"
ConcatFile="$LivestreamDir/Playlists/$NowTimestamp.txt"

killall ffmpeg

mkdir -p "$LivestreamDir/Playlists"
mkdir -p "$LivestreamDir/Logs"
rm -f "$ConcatFile"

find $MusicDir/. -name "*mp3" | sort -R | head -n 240 | while read file; do
  if ! [[ $file == *"'"* ]]; then
   echo "file '$file'" >> $ConcatFile
  fi
done

RES_IN="800x600" # input resolution
RES_OUT="800x600" # output resolution
FPS="5" # target FPS
GOP="10" # i-frame interval, should be double of FPS, 
GOPMIN="5" # min i-frame interval, should be equal to fps, 
THREADS="0"
CBR="1000k" # constant bitrate (should be between 1000k - 3000k)
QUALITY="ultrafast"
AUDIO_RATE="44100"
STREAM_KEY="rtmp://live.twitch.tv/app/live_469920893_z2gwahibwBSrT7Jn6abyfZSDhjSt7Z"

ffmpeg -re -s "$RES_IN" -i /dev/video0 -f flv \
  -f concat -safe 0 -i $ConcatFile -c:a aac \
  -fflags +igndts -fflags +genpts -copytb 1 \
  -vcodec libx264 -g $GOP -keyint_min $GOPMIN \
  -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p \
  -s "$RES_OUT" -preset $QUALITY \
  -tune film -acodec libmp3lame -threads $THREADS -strict normal -tune zerolatency \
  -bufsize $CBR -t 03:59:57 -f flv "$STREAM_KEY"

# ffmpeg -i /dev/video1 \
  #   -f concat -safe 0 -i $ConcatFile -c:a aac \
  #   -fflags +igndts -fflags +genpts -copytb 1 \
  #   -c:v libx264 -preset ultrafast -vf scale=-1:720 -pix_fmt yuv420p -threads 0 -tune zerolatency \
  #   -t 07:59:57 \
  #   -f flv "rtmp://live.twitch.tv/app/live_469920893_z2gwahibwBSrT7Jn6abyfZSDhjSt7Z"

