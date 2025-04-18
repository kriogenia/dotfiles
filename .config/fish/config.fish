function read_os
    test -d /mnt/c/ \
        && echo win \
        || cat /etc/os-release | rg "^ID=" | sed 's/ID=//'
end

source $__fish_config_dir/(read_os).fish
source $__fish_config_dir/common.fish

pyenv init - | source

status is-interactive; and begin

    source $__fish_config_dir/alias.fish
    source $__fish_config_dir/abbr.fish
    set -x MANPAGER "nvim +Man!"

    source (pyenv virtualenv-init -|psub)

    # CTRL-t = fzf select
    # CTRL-r = fzf history
    # ALT-c  = fzf cd
    fzf --fish | source

    test -e /usr/bin/thefuck; and thefuck --alias | source

    set fish_tmux_autoquit false
    set fish_tmux_autostart true

end

# set PATH $PATH $HOME/.local/bin
