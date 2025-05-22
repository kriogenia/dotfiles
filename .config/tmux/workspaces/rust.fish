#!/usr/bin/env fish

test (count $argv) -eq 1; or echo "Missing path" && return 1

set -l path (realpath $argv[1] )
set -l project (path basename $path)
set -l session " $project"

_mux_switch $session; and return

tmux new-session -d -s $session -n $session -c $path "$EDITOR ."
tmux split-window -ht $session:1.1 -c $path bacon
tmux split-window -vbt $session:1.2 -c $path # replace with something printing a rust ASCII
tmux switch -t $session
tmux select-pane -t $session:1.1
