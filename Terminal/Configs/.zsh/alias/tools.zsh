#!/bin/zsh

#----------------
# Name          : tools.zsh
# Description   : Aliases for miscellaneous tools
# Author        : E Fournier
# Dependencies  : zsh
#----------------

## Files

### Open Budget Spreadsheet
alias budget='libreoffice /mnt/bnk/snc/Documents/Fin/Budget_2020.xls'

## Sync

### Sync with Unison
alias uni='~/scripts/sync_unison calypso.whatbox.ca misigno /mnt/bnk/snc /home/misigno/snc /home/misigno/bin'

## Audio

### Run Audio-Log Script
alias aud_log='~/scripts/audio_log -i /mnt/rc/RECORD -o /mnt/extA/Lg/Audio'

## Browser

### Launch Tor
alias tor='GTK_THEME=Adwaita:light torbrowser-launcher'

## Locational

### Whereami
alias whereami='curl ipinfo.io'

