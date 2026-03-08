/home/linuxbrew/.linuxbrew/bin/brew shellenv | source

function _check_pkg_installed -d "OS specific package installation check" \
    -a package
    brew list $package &>/dev/null || snap list $package &>/dev/null || test -e /usr/bin/$package
end

if status is-interactive
    poetry completions fish >~/.config/fish/completions/poetry.fish

    set -g PYENV_ROOT /home/linuxbrew/.linuxbrew/bin/pyenv
    fish_add_path -p $PYENV_ROOT/bin
    pyenv init - | source
    if pyenv virtualenv-init - &>/dev/null
        source (pyenv virtualenv-init -|psub)
    end
end

# pbcopy / pbpaste
alias pbcopy="xclip -i -selection clipboard"
alias pbpaste="xclip -o"

set -gx TMUX_WORKSPACES $HOME/.config/tmux/workspaces
