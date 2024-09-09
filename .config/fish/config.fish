if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Basic
abbr -a -- clr clear
abbr -a -- nv nvim

# Git
abbr -a -- ga 'git add'
abbr -a -- gcmsg 'git commit -m'
abbr -a -- gs 'git status'
abbr -a -- gss 'git status --short'
abbr -a -- gdot '/usr/bin/git --git-dir=/home/sotoestevez/.dotfiles/ --work-tree=/home/sotoestevez'

# Fish
abbr -a -- abbrsave 'abbr | tail -1 >> ~/.config/fish/config.fish'

# Last
