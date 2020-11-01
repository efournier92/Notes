#!/bin/bash

#----------------
# Name          : video-stream-capture.bash
# Description   : Converts raw video/audio input stream to a video file
# Author        : E Fournier
# Dependencies  : ffmpeg, ffplay
# Arguments     : -v ${input_video_device} -a ${input_audio_device} -t ${output_duration} -s ${output_video_size} -o ${output_file_name}
# Example Usage : bash video-capture.bash -v /dev/video0 -a hw:2,0 -t 04:00:00 -s 640x480 -o output_file
#----------------

## Functions

### Returns output file name
function output_file {
  echo "./${output_file_name}.${output_file_extension}"
}

### Detects available video devices
#### Sets array of devices to a global variable: $available_video_devices
function detect_video_devices {
  available_video_devices=$(ls -d /dev/video*)
}

### Detects available ALSA devices
#### Sets array of devices to a global variable: $available_audio_devices
function detect_audio_devices {
  available_audio_devices="$(ls -d /dev/snd/pcmC*D*c)"
  available_audio_devices="${available_audio_devices//pcmC/hw:}"
  available_audio_devices="${available_audio_devices//c/}"
  available_audio_devices="${available_audio_devices//D/,}"
  available_audio_devices="${available_audio_devices//\/dev\/snd\//}"
}

## Configurtion

### Presets
input_stream_standard="ntsc"
input_video_format="v4l2"
input_audio_format="alsa"
output_file_name=$(date '+%y%m%d%H%M%S')
output_video_size="640x480"
output_video_codec="libx264"
output_format="mpeg"
output_file_extension="mp4"
output_tuning="zerolatency"
output_constant_rate_factor="16"
output_max_threads="512"
output_speed_preset="fast"
output_duration="04:00:00"

### Evaluate supplied argiments to override presets
while getopts ":n:v:a:t:s:" OPTION
do
  case $OPTION in
    v)
      #### Video input device agrument
      input_video_device=$OPTARG
      ;;
    a)
      #### Audio input device agrument
      input_audio_device=$OPTARG
      ;;
    t)
      #### Maximum output duration argument
      output_duration=$OPTARG
      ;;
    s)
      #### Output video dimensions argument
      output_video_size=$OPTARG
      ;;
    o)
      #### Output file name agrument
      output_file_name=$OPTARG
      ;;
  esac
done

### Ensure required arguments are valid

#### Video input device
detect_video_devices
if [[ -z "${input_video_device}" || ! "${available_video_devices}" =~ "${input_video_device}" ]]; then
  echo -e "------\nSELECT VIDEO DEVICE\n------"
  select input_video_device in "${available_video_devices}"; do
    break
  done
fi

#### Audio input device
detect_audio_devices
if [[ -z "${input_audio_device}" || ! "${available_audio_devices}" =~ "${input_audio_device}" ]]; then
  echo -e "------\nSELECT AUDIO DEVICE\n------"
  select input_audio_device in ${available_audio_devices}; do
    break
  done
fi

## Print debugging info
echo "-------------------------"
echo "Video Input Device      : ${input_video_device}"
echo "Audio Input Device      : ${input_audio_device}"
echo "Max Duration            : ${output_duration}"
echo "Output File Name        : ${output_file_name}"
echo "Output Maximum Duration : ${output_duration}"
echo "Output Video Dimensions : ${output_video_size}"
echo "Output File Location    : $(output_file)"
echo "-------------------------"

## Capture video from input stream

echo "Writing output as `output_file`"

### Begin capture process using FFmpeg
ffmpeg \
  -standard "${input_stream_standard}" \
  -f "${input_video_format}" -video_size "${output_video_size}" -thread_queue_size "${output_max_threads}" \
  -i "${input_video_device}" \
  -f "${input_audio_format}" -thread_queue_size "${output_max_threads}" -i "${input_audio_device}" \
  -c:v "${output_video_codec}" -tune "${output_tuning}" -preset "${output_speed_preset}" -crf "${output_constant_rate_factor}" \
  -t "${output_duration}" -f "${output_format}" - | \
  ffmpeg -i - -c copy `output_file` \
    -c copy -f s32le pipe:play | \
    ffplay -i pipe:play -nodisp

