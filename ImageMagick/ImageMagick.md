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

