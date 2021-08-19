#!/bin/zsh

#----------------
# Name          : tmux.zsh
# Description   : Aliases for tmux sessions
# Author        : E Fournier
# Dependencies  : zsh
#----------------

## Seedbox

### Start session
alias sb=". $TSESSIONS/sb.session"

### Kill session
alias sb!="tmux kill-session -t sb"

## Notes

### Start session
alias notes=". $TSESSIONS/notes.session"

### Kill session
alias notes!="tmux kill-session -t notes"

## Dev

### efournier92

### Start session
alias dev_efournier92=". $TSESSIONS/dev_efournier92.session"

### Kill session
alias dev_efournier92!="tmux kill-session -t efournier92"

