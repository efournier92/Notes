# [GIFs](https://en.wikipedia.org/wiki/GIF)

## Contents
- [Overview](#overview)
- [Convert Screenshots to `.gif`](#convert-screenshots-to-.gif)
- [Useful Commands](#useful-commands)

## Overview
I like to spin up [GIFs](https://en.wikipedia.org/wiki/GIF) sometimes, as a funny and shareable form of media. I use the following commands and processes to facilitate working with them.

## Convert Screenshots to `.gif`

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

## Useful Commands

### Standardize File Names
```bash
IDX=0
for i in *.png; do
  mv $i "Image`printf "%02d" $IDX`.png"
  let IDX++
done
```

### Merge with Background Layer
```bash
for i in Image*.png; do
  composite -blend 8 $i background.png "out/${i}"
done
```

### Make Image Grayscale
```bash
for i in Image*.png; do
  convert $i -colorspace Gray "out/${i}"
done
```

### Crop Image [w=2560, h=1500, x=0, y=56]
```bash
for i in Image*.png; do
  convert $i -crop 2560x1500+0+56 "out/${i}"
done
```

### Resize Image to [w=1600]
```bash
for i in Image*.png; do
  convert $i -resize 1600 "out/${i}"
done
```

### Optimize Image
```bash
pngquant 8 --speed 1 *.png 
```

### Create `.gif`
```bash
ffmpeg -f Image2 -r 1 -i Image_%2d.png background.gif
```

### All `convert` Commands
```bash
for i in Image*.png; do
  do name=`echo $i | cut -d'.' -f1`;
  convert $i -crop 2560x1500+0+56 -colorspace Gray -resize 1200 "out/${i}"
done
```

