# [GIFs](https://en.wikipedia.org/wiki/GIF)

## Contents
- [Overview](#overview)
- [Convert Screenshots to GIF](#convert-screenshots-to-gif)
- [Commands](#commands)
  - [Standardize File Names](#standardize-file-names)
  - [Merge with Background Layer](#merge-with-background-layer)
  - [Make Image Grayscale](#make-image-grayscale)
  - [Crop Image](#crop-image)
  - [Resize Image](#resize-image)
  - [Optimize Image](#optimize-image)
  - [Create GIF](#create-gif)
  - [`convert` Manipulations](#convert-manipulations)

## Overview
I like to spin up [GIFs](https://en.wikipedia.org/wiki/GIF) sometimes, as a funny and shareable form of media. I use the following commands and processes to facilitate working with them.

## Convert Screenshots to [GIF](https://en.wikipedia.org/wiki/GIF)

### 1. Merge with Background Layer
```bash
for i in Image*.png; do
  composite -blend 6 $i background.png "out/${i}"
done
```

### 2. All `convert` Commands
```bash
for i in Image*.png; do
  convert $i -crop 2560x1500+0+56 -colorspace Gray -resize 1200 "out/${i}"
done
```

### 3. Optimize Image
```bash
pngquant 8 --speed 1 *.png 
```

## Commands

### Standardize File Names
```bash
IDX=0
for i in *.png; do
  mv $i "Image`printf "%03d" $IDX`.png"
  let IDX++
done
```

### Merge with Background Layer
```bash
for i in Image*.png; do
  composite -blend 8 $i background.png "out/${i}"
done
```

### Make Image [Grayscale](https://en.wikipedia.org/wiki/Grayscale)
```bash
for i in Image*.png; do
  convert $i -colorspace Gray "out/${i}"
done
```

### Crop Image

#### _w=2560, h=1500, x=0, y=56_
```bash
for i in Image*.png; do
  convert $i -crop 2560x1500+0+56 "out/${i}"
done
```

### Resize Image

#### _w=1600_
```bash
for i in Image*.png; do
  convert $i -resize 1600 "out/${i}"
done
```

### Optimize Image
```bash
pngquant 8 --speed 1 *.png 
```

### Create [GIF](https://en.wikipedia.org/wiki/GIF)
```bash
ffmpeg -f Image2 -r 1 -i Image_%2d.png background.gif
```

### `convert` Manipulations
```bash
for i in Image*.png; do
  do name=`echo $i | cut -d'.' -f1`;
  convert $i -crop 2560x1500+0+56 -colorspace Gray -resize 1200 "out/${i}"
done
```

### Crossfade

### Description

### Command

```bash
ffmpeg \
-loop 1 -t 5 -i 1.png \
-loop 1 -t 5 -i 2.png \
-loop 1 -t 5 -i 3.png \
-loop 1 -t 5 -i 4.png \
-loop 1 -t 5 -i 5.png \
-filter_complex \
"[1]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+4/TB[f0]; \
 [2]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+8/TB[f1]; \
 [3]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+12/TB[f2]; \
 [4]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+16/TB[f3]; \
 [0][f0]overlay[bg1];[bg1][f1]overlay[bg2];[bg2][f2]overlay[bg3]; \
 [bg3][f3]overlay,format=yuv420p[v]" -map "[v]" -movflags +faststart out.mp4
```

