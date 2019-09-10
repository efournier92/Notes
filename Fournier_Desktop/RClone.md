# `RClone` Batch Backup

## Description
Below are a list of [`rclone`](https://rclone.org/) commands I use to back up files.

## Commands

### Sync `Users` to `Documents`

```dos
rclone sync "C:\Users\" "F:\Documents" --delete-during --ignore-errors --verbose
```

