#!/bin/zsh

#----------------
# Name          : windows.zsh
# Description   : Aliases for WSL enviroment
# Author        : E Fournier
# Dependencies  : zsh
#----------------

# Windows Aliases

## Utilities
alias start='cmd.exe /C start'
alias uni='. ~/scripts/unison.bash calypso.whatbox.ca misigno ~/snc /home/misigno/snc /home/misigno/bin'
alias vvm='bash /c/Users/efournier/scripts/vvm.bash ~/snc'

## Explorer
alias explore='start explorer'
alias qdir='start "C:\Users\efournier\Documents\Q-Dir_State.qdr"'
alias screens='explore "%USERPROFILE%\snc\Pictures\Screenshots'

## System

### Mount
alias m_tfs="sudo mount -t drvfs '\\\\tfs\\TeamCityBuilds' /mnt/tfs"
alias m_tfs!='sudo umount /mnt/tfs'

### System Edit
alias hostedit='vim /c/Windows/System32/drivers/etc/hosts'

## Shortcuts

### Sync Directory
alias sbooks='~/snc/Books'
alias sdesk='~/snc/Desktop'
alias sdocs='~/snc/Documents'
alias slg='~/snc/Lg'
alias spics='~/snc/Pictures'
alias swork='~/snc/Work'
alias sstories='~/snc/Work/Stories/'

### File Edit
alias spectrumpaths='vim ~/snc/Work/SpectrumPaths.md'

### Logs
alias logs='/c/Logs-Raw/'
alias exceptions='/c/Logs-Raw/Exceptions/SpectrumPaths'

### Mounts
alias tfs="cd /mnt/tfs"


