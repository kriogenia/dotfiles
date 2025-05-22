#!/usr/bin/env fish

set -l session " notes"

argparse d/detach -- $argv; or return
set -ql _flag_d; or set -l switch "tmux switch -t '$session'"

if _mux_check $session
    eval $switch
    return
end

tmux new-session -d -s $session -n $session -c $notes "nvim TODO.md"
eval $switch
