if test -d /mnt/c/
    set current_os win
else
    set current_os fedora
end

source $HOME/.config/fish/$current_os.fish
source $HOME/.config/fish/abbr.fish
source $HOME/.config/fish/env_vars.fish

pyenv init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub)
