#!/bin/bash

jpeg_dir="_JPEGs"
pdf_dir="_PDFs"
mkdir -p "${pdf_dir}"
for file in *.pdf; do
  dir_name="${file%.*}"
  output_path="${jpeg_dir}/${dir_name}"
  mkdir -p "${output_path}"
  [[ "$(ls -A $output_path)" ]] && continue
  # 
  pdftoppm -jpeg -r 300 "$file" "${jpeg_dir}/${dir_name}/pg"
done

for image_directory in $jpeg_dir/*; do
  pdf_name="${pdf_dir}/${image_directory##*/}"
  [[ -f "$pdf_name" ]] && continue

  echo "Image Directory: ${image_directory}"
 
  file_names=""
  for file in $image_directory/*.jpg; do
    echo "Opening $file"
    file_names="${file_names} ${file}"
    gimp "$file"
  done

  # Wait for user to press Enter key
  # read -p "[Enter] to confinue > " -n1 -s
  echo "NAMES: ${file_names}"
  convert ${file_names} "${pdf_name}.pdf"
done

