function mux \
    --description "Executes one of the preconfigured tmux workspaces" \
    --argument-names workspace path
    switch $workspace
        case notes
            source "$TMUX_WORKSPACES/notes.fish"
        case ""
            tmux switch -t 0
    end
end
