#!/usr/bin/env fish

test (count $argv) -eq 1; or echo "Missing path" && return 1

set -l path (realpath $argv[1] )
set -l project (path basename $path)
set -l session " $project"

_mux_switch $session; and return

tmux new-session -d -s $session -n $session -c $path "$EDITOR ."
tmux split-window -ht $session:1.1 -c $path
tmux send-keys -t $session:1.2 "cat $ASCII_ARTS/rust.txt" Enter
tmux split-window -vt $session:1.2 -c $path bacon
tmux switch -t $session
tmux select-pane -t $session:1.1
