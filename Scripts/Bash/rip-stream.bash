#!/bin/bash

out_dir="$1"
out_name="$2"
in_vid_stream="/dev/video0"
in_aud_stream="hw:2,0"
in_format="v4l2"
out_vid_codec="libx264"
out_aud_codec="flac"
out_format="mpegts"
out_format_ext="ts"
out_standard="ntsc-dvd"
out_tune="film"
out_crf="0"
out_time="02:30:00"

# Return out_file location
function out_file {
  echo "$out_dir/${out_name}.${out_format_ext}"
}

while [[ -z "$out_name" ]]; do
  printf "Output File Name: "
  read "out_name"
done

while [[ -z "$out_dir" && ! -d "$out_dir" ]]; do
  printf "Output File Directory: "
  read "out_dir"
done

cd "$out_dir"

while [[ -f `out_file` ]]; do
  last_out_name="$out_name"
  echo "File $out_name already exists..."
  printf "rename || rm: "
  # Get a new name from user
  read "new_out_name"
  if [[ "$new_out_name" =~ "rm" ]]; then
    # If user wants to delete the file
    rm -f `out_file`
    echo "REMOVED `out_file`"
    out_name="$last_out_name"
    break
  else
    # If user chose to rename, test again
    out_name="$new_out_name"
  fi
done

echo "Writing Output to `out_file`"

ffmpeg -f "$in_format" -i "$in_vid_stream" \
  -f alsa -i "$in_aud_stream" \
  -c:v "$out_vid_codec" -crf "$out_crf" -tune "$out_tune" \
  -f "$out_format" - | \
    ffmpeg -i - -c copy `out_file` \
    -c copy -f "$out_format" pipe:play | \
      ffplay -i pipe:play

