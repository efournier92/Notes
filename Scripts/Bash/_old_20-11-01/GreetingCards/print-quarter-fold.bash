#!/bin/bash

mkdir -p PNG

for file in *.xcf; do
  magick "$file" -flatten "PNG/${i/xcf/png}"
done

montage -tile 2x2 -label '' \
  'PNG/Front.png' -rotate 180 \
  'PNG/InsideTop.png' -rotate -180 \
  'PNG/Back.png' 'PNG/InsideBottom.png' \
  -geometry 2550x1650+0+0 Card.pdf

rm -r PNG

