#!/bin/bash

mkdir -p PNG

for i in *.xcf; do
  magick "$i" -flatten "PNG/${i/xcf/png}"
done

montage -tile 1x2 -label '' \
  'PNG/Back.png' -rotate 180 \
  'PNG/Front.png' -rotate -180 \
  'PNG/InsideTop.png' 'PNG/InsideBottom.png' \
  -geometry 2550x1650+0+0 Card.pdf

rm -r PNG

