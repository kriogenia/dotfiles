function _mux_switch \
    --description "Switches to the given session if it exists, otherwise exists"
    if _mux_check $argv
        tmux switch -t "$argv"
        return
    end
    return 1
end
