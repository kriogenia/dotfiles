#!/bin/fish

# Swaps tmux mouse enable/disable
set old (tmux show -gv mouse)
if [ $old = off ]
    set -f new on
else
    set -f new off
end
tmux set -g mouse $new
