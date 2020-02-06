#!/bin/bash

out_file_name="$1"
scan_dir="scan-$out_file_name"
out_concat_file="$scan_dir/out_concat"
out_final_file="$scan_dir/$out_file_name.pdf"
out_seq_id="scan"
out_seq_name="$out_seq_id%d.tif"
scanner=`scanimage --formatted-device-list=%d`

function stop_execution {
  echo "Exiting"
  exit
}

if [[ -z "$scanner" ]]; then 
  echo "No Scanner Found"
  stop_execution
fi

if [[ -d "$scan_dir" ]]; then 
  echo "Directory $scan_dir already exists"
  stop_execution
fi

mkdir -p "$scan_dir"

## Batch scan PDF scanner
scanimage -d "$scanner" --batch="$scan_dir/$out_seq_name" --batch-prompt --format=tiff --resolution 300

## Merge TIF and to PDF
tiffcp $scan_dir/$out_seq_id*.tif "$out_concat_file.tif"
tiff2pdf -o "$out_concat_file.pdf" "$out_concat_file.tif"

## Shrink PDF
ps2pdf "$out_concat_file.pdf" "$out_final_file"

## Outut file location
echo "OUTPUT PDF SAVED TO: $out_final_file"

