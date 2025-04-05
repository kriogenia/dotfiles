if test -d /mnt/c/
    set current_os win
else
    set current_os fedora
end

source $HOME/.config/fish/$current_os.fish
source $HOME/.config/fish/abbr.fish

pyenv init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub)

status is-interactive; and begin
    set fish_tmux_autoquit false
    set fish_tmux_autostart true
end
