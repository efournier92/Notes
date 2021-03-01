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

## Programs
alias explore="$OPEN_EXPLORER"
alias excel="$START_SPREADSHEET"
alias word="$START_WORDPROCESS"
alias powerpoint="$START_PRESENTATION"
alias qdir="start \"$HDOCS\\Q-Dir_State.qdr\""
alias screens="explore \"%USERPROFILE%\\snc\\Pictures\\Screenshots\""
alias mdrender="start \"C:\\Users\\efournier\\AppData\\Local\\Chromium\\Application\\chrome.exe\""
alias nplus="start notepad++"

## System

### Mount
export TFS="/mnt/tfs"
alias m_tfs="sudo mount -t drvfs '\\\\tfs\\TeamCityBuilds' $TFS"
alias m_tfs!="sudo umount $TFS"

### System Edit
alias hostedit="vim $HOSTS"

### System Cleanup
alias tempclean="rm -rf $HOME/AppData/Local/Temp/*"

### Edit Files

#### Spectrum Paths
alias spectrumpaths="vim $SNC/Work/SpectrumPaths.md"

#### Blue Jeans Rooms
alias bj="vim $SWORK/BlueJeansRooms.md"

### Logs

#### Logs root
export LOGS="/e/Logs-Raw/"
alias logs="cd $LOGS"

#### Exceptions
export EXCEPTIONS="$LOGS/Exceptions"
alias exceptions="cd $EXCEPTIONS"

