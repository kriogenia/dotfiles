# cd
alias ...='cd ../..'
alias .3=='cd ../../..'

# ls
set EZA_OPTIONS "--color=always --group-directories-first --icons"
alias ls="eza $EZA_OPTIONS"
alias la="eza -al $EZA_OPTIONS"
alias ll="eza -l $EZA_OPTIONS"
alias lt="eza -aT $EZA_OPTIONS"
alias l..="eza -al $EZA_OPTIONS ../"

# pbcopy / pbpaste
alias pbcopy="wl-copy"
alias pbpaste="wl-paste"

# rg
alias rg="rg -p"

# reload fish
alias fishr="source $__fish_config_dir/config.fish"
