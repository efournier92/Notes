#!/bin/bash

# AUDIO LOGGER
# Converts WAV

in_dir=$1
out_dir=$2

is_valid_date() {
  date_in=$1 
  date=`echo ${date_in%%.*}`
  [[ "$date" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}$ ]]
}

play_in_vlc() {
  vlc "$1"
}

is_valid_file() {
  file=$1
  echo "$file"
  if [[ "$file" =~ ".WAV" ]] && [[ ! "$file" =~ [@#\$%^\&*+] ]]; then echo "TRUE"; else echo "FALSE"; fi
  [[ "$file" =~ ".WAV" ]] && [[ ! "$file" =~ [@#\$%^\&*+] ]]
}

get_filename_input() {
  always_prompt=$1
  while ! is_valid_date "$date" && [ "$always_prompt" == false ]; do
    play_in_vlc "$file"
    printf "[yy-mm-dd_##]: "
    read date
    if [ "$date" == "delete" ]; then
      rm "$file"
      always_prompt=false
    elif is_valid_date "$date"
      return
    else
      continue
    fi
  done
  echo "$date"
}

name_audio_files() {
  dir=$1
  always_prompt=$2
  for file in $dir/*.WAV; do
    if ! is_valid_file "$file"; then
      return
    fi
    get_filename_input "$always_prompt"
    mv "$file" "$date.WAV"
  done
}

prep_output_dir() {
  mkdir -p "$txt_dir"
  date=`echo ${file%%_*}`
  concat_file="$txt_dir/$date.txt"
  rm -f "$concat_file"
  touch "$concat_file"
}

start_ffmpeg_convert() {
  mp3_file_name="$date.mp3"
  mp3_file_location="$out_dir/$mp3_file_name"
  if [[ "$file" =~ "_00" ]]; then
    if test -f "$mp3_file_location"; then
      mv "$mp3_file_location" "${out_dir}/${date}_00.WAV"
      mp3_file_location="${out_dir}/${date}_01.WAV"
    fi
    tmux new-window "ffmpeg -f concat -safe 0 -i $concat_file -c:a libmp3lame -ac 1 -q:a 15 $mp3_file_location"
  fi
}

create_concat_file() {
  date=$1
  for i in {0..9}; do
    echo "file '$source_dir/${date}_0${i}.WAV'" >> "$concat_file"
  done
}

convert_audio_files() {
  source_dir=$1
  txt_dir="$out_dir/TXT"
  rm -rf "$txt_dir"
  for file in *.WAV; do
    if ! is_valid_file "$file"; then
      return;
    fi
    mkdir -p "$out_dir"
  done
}

join_duplicates() {
  out_dir=$1
  name_audio_files "$out_dir" true
  convert_audio_files "$out_dir"
}

wait_for_ffmpeg_to_finish() {
  dir=$1
  time_spent_waiting=0
  is_convert_complete=false
  until [[ $is_convert_complete == true || $time_spent_waiting -gt 1000 ]]; do
    sleep 5
    time_spent_waiting=$((time_spent_waiting + 5))
    ffmpeg_windows=`tmux list-windows | grep -i 'ffmpeg'`
    if [[ $ffmpeg_windows == '' ]]; then
      join_duplicates "$out_dir"
      is_convert_complete=true
    fi
  done
}

start_conversion() {
  cd "$in_dir"

  if [[ -z `echo *.WAV` ]]; then
    echo "No WAV Files Found"
    exit
  fi

  name_audio_files false
  convert_audio_files "$in_dir"
  wait_for_ffmpeg_to_finish
}

start_conversion

