#!/usr/bin/env fish

set -l session " notes"

tmux list-sessions | rg $session && tmux switch -t $session && return

tmux new-session -d -s $session -n $session -c $notes "nvim TODO.md"
tmux switch -t $session
