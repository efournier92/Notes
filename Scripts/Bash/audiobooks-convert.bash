#!/bin/bash

in_dir="$1"

i=1
for file in $in_dir/*.(mp3|WAV|wav|aac); do
  print_num=`printf "%02d" $i`
  out_name="Part $print_num.mp3"
  if [ ! -f "$out_name" ]; then
    mv "$file" "$out_name"; i=$((i+1))
  fi
done

m4b-tool \
  merge "$in_dir" \
  --audio-channels 1 --audio-bitrate 64k \
  --no-chapter-reindexing --use-filenames-as-chapters \
  --jobs=4 --verbose \
  --output-file="The Greatest Show on Earth.m4b"

