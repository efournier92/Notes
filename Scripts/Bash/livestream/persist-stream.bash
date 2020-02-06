#!/bin/bash

this_process_start_time=0
fails_in_10_minutes=0
max_stream_hours="4"
max_stream_seconds=$((max_stream_hours * 60 * 60))

function kill_ffmpeg {
  killall ffmpeg
  sleep 1
}

kill_ffmpeg

while true; do
  now_time=`date +%s`
  seconds_since_last_stream=$((now_time - this_process_start_time))

  if ! pgrep "ffmpeg" || [ "$seconds_since_last_stream" -gt "$max_stream_seconds" ] ; then
    kill_ffmpeg
    sleep 1
    this_process_start_time=`date +%s`

    if [[ "$fails_in_10_minutes" -lt 3 ]]; then
      bash /home/misigno/scripts/livestream/livestream.bash advanced &

    else
      bash /home/misigno/scripts/livestream/livestream.bash &

    fi

    if [[ "$seconds_since_last_stream" -lt 600 ]]; then
      fails_in_10_minutes=$((fails_in_10_minutes + 1))

    else
      fails_in_10_minutes=0

    fi

  fi

  sleep 60
done

