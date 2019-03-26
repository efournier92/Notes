#/bin/bash

mkdir -p ~/.ffmpeg_sources

sudo apt-get update && sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfdk-aac-dev \
  libfreetype6-dev \
  libmp3lame-dev \
  libopus-dev
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvpx-dev \
  libvorbis-dev \
  libx264-dev \
  libx265-dev libnuma-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  nasm \
  pkg-config \
  texinfo \
  wget \
  yasm \
  zlib1g-dev

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

