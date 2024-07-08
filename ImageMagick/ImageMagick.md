# ImageMagick

## Commands

### Crop | All Directions

```bash
input_file="page.tif"
output_file="page.pdf"
crop_pixels="50"
convert "$input_file" \
  -gravity East -chop "${crop_pixels}x0" \
  -gravity West -chop "${crop_pixels}x0" \
  -gravity North -chop "0x${crop_pixels}" \
  -gravity South -chop "0x${crop_pixels}" \
  "$output_file"
```

### Resize | By Pixel Dimensions

```bash
out_dimensions="2000x2000"
out_dir="_OUT_${out_dimensions}"

mkdir -p "$out_dir"
for file in *.jpg; do
  convert "$file" -resize "$out_dimensions" "${out_dir}/${file}"
done
```

