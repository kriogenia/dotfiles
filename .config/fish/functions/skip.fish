function skip \
    --description "Skips the first <n> lines" \
    --argument n
    tail +(math 1 + $n)
end

