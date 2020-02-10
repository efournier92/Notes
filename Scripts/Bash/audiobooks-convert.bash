#!/bin/bash

in_dir="$1"
book_name="$2"

shopt -s extglob
shopt -s nocaseglob

if [[ -z "$in_dir" || -z "$book_name" ]]; then
  echo "USAGE: audiobooks-convert.bash in_dir book_name"
  exit
fi

i=1
for file in "$in_dir"/*+(mp3|wav|ogg|flac|aiff|vox); do
  echo $file
  print_num=`printf "%02d" $i`
  chapter_name="Part $print_num.mp3"
  if [ ! -f "${in_dir}/${chapter_name}" ]; then
    mv "$file" "${in_dir}/${chapter_name}"
    i=$((i + 1))
  fi
done

m4b-tool \
  merge "$in_dir" \
  --audio-channels 1 --audio-bitrate 64k \
  --use-filenames-as-chapters --no-chapter-reindexing \
  --jobs=4 --verbose \
  --output-file="$book_name.m4b"

