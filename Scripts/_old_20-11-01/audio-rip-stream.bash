#!/bin/bash

# DEFAULTS
# out_dir="$1"
# out_name="$2"
# max_threads="512"
# in_vid_stream="/dev/video0"
# in_aud_stream="hw:2,0"
# in_vid_format="v4l2"
# in_aud_format="alsa"
# out_vid_codec="libx264"
# out_format="mpeg"
# out_format_ext="mp4"
# out_tune="zerolatency"
# out_crf="16"
# out_max_duration="04:00:00"
# out_video_size="640x480"
# out_preset="fast"

out_dir="$1"
out_name="$2"
max_threads="512"
in_vid_stream="/dev/video0"
in_aud_stream="hw:2,0"
in_vid_format="v4l2"
in_aud_format="alsa"
out_vid_codec="libx264"
out_format="mpeg"
out_format_ext="mp4"
out_tune="zerolatency"
out_crf="16"
out_max_duration="04:00:00"
out_video_size="640x480"
out_preset="fast"

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

ffmpeg \
  -f "$in_vid_format" -video_size "$out_video_size" -thread_queue_size "$max_threads" \
  -i "$in_vid_stream" \
  -f "$in_aud_format" -thread_queue_size "$max_threads" -i "$in_aud_stream" \
  -c:v "$out_vid_codec" -tune "$out_tune" -preset "$out_preset" -crf "$out_crf" \
  -t "$out_max_duration" -f "$out_format" - | \
  ffmpeg -i - -c copy `out_file` \
    -c copy -f s32le pipe:play | \
      ffplay -i pipe:play -nodisp

