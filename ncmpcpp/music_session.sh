#!/bin/bash
SESSION="Music"
tmux kill-session -t $SESSION 2>/dev/null

tmux new-session -d -s $SESSION

tmux split-window -h
tmux split-window -v
tmux select-pane -t 1
tmux split-window -v

tmux select-layout "7902,171x44,0,0{85x44,0,0[85x16,0,0,15,85x27,0,17,18],85x44,86,0[85x22,86,0,16,85x21,86,23,17]}"

tmux select-pane -t 2
tmux send-keys "ncmpcpp" C-m
sleep 0.5
tmux send-keys "1"

tmux select-pane -t 3
tmux send-keys "ncmpcpp" C-m
tmux send-keys "8"
tmux send-keys "\\"

tmux select-pane -t 4
tmux send-keys "lyse" C-m

tmux select-pane -t 1
tmux send-keys "~/.config/ncmpcpp/cover.sh" C-m

tmux attach -t $SESSION
