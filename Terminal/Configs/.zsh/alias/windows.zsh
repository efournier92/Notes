#!/bin/zsh

#----------------
# Name          : windows.zsh
# Description   : Aliases for WSL enviroment
# Author        : E Fournier
# Dependencies  : zsh
#----------------

## Files
alias hostedit='vim /c/Windows/System32/drivers/etc/hosts'

## Tmux
alias notes='./$HOME/.tmux/notes.session $HOME/snc'

## Drives
alias m_tfs="sudo mount -t drvfs '\\\\tfs\\TeamCityBuilds' /mnt/tfs; cd /mnt/tfs"
alias m_tfs!='sudo umount /mnt/tfs'

## Shortcuts
alias stories='vim ~/snc/Work/Stories/'
alias start='cmd.exe /C start'
alias explore='start explorer'
alias qdir='start "C:\Users\efournier\Documents\Q-Dir_State.qdr"'

