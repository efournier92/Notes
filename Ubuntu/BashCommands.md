# `bash` Rename Commands

## `bash` Pattern Subsititution
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

