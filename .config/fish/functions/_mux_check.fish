function _mux_check \
    --description "Checks if the given session exists"
    tmux list-sessions | rg $argv &>/dev/null
end
