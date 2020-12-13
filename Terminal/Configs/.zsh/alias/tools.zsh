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

### Create a new agile story directory and file
alias story="$HOME/scripts/create_agile_story"

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

### List `._` Files
alias dotunderls="find . -name '._*' -print"

### Delete `._` Files
alias dotunderrm="find . -name '._*' -delete -print"

