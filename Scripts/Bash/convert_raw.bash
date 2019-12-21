#j!/bin/bash

in_file="$1"
out_name="$2"
in_start_time="00:00:00"
out_end_time="04:00:00"
out_vid_codec="libx264"
out_dir="OUT"
out_crf="28"
out_tune="film"
out_preset="slow"
out_yadif=""
out_max_queue="400"
out_ext="mp4"
out_crop="600:440:20:20"
out_dimensions="720:540"

# Return out_file location
function out_file {
  echo "$out_dir/${out_name}.${out_ext}"
}

while [[ -z "$in_file" && ! -f "$in_file" ]]; do
  printf "Input File: "
  read "in_file"
done

while [[ -z "$out_name" ]]; do
  printf "Output Name: "
  read "out_name"
done

mkdir -p "$out_dir"

while [[ -f `out_file` ]]; do
  last_out_name="$out_name"
  echo "File $out_name already exists..."
  printf "rename || rm: "
  # Get a new name from user
  read "new_out_name"
  if [[ "$new_out_name" =~ "rm" ]]; then
    # If user wants to delete the file
    rm -f `out_file`
    echo "REMOVED `out_file`"
    out_name="$last_out_name"
    break
  else
    # If user chose to rename, test again
    out_name="$new_out_name"
  fi
done

echo "Outputting as `out_file`"

ffmpeg -i "$in_file" -ss "$in_start_time" \
  -c:v "$out_vid_codec" -crf "$out_crf" -tune "$out_tune" -preset "$out_preset" \
  -vf "yadif ${out_yadif},crop=${out_crop}" \
  -profile:v baseline -level 3.0 -pix_fmt yuv420p \
  -c:a aac -ac 2 -b:a 128k \
  -t "$out_end_time" \
  -max_muxing_queue_size "$out_max_queue" \
  -movflags faststart \
  `out_file`

