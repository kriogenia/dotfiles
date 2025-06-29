# Basic
abbr -a -- clr clear
abbr -a -- nv nvim

# bat
abbr -a --position anywhere -- --help '--help | bat -plhelp'
abbr -a --position anywhere -- -h '-h | bat -plhelp'

# git
abbr -a -- ga 'git add'
abbr -a --set-cursor=% -- gcmsg 'git commit -m "%"'
abbr -a -- gca 'git commit --amend'
abbr -a -- gcfu 'git commit --fixup HEAD'
abbr -a -- gco 'git checkout'
abbr -a -- gp 'git push'
abbr -a -- gpf 'git push --force'
abbr -a -- grfu 'git rebase -i --autosquash HEAD^^'
abbr -a -- gs 'git status'
abbr -a -- gss 'git status --short'

# yadm
abbr -a -- ya 'yadm add'
abbr -a --set-cursor=% -- ycmsg 'yadm commit -m "%"'
abbr -a -- ys 'yadm status --short'
abbr -a -- ysu 'yadm status --short -unormal'
