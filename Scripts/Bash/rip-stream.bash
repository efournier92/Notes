#!/bin/bash

in_stream="$1"
out_dir="$2"
out_name="$3"

[[ -z "$in_stream" || -z "$out_dir" || -z "$out_name" ]] && echo "NO!" && exit

cd "$output_dir"

function out_file {
  echo "$out_dir/$out_name"
}


until [[ ! -f `$out_file` ]]; do
  if [[ "$out_name" == 'overwrite' ]]; then
    break
  fi
  echo "File Exists"
  printf "New Name or 'overwrite': "
  read out_name
done

in_format="v4l2"
out_video_codec="libx264"
out_audio_codec="flac"
out_format="mpegts"
out_format_ext="ts"
out_standard="ntsc-dvd"
out_tune="film"
out_crf="0"
out_time="02:30:00"
# ffmpeg -f v4l2 -i "$in_stream" \ 
#   -target "$out_standard" -tune "$out_tune" \ 
#   -crf "$out_crf" -f "$out_format" - | \
#     ffmpeg -f "$output_format" -i - -c:v "$out_video_codec" -crf "$out_crf" -t "$out_time" \
#     -tune "$out_tune" -f "$output_format" "${out_name}${out_format_ext}" \
#       # -c:v copy -f "$output_format" pipe:play | ffplay -i pipe:play
ffmpeg \
  -f alsa -i hw:2,0 -c:a flac \
  -f "$in_format" -i "$in_stream" -target "$out_standard" \
  -tune "$out_tune" -crf 0 -f "$out_format" - | \
    ffmpeg -f "$out_format" -i - -c:v "$out_video_codec" -target ntsc-dvd -tune film -crf 0 -t 02:20:00 -f mpegts play_output_00.ts -c:v copy -f mpegts pipe:play | ffplay -i pipe:play

