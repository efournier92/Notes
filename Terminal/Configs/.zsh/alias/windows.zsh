#!/bin/zsh

#----------------
# Name          : windows.zsh
# Description   : Aliases for WSL enviroment # Author        : E Fournier
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

### Edit Files

#### Spectrum Paths
alias spectrumpaths="vim ~/snc/Work/SpectrumPaths.md"

### Logs

#### Logs root
alias LOGS="/c/Logs-Raw/"
alias logs="cd $LOGS"

#### Exceptions
alias EXCEPTIONS="$LOGS/Exceptions"
alias exceptions="cd $EXCEPTIONS"

### Mounts
alias TFS="/mnt/tfs"
alias tfs="cd $TFS"

