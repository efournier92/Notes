# `bash` Rename Commands

## Pattern Substitution

```bash
for filename in /mnt/extC/**/*; do
  mv "$filename" "${filename//:/-}"
done
```

## `tr` Character Substitution
```bash
for filename in /mnt/extC/**/*; do
  mv "$filename" "$(echo "$filename" | tr '[A-Z]' '[a-z]')"
done
```

## `sed` Substitution
```bash
for file in /mnt/extC/**/*; do
  new=`echo "$file" | sed -e "s/old/new/"`
  mv "$file" "$new"
done
```

## Livestream
```bash
# crontab
# 0 * * * * bash /home/misigno/.livestream/livestream.sh

NowTimestamp=`date +'%Y-%m-%d-%H'`
LivestreamDir="/home/misigno/.livestream"
MusicDir="/mnt/MD/Audio/Music"
ConcatFile="$LivestreamDir/Playlists/$NowTimestamp.txt"

rm -f "$ConcatFile"

find $MusicDir/. -name "*mp3" | sort -R | head -n 30 | while read file; do
  # fileBitrate=$(mpck "$file" | grep "bitrate" | grep "VBR")
  if ! [[ $file == *"'"* ]]; then
   echo "file '$file'" >> $ConcatFile
  fi
done

# FFREPORT=file="$LivestreamDir/Logs/$NowTimestamp.log":level=24 \
ffmpeg -i /dev/video0 \
  -f concat -safe 0 -i $ConcatFile -c:a aac -fflags +igndts -fflags +genpts -copytb 1 \
  -c:v libx264 -preset veryfast -pix_fmt yuv420p -threads 0 -tune zerolatency -g 60 \
  -t 00:59:57 \
  -f flv "rtmp://live.twitch.tv/app/live_422375864_tssyAl45ZdXrUcfHuoEnCte2QO0VLe"

```

## Standardize Audio Library
```bash
shopt -s globstar
shopt -s extglob

baseDirIn="/mnt/MD/Audio/Music"
baseDirOut="/mnt/MD/Audio/MusicOUT"

mkdir -p "$baseDirOut"

for inFile in "$baseDirIn"/**/*.*; do
  filePath="${inFile##$baseDirIn/}"
  filePath="${filePath%.*}.mp3"

  outFilePath="$baseDirOut/$filePath"

  mkdir -p "${outFilePath%/*}"
  echo "FILE: $outFilePath" >> "fflog.log"

  ffmpeg -y -i "$inFile" \
    -c:a libmp3lame -b:a 224k \
    -map_metadata 0:g:0 -vsync 2 \
    -loglevel warning \
    "$outFilePath" &>> "fflog.log"

  touch -r "$inFile" "$outFilePath"
done
```

## Bible Loop
```bash
#!/bin/bash

shopt -s globstar

OutDir="/mnt/BNK/Hole/NewLivingOut"

mkdir -p "$OutDir"

for i in **/*.mp3; do
  OutFileBase="${i%/*}"
  OutFileRoot="${OutFileBase%/*}"

  if ! [[ "$OutFileBase" == "$LastOutFileBase" ]]; then
    COUNT=0
  fi

  OutFileName="${OutFileBase/\//-}-$(printf %03d $COUNT).mp3"

  # echo "$OutFileName"
  # echo "$OutFileName"
  ffmpeg -y -i "$i" -c:a libmp3lame -b:a 32k -ac 1 "$OutDir/$OutFileName"

  LastOutFileBase="$OutFileBase"
  COUNT=$((COUNT + 1))
done
```


