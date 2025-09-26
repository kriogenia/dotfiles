/home/linuxbrew/.linuxbrew/bin/brew shellenv | source
poetry completions fish >~/.config/fish/completions/poetry.fish

function _check_pkg_installed -d "OS specific package installation check" \
    -a package
    brew list $package &>/dev/null || snap list $package &>/dev/null || test -e /usr/bin/$package
end

if status is-interactive
    set -g PYENV_ROOT /home/linuxbrew/.linuxbrew/bin/pyenv
    fish_add_path -p $PYENV_ROOT/bin
    pyenv init - | source
    if pyenv virtualenv-init - &>/dev/null
        source (pyenv virtualenv-init -|psub)
    end
end
