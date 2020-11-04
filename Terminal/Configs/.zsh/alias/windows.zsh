#!/bin/zsh

#----------------
# Name          : windows.zsh
# Description   : Aliases for WSL enviroment
# Author        : E Fournier
# Dependencies  : zsh
#----------------

# Windows Aliases

## Utilities
alias start="cmd.exe /C start"
alias uni=". $HOME/scripts/unison.bash calypso.whatbox.ca misigno ~/snc /home/misigno/snc /home/misigno/bin"
alias vvm="bash /c/Users/efournier/scripts/vvm.bash $HOME/snc"

## Explorer
alias explore="start explorer"
alias qdir='start "C:\Users\efournier\Documents\Q-Dir_State.qdr"'
alias screens=:explore "%USERPROFILE%\snc\Pictures\Screenshots"

## System

### Mount
alias m_tfs="sudo mount -t drvfs '\\\\tfs\\TeamCityBuilds' /mnt/tfs"
alias m_tfs!="sudo umount /mnt/tfs"

### System Edit
alias hostedit="vim $ENV_HOSTS"

## Shortcuts

### Sync Directory
alias sbooks="$HOME/snc/Books"
alias sdesk="$HOME/snc/Desktop"
alias sdocs="$HOME/snc/Documents"
alias slg="$HOME/snc/Lg"
alias spics="$HOME/snc/Pictures"
alias sshots="$HOME/snc/Pictures/screenshots"
alias swork="$HOME/snc/Work"
alias sstories="$HOME/snc/Work/Stories/"

### File Edit
alias spectrumpaths="vim ~/snc/Work/SpectrumPaths.md"

### Logs
alias logs="/c/Logs-Raw/"
alias exceptions="/c/Logs-Raw/Exceptions/SpectrumPaths"

### Mounts
alias tfs="cd /mnt/tfs"

