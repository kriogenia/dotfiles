function todo \
    --description "Eases operations with the TODO document" \
    --argument-names action
    switch $action
        case open
            fish -c "cd $notes && nvim TODO.md"
        case add
            echo "1." $argv[2..] >>"$notes/TODO.md"
        case show '*'
            glow "$notes/TODO.md"
    end
end
