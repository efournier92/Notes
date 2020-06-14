#!/bin/bash

SESSION_NAME="note"
BASE_DIR="/mnt/bnk/snc"

# Create a detached session, if one doesn't exist
tmux new -s "$SESSION_NAME" -d -c "$BASE_DIR/Lg" "vim 2020.md; zsh"
# Attach the session, if not already
tmux attach -t "$SESSION_NAME"
# Switch to note session
tmux switch-client -t "$SESSION_NAME" &
# Create a new window and invoke vim
tmux new-window -t "$SESSION_NAME" "vim"
# Focus the terminal window
wmctrl -a terminal

