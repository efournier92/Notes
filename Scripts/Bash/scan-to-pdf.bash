#!/bin/bash

# scan-to-pdf
# Outputs a multi-page PDF document from scanned input

## Get document name as input
while [[ -z "$scan_name" || -d "$scan_dir" ]]; do
  read -p "Scan Name > " scan_name
done

## Calculate variables
scan_dir="scan_${scan_name}"
concat_file="${scan_dir}/out_concat"
pdf_file="${scan_name}.pdf"
sequence_id="scan"
sequence_name="${sequence_id}%d.tif"

## Get user selection for scan quality in dots-per-inch
echo "-------------"
echo "QUALITY (DPI)"
echo "-------------"
select quality in 150 300 600; do
    echo "Selected $quality"
    break
done

## Get user selection from available scanners
echo "-------------"
echo "SCANNER"
echo "-------------"
select scanner in `scanimage -f "%d %n"`; do
    echo "Selected $scanner"
    break
done

## Create temporary scan directory
mkdir -p "${scan_dir}"

## Batch scan PDF scanner
scanimage -d "${scanner}" --batch="${scan_dir}/${sequence_name}" --batch-prompt --progress --format=tiff --resolution 300

## Merge TIF and to PDF
tiffcp "${scan_dir}/${sequence_id}"*.tif "${concat_file}.tif"
tiff2pdf -o "${concat_file}.pdf" "${concat_file}.tif"

## Shrink PDF
ps2pdf "${concat_file}.pdf" "${pdf_file}"

## Outut file location
echo "OUTPUT PDF SAVED TO: ${pdf_file}"

## Open Document
evince "${pdf_file}"

## Remove temporary scan directory
rm -r "${scan_dir}"

