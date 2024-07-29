# [FFmpeg](https://www.ffmpeg.org/)

## Contents
- [Overview](#overview)
- [Commands](#commands)
  - [Batch Conversion](#batch-conversion)
  - [Trim File Duration](#trim-file-duration)
  - [Join List of Media](#join-list-of-media)
  - [Crop Edges](#crop-edges)
  - [CRF Quality Reduction](#crf-quality-reduction)
  - [Spoken Audio](#spoken-audio)
  - [Low Quality](#low-quality)
  - [Subtitles](#subtitles)
  - [Segment](#segment)
  - [Video to `gif`](#video-to-gif)
  - [Video Bumper](#video-bumper)
  - [Waveform](#waveform)
  - [Draw Text](#draw-text)
  - [All to `mpeg`](#all-to-mpeg)
  - [Waveform](#waveform)
  - [Draw Text](#draw-text)
  - [All to `mpeg`](#all-to-mpeg)
  - [`webm`](#webm)
  - [Media Info](#media-info)
  - [Image Sequence](#image-sequence)
  - [Images from Video](#images-from-video)
  - [Extract Audio](#extract-audio)
  - [Amplify Audio Volume](#amplify-audio-volume)
  - [`wav` to `mp3` ](#wav-to-mp3)
  - [Combine Video with Audio](#combine-video-with-audio)
  - [`avi` to `flv`](#avi-to-flv)
  - [`avi` to `divx`](#avi-to-divx)
  - [Install in OsX ](#install-in-osx )
  - [Install in Debian](#install-in-debian)
  - [Image Sequence to MP4](#image-sequence-to-mp4)
  - [Image Sequence to GIF](#image-sequence-to-gif)
  - [Compile From Source](#compile-from-source)

## Overview
[FFmpeg](https://www.ffmpeg.org/) is the coolest and most obscurely-ubiquitous tool I've ever happened upon. It's the engine running behind the vast majority of open-source tools for video editing and encoding. Clever [CLI](https://en.wikipedia.org/wiki/Command-line_interface) commands can invoke virtually any video editing process. Below are some of the commands I use most often.

## Commands

### Batch Conversion

#### Description
Leverage native `bash` loop functionality to encode a series of files.

#### Command

```bash
for i in *.mp4;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" -ac 1 "${name}.mp3";
done
```

### CRF Quality

#### Description
My go-to choice for live-action TV shows, for which I favor smaller size over the greatest quality.

#### Single

```bash
crf="28"
in_file=""
out_file="OUTPUT_$crf.mp4"
ffmpeg -i "$in_file" \
  -c:a aac -ac 2 -b:a 128k \
  -c:v libx264 -crf "$crf" -tune film -preset slow \
  -profile:v baseline -level 3.0 -pix_fmt yuv420p \
  -max_muxing_queue_size 400 \
  -movflags faststart \
  -map_metadata -1 -strict -2 \
  "$out_file"
```

#### Batch

```bash
crf="28"
ext_in=".mkv"
ext_out=".mp4"
out_dir="_OUTPUT_$crf"
mkdir "$out_dir"
for file in *$ext_in; do
  ffmpeg -i "$file" \
    -c:a aac -ac 2 -b:a 128k \
    -c:v libx264 -crf "$crf" -tune film -preset slow \
    -profile:v baseline -level 3.0 -pix_fmt yuv420p \
    -max_muxing_queue_size 400 \
    -movflags faststart \
    -map_metadata -1 -strict -2 \
    "$out_dir/${file/$ext_in/$ext_out}"
done
```

#### Concatenate

##### Re-Encode

```bash
crf="28"
concat_file="concat.txt"
out_file="CONCAT_$crf.mp4"
ffmpeg -safe 0 -f concat -i "$concat_file" \
  -c:a aac -ac 2 -b:a 128k \
  -c:v libx264 -crf "$crf" -tune film -preset slow \
  -profile:v baseline -level 3.0 -pix_fmt yuv420p \
  -max_muxing_queue_size 400 \
  -movflags faststart \
  -map_metadata -1 -strict -2 \
  "$out_file"
```

##### Without Re-Encoding

```bash
concat_file="concat.txt"
out_file="CONCAT.mp4"
ffmpeg -safe 0 -f concat -i "$concat_file" \
  -c copy \
  -map_metadata -1 -strict -2 \
  "$out_file"
```

#### Re-Encode and Trim

```bash
crf="28"
concat_file="concat.txt"
out_file="CONCAT+TRIM_$crf.mp4"
time_start="00:00:00.000"
time_end="00:00:00.000"
ffmpeg -ss "$time_start" -i "$concat_file" \
  -c:a aac -ac 2 -b:a 128k \
  -t "$time_end" \
  -c:v libx264 -crf "$crf" -tune film -preset slow \
  -profile:v baseline -level 3.0 -pix_fmt yuv420p \
  -max_muxing_queue_size 400 \
  -movflags faststart \
  -map_metadata -1 -strict -2 \
  "$out_file"
```

#### Create an Intermediate File to Mitigate Audio-Sync Issues

```bash
out_dir_name="TS"
mkdir -p "$out_dir_name"
for file in *.mp4; do
  ffmpeg -i "$file" -q 0 "$out_dir_name/${file/.mp4/.MTS}"
done
```

### Trim File Duration

#### Description
Trim a file, from start time `-ss` to duration  `-t`.

#### Command

```bash
ffmpeg -ss 00:00:00.000 -i in.mp4 \
-t 00:00:00.000 -c copy out.mp4
```

### Join List of Media

#### Description
Join multiple media sources into one. The list is fed from a `txt` concat file.

#### Command

```bash
ffmpeg -safe 0 -f concat -i path/to/concat.txt -c copy out.mp4
```

#### Concat File

```text
file '/path/to/video1.mp4'
file '/path/to/video2.mp4'
file '/path/to/video3.mp4'
```

#### Standard Video Command

```bash
crf=28
ffmpeg -safe "0" -f "concat" -i "concat.txt" \
  -c:a "aac" -ac "2" -b:a "128k" \
  -c:v "libx264" -crf "$crf" -tune "film" -preset "slow" \
  -profile:v "baseline" -level "3.0" -pix_fmt "yuv420p" \
  -max_muxing_queue_size "400" \
  -vf "yadif=0:0:0" \
  -movflags "faststart" \
  -map_metadata "-1" -strict "-2" \
  "out.mp4"
```

### Crop Edges

#### Description
Crop a video's edges according by dimension.

#### Command

```bash
ffmpeg -i in.mp4 -filter:v "crop=out_w:out_h:x:y" out.mp4
```

### Change Aspect Ratio

#### Description
Adjust a video's aspect ratio based on defined width and height.

#### Command

```bash
width=640
height=480
ffmpeg -i in.mp4 -vf scale=$width:$height -aspect $width:$height out.mp4
```

### Capture Sample Screenshot

#### Description
Capture a single frame from a video file. Use for determining dimensions to crop.

#### Command

```bash
ffmpeg -ss 00:00:01 -i in.mp4 -vframes 1 -q:v 2 sample-frame.jpg
```

### CRF Quality Reduction

#### Description
Control video quality by applying a constant rate factor.

#### Command

```bash
ffmpeg -i in.mp4 -c:v libx264 \
-preset slow -crf 24 -c:a copy out.mp4
```

### Spoken Audio

#### Description
Reduce file size for spoken audio files, like stand-up comedy.

#### Command

##### Single

```bash
ffmpeg -i in.mp4 -c:a libmp3lame -b:a 128k -ac 1 out.mp3
```

##### Batch

```bash
out_dir="_OUT"
mkdir -p "$out_dir"
for file in *.mp4; do 
  ffmpeg -i "$file" -c:a libmp3lame -b:a 128k -ac 1 "${out_dir}/${file}"
done
```

### Low Quality Audio

#### Description
Reduce the file size for a list of low quality recordings.

#### Command

```bash
ffmpeg -f concat -i /path/to/concat.txt \
  -ac 1 -q:a 15 /path/to/out.mp3
```

### Single Photo Slideshow

#### Description
Creates a video from a single image and an audio input.

#### Command

```bash
audio_duration="00:02:39.000"
audio_file="in.wav"
image_file="in.png"
ffmpeg -loop 1 \
  -i "$image_file" -i "$audio_file" \
  -acodec aac -c:a libmp3lame -shortest \
  -c:v libx264 -t "$audio_duration" -vf scale=720:240 -pix_fmt yuv420p \
  out.mp4 
```

### Subtitles

#### Description
Hard-code subtitles file on a video.

#### Command

```bash
ffmpeg -i in.mkv -vf subtitles=in.srt out.mkv
```

### Segment

#### Description
Output series of segments from a single input file.

#### Command

```bash
ffmpeg -i in.mp3 -f segment -segment_time {seconds} -c copy out%03d.mp3
```

### Video to `gif`

#### Description
Convert a video file into a `gif`.

#### Command

```bash
ffmpeg -i in.mp4 -r 6 \
-filter:v "crop=256:576:2:2" -vf scale=270:580 \
out.gif
```

### Video Bumper

#### Description
Create a fade-in video bumper.

#### Command

```bash
ffmpeg -loop 1 -i in.jpg -c:v libx264 -t 6 \
-vf "scale=720:480,fade=in:0:70" \
out.mp4
```

### Waveform

#### Description
Create a waveform pattern from an audio file.

#### Command

```bash
ffmpeg -i in.mp3 
-filter_complex "[0:a]showwaves=s=1280x720:mode=line:rate=25,format=yuv420p[vid]" \
-map "[vid]" -map 0:a -codec:v libx264 -crf 18 -preset fast \
-codec:a aac -strict -2 -b:a 192k \
out.mp4
```

### Draw Text

#### Description
Superimpose dynamic text over video.

#### Command

```bash
ffmpeg -i in.mp4 \
-vf "scale=720:480, \
  drawtext=fontfile=/Users/Misigno/Desktop/brandon-grotesque-medium.otf\
  :text='${name}':enable='between(t,10,18)'\
  :fontcolor=white:fontsize=30:x=(w-tw)/2:y=(h/PHI)+th" \
-f vob out.mp4
```

### All to `mpeg`

#### Description
Convert a whole directory to a consistent `mpeg`, usually as an intermediary before concatenation.

#### Command

```bash
for i in *.*;
do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" \
    -vcodec mpeg2video -pix_fmt yuv420p -me_method epzs -threads 4 \
    -r 29.97 -g 45 -bf 2 -trellis 2 -cmp 2 -subcmp 2 -b 2500k -bt 300k \
    -acodec mp2 -ac 2 -ab 192k -ar 44100 \
    -async 1 \
    -y -movflags +faststart \
    -vf "scale=720:480, \
      drawtext=fontfile=/Users/Misigno/Desktop/brandon-grotesque-medium.otf\
      :text='${name}':enable='between(t,10,18)'\
      :fontcolor=white:fontsize=30:x=(w-tw)/2:y=(h/PHI)+th" \
    -f vob "TS/${name}.mpeg"
done
```

### `webm`

#### Description
Convert a `webm` file to mp4, without losing quality.

#### Command

```bash
ffmpeg -i "in.webm" -qscale 0 "out.mp4"
```

### Media Info

#### Description
Output metadata information about a media file.

#### Command

```bash
ffmpeg -i in.avi
```

### Image Sequence

#### Description
Encode a series of images as a video.

#### Command

```bash
ffmpeg -f inImage2 -i inImage%d.jpg out.mpg
```

### Images from Video

#### Description
Convert a video into a series of images.

#### Command

```bash
ffmpeg -i in.mpg out%d.jpg
```

### Extract Audio

#### Description
Output the sound from a video as an audio file.

#### Command

```bash
ffmpeg -i in.avi -vn -ar 44100 -ac 2 -ab 192k -f mp3 out.mp3
```

### Amplify Audio Volume

#### Description
Increase or decrease the audio amplification statically across a media file.

#### Command

```bash
ffmpeg -i in.mp4 -filter:a "volume=0.5" out.mp4
```

### `wav` to `mp3` 

#### Description
Convert a `wav` audio file into an `mp3`.

#### Command

```bash
ffmpeg -i in.avi -vn -ar 44100 -ac 2 -ab 192k -f mp3 out.mp3
```

### `flac` to `mp3` 

#### Description
Convert a `flac` audio file into an `mp3`.

#### Single

```bash
ffmpeg -i in.avi -vn -ar 44100 -ac 2 -ab 192k -f mp3 out.mp3
```

#### Batch

```bash
out_dir="./_OUT"
mkdir -p "$out_dir"
for file in *.flac; d
  ffmpeg -i "$file" -codec:a libmp3lame -qscale:a 3 "${file/.flac/.mp3}"
done
```

### Combine Video with Audio

#### Description
Use an audio file as the soundtrack to a video.

#### Command

```bash
ffmpeg -i in.wav -i in.avi out.mpg
```

### `avi` to `flv`

#### Description
Convert an `avi` to an `flv` for the web.

#### Command

```bash
ffmpeg -i in.avi -ab 56 -ar 44100 -b 200 -r 15 -s 320x240 -f flv out.flv
```

### `avi` to `divx`

#### Description
Convert an `avi` to `divx` for some reason.

#### Command

```bash
ffmpeg -i in.avi -s 320x240 -vcodec msmpeg4v2 out.avi
```

### Image Sequence to MP4

```bash
#!/bin/bash

ffmpeg \
  -loop 1 -t 5 -i IMG_000.jpg \
  -loop 1 -t 5 -i IMG_001.jpg \
  -loop 1 -t 5 -i IMG_002.jpg \
  -loop 1 -t 5 -i IMG_003.jpg \
  -loop 1 -t 5 -i IMG_004.jpg \
  -loop 1 -t 5 -i IMG_005.jpg \
  -loop 1 -t 5 -i IMG_006.jpg \
  -loop 1 -t 5 -i IMG_007.jpg \
  -loop 1 -t 5 -i IMG_000.jpg \
  -filter_complex \
  "[1]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+1/TB[f0]; \
   [2]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+3/TB[f1]; \
   [3]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+5/TB[f2]; \
   [4]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+7/TB[f3]; \
   [5]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+9/TB[f4]; \
   [6]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+11/TB[f5]; \
   [7]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+13/TB[f6]; \
   [8]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+15/TB[f7]; \
   [0][f0]overlay[bg1]; \
   [bg1][f1]overlay[bg2]; \
   [bg2][f2]overlay[bg3]; \
   [bg3][f3]overlay[bg4]; \
   [bg4][f4]overlay[bg5]; \
   [bg5][f5]overlay[bg6]; \
   [bg6][f6]overlay[bg7]; \
   [bg7][f7]overlay,format=yuv420p[v]" -map "[v]" -movflags +faststart out.gif
```

### Gifs

#### Gifski

##### Download
- https://gif.ski/

##### Usage

```bash
gifski --fps 7 --width 520 -o file_520.gif frame*.png
```

#### Produce Frames from Video

```bash
ffmpeg -i slideshow.mp4 -filter:v "crop=720:720:282:0" -r 7 "$FRAME_DIR/frame%04d.png"
```

#### Reduce Image Size

##### Single File

```bash
convert input.jpg -resize 600 output.jpg
```

##### Batch
```bash
for i in *.png; do convert "$i" -resize 600 "$i.jpg"; done
```

### Image Sequence to GIF

```bash
#!/bin/bash

ffmpeg \
  -loop 1 -t 5 -i IMG_000.jpg \
  -loop 1 -t 5 -i IMG_001.jpg \
  -loop 1 -t 5 -i IMG_002.jpg \
  -loop 1 -t 5 -i IMG_003.jpg \
  -loop 1 -t 5 -i IMG_004.jpg \
  -loop 1 -t 5 -i IMG_005.jpg \
  -loop 1 -t 5 -i IMG_006.jpg \
  -loop 1 -t 5 -i IMG_007.jpg \
  -loop 1 -t 5 -i IMG_000.jpg \
  -filter_complex \
  "[1]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+1/TB[f0]; \
   [2]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+3/TB[f1]; \
   [3]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+5/TB[f2]; \
   [4]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+7/TB[f3]; \
   [5]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+9/TB[f4]; \
   [6]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+11/TB[f5]; \
   [7]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+13/TB[f6]; \
   [8]format=yuva444p,fade=d=1:t=in:alpha=1,setpts=PTS-STARTPTS+15/TB[f7]; \
   [0][f0]overlay[bg1]; \
   [bg1][f1]overlay[bg2]; \
   [bg2][f2]overlay[bg3]; \
   [bg3][f3]overlay[bg4]; \
   [bg4][f4]overlay[bg5]; \
   [bg5][f5]overlay[bg6]; \
   [bg6][f6]overlay[bg7]; \
   [bg7][f7]overlay,format=yuv420p[v]" -map "[v]" -movflags +faststart out.gif
```

### Install in OsX 

#### Description
Build and install `ffmpeg` on a Mac via [homebrew](https://brew.sh/)

#### Command

```bash
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-fontconfig --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-openssl --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools --with-x265 --with-faac --with-lame --with-x264 --with-xvid
```

### Install in Debian

#### Description
Compile and install `ffmpeg` on Debian-based Linux systems via `apt`.

### Compile From Source

```bash
#/bin/bash

mkdir -p ~/.ffmpeg_sources

sudo apt-get update && sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libcdio \
  libfreetype6-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  pkg-config \
  texinfo \
  wget \
  zlib1g-dev

sudo apt-get -y install libx264-dev
sudo apt-get -y install libx265-dev libnuma-dev
sudo apt-get -y install libvpx-dev
sudo apt-get -y install libfdk-aac-dev
sudo apt-get -y install libmp3lame-dev
sudo apt-get -y install libopus-dev

cd ~/.ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="/bin:$PATH" PKG_CONFIG_PATH="$HOME/.ffmpeg_sources/lib/pkgconfig" ./configure \
  --prefix="$HOME/.ffmpeg_sources" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/.ffmpeg_sources/include" \
  --extra-ldflags="-L$HOME/.ffmpeg_sources/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree && \
PATH="/bin:$PATH" make && \
make install && \
hash -r

source ~/.profile
```

