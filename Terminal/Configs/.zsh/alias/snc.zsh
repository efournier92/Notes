#!/bin/zsh

#----------------
# Name          : snc.zsh
# Description   : Aliases for navigating the Snc directory
# Author        : E Fournier
# Dependencies  : zsh
#----------------

# Snc Aliases

local this_year=`date +"%Y"`

local watch_script="$HSCRIPTS/watch_for_change"
[[ -z `pgrep inotifywait` && -f "$watch_script" ]] \
  && nohup "$watch_script" "$SNC" "$ZSCRIPTS/uni" >/dev/null 2>&1&

#/dev/null &>/dev/null &
 
#"$ZSCRIPTS/uni" &>/dev/null &

## Directory Shortcuts

### Books
export SBOOKS="$SNC/Books"

### Desktop
export SDESK="$SNC/Desktop"

### Documents
export SDOCS="$SNC/Documents"

### Lg
export SLG="$SNC/Lg"

### Pictures
export SPHO="$SNC/Pictures"

### Screenshots
export SSHOTS="$SNC/Pictures/screenshots"

### Work
export SWORK="$SNC/Work"

### Stories
export SSTORIES="$SWORK/Stories"

### Notes
export SNOTES="$SNC/Notes"

## Vim Files

### Open Lg for this Year
alias lgyr="vim $SLG/$this_year.md"

### Open Do & Lg notes split vertically
alias nlog="vim -O $SNOTES/Do.md $SNOTES/Lg.md"

### Open Do Notes
alias ndo="vim $SNOTES/Do.md"

### Open Lg Notes
alias nlg="vim $SNOTES/Lg.md"

### Open Xy Notes
alias nxy="vim $SNOTES/Xy.md"

