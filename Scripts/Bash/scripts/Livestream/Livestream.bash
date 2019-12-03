#!/bin/bash

# crontab
# * */2 * * * bash /home/misigno/scripts/Livestream/Livestream.bash

NowStamp=`date +'%Y-%m-%d-%H'`
MusicDir="/mnt/MD0/Audio/Music"
LivestreamDir="/home/misigno/scripts/Livestream"
PlaylistFile="$LivestreamDir/Playlists/$NowStamp.txt"
InputDevice="/dev/video0"
Resolution="800x600"
FramesPerSecond="5"
IframeInterval="10" # should be double of FramesPerSecond
IframeMinimumInterval="5" # should be equal to FramesPerSecond
Threads="0"
Bitrate="1000k" # constant bitrate (should be between 1000k - 3000k)
QualityPreset="ultrafast"
AudioRate="44100"
StreamRepo="rtmp://live.twitch.tv/app/live_469920893_z2gwahibwBSrT7Jn6abyfZSDhjSt7Z"

killall ffmpeg

rm -rf "$LivestreamDir/Playlists"
mkdir -p "$LivestreamDir/Playlists"
touch "$PlaylistFile"

find "$MusicDir/." -name "*mp3" | sort -R | head -n 240 | while read file; do
  if ! [[ "$file" == *"'"* ]]; then
   echo "file '$file'" >> "$PlaylistFile"
  fi
done

ffmpeg -re -s "$Resolution" -i "$InputDevice" -f flv -r "$FramesPerSecond" \
  -f concat -safe 0 -i "$PlaylistFile" -c:a aac \
  -fflags +igndts -fflags +genpts -copytb 1 \
  -vcodec libx264 -g "$IframeInterval" -keyint_min "$IframeMinimumInterval" \
  -b:v "$Bitrate" -minrate "$Bitrate" -maxrate "$Bitrate" -pix_fmt yuv420p \
  -s "$Resolution" -preset "$QualityPreset" \
  -tune film -acodec libmp3lame -threads "$Threads" -strict normal -tune zerolatency \
  -bufsize "$Bitrate" -t 01:59:57 -f flv "$StreamRepo"

