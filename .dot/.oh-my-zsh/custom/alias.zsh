# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

#SHORTCUTS
aoc=~/Projects/Advent\ of\ Code
learning=~/Projects/Learning
portfolio=~/Projects/Web/sotoestevezdev
rust=~/Projects/Rust
todoc=~/Documents/TODO.md
zshcustom=~/.oh-my-zsh/custom

#ALIASES
alias clr="clear"
alias nv="nvim"
alias todo="bat ~/Documents/TODO.md"
alias todo-open="vim ~/Documents/TODO.md"

##BINS
alias astudio="/usr/local/android-studio/bin/studio.sh"
alias idea="intellij-idea-ultimate"

##GIT
alias gcfu="git commit --fixup HEAD"
alias grfu="git rebase -i --autosquash HEAD^^"
alias gdot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"