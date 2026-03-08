#!/usr/bin/env fish

set -l session "🖧 posting"

_mux_switch $session; and return

tmux new-session -d -s $session -n $session -c $POSTING_PATH just
tmux send-keys -t $session:1.1 Tab Enter
tmux split-window -ht $session:1.1 -c $POSTING_PATH
tmux send-keys -t $session:1.2 "nvim ." Enter
tmux split-window -vt $session:1.2 -c $POSTING_PATH
tmux switch -t $session
tmux select-pane -t $session:1.1
