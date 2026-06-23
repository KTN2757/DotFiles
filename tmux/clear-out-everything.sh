#!/bin/bash
tmux list-panes -a -F '#{pane_id}' | while read pane; do
    tmux send-keys -t "$pane" 'reset' Enter
done
