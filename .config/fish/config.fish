function read_os
    test -d /mnt/c/ \
        && echo win \
        || cat /etc/os-release | rg "^ID=" | sed 's/ID=//'
end

source $__fish_config_dir/(read_os).fish
source $__fish_config_dir/common.fish
source $__fish_config_dir/abbr.fish
source $__fish_config_dir/alias.fish

pyenv init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub)

fzf --fish | source

set -x MANPAGER "nvim +Man!"

# tmux
status is-interactive; and begin
    set fish_tmux_autoquit false
    set fish_tmux_autostart true
end

set PATH $PATH $HOME/.local/bin
