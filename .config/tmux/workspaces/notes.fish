#!/usr/bin/env fish

set -l session " notes"

argparse d/detached -- $argv
set -ql _flag_d; or set -l switch "tmux switch -t '$session'"

tmux list-sessions | rg $session &>/dev/null
if test $status -eq 0
    eval $switch
    return
end

tmux new-session -d -s $session -n $session -c $notes "nvim TODO.md"
eval $switch
