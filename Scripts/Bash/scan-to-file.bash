#!/bin/bash

#---------------
# Name         : scan-to-file.bash
# Description  : Scans and converts image inputs to a file
# Author       : E Fournier
# Dependencies : scanimage, ps2pdf, tiffcp, tiff2pdf, ps2pdf, evince
# Arguments    : -s ${scanner} -f ${scan_format} -n ${scan_name} -q ${scan_quality} -p ${is_preview_mode_enabled}
# Sample Usage : bash scan-to-file -s ${} -f pdf -n scan -q 300 -p
#---------------

## Configuration

### Constants
available_qualities=(150 300 600)
available_formats=(pdf jpeg)

### Presets
is_preview_mode_enabled=false
scan_name=$(date '+%y%m%d%H%M%S')

### Evaluate supplied arguments to override presets
while getopts ":s:f:n:q:p" OPTION
do
  case $OPTION in
    s)
      scanner=$OPTARG
      ;;
    f)
      scan_format=$OPTARG
      ;;
    n)
      scan_name=$OPTARG
      ;;
    q)
      scan_quality=$OPTARG
      ;;
    p)
      is_preview_mode_enabled=true 
      ;;
  esac
done

### Ensure required arguments are valid

#### Select from available scanners
if [[ -z "$scanner" ]]; then
  echo "------\nSELECT SCANNER:\n------"
  select scanner in `scanimage -f "%d %n"`; do
    break
  done
fi

#### Select output format
if [[ "$scan_format" != "jpeg" && "$scan_format" != "pdf" ]]; then
  echo "------\nSELECT FORMAT\n------"
  select scan_format in ; do
    break
  done
fi

#### Select output quality in DPI
if [[ -z "${scan_quality}" ]]; then
  echo "------\nSELECT QUALITY (DPI)\n------"
  select scan_quality in ${available_qualities}; do
    break
  done
fi

### Print debugging info
echo "---------------------------"
echo "Scanner                   : ${scanner}"
echo "Output File Extension     : ${scan_format}"
echo "Output File Name          : ${scan_name}"
echo "Output File Quality (DPI) : ${scan_quality} DPI"
echo "Is Preview Mode Enabled?  : ${is_preview_mode_enabled}"
echo "---------------------------"

## Image Mode
if [[ $scan_format == "jpeg" ]]; then
  scanimage -d "$scanner" --progress --format="$scan_format" --resolution "$scan_quality" -o "${scan_name}.jpeg"
fi
  
## Document Mode
if [[ $scan_format == "pdf" ]]; then

  ### Configs
  temp_tiff_dir="scan_${scan_name}"
  temp_tiff_concat_file="${temp_tiff_dir}/out_concat"
  tmp_tif_sequence="${scan_name}%d.tif"
  output_pdf_file="${scan_name}.pdf"

  ### Print debugging info
  echo "------------------"
  echo "TIFF Directory   : ${temp_tiff_dir}"
  echo "TIFF Concat File : ${temp_tiff_concat_file}"
  echo "TIFF Sequence    : ${tmp_tif_sequence}"
  echo "Output PDF File  : ${output_pdf_file}"
  echo "------------------"
  
  ### Create temporary scan directory
  mkdir -p "${temp_tiff_dir}"
  
  ### Batch scan PDF scanner
  scanimage -d "${scanner}" --batch="${temp_tiff_dir}/${tmp_tif_sequence}" --batch-prompt --progress --format=tiff --resolution "${scan_quality}"
  
  ### Merge TIF scan files
  tiffcp "${temp_tiff_dir}/${sequence_id}"*.tif "${temp_tiff_concat_file}.tif"
  
  ### Convert TIF concat file to PDF
  tiff2pdf -o "${temp_tiff_concat_file}.pdf" "${temp_tiff_concat_file}.tif"
  
  ### Convert PDF to standard format
  ps2pdf "${temp_tiff_concat_file}.pdf" "${output_pdf_file}"
  
  ### Open document in evince
  if [[ ${is_preview_mode_enabled} == true ]]; then
    evince "${output_pdf_file}"
  fi
  
  ### Remove temporary scan directory
  rm -r "${temp_tiff_dir}"
fi

