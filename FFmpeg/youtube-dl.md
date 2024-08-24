# [youtube-dl](https://ytdl-org.github.io/youtube-dl/index.html)

- [Contents](contents)
- [Overview](overview)
- [Commands](commands)
  - [No Playlist](no-playlist)
  - [With Playlist](with-playlist)
  - [Extract Audio](extract-audio)

## Overview

An awesome CLI tool that supports downloading video from YouTube, and many other web video platforms.

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

