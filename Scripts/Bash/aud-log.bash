#!/bin/bash

# AUDIO LOGGER
# Converts .WAV
# Meant to transform voice memos from a raw to a compressed format, for longterm storage

# ^ BEST READ FROM THE BOTTOM UP ^

is_convert_complete=false

while getopts "vi:o:" OPTION
do
  case $OPTION in
    v)
      verbose=true
      echo "VERBOSE OUTPUT ENABLED"
      ;;
    i)
      in_dir=$OPTARG
      ;;
    o)
      out_dir=$OPTARG
      ;;
  esac
done

# Stop execution if either directory is invalid
if [[ ! -d "$in_dir" || -z "$out_dir" ]]; then
  echo "Input and output directories expected (use -i and -o)"
  exit
else
  if [[ $verbose = true ]]; then
    echo "INPUT DIRECTORY: $in_dir"
    echo "OUTPUT DIRECTORY: $out_dir"
  fi
fi

# True if .WAV file is valid
is_valid_file() {
  eval_file=$1
  [[ "$eval_file" = *.WAV ]] && [[ ! "$eval_file" =~ [@#\$%^\&*+] ]]
}

# True if input is of valid date format
is_valid_file_name() {
  eval_file=$1
  file_name="${eval_file##*/}"
  file_name="${file_name%%.*}"
  if [[ "$file_name" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{2}_[0-9]{2}$ ]]; then
    [[ $verbose = true ]] && echo "$file_name IS a valid file"
    true
  else
    [[ $verbose = true ]] && echo "$file_name is NOT a valid file"
    false
  fi
}

# Play input file in VLC
play_in_vlc() {
  eval_file="$1"
  [[ $verbose = true ]] && echo "Opening $eval_file in VLC"
  vlc "$eval_file"
}

# Join files from the same date
join_duplicates() {
  join_dir=`join_dir`
  mkdir -p "$join_dir"
  in_dir="$join_dir"
  [[ $verbose = true ]] && echo "Joining duplicates into `join_dir`"
  name_audio_files
  convert_audio_files
}

function join_dir_has_wavs {
  if ls `join_dir`/*.WAV &>/dev/null &>/dev/null
  then
    true
  else
    false
  fi
}

# Wait for FFmpeg to finish converting before joining files from the same date
wait_for_ffmpeg_to_finish() {
  dir=$1
  [[ $verbose = true ]] && echo "Started waiting for FFmpeg to finish"
  time_spent_waiting=0
  until [[ $is_convert_complete == true || $time_spent_waiting -gt 1000 ]]; do
    sleep 2
    [[ $verbose = true ]] && echo "Spent $time_spent_waiting waiting ofr FFmpeg"
    time_spent_waiting=$((time_spent_waiting + 5))
    ffmpeg_windows=`tmux list-windows | grep -i 'ffmpeg'`
    if [[ $ffmpeg_windows == '' ]]; then
      [[ $verbose = true ]] && echo "FFmpeg conversion complete"
      is_convert_complete=true
      if join_dir_has_wavs; then
        in_dir=`join_dir`
        start_conversion
      fi
    fi
  done
}

# True if input is of valid date format
parse_date() {
  eval_file=$1
  file_name="${eval_file##*/}"
  file_name="${file_name%%.*}"
  file_name="${file_name%%_*}"
  echo "$file_name"
}

rename_file() {
  mp3_file=$1
  [[ $verbose = true ]] && echo "Moving $mp3_file from $in_dir to $join_dir/${date}_00.WAV for joining"
  mv "$mp3_file" "$join_dir/${date}_00.WAV"
  mp3_file="$join_dir/${date}_01.WAV"
}

convert_audio_files() {
  for file_to_convert in $in_dir/*; do
    [[ $file_to_convert = *.WAV ]] || continue
    if ! is_valid_file "$file_to_convert"; then
      [[ $verbose = true ]] && echo "Skipping invalid file $file_to_convert"
      continue
    fi

    echo "CONVERT: $file_to_convert"
    date=`parse_date "$file_to_convert"`
    mp3_file=`mp3_file $date`
    concat_file=`concat_file $date`

    if [[ $verbose = true ]]; then
      echo "CONVERTING WITH FFMPEG"
      echo "Convert File: $file_to_convert"
      echo "Date: $date"
      echo "MP3 File: $mp3_file"
      echo "Concat File: $concat_file"
    fi

    if [[ "$file_to_convert" =~ "_00" ]]; then
      [[ $verbose = true ]] && echo "First File: $file_to_convert"
      if test -f "$mp3_file"; then
        mv "$mp3_file" "`join_dir`/${date}_AA.WAV"
        mp3_file="`join_dir`/${date}_BB.WAV"
      fi

      # Write more than enough filenames to FFmpeg concat file
      file_to_write=`concat_file "$date"`
      clean_concat_file "$file_to_write"
      [[ $verbose = true ]] && echo "Writing concat file $concat_file to $in_dir"
      loops=9
      for (( n = 0; n < $loops; n++ )); do
        echo "file '$in_dir/${date}_0${n}.WAV'" >> "$file_to_write"
      done

      tmux new-window "ffmpeg -f concat -safe 0 -i $concat_file -c:a libmp3lame -ac 1 -q:a 15 $mp3_file"
    fi

  done
  wait_for_ffmpeg_to_finish
  # if [[ $must_join_files == true ]]; then
  # fi
}

clean_concat_file() {
  clean_date=`parse_date "$1"`
  file_to_clean=`concat_file "$clean_date"`
  mkdir -p `concat_dir`
  [[ $verbose = true ]] && echo "Cleaning $file_to_clean in `concat_dir`"
  rm -f "$file_to_clean"
  touch "$file_to_clean"
}

concat_dir() {
  echo "$out_dir/.concat"
}

join_dir() {
  join_dir="$out_dir/.join"
  mkdir -p "$join_dir"
  echo "$join_dir"
}

concat_file() {
  date=`parse_date $1`
  dir=`concat_dir`
  echo "$dir/$date.txt"
}

mp3_file() {
  date="$1"
  echo "$out_dir/$date.mp3"
}

# Rename files based on user input
name_audio_files() {
  for file in $in_dir/*.WAV; do
    if ! is_valid_file "$file"; then
      continue
    fi
    new_file_name="$file"
    has_file_moved=false
    until is_valid_file_name "$new_file_name"; do
      play_in_vlc "$file"
      printf "[yy-mm-dd_##]: "
      read new_file_name
      if [[ "$new_file_name" == "delete" ]]; then
        rm "$file"
        break
      elif is_valid_file_name "$new_file_name"; then
        if [[ "$file" =~ 'join' ]]; then
          wav_dir=$out_dir
        else
          wav_dir=$dir
        fi
        mkdir -p "$out_dir"
        mv "$file" "$in_dir/$new_file_name.WAV"
        break
      fi
    done
  done
}

function ask_to_delete_join_dir {
  [[ ! -d `join_dir` ]] && return 0
  echo "JOIN CONTENTS"
  echo "-------------"
  ls `join_dir`
  until [[ $should_delete_join_dir == "y" || $should_delete_join_dir == "n" ]]; do
  echo "Do you want to delete the join directory? [y/n]: "
  read should_delete_join_dir
    if [[ $should_delete_join_dir = "y" ]]; then
      rm -r `join_dir` 
    else
      return 0
    fi
  done
}

# Kickstart audio conversion process
start_conversion() {
  name_audio_files
  convert_audio_files
}

start_conversion

