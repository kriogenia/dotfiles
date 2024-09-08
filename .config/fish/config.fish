if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Basic
abbr -a -- clr clear
abbr -a -- nv nvim

# Git
abbr -a -- gdot '/usr/bin/git --git-dir=/home/sotoestevez/.dotfiles/ --work-tree=/home/sotoestevez'

# Last
abbr -a -- abbrsave 'abbr | tail -1 >> ~/.config/fish/config.fish'
