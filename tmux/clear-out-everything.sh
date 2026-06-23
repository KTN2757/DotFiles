#!/bin/bash
tmux list-panes -a -F '#{session_name}:#{pane_id}' | while read line; do
    session="${line%%:*}"
    pane="${line##*:}"
    [[ "$session" == "Music" ]] && continue
    tmux send-keys -t "$pane" 'reset' Enter
done
