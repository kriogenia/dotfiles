source $__fish_config_dir/default.fish
source $__fish_config_dir/override.fish

pacman -Q pyenv; and pyenv init - | source

status is-interactive; and begin

    source $__fish_config_dir/alias.fish
    source $__fish_config_dir/abbr.fish
    set -x MANPAGER "nvim +Man!"

    pyenv virtualenv-init - &>/dev/null
    test $status = 0; and source (pyenv virtualenv-init -|psub)

    # CTRL-t = fzf select
    # CTRL-r = fzf history
    # ALT-c  = fzf cd
    fzf --fish | source

    test -e /usr/bin/thefuck; and thefuck --alias | source

    set fish_tmux_autoquit false
    set fish_tmux_autostart true

    # always start a notes session in the background
    source "$TMUX_WORKSPACES/notes.fish" -d

end

# set PATH $PATH $HOME/.local/bin
