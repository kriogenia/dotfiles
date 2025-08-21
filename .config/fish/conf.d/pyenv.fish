if status is-interactive && pkg_installed pyenv
    set -g PYENV_ROOT $HOME/.pyenv
    pyenv init - | source
    if pyenv virtualenv-init - &>/dev/null
        source (pyenv virtualenv-init -|psub)
    end
end
