#!/bin/bash

IN_DIR=$1
OUT_DIR=$2

is_valid_date() {
  date=`echo $1 | cut -f1 -d "."`
  [[ "$date" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}$ ]]
}

play_in_vlc() {
  vlc "$1"
}

cd "$IN_DIR"
echo "InDir: $IN_DIR"
if [[ -z `echo *.WAV` ]]; then
  echo "No WAV Files Found"
  exit
fi

for file in *.WAV; do
  if ! is_valid_date "$file"; then
    while [ -n "$file" ] && ! is_valid_date "$date"; do
      play_in_vlc "$file"
      printf "[yy-mm-dd_##] > "
      read date
      if [ $date == "delete" ]; then
        rm "$file"
        continue
      fi
    done

    mv "$file" "$date.WAV"
  fi
done

txt_dir="$OUT_DIR/TXT"
rm -rf $txt_dir
mkdir -p "$txt_dir"
mp3_dir="$OUT_DIR"
mkdir -p "$mp3_dir"
for file in *.WAV; do
  if is_valid_date "$file"; then
    date=`echo $file | cut -f1 -d "_"`
    echo $date
    txt_file="$txt_dir/$date.txt"

    if [ -f "$txt_file" ]; then
      rm "$txt_file"
    fi

    touch "$txt_file"

    for i in {0..9}; do
      echo "file '$IN_DIR/${date}_0${i}.WAV'" >> "$txt_file"
    done

    mp3_file="$mp3_dir/$date.mp3"

    if [[ $file =~ "_00" ]]; then
      tmux new-window "ffmpeg -f concat -safe 0 -i $txt_file -ac 1 -q:a 15 $mp3_file"
    fi
  fi
done

