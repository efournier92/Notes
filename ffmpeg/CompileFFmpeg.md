# `ffmpeg`

## Description

## Commands

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

