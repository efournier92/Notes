#!/bin/bash

tmux new-session -d -s totesnote

tmux switch -t totesnote

tmux send-keys -t totesnote:1 "pkexec /usr/bin/mongod --quiet --config /etc/mongod.conf & cd /mnt/BNK/CodeSpace/totesnote" C-m
tmux send-keys -t totesnote:1 "vim ." C-m

tmux new-window -t totesnote:2
tmux select-window -t totesnote:2
tmux send-keys -t totesnote:2 "cd /mnt/BNK/CodeSpace/totesnote" C-m
tmux split-window -h -t totesnote:2
tmux select-pane -t 2
tmux send-keys -t totesnote:2 "cd /mnt/BNK/CodeSpace/totesnote" C-m
tmux send-keys -t totesnote:2 "ng serve" C-m

tmux new-window -t totesnote:3
tmux select-window -t totesnote:3
tmux send-keys -t totesnote:3 "cd /mnt/BNK/CodeSpace/totesnote-api" C-m
tmux send-keys -t totesnote:3 "vim ." C-m

tmux new-window -t totesnote:4
tmux select-window -t totesnote:4
tmux send-keys -t totesnote:4 "cd /mnt/BNK/CodeSpace/totesnote-api" C-m
tmux split-window -h -t totesnote:4
tmux select-pane -t 2
tmux send-keys -t totesnote:4 "cd /mnt/BNK/CodeSpace/totesnote-api" C-m
tmux send-keys -t totesnote:4 "nodemon app.js" C-m

