#!/bin/zsh

#----------------
# Name          : tools.zsh
# Description   : Aliases for miscellaneous tools
# Author        : E Fournier
# Dependencies  : zsh
#----------------

## Files

### Open Budget Spreadsheet
alias budget="libreoffice $SDOCS/Fin/Budget_2020.xls"

## Sync

### SB 

### Sync with Unison
alias uni=". $ZSCRIPTS/uni"

## Audio

### Run Audio-Lg Script
alias aud_lg="$HSCRIPTS/audio_lg -i $RC/RECORD -o $EXTA/Lg/Audio"

## Browser

### Launch Tor
alias tor="GTK_THEME=Adwaita:light torbrowser-launcher"

## List

### List Block Devices with UUIDs
alias lsuuid="lsblk -o NAME,FSTYPE,PARTLABEL,UUID,PARTUUID"

## Location

### Whereami
alias whereami="curl ipinfo.io"

## Cleanup

### Delete `._` Files
alias rmdotunder="find . -type f -name '._*' -print"

