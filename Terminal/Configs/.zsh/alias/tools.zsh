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
alias uni="$HSCRIPTS/sync_unison calypso.whatbox.ca misigno $SNC $SBROOT/snc $SBROOT/bin"

## Audio

### Run Audio-Log Script
alias aud_log="$HSCRIPTS/audio_log -i $RC/RECORD -o $EXTA/Lg/Audio"

## Browser

### Launch Tor
alias tor="GTK_THEME=Adwaita:light torbrowser-launcher"

## Location

### Whereami
alias whereami="curl ipinfo.io"

## Cleanup

### Delete `._` Files
alias rmdotunder="find . -type f -name '._*' -print"

