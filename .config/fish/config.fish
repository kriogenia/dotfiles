source $__fish_config_dir/default.fish
source $__fish_config_dir/override.fish

status is-interactive; and begin
    set -g fish_greeting
    source $__fish_config_dir/themes/theme.fish

    source $__fish_config_dir/alias.fish
    source $__fish_config_dir/abbr.fish
    set -x MANPAGER "nvim +Man!"

    # CTRL-t = fzf select
    # CTRL-r = fzf history
    # ALT-c  = fzf cd
    fzf --fish | source

    pkg_installed thefuck; and thefuck --alias | source
    nvm use lts >/dev/null

    set fish_tmux_autoquit false
    set fish_tmux_autostart true
end
