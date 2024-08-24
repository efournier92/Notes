# [rclone](https://rclone.org/)

## Contents

- [Overview](#overview)
- [Commands](#commands)
  - [Sync](#sync)

## Overview

[rclone](https://rclone.org/) is a powerful [CLI](https://en.wikipedia.org/wiki/Command-line_interface) tool that facilitates selectively syncing entire disks, with various configurations available. I'd wager there's no backup task that can't be achieved using this tool. Below are a list of commands I use when syncing disks and directories.

## Commands

### Sync

#### Description

Sync the `Users` directory to the `Documents` directory on another disk.

#### Command

```dos
rclone sync "C:\Users\" "F:\Documents" --delete-during --ignore-errors --verbose
```

