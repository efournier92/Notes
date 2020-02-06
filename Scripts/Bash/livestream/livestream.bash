#!/bin/bash

mode="$1"
now_stamp=`date +'%Y-%m-%d-%H'`
music_dir="/mnt/MD0/Audio/Music"
livestream_dir="/home/misigno/scripts/livestream"
playlist_file="$livestream_dir/Playlists/$now_stamp.txt"
playlist_total_songs="200"
input_device_main="/dev/video1"
input_device_sub="/dev/video0"
input_main_resolution="960:540"
resolution="1280x720"
output_resolution="1600x900"
frames_per_second="5"
iframe_interval="10" # should be double of frames_per_second
iframe_minimum_interval="5" # should be equal to frames_per_second
threads="0"
bitrate="1000k" # constant bitrate (should be between 1000k - 3000k)
quality_preset="ultrafast"
audio_rate="44100"
thread_queue_max="512"
stream_server="live-iad03"
stream_base_url="rtmp://${stream_server}.twitch.tv/app/"
stream_repo="live_469920893_ZqDiWkgqq25jIsIgG23jEUjzY90wlI"
stream_url="${stream_base_url}${stream_repo}"


if [[ "$mode" = 'advanced' ]]; then
  rm -rf "$livestream_dir/Playlists"
  mkdir -p "$livestream_dir/Playlists"
  touch "$playlist_file"

  find "$music_dir" -name "*mp3" | sort -R | head -n $playlist_total_songs | while read file; do
    if ! [[ "$file" == *"'"* ]]; then
      echo "file '$file'" >> "$playlist_file"
    fi
  done
\
  ffmpeg -re \
  -s "$input_main_resolution" -thread_queue_size "$thread_queue_max" -i "$input_device_main" \
  -thread_queue_size "$thread_queue_max" -i "$input_device_sub" \
  -fflags +igndts -fflags +genpts -copytb 1 \
  -f concat -safe 0 -i "$playlist_file" -c:a aac \
  -vcodec libx264 -g "$iframe_interval" -keyint_min "$iframe_minimum_interval" \
  -b:v "$bitrate" -minrate "$bitrate" -maxrate "$bitrate" -pix_fmt yuv420p \
  -preset "$quality_preset" \
  -acodec libmp3lame -threads "$threads" -strict normal -tune zerolatency \
  -filter_complex '[0:v]scale=ih*16/9:-1,boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[0:v]crop=700:540:260:0[cropped];[bg][cropped]overlay=0:(H-h)/2,crop=h=iw*9/16[withbg];[1:v]scale=iw/1.6:ih/1.6[pip];[withbg][pip]overlay=main_w-overlay_w-0:(H-h)/2[vid]' -map [vid] -map 2:0 \
  -bufsize "$bitrate" -f flv "$stream_url"

else
  ffmpeg -re \
    -s "$input_main_resolution" -thread_queue_size "$thread_queue_max" -i "$input_device_main" \
    -f concat -safe 0 -i "$playlist_file" -c:a aac \
    -fflags +igndts -fflags +genpts -copytb 1 \
    -vcodec libx264 -g "$iframe_interval" -keyint_min "$iframe_minimum_interval" \
    -b:v "$bitrate" -minrate "$bitrate" -maxrate "$bitrate" -pix_fmt yuv420p \
    -preset "$quality_preset" \
    -threads "$threads" -strict normal -tune zerolatency \
    -bufsize "$bitrate" -f flv "$stream_url"
fi

