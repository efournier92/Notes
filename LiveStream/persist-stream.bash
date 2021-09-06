#!/bin/bash

ffmpeg_id=32768
this_process_start_time=0
fails_in_10_minutes=0
while true; do
  now_time=`date +%s`
  seconds_since_last_stream=$((now_time-this_process_start_time))
  echo "Stream Live for $seconds_since_last_stream Seconds"

  if ! ps -p "$ffmpeg_id" > /dev/null; then
    last_process_start_time="$this_process_start_time"
    this_process_start_time=`date +%s`
    seconds_since_last_stream=$((this_process_start_time-last_process_start_time))

    if [[ "$fails_in_10_minutes" -lt 3 || "$seconds_since_last_stream" -gt 14400 ]]; then
      kill  "$ffmpeg_id"
      nohup bash /home/misigno/scripts/livestream/livestream.bash advanced &>/dev/null &
      ffmpeg_id="$!"

    else
      kill "$ffmpeg_id"
      nohup bash /home/misigno/scripts/livestream/livestream.bash &>/dev/null &
      ffmpeg_id="$!"
    fi

    if [[ "$seconds_since_last_stream" -lt 600 ]]; then
      fails_in_10_minutes=$((fails_in_10_minutes+1))

    else
      fails_in_10_minutes=0
    fi
  fi
  sleep 1 
done

