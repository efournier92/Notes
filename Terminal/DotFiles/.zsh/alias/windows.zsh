#!/bin/zsh

#----------------
# Name          : windows.zsh
# Description   : Aliases for WSL enviroment # Author        : E Fournier
# Dependencies  : zsh
#----------------

# Windows Aliases

## Utilities
alias start="cmd.exe /C start"
alias vvm="bash $HSCRIPTS/vvm.bash $SNC"

## Explorer
alias explore="start explorer"
alias qdir="start \"$HDOCS\\Q-Dir_State.qdr\""
alias screens="explore \"%USERPROFILE%\\snc\\Pictures\\Screenshots\""

## System

### Mount
export TFS="/mnt/tfs"
alias m_tfs="sudo mount -t drvfs '\\\\tfs\\TeamCityBuilds' $TFS"
alias m_tfs!="sudo umount $TFS"

### System Edit
alias hostedit="vim $HOSTS"

### Edit Files

#### Spectrum Paths
alias spectrumpaths="vim $SNC/Work/SpectrumPaths.md"

### Logs

#### Logs root
export LOGS="/c/Logs-Raw/"
alias logs="cd $LOGS"

#### Exceptions
export EXCEPTIONS="$LOGS/Exceptions"
alias exceptions="cd $EXCEPTIONS"

