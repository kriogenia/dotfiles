if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Basic
abbr -a -- clr clear
abbr -a -- nv nvim
abbr -a -- tre 'exa --tree --icons'

# Git
abbr -a -- ga 'git add'
abbr -a -- gcmsg 'git commit -m'
abbr -a -- gca 'git commit --amend'
abbr -a -- gcfu 'git commit --fixup HEAD'
abbr -a -- gp 'git push'
abbr -a -- gpf 'git push --force'
abbr -a -- grfu 'git rebase -i --autosquash HEAD^^'
abbr -a -- gs 'git status'
abbr -a -- gss 'git status --short'
abbr -a -- gdot '/usr/bin/git --git-dir=/home/sotoestevez/.dotfiles/ --work-tree=/home/sotoestevez'

# Fish
abbr -a -- abbrsave 'abbr | tail -1 >> ~/.config/fish/config.fish'

# Last
abbr -a -- vpip 'pyenv exec pip'
