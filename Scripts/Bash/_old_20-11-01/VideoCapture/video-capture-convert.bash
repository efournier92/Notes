#!/bin/bash

#---------------
# Name         : video-capture-convert.bash
# Description  : Converts and compresses a video file to a high-compatibility format
# Author       : E Fournier
# Dependencies : ffmpeg, ffplay
# Arguments    : -i ${input_file_name} -d ${output_file_directory} -o ${output_file_name} -t ${input_start_time} -e ${output_duration} -c ${output_crop_positions} -s ${output_video_size} -r ${output_constant_rate_factor} -p ${output_speed_preset}
# Sample Usage : bash video-capture-convert.bash -i input.mp4 -d Video_Out -o output.mp4 -t 00:00:00 -e 04:00:00 -c 0:0:0:0 -s 720:540 -r 28 -p slow
#---------------

## Functions

### Returns output file name
function output_file {
  echo "${output_file_directory}/${output_file_name}.${output_file_extension}"
}

## Configuration

### Constants
available_speed_presets=("veryslow slower slow medium fast faster veryfast superfast ultrafast")

### Presets
input_start_time="00:00:00"
output_duration="04:00:00"
output_file_name=$(date '+%y%m%d%H%M%S')
output_video_codec="libx264"
output_video_tuning="film"
output_speed_preset="slow"
output_max_queue_size="400"
output_file_extension="mp4"
output_yadif=""
output_crop_positions="20:20:20:20"
output_video_size="720:540"
output_constant_rate_factor="28"
output_speed_preset="slow"
output_audio_bitrate="128k"
output_audio_channels="2"

### Evaluate supplied arguments to override presets
while getopts ":i:d:o:t:e:c:s:r:p:" OPTION
do
  case $OPTION in
    i)
      input_file_name=$OPTARG
      ;;
    d)
      output_file_directory=$OPTARG
      ;;
    o)
      output_file_name=$OPTARG
      ;;
    t)
      input_start_time=$OPTARG
      ;;
    e)
      output_duration=$OPTARG
      ;;
    c)
      output_crop_positions=$OPTARG
      ;;
    s)
      output_video_size=$OPTARG
      ;;
    r)
      output_constant_rate_factor=$OPTARG
      ;;
    p)
      if [[ "${available_speed_presets[@]}" =~ "${output_speed_preset}" ]]; then
        output_speed_preset=$OPTARG
      fi
      ;;
  esac
done

### Ensure required arguments are valid

#### Input file name
while [[ -z "${input_file_name}" && ! -f "${input_file}" ]]; do
  printf "Input File Name: "
  read "input_file_name"
done

### Output directory name
while [[ -z "${output_file_directory}" ]]; do
  printf "Output Directory:  "
  read "output_file_directory"
done

### Print debugging info
echo "------------------------"
echo "Output File Name       : ${output_file_name}"
echo "Max Output Duration    : ${output_duration}"
echo "Output Crop Positions  : ${output_crop_positions}"
echo "Output Dimensions      : ${output_video_size}"
echo "Output CRF             : ${output_constant_rate_factor}"
echo "Output Speed Preset    : ${output_speed_preset}"
echo "Writing Output As      : `output_file`"
echo "------------------------"

## Convert video

### Create the output directory if it does not exist
mkdir -p "${output_file_directory}"

### Create output video from input video
ffmpeg \
  -i "${input_file_name}" -ss "${input_start_time}" \
  -c:v "${output_video_codec}" -crf "${output_constant_rate_factor}" -tune "${output_video_tuning}" -preset "${output_speed_preset}" \
  -vf "yadif ${output_yadif},crop=${output_crop_positions},scale=${output_video_size}" \
  -profile:v baseline -level 3.0 -pix_fmt yuv420p \
  -c:a aac -ac ${output_audio_channels} -b:a ${output_audio_bitrate} \
  -t "${output_duration}" \
  -max_muxing_queue_size "${output_max_queue_size}" \
  -movflags faststart \
  `output_file`

