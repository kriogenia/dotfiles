function read_os
    test -d /mnt/c/ \
        && echo win \
        || cat /etc/os-release | rg "^ID=" | sed 's/ID=//'
end

set -f os_config $__fish_config_dir/(read_os).fish
test -f $os_config; and source $os_config
source $__fish_config_dir/common.fish

pyenv init - | source

status is-interactive; and begin

    source $__fish_config_dir/alias.fish
    source $__fish_config_dir/abbr.fish
    set -x MANPAGER "nvim +Man!"

    pyenv virtualenv-init - 2>/dev/null
    test $status = 0; and source (pyenv virtualenv-init -|psub)

    # CTRL-t = fzf select
    # CTRL-r = fzf history
    # ALT-c  = fzf cd
    fzf --fish | source

    test -e /usr/bin/thefuck; and thefuck --alias | source

    set fish_tmux_autoquit false
    set fish_tmux_autostart true

end

# set PATH $PATH $HOME/.local/bin
