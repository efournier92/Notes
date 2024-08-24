# [FFmpeg](https://www.ffmpeg.org/)

## Contents

- [Overview](#overview)
- [Batch Conversion](#batch-conversion)
- [Trim File Duration](#trim-file-duration)
- [Join List of Media](#join-list-of-media)
- [Crop Edges](#crop-edges)
- [CRF Quality Reduction](#crf-quality-reduction)
- [Spoken Audio](#spoken-audio)
- [Low Quality Audio](#low-quality-audio)
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
- [Combine Video with Audio](#combine-video-with-audio)
- [`wav` to `mp3` ](#wav-to-mp3)
- [`avi` to `flv`](#avi-to-flv)
- [`avi` to `divx`](#avi-to-divx)
- [Install on macOS](#install-on-macos)
- [Install in Debian](#install-in-debian)
- [Compile From Source](#compile-from-source)

## Overview

[FFmpeg](https://www.ffmpeg.org/) is the coolest and most obscurely-ubiquitous tool I've ever happened upon. It's the engine running behind the vast majority of open-source tools for video editing and encoding. Clever [CLI](https://en.wikipedia.org/wiki/Command-line_interface) commands can invoke virtually any video editing process. Below are some of the commands I use most often.

## Batch Conversion

### Description

Leverage native `bash` loop functionality to encode a series of files.

### Command

```bash
for i in *.mp4;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" -ac 1 "${name}.mp3";
done
```

## Trim File Duration

### Description

Trim a file, from start time `-ss` to duration  `-t`.

### Command

```bash
ffmpeg -ss 00:00:00.000 -i in.mp4 \
-t 00:00:00.000 -c copy out.mp4
```

## Join List of Media

### Description

Join multiple media sources into one. The list is fed from a `txt` concat file.

### Command

```bash
ffmpeg -safe 0 -f concat -i path/to/concat.txt -c copy out.mp4
```

### Concat File

```text
file '/path/to/video1.mp4'
file '/path/to/video2.mp4'
file '/path/to/video3.mp4'
```

## Crop Edges

### Description

Crop a video's edges according by dimension.

### Command

```bash
ffmpeg -i in.mp4 -filter:v "crop=out_w:out_h:x:y" out.mp4
```

## CRF Quality Reduction

### Description

Control video quality by applying a constant rate factor.

### Command

```bash
ffmpeg -i in.mp4 -c:v libx264 \
-preset slow -crf 24 -c:a copy out.mp4
```

## Spoken Audio

### Description

Reduce file size for spoken audio files, like stand-up comedy.

### Command

```bash
ffmpeg -i in.mp4 -c:a libmp3lame -b:a 128k -ac 1 out.mp3
```

## Low Quality Audio

### Description

Reduce the file size for a list of low quality recordings.

### Command

```bash
ffmpeg -f concat -i /path/to/concat.txt \
-ac 1 -q:a 15 /path/to/out.mp3
```

## Subtitles

### Description

Hard-code subtitles file on a video.

### Command

```bash
ffmpeg -i in.mkv -vf subtitles=in.srt out.mkv
```

## Segment

### Description

Output series of segments from a single input file.

### Command

```bash
ffmpeg -i in.mp3 -f segment -segment_time {seconds} -c copy out%03d.mp3
```

## Video to `gif`

### Description

Convert a video file into a `gif`.

### Command

```bash
ffmpeg -i in.mp4 -r 6 \
-filter:v "crop=256:576:2:2" -vf scale=270:580 \
out.gif
```

## Video Bumper

### Description

Create a fade-in video bumper.

### Command

```bash
ffmpeg -loop 1 -i in.jpg -c:v libx264 -t 6 \
-vf "scale=720:480,fade=in:0:70" \
out.mp4
```

## Waveform

### Description

Create a waveform pattern from an audio file.

### Command

```bash
ffmpeg -i in.mp3 
-filter_complex "[0:a]showwaves=s=1280x720:mode=line:rate=25,format=yuv420p[vid]" \
-map "[vid]" -map 0:a -codec:v libx264 -crf 18 -preset fast \
-codec:a aac -strict -2 -b:a 192k \
out.mp4
```

## Draw Text

### Description

Superimpose dynamic text over video.

### Command

```bash
ffmpeg -i in.mp4 \
-vf "scale=720:480, \
  drawtext=fontfile=/Users/Misigno/Desktop/brandon-grotesque-medium.otf\
  :text='${name}':enable='between(t,10,18)'\
  :fontcolor=white:fontsize=30:x=(w-tw)/2:y=(h/PHI)+th" \
-f vob out.mp4
```

## All to `mpeg`

### Description

Convert a whole directory to a consistent `mpeg`, usually as an intermediary before concatenation.

### Command

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

## `webm` to `mp4`

### Description

Convert a `webm` file to `mp4`, without losing quality.

### Command

```bash
ffmpeg -i "in.webm" -qscale 0 "out.mp4"
```

## Media Info

### Description

Output metadata information about a media file.

### Command

```bash
ffmpeg -i in.avi
```

## Image Sequence

### Description

Encode a series of images as a video.

### Command

```bash
ffmpeg -f inImage2 -i inImage%d.jpg out.mpg
```

## Images from Video

### Description

Convert a video into a series of images.

### Command

```bash
ffmpeg -i in.mpg out%d.jpg
```

## Extract Audio

### Description

Output the sound from a video as an audio file.

### Command

```bash
ffmpeg -i in.avi -vn -ar 44100 -ac 2 -ab 192k -f mp3 out.mp3
```

## Combine Video with Audio

### Description

Use an audio file as the soundtrack to a video.

### Command

```bash
ffmpeg -i in.wav -i in.avi out.mpg
```

## `wav` to `mp3` 

### Description

Convert a `wav` audio file into an `mp3`.

### Command

```bash
ffmpeg -i in.avi -vn -ar 44100 -ac 2 -ab 192k -f mp3 out.mp3
```

## `avi` to `flv`

### Description

Convert an `avi` to an `flv` for the web.

### Command

```bash
ffmpeg -i in.avi -ab 56 -ar 44100 -b 200 -r 15 -s 320x240 -f flv out.flv
```

## `avi` to `divx`

### Description

Convert an `avi` to `divx` for some reason.

### Command

```bash
ffmpeg -i in.avi -s 320x240 -vcodec msmpeg4v2 out.avi
```

## Install on [macOS](https://en.wikipedia.org/wiki/MacOS)

### Description

Build and install `ffmpeg` on a Mac via [homebrew](https://brew.sh/)

### Command

```bash
brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-fontconfig --with-frei0r --with-libass --with-libvo-aacenc --with-libvorbis --with-libvpx --with-opencore-amr --with-openjpeg --with-opus --with-openssl --with-rtmpdump --with-schroedinger --with-speex --with-theora --with-tools --with-x265 --with-faac --with-lame --with-x264 --with-xvid
```

## Install in Debian

### Description

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

