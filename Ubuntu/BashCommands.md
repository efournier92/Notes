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


