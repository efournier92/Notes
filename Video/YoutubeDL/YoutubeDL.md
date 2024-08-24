# [youtube-dl](https://ytdl-org.github.io/youtube-dl/index.html)

## Contents

- [Overview](#overview)
- [Commands](#commands)
  - [No Playlist](#no-playlist)
  - [With Playlist](#with-playlist)
  - [Extract Audio](#extract-audio)

## Overview

[youtube-dl](https://ytdl-org.github.io/youtube-dl/index.html) is an awesome CLI tool, which supports downloading video from YouTube, and [many other web-video platforms](https://ytdl-org.github.io/youtube-dl/supportedsites.html).

## Commands

### No Playlist

#### Description

Download a single video, ignoring playlist.

#### Command

```bash
youtube-dl "https://youtu.be/" --no-playlist
```

### With Playlist

#### Description

Download an entire playlist of videos.

#### Command

```bash
youtube-dl -citw "https://youtu.be/"
```

### Extract Audio

#### Description

Download only the audio from a video.

#### Command

```bash
youtube-dl --extract-audio --audio-format mp3 -o out.mp3 "https://youtu.be/"
```

