function search -d "Searches in the current directory merging fzf, rg and bat"
    set RELOAD 'reload:rg --column --color=always --smart-case {q} || :'
    fzf --disabled --ansi \
        --bind "start:$RELOAD" --bind "change:$RELOAD" \
        --bind 'enter:become:nvim {1} +{2}' \
        --delimiter : \
        --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
        --preview-window '~4,+{2}+4/3,<80(up)'
end
