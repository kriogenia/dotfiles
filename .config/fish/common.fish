function set_if_unset \
    -d "Sets the variable only if not previously set" \
    -a var val
    set -q $var; or set -g $var $val
end

set_if_unset BROWSER firefox

set_if_unset PYENV_ROOT $HOME/.pyenv
set_if_unset SDKMAN_DIR $HOME/.sdkman
set_if_unset XDG_CONFIG_HOME $HOME/.config

set_if_unset learning $projects/my_learnings/

set_if_unset TMUX_WORKSPACES $XDG_CONFIG_HOME/tmux/workspaces
set_if_unset ASCII_ARTS $HOME/dotfiles/ascii
