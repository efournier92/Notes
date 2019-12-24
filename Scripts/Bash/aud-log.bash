#!/bin/bash

# AUDIO LOGGER
# Converts .WAV
# Meant to transform voice memos from a raw to a compressed format, for longterm storage

# ^ BEST READ FROM THE BOTTOM UP ^

in_dir=$1
out_dir=$2
is_convert_complete=false

shopt -s extglob

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
  [[ $verbose = true ]] && echo "INPUT DIRECTORY: $in_dir"
  [[ $verbose = true ]] && echo "OUTPUT DIRECTORY: $out_dir"
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
  mkdir -p `join_dir`
  [[ $verbose = true ]] && echo "Joining duplicates into `join_dir`"
  name_audio_files `join_dir` true
  convert_audio_files `join_dir`
}

# Wait for FFmpeg to finish converting before joining files from the same date
wait_for_ffmpeg_to_finish() {
  dir=$1
  [[ $verbose = true ]] && echo "Started waiting for FFmpeg to finish"
  time_spent_waiting=0
  until [[ $is_convert_complete == true || $time_spent_waiting -gt 1000 ]]; do
    sleep 5
    [[ $verbose = true ]] && echo "Spent $time_spent_waiting waiting ofr FFmpeg"
    time_spent_waiting=$((time_spent_waiting + 5))
    ffmpeg_windows=`tmux list-windows | grep -i 'ffmpeg'`
    if [[ $ffmpeg_windows == '' ]]; then
      [[ $verbose = true ]] && echo "FFmpeg conversion complete"
      is_convert_complete=true
      join_duplicates
    fi
  done
}

# True if input is of valid date format
parse_date() {
  eval_file=$1
  file_name="${eval_file##*/}"
  file_name="${file_name%%.*}"
  file_name="${file_name%%_*}"
  [[ $verbose = true ]] && echo "Parsed file $eval_file to date $file_name"
  echo "$file_name"
}

# Open a new TMUX window and run FFmpeg convert command
convert_file_with_ffmpeg() {
  convert_file="$1"
  date=`parse_date "$convert_file"`
  mp3_file=`mp3_file $date`
  concat_file=`concat_file $date`
  source_dir="$in_dir"

  if [[ $verbose = true ]]; then
    echo "CONVERTING WITH FFMPEG"
    echo "Convert File: $convert_file"
    echo "Date: $date"
    echo "MP3 File: $mp3_file"
    echo "Concat File: $concat_file"
    echo "Source Directory: $source_dir"
  fi

  if [[ "$convert_file" =~ "_00" ]]; then
    [[ $verbose = true ]] && echo "First File: $convert_file"
    if test -f `mp3_file $date`; then
      join_dir=`join_dir`
      source_dir="$join_dir"
      must_join_files=true
      [[ $verbose = true ]] && echo "Moving $mp3_file from $source_dir to $join_dir/${date}_00.WAV for joining"
      mv "$mp3_file" "$join_dir/${date}_00.WAV"
      mp3_file="$join_dir/${date}_01.WAV"
    fi
    if [[ "$must_join_files" == true ]]; then
      join_dir=`join_dir`
      source_dir="$join_dir"
    fi
    write_concat_file "$date" "$source_dir"
    tmux new-window "ffmpeg -f concat -safe 0 -i $concat_file -c:a libmp3lame -ac 1 -q:a 15 $mp3_file"
  fi
}

# 
convert_audio_files() {
  must_join_files=false
  source_dir="$1"
  for convert_file in $source_dir/*; do
    [[ $convert_file = *.WAV ]] || continue
    if ! is_valid_file "$convert_file"; then
      [[ $verbose = true ]] && echo "Skipping invalid file $convert_file"
      continue
    fi
    convert_file_with_ffmpeg "$convert_file"
  done
  if [[ $must_join_files == true ]]; then
    wait_for_ffmpeg_to_finish
  fi
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

# Write more than enough filenames to FFmpeg concat file
write_concat_file() {
  concat_date="$1"
  concat_file_dir="$2"
  file_to_write=`concat_file "$date"`
  clean_concat_file "$file_to_write"
  [[ $verbose = true ]] && echo "Writing concat file $concat_file to $concat_file_dir"
  loops=9
  if [[ "$must_join_files" == true ]]; then
    loops=1
  fi
  for (( n=0; n < $loops; n++)); do
    echo "file '$concat_file_dir/${concat_date}_0${n}.WAV'" >> "$file_to_write"
  done
}

# Collect user input for filename
get_filename_input() {
  in_file="$1"
  dir="$2"
  if ! is_valid_file "$in_file"; then
    return
  fi
  new_file_name="$in_file"
  has_file_moved=false
  i=0
  until [[ "$has_file_moved" == true ]] || [[ $i -gt 10 ]]; do
    if ! is_valid_file_name "$new_file_name" || [[ "$must_join_files" == true ]]; then
      play_in_vlc "$in_file"
      printf "[yy-mm-dd_##]: "
      read new_file_name
      if [ "$new_file_name" == "delete" ]; then
        rm "$in_file"
        has_file_moved=true
        always_prompt=false
      elif is_valid_file_name "$new_file_name"; then
        if [[ "$in_file" =~ 'join' ]]; then
          wav_dir=$out_dir
        else
          wav_dir=$dir
        fi
        break
        mkdir -p "$wav_dir"
        mv "in_file" "$wav_dir/$new_file_name.WAV"
        has_file_moved=true
        always_prompt=false
      fi
    else
      i=$(( i + 1 ))
    fi
  done
}

# Rename files based on user input
name_audio_files() {
  dir=$1
  always_prompt=$2
  for file in $dir/*.WAV; do
    if ! is_valid_file "$file"; then
      continue
    fi
    get_filename_input "$file" "$dir"
  done
}

# Kickstart audio conversion process
start_conversion() {
  name_audio_files "$in_dir" false
  convert_audio_files "$in_dir"
}

start_conversion

