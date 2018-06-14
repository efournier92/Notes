#!/bin/zsh

tmux new-session -d -s totesnote

tmux switch -t totesnote

tmux new-window -t totesnote:1
tmux send-keys -t totesnote:1 "cd /mnt/BNK/CodeSpace/totesnote;vim" C-m

tmux new-window -t totesnote:2
tmux select-window -t totesnote:2
tmux send-keys -t totesnote:2 "cd /mnt/BNK/CodeSpace/totesnote" C-m
tmux split-window -h -t totesnote:2
tmux select-pane -t 2
tmux send-keys -t totesnote:2 "cd /mnt/BNK/CodeSpace/totesnote;ng serve" C-m

tmux new-window -t totesnote:3
tmux select-window -t totesnote:3
tmux send-keys -t totesnote:3 "cd /mnt/BNK/CodeSpace/totesnote-api;vim" C-m

tmux new-window -t totesnote:4
tmux select-window -t totesnote:4
tmux send-keys -t totesnote:4 "cd /mnt/BNK/CodeSpace/totesnote-api" C-m
tmux split-window -h -t totesnote:4
tmux select-pane -t 2
tmux send-keys -t totesnote:4 "cd /mnt/BNK/CodeSpace/totesnote-api;mongod" C-m
tmux split-window -t totesnote:4
tmux select-pane -t 3
tmux send-keys -t totesnote:4 "cd /mnt/BNK/CodeSpace/totesnote-api;nodemon app.js" C-m

