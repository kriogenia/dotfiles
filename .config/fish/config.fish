test -d /mnt/c/ && set current_os win || set current_os fedora

source $__fish_config_dir/$current_os.fish
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
